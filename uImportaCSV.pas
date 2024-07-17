unit uImportaCSV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.WinXCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDMConexao, View.uFrmMessage,
  Utils.Funcoes, Vcl.ComCtrls, FileCtrl;

type
  TfrmImportaCSV = class(TForm)
    pnTitulo: TPanel;
    lblTituloJanela: TLabel;
    lblSubTituloJanela: TLabel;
    pnSeparador01: TPanel;
    pnConteudo: TPanel;
    pnImportar: TPanel;
    ActionList1: TActionList;
    actCancelar: TAction;
    actImportar: TAction;
    lblCaminhoCSV: TLabel;
    edtCaminhoCSV: TEdit;
    pnPesquisar: TPanel;
    btPesquisar: TSpeedButton;
    lblImportarTabela: TLabel;
    cbImportarTabela: TComboBox;
    OpenDialog1: TOpenDialog;
    actPesquisar: TAction;
    pnCancelar: TPanel;
    btImportar: TSpeedButton;
    btCancelar: TSpeedButton;
    ProgressBar: TProgressBar;
    lblProgresso: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actImportarExecute(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure cbImportarTabelaChange(Sender: TObject);

  private
    function RetDate(cValor: String): TDate;
    procedure ImportEtqRed(cFileName: string);
    procedure Teste;
    { Private declarations }
  public
    { Public declarations }
    procedure ImportFile(cFileName: string; iItemIndex: integer);
    function RetFloat(cValor: String): Real;
    function RetCar(cValor: String): String;
    function RetSpace(cValor: String): String;
    function VeriCampos: boolean;
    function ImportaCSV(cFileName: String): boolean;

  end;

var
  frmImportaCSV: TfrmImportaCSV;

implementation

{$R *.dfm}

procedure TfrmImportaCSV.actCancelarExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmImportaCSV.actImportarExecute(Sender: TObject);
begin
  if VeriCampos then
    ImportaCSV(edtCaminhoCSV.Text);
end;

procedure TfrmImportaCSV.actPesquisarExecute(Sender: TObject);
var cDirectory: String;
begin

  if cbImportarTabela.ItemIndex = 0 then
  begin

    SelectDirectory('Selecione uma pasta', 'C:\', cDirectory);
    edtCaminhoCSV.Text := cDirectory;

  end
  else
  begin
    if OpenDialog1.Execute then
      edtCaminhoCSV.Text := OpenDialog1.FileName;
  end;


end;

procedure TfrmImportaCSV.btCancelarClick(Sender: TObject);
begin
  actCancelar.Execute;
end;

procedure TfrmImportaCSV.btImportarClick(Sender: TObject);
begin
  actImportar.Execute;
end;

procedure TfrmImportaCSV.btPesquisarClick(Sender: TObject);
begin
  actPesquisar.Execute;
end;

procedure TfrmImportaCSV.cbImportarTabelaChange(Sender: TObject);
begin

  if cbImportarTabela.ItemIndex = 0 then
  begin
    lblCaminhoCSV.Caption := 'Pasta dos arquivos CSV';
  end
  else
  begin
    lblCaminhoCSV.Caption := 'Caminho do arquivo CSV';
  end;

  edtCaminhoCSV.Text    := '';

end;

procedure TfrmImportaCSV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then
    actCancelar.Execute;
  if key = 13 then
  begin
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

function TfrmImportaCSV.ImportaCSV(cFileName: String): boolean;
begin

  if cbImportarTabela.ItemHeight = 0 then
  begin

  end
  else
  if cbImportarTabela.ItemIndex = 9 then
  begin
    ImportEtqRed(cFileName);
  end
  else
  begin
    ImportFile(cFileName, cbImportarTabela.ItemIndex);
  end;

end;

procedure TfrmImportaCSV.ImportEtqRed(cFileName: string);
var
  ArquivoCSV: TextFile;
  Contador, I, iTotLinhas, iFilial, iCliente: Integer;
  Linha, cNomeFilial, cReferencia, cCliente_desc, cDuplicata, cSubGrupo: String;

  // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then // vc pode usar qualquer delimitador ... eu
        // estou usando o ";"
        break;
      ValorMontado := ValorMontado + Linha[I];
      inc(I);
    end;
    result := Trim(ValorMontado);
  end;

begin

  iTotLinhas := NumeroDeLinhasTXT(cFileName);

  ProgressBar.Max      := iTotLinhas;
  ProgressBar.Visible  := True;

  lblProgresso.Caption := 'Importando registro 000000 de ' + ZeroEsquerda(IntToStr(iTotLinhas), 6);
  lblProgresso.Visible := True;

  frmImportaCSV.Refresh;

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, cFileName);

  try

    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    Contador := 1;

    while not Eoln(ArquivoCSV) do
    begin
      if Contador = 1 then // Primeira Linha do arquivo (Cabeçalho);
      begin

        I := 0;
        {
          Cabeçalho
        }

      end
      else
      begin

        // Demais Linhas (Itens do Pedido )
        I := 0;

        iFilial       := StrToInt(MontaValor);
        cReferencia   := MontaValor;

        if dmConexao.tbSESRR22.findkey([iFilial, cReferencia]) then
          dmConexao.tbSESRR22.Edit
        else
        begin
          dmConexao.tbSESRR22.Append;
        end;

        dmConexao.tbSESRR22filial.AsInteger         := iFilial;     //StrToInt(MontaValor);
        dmConexao.tbSESRR22referencia.AsString      := cReferencia; //MontaValor;
        dmConexao.tbSESRR22descricao.AsString       := MontaValor;

        dmConexao.tbSESRR22tam_1.AsString           := MontaValor;
        dmConexao.tbSESRR22tam_2.AsString           := MontaValor;
        dmConexao.tbSESRR22tam_3.AsString           := MontaValor;
        dmConexao.tbSESRR22tam_4.AsString           := MontaValor;
        dmConexao.tbSESRR22tam_5.AsString           := MontaValor;
        dmConexao.tbSESRR22tam_6.AsString           := MontaValor;
        dmConexao.tbSESRR22tam_7.AsString           := MontaValor;
        dmConexao.tbSESRR22tam_8.AsString           := MontaValor;
        dmConexao.tbSESRR22tam_9.AsString           := MontaValor;
        dmConexao.tbSESRR22tam_10.AsString          := MontaValor;
        dmConexao.tbSESRR22tam_11.AsString          := MontaValor;
        dmConexao.tbSESRR22tam_12.AsString          := MontaValor;

        dmConexao.tbSESRR22qtd_1.AsInteger          := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_2.AsInteger          := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_3.AsInteger          := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_4.AsInteger          := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_5.AsInteger          := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_6.AsInteger          := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_7.AsInteger          := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_8.AsInteger          := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_9.AsInteger          := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_10.AsInteger         := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_11.AsInteger         := StrToInt(Montavalor);
        dmConexao.tbSESRR22qtd_12.AsInteger         := StrToInt(Montavalor);

        dmConexao.tbSESRR22.Post;

      end;

      Readln(ArquivoCSV, Linha);

      Contador             := Contador + 1;

      ProgressBar.Position := Contador;
      lblProgresso.Caption := 'Importando registro ' + ZeroEsquerda(IntToStr(Contador), 6) + ' de ' + ZeroEsquerda(IntToStr(iTotLinhas), 6);
      frmImportaCSV.Refresh;

      Application.ProcessMessages;

    end;

  finally

    CloseFile(ArquivoCSV);
    Alerta('SGA | Importação', 'Processo finalizado', 'A importação da tabela CSV foi finalizado com sucesso.', 1, 1);
    Application.Terminate;

  end;

end;

procedure TfrmImportaCSV.ImportFile(cFileName: string; iItemIndex: integer);
var
  ArquivoCSV: TextFile;
  Contador, I, iTotLinhas, iFilial, iCliente: Integer;
  Linha, cNomeFilial, cReferencia, cCliente_desc, cDuplicata, cSubGrupo,
  cCor, cDescricao: String;

  // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then // vc pode usar qualquer delimitador ... eu
        // estou usando o ";"
        break;
      ValorMontado := ValorMontado + Linha[I];
      inc(I);
    end;
    result := Trim(ValorMontado);
  end;

begin

  iTotLinhas := NumeroDeLinhasTXT(cFileName);

  ProgressBar.Max      := iTotLinhas;
  ProgressBar.Visible  := True;

  lblProgresso.Caption := 'Importando registro 000000 de ' + ZeroEsquerda(IntToStr(iTotLinhas), 6);
  lblProgresso.Visible := True;

  frmImportaCSV.Refresh;

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, cFileName);

  try

    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    Contador := 1;

    while not Eoln(ArquivoCSV) do
    begin
      if Contador = 1 then // Primeira Linha do arquivo (Cabeçalho);
      begin

        I := 0;
        {
          Cabeçalho
        }

      end
      else
      begin

        // Demais Linhas (Itens do Pedido )
        I := 0;

        case iItemIndex of

        1: // SESRR22
          begin

            iFilial       := StrToInt(MontaValor);
            cNomeFilial   := MontaValor;
            cReferencia   := MontaValor;
            cDescricao    := MontaValor;
            cCor          := MontaValor;

            if dmConexao.tbSESRR22.Findkey([iFilial, cReferencia, cCor]) then
              dmConexao.tbSESRR22.Edit
            else
              dmConexao.tbSESRR22.Append;

            dmConexao.tbSESRR22filial.AsInteger         := iFilial;     //StrToInt(MontaValor);
            dmConexao.tbSESRR22nome.AsString            := cNomeFilial; //MontaValor;
            dmConexao.tbSESRR22referencia.AsString      := cReferencia; //MontaValor;
            dmConexao.tbSESRR22descricao.AsString       := cDescricao;
            dmConexao.tbSESRR22cor.AsString             := cCor;
            dmConexao.tbSESRR22cor_descricao.AsString   := MontaValor;
            dmConexao.tbSESRR22unidade.AsString         := MontaValor;
            dmConexao.tbSESRR22fornec.AsString          := MontaValor;
            dmConexao.tbSESRR22fornec_desc.AsString     := MontaValor;
            dmConexao.tbSESRR22resumido.AsString        := MontaValor;
            dmConexao.tbSESRR22grupo.AsString           := MontaValor;
            dmConexao.tbSESRR22grupo_desc.AsString      := MontaValor;
            dmConexao.tbSESRR22subgrupo.AsString        := MontaValor;
            dmConexao.tbSESRR22subgrupo_desc.AsString   := MontaValor;
            dmConexao.tbSESRR22marca.AsString           := MontaValor;
            dmConexao.tbSESRR22marca_desc.AsString      := MontaValor;
            dmConexao.tbSESRR22colecao.AsString         := MontaValor;
            dmConexao.tbSESRR22colecao_desc.AsString    := MontaValor;
            dmConexao.tbSESRR22linha.AsString           := MontaValor;
            dmConexao.tbSESRR22linha_desc.AsString      := MontaValor;
            dmConexao.tbSESRR22estoque.AsFloat          := RetFloat(MontaValor);
            dmConexao.tbSESRR22custo.AsCurrency         := RetFloat(MontaValor);
            dmConexao.tbSESRR22reposicao.AsCurrency     := RetFloat(MontaValor);
            dmConexao.tbSESRR22venda.AsCurrency         := RetFloat(MontaValor);
            dmConexao.tbSESRR22preco1.AsCurrency        := RetFloat(MontaValor);
            dmConexao.tbSESRR22preco2.AsCurrency        := RetFloat(MontaValor);
            dmConexao.tbSESRR22preco3.AsCurrency        := RetFloat(MontaValor);
            dmConexao.tbSESRR22promocao.AsCurrency      := RetFloat(MontaValor);
            dmConexao.tbSESRR22marcacao.AsFloat         := RetFloat(MontaValor);
            MontaValor;
            dmConexao.tbSESRR22ult_compra.AsString      := '01/01/1990';         // Planilha trás datas inexistentes
            dmConexao.tbSESRR22inativos.AsString        := MontaValor;
            montavalor;

            // Correção da marcação
            // dmconexao.tbSESRR22marca.AsFloat            := (((dmConexao.tbSESRR22venda.AsCurrency / dmConexao.tbSESRR22reposicao.AsCurrency) - 1) * 100);

            dmConexao.tbSESRR22.Post;

          end;

        // Cadastro de clientes
        2:
          begin

            //
            iCliente      := StrToInt(MontaValor);

            if dmConexao.tbClientes.Locate('codigo', iCliente, []) then
              dmConexao.tbClientes.Edit
            else
              dmConexao.tbClientes.Append;

            dmConexao.tbClientescodigo.AsInteger      := iCliente;
            dmConexao.tbClientescpf.AsString          := RetCar(MontaValor);
            dmConexao.tbClientesdocumento.AsString    := MontaValor;
            dmConexao.tbClientesnome.AsString         := MontaValor;
            dmConexao.tbClientesnascimento.AsString   := '01/01/1990';
            MontaValor;
            dmConexao.tbClientestipo.AsInteger        := StrToInt(MontaValor);
            dmConexao.tbClientestipo_desc.AsString    := MontaValor;
            dmConexao.tbClientesestado_civil.AsString := MontaValor;
            dmConexao.tbClientescalce.AsString        := MontaValor;
            dmConexao.tbClientesbloqueio.AsString     := MontaValor;
            dmConexao.tbClientescep.AsString          := MontaValor;
            dmConexao.tbClienteslogradouro.AsString   := MontaValor;
            dmConexao.tbClientesnumero.AsString       := MontaValor;
            dmConexao.tbClientescompleta.AsString     := MontaValor;
            dmConexao.tbClientesbairro.AsString       := MontaValor;
            dmConexao.tbClientescidade.AsString       := MontaValor;
            dmConexao.tbClientesuf.AsString           := MontaValor;
            dmConexao.tbClientesfone.AsString         := MontaValor;
            dmConexao.tbClientescelular.AsString      := MontaValor;
            dmConexao.tbClientesemail.AsString        := MontaValor;
            dmConexao.tbClientesfilial.AsInteger      := StrToInt(MontaValor);
            dmConexao.tbClientesvendedor.AsString     := MontaValor;
            dmConexao.tbClientesvendedor_desc.AsString:= MontaValor;

            dmConexao.tbClientesprimeira_compra.AsString := '01/01/1990';
            dmConexao.tbClientesultima_compra.AsString   := '01/01/1990';
            MontaValor;
            MontaValor;

            dmConexao.tbClienteslimite.AsFloat        := RetFloat(MontaValor);
            dmConexao.tbClientesvale.AsFloat          := RetFloat(MontaValor);
            dmConexao.tbClientessaldo.AsFloat         := RetFloat(MontaValor);
            dmConexao.tbClientesconjuge.AsString      := MontaValor;
            dmConexao.tbClientesnasc_conjuge.AsString := '01/01/1990';
            MontaValor;
            dmConexao.tbClientespai.AsString          := MontaValor;
            dmConexao.tbClientesnasc_pai.AsString     := '01/01/1990';
            MontaValor;
            dmConexao.tbClientesmae.AsString          := MontaValor;
            dmConexao.tbClientesnasc_mae.AsString     := '01/01/1990';
            MontaValor;
            dmConexao.tbClientesobervacao.AsString    := MontaValor;
            dmConexao.tbClientesvestuario.AsString    := MontaValor;
            dmConexao.tbClientessexo.AsString         := MontaValor;
            dmConexao.tbClientesregiao.AsString       := MontaValor;
            dmConexao.tbClientesmaior_compra.AsFloat  := RetFloat(MontaValor);

            dmConexao.tbClientesnumero_compra.AsInteger  := StrToInt(MontaValor);
            dmConexao.tbClientesnumero_atrasos.AsInteger := StrToInt(MontaValor);
            dmConexao.tbClientesidade.AsInteger          := StrToInt(MontaValor);

            dmConexao.tbClientesatividade.AsString    := MontaValor;

            dmConexao.tbClientes.Post;

          end;

        // Duplicatas
        3:
          begin

            iFilial       := StrToInt(MontaValor);
            cNomeFilial   := MontaValor;
            iCliente      := StrToInt(MontaValor);
            cCliente_desc := MontaValor;
            cDuplicata    := MontaValor;

            if dmConexao.tbDuplicatas.Locate('filial;duplicata', VarArrayOf([iFilial, cDuplicata]), []) then
              dmConexao.tbDuplicatas.Edit
            else
              dmConexao.tbDuplicatas.Append;

            dmConexao.tbDuplicatasfilial.AsInteger        := iFilial;         //StrToInt(MontaValor);
            dmConexao.tbDuplicatasfilial_desc.AsString    := cNomeFilial;     //MontaValor;
            dmConexao.tbDuplicatascliente.AsInteger       := iCliente;
            dmConexao.tbDuplicatascliente_desc.AsString   := cCliente_desc;
            dmConexao.tbDuplicatasduplicata.AsString      := cDuplicata;
            dmConexao.tbDuplicatasmodalidade.AsInteger    := StrToInt(MontaValor);
            dmConexao.tbDuplicatasmod_desc.AsString       := MontaValor;
            dmConexao.tbDuplicatassituacao.AsInteger      := StrToInt(MontaValor);
            dmConexao.tbDuplicatassituacao_desc.AsString  := MontaValor;
            dmConexao.tbDuplicatasvendedor.AsString       := MontaValor;
            dmConexao.tbDuplicatasvendedor_desc.AsString  := MontaValor;
            dmConexao.tbDuplicatasvalor.AsCurrency        := RetFloat(MontaValor);
            dmConexao.tbDuplicatasemissao.AsString        := MontaValor;
            dmConexao.tbDuplicatasvencimento.AsString     := MontaValor;
            dmConexao.tbDuplicataspagamento.AsString      := MontaValor;
            dmConexao.tbDuplicatasatraso.AsInteger        := StrToInt(RetSpace(MontaValor));
            dmConexao.tbDuplicatasjuros.AsCurrency        := RetFloat(MontaValor);
            dmConexao.tbDuplicatasdesconto.AsCurrency     := RetFloat(MontaValor);
            dmConexao.tbDuplicatascod_lancto.AsString     := MontaValor;
            dmConexao.tbDuplicatascod_lancto_desc.AsString:= MontaValor;
            dmConexao.tbDuplicatascaixa.AsString          := MontaValor;
            dmConexao.tbDuplicatascaixa_desc.AsString     := MontaValor;
            dmConexao.tbDuplicatasprazo.AsInteger         := StrToInt(MontaValor);
            dmConexao.tbDuplicatasoperador.AsString       := MontaValor;
            dmConexao.tbDuplicatasoperador_desc.AsString  := MontaValor;
            dmConexao.tbDuplicatasstatus.AsString         := Montavalor;
            dmConexao.tbDuplicatasano.AsInteger           := StrToInt(MontaValor);
            dmConexao.tbDuplicatasmes.AsInteger           := StrToInt(MontaValor);
            dmConexao.tbDuplicatasdia.AsInteger           := StrToInt(MontaValor);
            dmConexao.tbDuplicatastempo.AsString          := MontaValor;
            dmConexao.tbDuplicatasMexExt.AsString         := MontaValor;
            dmConexao.tbDuplicatascond_pagto.AsString     := MontaValor;
            dmConexao.tbDuplicatasdescricao.AsString      := MontaValor;

            dmConexao.tbDuplicatas.Post;

          end;

        // Estoque.csv
        8:
          begin

            iFilial       := StrToInt(MontaValor);
            cReferencia   := MontaValor;
            cDescricao    := MontaValor;
            cCor          := MontaValor;

            if dmConexao.tbSESRR22.Findkey([iFilial, cReferencia, cCor]) then
              dmConexao.tbSESRR22.Edit
            else
              begin

                dmConexao.tbSESRR22.Append;

                dmConexao.tbSESRR22linha.AsString           := '';
                dmConexao.tbSESRR22linha_desc.AsString      := '';

              end;

            dmConexao.tbSESRR22filial.AsInteger         := iFilial;     //StrToInt(MontaValor);
            dmConexao.tbSESRR22referencia.AsString      := cReferencia; //MontaValor;
            dmConexao.tbSESRR22descricao.AsString       := cDescricao;
            dmConexao.tbSESRR22cor.AsString             := cCor;
            dmConexao.tbSESRR22cor_descricao.AsString   := MontaValor;
            dmConexao.tbSESRR22fornec.AsString          := MontaValor;
            dmConexao.tbSESRR22fornec_desc.AsString     := MontaValor;
            dmConexao.tbSESRR22resumido.AsString        := MontaValor;
            dmConexao.tbSESRR22unidade.AsString         := MontaValor;
            dmConexao.tbSESRR22grupo.AsString           := MontaValor;
            dmConexao.tbSESRR22grupo_desc.AsString      := MontaValor;

            cSubGrupo := MontaValor;
            dmConexao.tbSESRR22subgrupo.AsString        := Copy(cSubGrupo, 4, 2);

            dmConexao.tbSESRR22subgrupo_desc.AsString   := MontaValor;

            dmConexao.tbSESRR22colecao.AsString         := MontaValor;
            dmConexao.tbSESRR22colecao_desc.AsString    := MontaValor;
            dmConexao.tbSESRR22marca.AsString           := MontaValor;
            dmConexao.tbSESRR22marca_desc.AsString      := MontaValor;
            dmConexao.tbSESRR22linha.AsString           := MontaValor;
            dmConexao.tbSESRR22linha_desc.AsString      := MontaValor;

            dmConexao.tbSESRR22tam_1.AsString           := MontaValor;
            dmConexao.tbSESRR22tam_2.AsString           := MontaValor;
            dmConexao.tbSESRR22tam_3.AsString           := MontaValor;
            dmConexao.tbSESRR22tam_4.AsString           := MontaValor;
            dmConexao.tbSESRR22tam_5.AsString           := MontaValor;
            dmConexao.tbSESRR22tam_6.AsString           := MontaValor;
            dmConexao.tbSESRR22tam_7.AsString           := MontaValor;
            dmConexao.tbSESRR22tam_8.AsString           := MontaValor;
            dmConexao.tbSESRR22tam_9.AsString           := MontaValor;
            dmConexao.tbSESRR22tam_10.AsString          := MontaValor;
            dmConexao.tbSESRR22tam_11.AsString          := MontaValor;
            dmConexao.tbSESRR22tam_12.AsString          := MontaValor;
            //dmConexao.tbSESRR22tam_13.AsString          := MontaValor;
            //dmConexao.tbSESRR22tam_14.AsString          := MontaValor;
            //dmConexao.tbSESRR22tam_15.AsString          := MontaValor;

            dmConexao.tbSESRR22qtd_1.AsInteger          := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_2.AsInteger          := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_3.AsInteger          := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_4.AsInteger          := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_5.AsInteger          := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_6.AsInteger          := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_7.AsInteger          := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_8.AsInteger          := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_9.AsInteger          := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_10.AsInteger         := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_11.AsInteger         := StrToInt(Montavalor);
            dmConexao.tbSESRR22qtd_12.AsInteger         := StrToInt(Montavalor);
            //dmConexao.tbSESRR22qtd_13.AsInteger         := StrToInt(Montavalor);
            //dmConexao.tbSESRR22qtd_14.AsInteger         := StrToInt(Montavalor);
            //dmConexao.tbSESRR22qtd_15.AsInteger         := StrToInt(Montavalor);

            dmConexao.tbSESRR22estoque.AsFloat          := RetFloat(MontaValor);

            dmConexao.tbSESRR22custo.AsCurrency         := RetFloat(MontaValor);
            dmConexao.tbSESRR22reposicao.AsCurrency     := RetFloat(MontaValor);
            dmConexao.tbSESRR22medio.AsCurrency         := RetFloat(MontaValor);
            dmConexao.tbSESRR22venda.AsCurrency         := RetFloat(MontaValor);
            dmConexao.tbSESRR22preco1.AsCurrency        := RetFloat(MontaValor);
            dmConexao.tbSESRR22preco2.AsCurrency        := RetFloat(MontaValor);
            dmConexao.tbSESRR22preco3.AsCurrency        := RetFloat(MontaValor);
            dmConexao.tbSESRR22promocao.AsCurrency      := RetFloat(MontaValor);
            dmConexao.tbSESRR22pontuacao.AsInteger      := StrToInt(Montavalor);
            dmConexao.tbSESRR22curva.AsString           := MontaValor;
            Montavalor;  // Ultima venda
            dmConexao.tbSESRR22ult_compra.AsString      := '01/01/1990';         // Planilha trás datas inexistentes

            //dmConexao.tbSESRR22marcacao.AsFloat         := (((dmConexao.tbSESRR22venda.AsCurrency / dmConexao.tbSESRR22reposicao.AsCurrency) - 1) * 100);


            dmConexao.tbSESRR22.Post;

          end;

        end;

      end;

      Readln(ArquivoCSV, Linha);

      Contador             := Contador + 1;

      ProgressBar.Position := Contador;
      lblProgresso.Caption := 'Importando registro ' + ZeroEsquerda(IntToStr(Contador), 6) + ' de ' + ZeroEsquerda(IntToStr(iTotLinhas), 6);
      frmImportaCSV.Refresh;

      Application.ProcessMessages;

    end;

  finally

    CloseFile(ArquivoCSV);
    Alerta('SGA | Importação', 'Processo finalizado', 'A importação da tabela CSV foi finalizado com sucesso.', 1, 1);
    Application.Terminate;

  end;

