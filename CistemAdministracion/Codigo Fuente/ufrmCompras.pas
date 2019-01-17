unit ufrmCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxDBEdit, cxPC, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxLabel, cxContainer, cxGroupBox, ExtCtrls, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxDBLookupComboBox, cxLookupEdit,
  cxDBLookupEdit, cxCheckBox, StdCtrls, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, uDAInterfaces, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeelPainters,
  cxLookAndFeels, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinPumpkin,
  dxSkinSeven, dxSkinSharp, dxSkinSpringTime, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxPCdxBarPopupMenu, cxNavigator, uDAFields,
  uROComponent;

type
  TFrmCompra = class(TfrmCustomModule)
    cdsProveedor: TDACDSDataTable;
    dsProveedor: TDADataSource;
    dsProducto: TDADataSource;
    cdsProducto: TDACDSDataTable;
    pgcFacturacion: TcxPageControl;
    cxPagCompra: TcxPageControl;
    cxTabCompra: TcxTabSheet;
    grbEncabezado: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    dbTxtFolio: TcxDBTextEdit;
    cxDbTxtFacturaCompra: TcxDBTextEdit;
    dbDatFecha: TcxDBDateEdit;
    cxGroupBox5: TcxGroupBox;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxLabel19: TcxLabel;
    cxGroupBox6: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    dbCbxAlmacen: TcxDBLookupComboBox;
    cxLabel2: TcxLabel;
    cxGridDBTableView3Cantidad: TcxGridDBColumn;
    cxGridDBTableView3Costo: TcxGridDBColumn;
    cxGridDBTableView3ProductoID: TcxGridDBColumn;
    cxGridDBTableView3Importe: TcxGridDBColumn;
    edtBonoMerma: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    dbCbTipoMov: TcxDBLookupComboBox;
    cxLabel4: TcxLabel;
    cdsTipoMovAlmacen: TDACDSDataTable;
    dsTipoMovAlmacen: TDADataSource;
    cdsMovimientoAlmacen2: TDACDSDataTable;
    dsMovimientoAlmacen2: TDADataSource;
    cdsAlmacen2: TDACDSDataTable;
    dsAlmacen2: TDADataSource;
    dsDetalleMovAlmacen2: TDADataSource;
    cdsDetalleMovAlmacen2: TDACDSDataTable;
    cxEstacionDestino: TcxDBLookupComboBox;
    cxLabel1: TcxLabel;
    cxAlmacenDestino: TcxDBLookupComboBox;
    cxLabel9: TcxLabel;
    cdsEstaciones: TDACDSDataTable;
    dsEstaciones: TDADataSource;
    cxDescripcion: TcxGridDBColumn;
    cxBonoMerma: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    cdsMovAlmacenDos: TDACDSDataTable;
    cdsDetalleMovDos: TDACDSDataTable;
    dbcProveedor: TcxDBLookupComboBox;
    procedure dbCbxAlmacenEnter(Sender: TObject);
    procedure cdsDetalleMovAlmacen2ProductoIDValidate(Sender: TDACustomField);
    procedure cxGridDBTableView3FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dbCbTipoMovExit(Sender: TObject);
    procedure cdsDetalleMovAlmacen2BeforePost(DataTable: TDADataTable);
    procedure cdsDetalleMovAlmacen2AfterPost(DataTable: TDADataTable);
    procedure cdsMovimientoAlmacen2NewRecord(DataTable: TDADataTable);
    procedure cdsDetalleMovAlmacen2NewRecord(DataTable: TDADataTable);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1Exit(Sender: TObject);
    procedure cxGridDBTableView3ProductoIDPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure dbTxtProveedorEnter(Sender: TObject);
    procedure cxGrid1Enter(Sender: TObject);
    procedure cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbTxtProveedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView3EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
    procedure EliminarNulos;
    function ExisteProducto(ProductoID:Integer):Boolean;
    procedure BuscarProducto;
    procedure FiltraAlmacen(Filtro: string);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
     procedure UpdateActionsState; override;
  end;

var
  FrmCompra: TFrmCompra;
  ImpuestoPorcentaje:Real;
  Consulta:Byte;
  Transaccion: Integer;

