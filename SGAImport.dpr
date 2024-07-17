program SGAImport;

uses
  Vcl.Forms,
  uImportaCSV in 'uImportaCSV.pas' {frmImportaCSV},
  uClasse.Conexao in 'uClasse.Conexao.pas',
  uDMConexao in 'uDMConexao.pas' {dmConexao: TDataModule},
  View.uFrmMessage in '..\vSICOM\View\View.uFrmMessage.pas' {frmMessage},
  Utils.Funcoes in '..\vSICOM\Utils\Utils.Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmImportaCSV, frmImportaCSV);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmMessage, frmMessage);
  Application.Run;
end.
