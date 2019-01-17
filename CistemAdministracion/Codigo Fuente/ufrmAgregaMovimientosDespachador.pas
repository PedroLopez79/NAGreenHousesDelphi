unit ufrmAgregaMovimientosDespachador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxTextEdit, cxCalendar, cxDBLookupComboBox, uDAScriptingProvider,
  uDADataTable, uDACDSDataTable, uDAInterfaces, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxMaskEdit, cxButtonEdit, cxDBEdit, StdCtrls,
  cxGroupBox, uDAMemDataTable;

type
  TfrmAgregaMovimientosDespachador = class(TfrmCustomModule)
    cxGroupBox2: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edtNombre: TcxTextEdit;
    edtDespachador: TcxDBButtonEdit;
    dsEstacion: TDADataSource;
    cdsEstacion: TDACDSDataTable;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cdsDespachador: TDAMemDataTable;
    dsDespachador: TDADataSource;
    cdsProducto: TDAMemDataTable;
    dsProducto: TDADataSource;
    cdsMovimientos: TDACDSDataTable;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dsMovimiento: TDADataSource;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    procedure edtDespachadorExit(Sender: TObject);
    procedure edtDespachadorPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cdsMovimientosBeforePost(DataTable: TDADataTable);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure BuscarDespachador;
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  protected
    procedure RegisterActions; override;
  end;

var
  frmAgregaMovimientosDespachador: TfrmAgregaMovimientosDespachador;

implementation

uses Modules, uDM, dmActions, ufrmBuscar, ufrmBuscarCliente,
  UtileriasComun, dmImagenes, LibraryEmpresas_Intf, ufrmParametros,
  ufrmDatosCupon, ufrmBuscarEmpleado;

{$R *.dfm}

{ TfrmCustomModule1 }

procedure TfrmAgregaMovimientosDespachador.ActionCancelar(Action: TBasicAction);
var
   Valor: String;
begin
   Valor:='0000';
   cdsMovimientos.Close;
   cdsMovimientos.Open;
   edtDespachador.Text:=Valor;
   edtNombre.Text:='';
end;

procedure TfrmAgregaMovimientosDespachador.ActionGuardar(Action: TBasicAction);
begin
  if cdsMovimientos.RecordCount < 1 then
    raise Exception.Create('No existen registros para guardar.');
  if cdsMovimientos.State in dsEditModes then
    raise Exception.Create('Debe completar el registro que esta capturando antes de gusrdar.');

  cdsMovimientos.ApplyUpdates();
  cdsMovimientos.Close;
  cdsMovimientos.Open;
end;

procedure TfrmAgregaMovimientosDespachador.ActionNuevo(Action: TBasicAction);
begin
  cdsMovimientos.Append;

  cdsEstacion.Close;
  cdsEstacion.Open;

  cdsProducto.Close;
  cdsProducto.Open;

  UpdateActionsState;
  edtDespachador.SetFocus;

  cdsMovimientos.FieldByName('Cargo').AsInteger:= 0;
  cdsMovimientos.FieldByName('Abono').AsInteger:= 0;
  cdsMovimientos.FieldByName('Fecha').AsDateTime:=Trunc(DM.Servidor.Fecha);
end;

procedure TfrmAgregaMovimientosDespachador.BuscarDespachador;
begin
  frmBuscarEmpleado:=TfrmBuscarEmpleado.Create(nil);
  frmBuscarEmpleado.ShowModal;
  if (frmBuscarEmpleado.OK) or (frmBuscarEmpleado.OKClienteNuevo) then
  begin
    edtDespachador.EditText  :=inttostr(frmBuscarEmpleado.Clave);
    edtDespachador.EditValue :=frmBuscarEmpleado.Clave;
    cdsMovimientos.FieldByName('DespachadorID').AsInteger:= frmBuscarEmpleado.Clave;
    edtDespachador.EditText:= frmBuscarEmpleado.Nombre;
    edtNombre.Text:=  frmBuscarEmpleado.Nombre;
  end;
end;

procedure TfrmAgregaMovimientosDespachador.cdsMovimientosBeforePost(
  DataTable: TDADataTable);
begin
  inherited;
  //cdsMovimientos.FieldByName('Fecha').AsDateTime:=Trunc(DM.Servidor.Fecha);
  //if not DM.FechaValida(cdsMovimientos.FieldByName('FechaMovimiento').AsDateTime) then
  //raise Exception.Create('Fecha fuera de Ejercicio/Periodo.');

  //cdsMovimientos.FieldByName('IdentificadorID').AsInteger:=DM.Identificador;

  cdsMovimientos.FieldByName('Ejercicio').AsString:=FormatDateTime('yyyy', cdsMovimientos.FieldByName('Fecha').AsDateTime);
  cdsMovimientos.FieldByName('Periodo').AsString:=FormatDateTime('mm', cdsMovimientos.FieldByName('Fecha').AsDateTime);
  cdsMovimientos.FieldByName('Dia').AsString:=FormatDateTime('dd', cdsMovimientos.FieldByName('Fecha').AsDateTime);

  cdsMovimientos.FieldByName('LiquidacionID').AsInteger:=0;
  cdsMovimientos.FieldByName('TurnoID').AsInteger:=0;
  cdsMovimientos.FieldByName('DespachadorID').AsInteger:=edtDespachador.EditValue;
  cdsMovimientos.FieldByName('UsuarioID').AsInteger:=DM.Seguridad.idEmpleado;
  cdsMovimientos.FieldByName('MovimientoDespachadorID').AsInteger:=DM.Servidor.Folio('MovimientoDespachadorID', '');
end;

procedure TfrmAgregaMovimientosDespachador.edtDespachadorExit(Sender: TObject);
begin
  inherited;
  if edtDespachador.Text <> '' then
  begin

  cdsDespachador.Close;
  cdsDespachador.ParamByName('DespachadorID').asInteger:= strtoint(edtDespachador.EditingText);
  cdsDespachador.Open;

  if not cdsDespachador.EOF then
     edtNombre.EditValue:= cdsDespachador.FieldByName('Nombre').AsString;
  end;
end;

procedure TfrmAgregaMovimientosDespachador.edtDespachadorPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  BuscarDespachador;
  cxGrid1.SetFocus;
end;

procedure TfrmAgregaMovimientosDespachador.FormCreate(Sender: TObject);
begin
  inherited;
  cdsMovimientos.Close;
  cdsMovimientos.ParamByName('Movimiento').AsInteger:=-1;
  cdsMovimientos.Open;
end;

procedure TfrmAgregaMovimientosDespachador.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
end;

procedure TfrmAgregaMovimientosDespachador.UpdateActionsState;
begin
  inherited;
  dmAppActions.actNuevo.Enabled:=not (cdsMovimientos.State in dsEditModes);
  dmAppActions.actGuardar.Enabled:=not dmAppActions.actNuevo.Enabled;
  dmAppActions.actCancelar.Enabled:=not dmAppActions.actNuevo.Enabled;

  if not (edtDespachador.Focused) then dmAppActions.actBuscar.Enabled:=False;
  begin
  cxGroupBox1.Enabled := not (dmAppActions.actNuevo.Enabled);
  cxGrid1.Enabled     := not (dmAppActions.actNuevo.Enabled);
  end;
end;

initialization
  ModuleInfoManager.RegisterModule('AgregaMovimientoDespachador', TfrmAgregaMovimientosDespachador);

end.