implementation

  uses Modules, uDM, dmActions, ufrmBuscarProveedor,
  LibraryEmpresas_Intf, UtileriasComun, ufrmBuscarProducto;

{$R *.dfm}

procedure TFrmCompra.ActionNuevo(Action: TBasicAction);
begin
  grbEncabezado.Enabled:=True;
  dbTxtFolio.Enabled:=True;
  dbCbxAlmacen.Enabled:=True;
  dbcProveedor.Enabled:=True;
  cxDbTxtFacturaCompra.Enabled:=True;
  cxgrid1.Enabled:=True;
  edtBonoMerma.Enabled:=True;
  dbCbTipoMov.Enabled:=True;

  cdsMovimientoAlmacen2.Append;
  cdsDetalleMovAlmacen2.Close;
  cdsDetalleMovAlmacen2.Open;
  grbEncabezado.SetFocus;
  dbCbxAlmacen.SetFocus;
end;

procedure TFrmCompra.BuscarProducto;
begin
  frmBuscarProducto:=TfrmBuscarProducto.Create(Self);
  frmBuscarProducto.IniciarBusqueda(0);
  frmBuscarProducto.ShowModal;
  if frmBuscarProducto.OK then
  begin
    if (cdsDetalleMovAlmacen2.State = dsBrowse) then
        cdsDetalleMovAlmacen2.Append;
        cdsDetalleMovAlmacen2.FieldByName('ProductoID').AsInteger:=frmBuscarProducto.Clave;
  end;
end;

procedure TFrmCompra.ActionGuardar(Action: TBasicAction);
var
Aux: LibraryEmpresas_Intf.TReporte;
i: Integer;
begin
  EliminarNulos;
  if cdsDetalleMovAlmacen2.RecordCount > 0 then
  begin
    grbEncabezado.Enabled:=False;
    cdsMovimientoAlmacen2.FieldByName('Folio').AsInteger:=DM.Servidor.Folio('FolioCompra','');
    cdsMovimientoAlmacen2.FieldByName('UsuarioID').AsInteger:=DM.Seguridad.idEmpleado;
    cdsMovimientoAlmacen2.Post;
    cdsMovimientoAlmacen2.ApplyUpdates();
    cdsDetalleMovAlmacen2.ApplyUpdates();
    if cdsMovimientoAlmacen2.FieldByName('TipoMovimientoAlmacenID').AsInteger = 5 then
    begin
      cdsMovAlmacenDos.Open;
      cdsMovAlmacenDos.Append;
      for I := 0 to cdsMovimientoAlmacen2.FieldCount - 1 do
        cdsMovAlmacenDos.FieldByName(cdsMovimientoAlmacen2.Fields[I].Name).AsVariant:=cdsMovimientoAlmacen2.Fields[I].Value;
      cdsMovAlmacenDos.FieldByName('MovimientoAlmacenID').AsInteger:=DM.Servidor.Folio('MovimientoAlmacen','');
      cdsMovAlmacenDos.FieldByName('Folio').AsInteger:=DM.Servidor.Folio('FolioCompra','');
      cdsMovAlmacenDos.FieldByName('AlmacenID').AsInteger:=cdsMovimientoAlmacen2.FieldByName('AlmacenDestinoID').AsInteger;
      cdsMovAlmacenDos.FieldByName('EstacionID').AsInteger:=cdsMovimientoAlmacen2.FieldByName('EstacionDestinoID').AsInteger;
      cdsMovAlmacenDos.FieldByName('AlmacenDestinoID').AsInteger:=cdsMovimientoAlmacen2.FieldByName('AlmacenID').AsInteger;
      cdsMovAlmacenDos.FieldByName('EstacionDestinoID').AsInteger:=cdsMovimientoAlmacen2.FieldByName('EstacionID').AsInteger;
      cdsMovAlmacenDos.FieldByName('TipoMovimientoAlmacenID').AsInteger:=4;
      cdsMovAlmacenDos.Post;
      cdsMovAlmacenDos.ApplyUpdates();
      cdsDetalleMovAlmacen2.First;
      cdsDetalleMovDos.Open;
      while not cdsDetalleMovAlmacen2.EOF do
      begin
        cdsDetalleMovDos.Append;
        for I := 0 to cdsDetalleMovAlmacen2.FieldCount - 1 do
          cdsDetalleMovDos.FieldByName(cdsDetalleMovAlmacen2.Fields[I].Name).AsVariant:=cdsDetalleMovAlmacen2.Fields[I].Value;
        cdsDetalleMovDos.FieldByName('MovimientoAlmacenID').AsInteger:=cdsMovAlmacenDos.FieldByName('MovimientoAlmacenID').AsInteger;
        cdsDetalleMovDos.FieldByName('DetalleMovimientoAlmacenID').AsInteger:=DM.Servidor.Folio('DetalleTransaccionID','');

        cdsDetalleMovDos.Post;
        cdsDetalleMovAlmacen2.Next;
      end;
      cdsDetalleMovDos.ApplyUpdates();
      cdsMovAlmacenDos.Close;
      cdsDetalleMovDos.Close;
    end;
   Aux:=TReporte.Create;
   Try
      Aux.Assign(DM.Servidor.BuscaReporte('INVENTARIOS TIPO MOVIMIENTO', 1));
      DM.Parametros.FacturasdeCompras:=Transaccion;
      DM.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, 'IMPRIMIENDO...', Aux.CampoJoin,False);
    finally
      Aux.Free;
    end;
  end
  else
    Showmessage('Registre al menos un Producto');