end;

function TfrmImportaCSV.RetCar(cValor: String): String;
var
  i: Integer;
begin

  Result := '';

  for I := 1 to Length(cValor) do
  begin

    if ((cValor[i] <> '.') and (cValor[i] <> '-')) then
      Result := Result + cValor[i];

  end;

end;

function TfrmImportaCSV.RetFloat(cValor: String): Real;
var
  cStrLimpa : String;

begin

  cStrLimpa := RetCar(cValor);
  Result    := 0;

  if Copy(cStrLimpa, Length(cStrLimpa), 1) = '-' then
    Result := StrToFloat(Copy(cStrLimpa, 1, Length(cStrLimpa)-1)) * (-1)
  else
    Result := StrToFloat(cStrLimpa);

end;

function TfrmImportaCSV.RetSpace(cValor: String): String;
var
  i: Integer;

begin

 Result := '';

  for I := 1 to Length(cValor) do
  begin

    if cValor[i] <> ' ' then
      Result := Result + cValor[i];

  end;

end;


function TfrmImportaCSV.RetDate(cValor: String): TDate;
begin

  if cValor = '00/00/0000' then
    Result := StrToDate('01/01/1990')
  else
    Result := StrToDate(cValor);

end;

function TfrmImportaCSV.VeriCampos: boolean;
begin

  Result := True;

  if edtCaminhoCSV.Text = '' then
  begin

    Alerta('SGA | Importação', 'Caminho do CSV vazio', 'Indique o arquivo CSV para ser importado.', 1, 1);
    Result := False;
    edtCaminhoCSV.SetFocus;
    exit

  end;

  if cbImportarTabela.ItemIndex = -1 then
  begin

    Alerta('SGA | Importação', 'Tabela a importar não selecionada', 'Indique para qual tabela deseja importar.', 1, 1);
    Result := False;
    cbImportarTabela.SetFocus;
    exit

  end;

end;

procedure TfrmImportaCSV.Teste;
var
  i: integer;
begin

  for I := 1 to 2000 do
  begin

    dmConexao.tbSESRR22.Append;

    dmConexao.tbSESRR22referencia.AsString := '10100';

    dmConexao.tbSESRR22.Post;

  end;

end;

end.
