unit ufrmModificaFolio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxLabel, cxTextEdit, cxContainer, cxEdit, cxGroupBox,
  cxPC, cxControls, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCurrencyEdit, cxLookAndFeelPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinValentine, dxSkinXmas2008Blue, cxGraphics, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, dxSkinSummer2008, cxLookAndFeels, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TfrmModificarFolio = class(TfrmCustomModule)
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edtFolio: TcxCurrencyEdit;
    edtSerie: TcxImageComboBox;
    procedure FormCreate(Sender: TObject);
    procedure edtFolioPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure ActionGuardar(Action: TBasicAction);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  end;

var
  frmModificarFolio: TfrmModificarFolio;

implementation

uses
  Modules, uDM, dmActions, dmImagenes, UtileriasComun;

{$R *.dfm}
{ TfrmModificarFolio }


procedure TfrmModificarFolio.ActionGuardar(Action: TBasicAction);
begin
  cxGroupBox1.SetFocus;
  if MessageDlg('�Deseas modificar el folio de la factura?', mtConfirmation, [mbNo, mbYES], 0) = mrYes then
    ShowMessage(DM.Servidor.ModificarFolioActual('FolioFactura', edtSerie.EditValue, Trunc(edtFolio.EditValue)));
end;

procedure TfrmModificarFolio.edtFolioPropertiesChange(Sender: TObject);
begin
  inherited;
  UpdateActionsState;
end;

procedure TfrmModificarFolio.FormCreate(Sender: TObject);
begin
  inherited;
  with edtSerie.Properties.Items.Add do
  begin
    Description:=DM.Serie;
    Value:=DM.Serie;
  end;
  if DM.SerieExpress <> '' then
  begin
    edtSerie.Enabled:=True;
    with edtSerie.Properties.Items.Add do
    begin
      Description:=DM.SerieExpress;
      Value:=DM.SerieExpress;
    end;
  end;
  edtSerie.EditValue:=DM.Serie;
end;

procedure TfrmModificarFolio.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actGuardar, ActionGuardar);
end;

procedure TfrmModificarFolio.UpdateActionsState;
begin
  inherited;
  dmAppActions.actGuardar.Enabled:=(edtFolio.Text <> '');
end;

initialization
  ModuleInfoManager.RegisterModule('Modificar Folio', TfrmModificarFolio);

end.