end;

procedure TFrmCompra.ActionCancelar(Action: TBasicAction);
begin

  dbTxtFolio.Enabled:=false;
  dbCbxAlmacen.Enabled:=False;
  dbcProveedor.Enabled:=False;
  cxDbTxtFacturaCompra.Enabled:=False;
  cxgrid1.Enabled:=false;
  edtBonoMerma.Enabled:=False;
  dbCbTipoMov.Enabled:=False;
  cxEstacionDestino.Enabled:=False;
  cxAlmacenDestino.Enabled:=False;

  cdsMovimientoAlmacen2.Cancel;
  cdsDetalleMovAlmacen2.Cancel;
  cdsDetalleMovAlmacen2.Close;
end;

procedure TFrmCompra.ActionBuscar(Action: TBasicAction);
begin
  case Consulta of
    2:BuscarProducto;
  end;
end;

procedure TFrmCompra.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
end;

procedure TFrmCompra.UpdateActionsState;
begin
  inherited;
  dmAppActions.actNuevo.Enabled:=cdsMovimientoAlmacen2.State = dsBrowse;
  dmAppActions.actGuardar.Enabled:=(cdsMovimientoAlmacen2.State in dsEditModes);
  dmAppActions.actCancelar.Enabled:=cdsMovimientoAlmacen2.State in dsEditModes;
  dmAppActions.actEliminar.Enabled:=(cdsMovimientoAlmacen2.State = dsBrowse) and (cdsMovimientoAlmacen2.RecordCount > 0);
  dmAppActions.actBuscar.Enabled:=((cdsMovimientoAlmacen2.State=dsEdit) or (cdsMovimientoAlmacen2.State=dsInsert));
end;

procedure TFrmCompra.cdsDetalleMovAlmacen2AfterPost(DataTable: TDADataTable);
var
  Total:Real;
  Impuesto: Real;
  Merma: Float;
begin
  inherited;
  Total:=0;
  cdsDetalleMovAlmacen2.First;
  While not cdsDetalleMovAlmacen2.EOF do
  begin
     Total:=Total + Decimales(cdsDetalleMovAlmacen2.FieldByName('Cantidad').AsFloat *
                    cdsDetalleMovAlmacen2.FieldByName('Precio').AsFloat, 2);
     cdsDetalleMovAlmacen2.Next;
  end;

     cdsEstaciones.Locate('EmpresaID', cdsMovimientoAlmacen2.FieldByName('EstacionID').AsInteger, []);
     ImpuestoPorcentaje:=cdsEstaciones.FieldByName('Impuesto').AsFloat;

     cdsMovimientoAlmacen2.FieldByName('ImpuestoPorcentaje').AsFloat:=ImpuestoPorcentaje;
     cdsMovimientoAlmacen2.FieldByName('SubTotal').AsFloat:=Decimales(Total, 2);
     Impuesto:= (Total*(ImpuestoPorcentaje/100));
     cdsMovimientoAlmacen2.FieldByName('Impuesto').AsFloat:=Impuesto;
     Merma:=cdsMovimientoAlmacen2.FieldByName('BonoMerma').AsFloat;
     cdsMovimientoAlmacen2.FieldByName('Total').AsFloat:=Total + Impuesto - Merma;

