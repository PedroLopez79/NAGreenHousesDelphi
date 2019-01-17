unit ufrmBuscarEmpleado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBuscar, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxTextEdit, cxLabel, cxContainer, cxGroupBox, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxSkinsdxRibbonPainter, Menus,
  cxLookAndFeelPainters, uDAInterfaces, dxStatusBar, dxRibbonStatusBar,
  dxRibbon, StdCtrls, cxButtons, ExtCtrls, cxPC, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeels,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSpringTime;

type
  TfrmBuscarEmpleado = class(TfrmBuscar)
    dbgBuscarDBTableView2DespachadorID: TcxGridDBColumn;
    dbgBuscarDBTableView2Nombre: TcxGridDBColumn;
    dbgBuscarDBTableView2Codigo: TcxGridDBColumn;
    dbgBuscarDBTableView2Domicilio: TcxGridDBColumn;
    dbgBuscarDBTableView2Ciudad: TcxGridDBColumn;
    dbgBuscarDBTableView2Telefono: TcxGridDBColumn;
    dbgBuscarDBTableView2Status: TcxGridDBColumn;
    dbgBuscarDBTableView2FechaAlta: TcxGridDBColumn;
    dbgBuscarDBTableView2CuentaContable: TcxGridDBColumn;
    dbgBuscarDBTableView2EstacionID: TcxGridDBColumn;
    procedure cxBusquedaEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cxBusquedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxBusquedaExit(Sender: TObject);
    procedure dbgBuscarDBTableView2DblClick(Sender: TObject);
  private
    Procedure Buscar; override;
    { Private declarations }
  public
    { Public declarations }
    Nombre: String;
  end;

var
  frmBuscarEmpleado: TfrmBuscarEmpleado;

implementation

uses UtileriasComun, uDM;

{$R *.dfm}

procedure TfrmBuscarEmpleado.Buscar;
begin
  cdsBuscar.Close;
  cdsBuscar.ParamByName('Parametro').AsString:=edtBusqueda.Text;
  cdsBuscar.Open;
end;

procedure TfrmBuscarEmpleado.cxBusquedaEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  inherited;
  Busqueda:=False;
end;

procedure TfrmBuscarEmpleado.cxBusquedaExit(Sender: TObject);
begin
  inherited;
  Buscar;
  Busqueda:=True;
end;

procedure TfrmBuscarEmpleado.cxBusquedaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    if dbgBuscar.CanFocus then
      dbgBuscar.SetFocus;
  end;
end;

procedure TfrmBuscarEmpleado.dbgBuscarDBTableView2DblClick(Sender: TObject);
begin
  inherited;
  Clave:=cdsBuscar.FieldByName('DespachadorID').AsInteger;
  Nombre:=cdsBuscar.FieldByName('Nombre').AsString;
end;

end.
