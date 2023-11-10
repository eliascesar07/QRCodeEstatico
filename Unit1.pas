unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin, ComCtrls, ACBrPIXCD;

type

  { TForm1 }

  TForm1 = class(TForm)
    ACBrPixCD1: TACBrPixCD;
    btSalvarPNG: TButton;
    btSalvarPNG1: TButton;
    btGerarQRCodePIX: TButton;
    btGerarQRCodeTexto: TButton;
    edChave: TEdit;
    edInfo: TEdit;
    edTexto: TEdit;
    edCidade: TEdit;
    edNome: TEdit;
    edValor: TFloatSpinEdit;
    imgQRCode: TImage;
    Label1: TLabel;
    Label2: TLabel;
    lbInfo: TLabel;
    lbTexto: TLabel;
    lbCidade: TLabel;
    lbNome: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    pnPIX: TPanel;
    pnTexto: TPanel;
    tsTexto: TTabSheet;
    tsPIX: TTabSheet;
    procedure btGerarQRCodePIXClick(Sender: TObject);
    procedure btSalvarPNGClick(Sender: TObject);
    procedure btGerarQRCodeTextoClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses
  ACBrImage, ACBrDelphiZXingQRCode, ACBrUtil.Strings;

{$R *.lfm}

{ TForm1 }

procedure TForm1.btGerarQRCodePIXClick(Sender: TObject);
var
  wQRCode: String;
begin
  ACBrPixCD1.Recebedor.Nome := Trim(edNome.Text);
  ACBrPixCD1.Recebedor.Cidade := Trim(edCidade.Text);
  wQRCode := ACBrPixCD1.GerarQRCodeEstatico(edChave.Text, edValor.Value, edInfo.Text);
  PintarQRCode(wQRCode, imgQRCode.Picture.Bitmap, qrUTF8BOM);
end;

procedure TForm1.btSalvarPNGClick(Sender: TObject);
begin
  imgQRCode.Picture.SaveToFile('_QRCode_' + OnlyAlphaNum(edNome.Text) + '.png');
end;

procedure TForm1.btGerarQRCodeTextoClick(Sender: TObject);
begin
  PintarQRCode(edTexto.Text, imgQRCode.Picture.Bitmap, qrUTF8BOM);
end;

end.