end;

procedure TFrmCompra.cdsDetalleMovAlmacen2BeforePost(DataTable: TDADataTable);
begin
  inherited;
   cdsDetalleMovAlmacen2.FieldByName('Importe').AsFloat:=cdsDetalleMovAlmacen2.FieldByName('Cantidad').AsFloat *
                                                    cdsDetalleMovAlmacen2.FieldByName('Precio').AsFloat;
end;

procedure TFrmCompra.cdsDetalleMovAlmacen2NewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleMovAlmacen2.FieldByName('DetalleMovimientoAlmacenID').AsInteger:=DM.Servidor.Folio('DetalleTransaccionID','');
  cdsDetalleMovAlmacen2.FieldByName('MovimientoAlmacenID').AsInteger:=cdsMovimientoAlmacen2.FieldByName('MovimientoAlmacenID').AsInteger;
  cdsDetalleMovAlmacen2.FieldByName('Cantidad').AsFloat:=0;
  cdsDetalleMovAlmacen2.FieldByName('Precio').AsFloat:=0;
end;

procedure TFrmCompra.cdsDetalleMovAlmacen2ProductoIDValidate(
  Sender: TDACustomField);
begin
  inherited;
  if cdsProducto.Locate('ProductoID', cdsDetalleMovAlmacen2.FieldByName('ProductoID').AsInteger, []) then
    cdsDetalleMovAlmacen2.FieldByName('Precio').AsFloat:=cdsProducto.FieldByName('Costo').AsFloat;
end;

procedure TFrmCompra.cdsMovimientoAlmacen2NewRecord(DataTable: TDADataTable);
var
  Fecha:DateTime;
begin
  inherited;
  Fecha:=DM.Servidor.Fecha;
  cdsMovimientoAlmacen2.FieldByName('MovimientoAlmacenID').AsInteger:=DM.Servidor.Folio('MovimientoAlmacen','');
  Transaccion:= cdsMovimientoAlmacen2.FieldByName('MovimientoAlmacenID').AsInteger;
  cdsMovimientoAlmacen2.FieldByName('Folio').AsInteger:=DM.Servidor.FolioActual('FolioCompra','');
  cdsMovimientoAlmacen2.FieldByName('Fecha').AsDateTime:=Trunc(Fecha);
  cdsMovimientoAlmacen2.FieldByName('Ejercicio').AsInteger:=StrToInt(FormatDateTime('yyyy',Fecha));
  cdsMovimientoAlmacen2.FieldByName('Periodo').AsInteger:=StrToInt(FormatDateTime('m',Fecha));
  cdsMovimientoAlmacen2.FieldByName('Dia').AsInteger:=StrToInt(FormatDateTime('d',Fecha));
  cdsMovimientoAlmacen2.FieldByName('EstacionID').AsInteger:=DM.Estacion;
  cdsMovimientoAlmacen2.FieldByName('TipoMovimientoAlmacenID').AsInteger:=1;
  cdsMovimientoAlmacen2.FieldByName('BonoMerma').AsInteger:=0;
end;

procedure TFrmCompra.cxGrid1Enter(Sender: TObject);
begin
  inherited;
  Consulta:=2;
end;

procedure TFrmCompra.cxGrid1Exit(Sender: TObject);
begin
  inherited;
  if (cdsDetalleMovAlmacen2.State = dsEdit) or
     (cdsDetalleMovAlmacen2.State = dsInsert) then
      cdsDetalleMovAlmacen2.Cancel;
      Consulta:=0;
end;

procedure TFrmCompra.cxGridDBTableView3EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key=VK_F2 then
  begin
    BuscarProducto;
  end;
