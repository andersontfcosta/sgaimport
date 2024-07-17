unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  uClasse.Conexao, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, IniFiles;

type
  TdmConexao = class(TDataModule)
    FDConnection: TFDConnection;
    MySQLDriverLink: TFDPhysMySQLDriverLink;
    FBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    tbDuplicatas: TFDTable;
    dsDuplicatas: TDataSource;
    tbDuplicatasid: TFDAutoIncField;
    tbDuplicatasfilial: TIntegerField;
    tbDuplicatasfilial_desc: TStringField;
    tbDuplicatascliente: TIntegerField;
    tbDuplicatascliente_desc: TStringField;
    tbDuplicatasduplicata: TStringField;
    tbDuplicatasmodalidade: TIntegerField;
    tbDuplicatasmod_desc: TStringField;
    tbDuplicatassituacao: TIntegerField;
    tbDuplicatassituacao_desc: TStringField;
    tbDuplicatasvendedor: TStringField;
    tbDuplicatasvendedor_desc: TStringField;
    tbDuplicatasvalor: TSingleField;
    tbDuplicatasemissao: TDateField;
    tbDuplicatasvencimento: TDateField;
    tbDuplicataspagamento: TDateField;
    tbDuplicatasatraso: TIntegerField;
    tbDuplicatasjuros: TSingleField;
    tbDuplicatasdesconto: TSingleField;
    tbDuplicatascod_lancto: TStringField;
    tbDuplicatascod_lancto_desc: TStringField;
    tbDuplicatascaixa: TStringField;
    tbDuplicatascaixa_desc: TStringField;
    tbDuplicatasprazo: TIntegerField;
    tbDuplicatasoperador: TStringField;
    tbDuplicatasoperador_desc: TStringField;
    tbDuplicatasstatus: TStringField;
    tbDuplicatasano: TIntegerField;
    tbDuplicatasmes: TIntegerField;
    tbDuplicatasdia: TIntegerField;
    tbDuplicatastempo: TStringField;
    tbDuplicatasMexExt: TStringField;
    tbDuplicatascond_pagto: TStringField;
    tbDuplicatasdescricao: TStringField;
    dsSESRR22: TDataSource;
    tbClientes: TFDTable;
    dsClientes: TDataSource;
    tbClientesidclientes: TFDAutoIncField;
    tbClientescodigo: TIntegerField;
    tbClientescpf: TStringField;
    tbClientesdocumento: TStringField;
    tbClientesnome: TStringField;
    tbClientesnascimento: TDateField;
    tbClientestipo: TIntegerField;
    tbClientestipo_desc: TStringField;
    tbClientesestado_civil: TStringField;
    tbClientescalce: TStringField;
    tbClientesbloqueio: TStringField;
    tbClientescep: TStringField;
    tbClienteslogradouro: TStringField;
    tbClientesnumero: TStringField;
    tbClientescompleta: TStringField;
    tbClientesbairro: TStringField;
    tbClientescidade: TStringField;
    tbClientesuf: TStringField;
    tbClientesfone: TStringField;
    tbClientescelular: TStringField;
    tbClientesemail: TStringField;
    tbClientesfilial: TIntegerField;
    tbClientesvendedor: TStringField;
    tbClientesvendedor_desc: TStringField;
    tbClientesprimeira_compra: TDateField;
    tbClientesultima_compra: TDateField;
    tbClienteslimite: TSingleField;
    tbClientesvale: TSingleField;
    tbClientessaldo: TSingleField;
    tbClientesconjuge: TStringField;
    tbClientesnasc_conjuge: TDateField;
    tbClientespai: TStringField;
    tbClientesnasc_pai: TDateField;
    tbClientesmae: TStringField;
    tbClientesnasc_mae: TDateField;
    tbClientesobervacao: TStringField;
    tbClientesvestuario: TStringField;
    tbClientessexo: TStringField;
    tbClientesregiao: TStringField;
    tbClientesmaior_compra: TSingleField;
    tbClientesnumero_compra: TIntegerField;
    tbClientesnumero_atrasos: TIntegerField;
    tbClientesidade: TIntegerField;
    tbClientesatividade: TStringField;
    tbAltPreco: TFDTable;
    dsAltPreco: TDataSource;
    tbAltPrecoID: TIntegerField;
    tbAltPrecodata: TDateTimeField;
    tbAltPrecofilial: TIntegerField;
    tbAltPrecoreferencia: TStringField;
    tbAltPrecopreco_de: TBCDField;
    tbAltPrecopreco_por: TBCDField;
    tbVendas: TFDTable;
    dsVendas: TDataSource;
    tbVendasID: TIntegerField;
    tbVendasfilial: TIntegerField;
    tbVendasvendedor: TIntegerField;
    tbVendasvendedor_desc: TStringField;
    tbVendasgrupo: TIntegerField;
    tbVendasgrupo_desc: TStringField;
    tbVendassubgrupo: TStringField;
    tbVendassubgrupo_desc: TStringField;
    tbVendasano: TIntegerField;
    tbVendasmes: TIntegerField;
    tbVendasdia: TIntegerField;
    tbVendashora: TIntegerField;
    tbVendasminuto: TIntegerField;
    tbVendasreferencia: TStringField;
    tbVendasreferencia_desc: TStringField;
    tbVendascor: TIntegerField;
    tbVendascor_desc: TStringField;
    tbVendastamanho: TStringField;
    tbVendasquantidade: TIntegerField;
    tbVendasvr_total: TFloatField;
    tbVendascliente: TIntegerField;
    tbVendascliente_desc: TStringField;
    tbVendascidade: TStringField;
    tbVendasuf: TStringField;
    tbVendasdocto: TIntegerField;
    tbVendasserie_docto: TStringField;
    tbVendastipo: TStringField;
    tbVendascolecao: TIntegerField;
    tbVendascolecao_desc: TStringField;
    tbVendasfornecedor: TIntegerField;
    tbVendasfornecedor_desc: TStringField;
    tbVendasfornecedor_resumido: TStringField;
    tbVendasmarca: TIntegerField;
    tbVendasmarca_desc: TStringField;
    tbVendasmesext: TStringField;
    tbVendasreposicao: TFloatField;
    tbVendasdesconto: TFloatField;
    tbVendastempokey: TStringField;
    tbVendasdata: TDateField;
    tbVendasn_fiscal: TIntegerField;
    tbVendasserie_n_fiscal: TStringField;
    tbVendasecf: TStringField;
    tbVendasvr_avista: TFloatField;
    tbVendasvr_aprazo: TFloatField;
    tbVendasoriginal: TIntegerField;
    tbVendasvr_venda: TFloatField;
    tbVendaslinha: TIntegerField;
    tbVendaslinha_desc: TStringField;
    tbVendasmodalidade: TIntegerField;
    tbVendasmodalidade_desc: TStringField;
    tbVendasprazo: TStringField;
    tbVendasprazo_desc: TStringField;
    tbSESRR22: TFDTable;
    tbSESRR22id: TFDAutoIncField;
    tbSESRR22filial: TIntegerField;
    tbSESRR22nome: TStringField;
    tbSESRR22referencia: TStringField;
    tbSESRR22descricao: TStringField;
    tbSESRR22cor: TIntegerField;
    tbSESRR22cor_descricao: TStringField;
    tbSESRR22unidade: TStringField;
    tbSESRR22fornec: TIntegerField;
    tbSESRR22fornec_desc: TStringField;
    tbSESRR22resumido: TStringField;
    tbSESRR22grupo: TIntegerField;
    tbSESRR22grupo_desc: TStringField;
    tbSESRR22subgrupo: TIntegerField;
    tbSESRR22subgrupo_desc: TStringField;
    tbSESRR22marca: TIntegerField;
    tbSESRR22marca_desc: TStringField;
    tbSESRR22colecao: TIntegerField;
    tbSESRR22colecao_desc: TStringField;
    tbSESRR22linha: TIntegerField;
    tbSESRR22linha_desc: TStringField;
    tbSESRR22estoque: TSingleField;
    tbSESRR22custo: TSingleField;
    tbSESRR22reposicao: TSingleField;
    tbSESRR22venda: TSingleField;
    tbSESRR22preco1: TSingleField;
    tbSESRR22preco2: TSingleField;
    tbSESRR22preco3: TSingleField;
    tbSESRR22promocao: TSingleField;
    tbSESRR22marcacao: TSingleField;
    tbSESRR22ult_compra: TDateField;
    tbSESRR22inativos: TSingleField;
    tbSESRR22medio: TSingleField;
    tbSESRR22pontuacao: TIntegerField;
    tbSESRR22curva: TStringField;
    tbSESRR22tam_1: TStringField;
    tbSESRR22tam_2: TStringField;
    tbSESRR22tam_3: TStringField;
    tbSESRR22tam_4: TStringField;
    tbSESRR22tam_5: TStringField;
    tbSESRR22tam_6: TStringField;
    tbSESRR22tam_7: TStringField;
    tbSESRR22tam_8: TStringField;
    tbSESRR22tam_9: TStringField;
    tbSESRR22tam_10: TStringField;
    tbSESRR22tam_11: TStringField;
    tbSESRR22tam_12: TStringField;
    tbSESRR22tam_13: TStringField;
    tbSESRR22tam_14: TStringField;
    tbSESRR22tam_15: TStringField;
    tbSESRR22qtd_1: TSingleField;
    tbSESRR22qtd_2: TSingleField;
    tbSESRR22qtd_3: TSingleField;
    tbSESRR22qtd_4: TSingleField;
    tbSESRR22qtd_5: TSingleField;
    tbSESRR22qtd_6: TSingleField;
    tbSESRR22qtd_7: TSingleField;
    tbSESRR22qtd_8: TSingleField;
    tbSESRR22qtd_9: TSingleField;
    tbSESRR22qtd_10: TSingleField;
    tbSESRR22qtd_11: TSingleField;
    tbSESRR22qtd_12: TSingleField;
    tbSESRR22qtd_13: TSingleField;
    tbSESRR22qtd_14: TSingleField;
    tbSESRR22qtd_15: TSingleField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Conexao : TConexao;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.DataModuleCreate(Sender: TObject);
