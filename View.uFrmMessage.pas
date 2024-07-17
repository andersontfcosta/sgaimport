unit View.uFrmMessage;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  dxGDIPlusClasses;

type
  TfrmMessage = class(TForm)
    shpFundo: TShape;
    pnSeparatorLine01: TPanel;
    lblTituloMensagem: TLabel;
    imgInformation: TImage;
    pnSeparatorLine02: TPanel;
    lblSutituloMensagem: TLabel;
    lblMensagem: TLabel;
    pnConfirmar: TPanel;
    btConfirmar: TSpeedButton;
    pnCancelar: TPanel;
    btCancelar: TSpeedButton;
    imgInterrogation: TImage;
    imgError: TImage;
    procedure FormShow(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }

    cTitulo, cSubTitulo, cMensagem: String;
    iTipo, iBotoes: integer;                // 1-Ok; 2-Confirmar/Cancelar
    bReturn: boolean;

  end;

var
  frmMessage: TfrmMessage;
implementation

{$R *.dfm}

procedure TfrmMessage.btCancelarClick(Sender: TObject);
begin
  bReturn := False;
  Close;
end;

procedure TfrmMessage.btConfirmarClick(Sender: TObject);
begin
  bReturn := true;
  Close;
end;

procedure TfrmMessage.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
    btConfirmar.Click;

  if Key = #27 then
    btCancelar.Click;

end;

procedure TfrmMessage.FormShow(Sender: TObject);
var
  i: integer;

begin

  bReturn := False;

  lblTituloMensagem.Caption   := cTitulo;
  lblSutituloMensagem.Caption := cSubTitulo;
  lblMensagem.Caption         := cMensagem;

  // Imagem que irá aparecer
  for I := 0 to ComponentCount - 1 do
  begin

    if (frmMessage.Components[i] is TImage) and ((frmMessage.Components[i] as TImage).Tag = iTipo) then
      (frmMessage.Components[i] as TImage).Visible := True;

  end;

  // Tipo de botões
  case iBotoes of

    1: btConfirmar.Caption := 'Ok';
    2: pnCancelar.Visible  := True;

  end;

end;

end.