end;

procedure TFrmCompra.cxGridDBTableView3FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  Sender.OptionsSelection.CellSelect:=AFocusedRecord = nil;
end;

procedure TFrmCompra.cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=VK_F2 then
  begin
    BuscarProducto;
  end;
end;

procedure TFrmCompra.cxGridDBTableView3ProductoIDPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue > 0 then
  begin
    if ExisteProducto(DisplayValue) then
    begin
      cdsDetalleMovAlmacen2.FieldByName('Precio').AsFloat:=DM.Servidor.CostoProducto(DisplayValue);
      cdsDetalleMovAlmacen2.FieldByName('ProductoID').AsInteger:=DisplayValue;
//      cdsProductoNombre.Close;
//      cdsProductoNombre.ParamByName('ProductoID').AsInteger:=cdsDetalleMovAlmacen2.FieldByName('ProductoID').AsInteger;
//      cdsProductoNombre.Open;
    end
    else
      Showmessage('Producto NO Existe o no es Inventariable');
  end;
end;

procedure TFrmCompra.dbCbTipoMovExit(Sender: TObject);
begin
  inherited;
    if (dbCbTipoMov.Text = 'Salida por Traspaso') or (dbCbTipoMov.Text = 'SALIDA POR TRASPASO') then
    begin
       cxEstacionDestino.Enabled:=True;
       cxAlmacenDestino.Enabled:=True;
       cdsMovimientoAlmacen2.FieldByName('EstacionDestinoID').AsInteger:=DM.Estacion;
    end
    else
    begin
       cxEstacionDestino.Enabled:=False;
       cxAlmacenDestino.Enabled:=False;
    end;
end;

procedure TFrmCompra.dbCbxAlmacenEnter(Sender: TObject);
begin
  inherited;
  FiltraAlmacen('EstacionID = ' + IntToStr(DM.Estacion));
end;

procedure TFrmCompra.dbTxtProveedorEnter(Sender: TObject);
begin
  inherited;
  Consulta:=1;
end;

procedure TFrmCompra.dbTxtProveedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=VK_F2 then
  begin
    case Consulta of
      2:BuscarProducto;
    end
  end;
end;

procedure TFrmCompra.FiltraAlmacen(Filtro: string);
begin
  cdsAlmacen2.Filtered:=False;
  cdsAlmacen2.Filter:=Filtro;
  cdsAlmacen2.Filtered:=True;
end;

procedure TFrmCompra.FormCreate(Sender: TObject);
begin
  inherited;
  cxGridDBTableView3.Styles.ContentEven:=DM.cxStyle2;
  dbTxtFolio.Enabled:=false;
  dbCbxAlmacen.Enabled:=False;
  dbcProveedor.Enabled:=False;
  cxDbTxtFacturaCompra.Enabled:=False;
  edtBonoMerma.Enabled:=False;
  cxgrid1.Enabled:=false;
  dbCbTipoMov.Enabled:=False;
  cxEstacionDestino.Enabled:=False;
  cxAlmacenDestino.Enabled:=False;
  cdsAlmacen2.Open;
  cdsTipoMovAlmacen.Open;
  cdsProducto.Open;
  cdsProveedor.Open;
  cdsMovimientoAlmacen2.Open;
  cdsDetalleMovAlmacen2.Open;
  cdsMovAlmacenDos.Open;
  cdsEstaciones.Open;
end;

procedure TFrmCompra.EliminarNulos;
begin
  cdsDetalleMovAlmacen2.First;
  while not cdsDetalleMovAlmacen2.EOF  do
  begin
    if (cdsDetalleMovAlmacen2.FieldByName('ProductoID').AsInteger=0) then
        cdsDetalleMovAlmacen2.Delete;
        cdsDetalleMovAlmacen2.Next;
  end;
end;


function TFrmCompra.ExisteProducto(ProductoID: Integer): Boolean;
begin
  Result:=cdsProducto.Locate('ProductoID',ProductoID, [loCaseInsensitive]);
end;

initialization
  ModuleInfoManager.RegisterModule('Almacen', TFrmCompra);
end.