var
  cIniFile : String;
  IniFile  : TIniFile;
  cVendorLib : String;

begin


  IniFile := TIniFile.Create(extractfilepath(ParamStr(0)) + 'SGAImport.ini');


  cVendorLib  := extractfilepath(ParamStr(0)) + 'libmysql.dll';

  FBDriverLink.VendorLib    := IniFile.ReadString('SGA', 'VendorLib', cVendorLib);
  MySQLDriverLink.VendorLib := IniFile.ReadString('SGA', 'VendorLib', cVendorLib);


  FDConnection.Connected := False;

  FDConnection.Params.Clear;
  FDConnection.Params.Add('Server=' + IniFile.ReadString('SGA', 'Server', 'localhost'));
  FDConnection.Params.Add('user_name=' + IniFile.ReadString('SGA', 'user_name', 'root'));
  FDConnection.Params.Add('password=' + IniFile.ReadString('SGA', 'password', ''));
  FDConnection.Params.Add('port=' + IniFile.ReadString('SGA', 'Port', '3306'));
  FDConnection.Params.Add('Database=' + IniFile.ReadString('SGA', 'Database', 'sga'));
  FDConnection.Params.Add('DriverID=' + IniFile.ReadString('SGA', 'DriverID', 'MySQL'));

  FDConnection.Connected := True;

  tbSESRR22.Active       := True;
//  tbClientes.Active      := True;
//  tbDuplicatas.Active    := True;
//  tbAltPreco.Active      := True;

  Conexao := TConexao.Create(FDConnection);

end;

procedure TdmConexao.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Destroy;
end;

end.
