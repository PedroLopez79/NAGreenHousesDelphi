unit ufrmFacturacionDePiso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxDBEdit, cxPC, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxLabel, cxContainer, cxGroupBox, ExtCtrls, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxDBLookupComboBox, cxLookupEdit,
  cxDBLookupEdit, cxCheckBox, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCurrencyEdit,uDAInterfaces, dxSkinsdxRibbonPainter,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinSilver, dxSkinStardust, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeelPainters, dxSkinSummer2008, Menus, StdCtrls, cxButtons,
  cxLookAndFeels, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinPumpkin,
  dxSkinSeven, dxSkinSharp, dxSkinSpringTime, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxPCdxBarPopupMenu, cxNavigator, uDAFields,
  uROComponent;

type
  TEx=Class(Exception);

  TFrmFacturacionDePiso = class(TfrmCustomModule)
    cdsCliente: TDACDSDataTable;
    dsCliente: TDADataSource;
    dsProducto: TDADataSource;
    cdsProducto: TDACDSDataTable;
    dsDetalleFactura: TDADataSource;
    dsFactura: TDADataSource;
    cdsFormaPago: TDACDSDataTable;
    dsFormaPago: TDADataSource;
    cdsEmpresa: TDACDSDataTable;
    dsEstacion: TDADataSource;
    pgcFacturacion: TcxPageControl;
    cxTabFacturacion: TcxTabSheet;
    cxTabTicket: TcxTabSheet;
    GrBoxDatos: TcxGroupBox;
    LblFolio: TcxLabel;
    LblNoCliente: TcxLabel;
    LblRFC: TcxLabel;
    LblFecha: TcxLabel;
    LblDireccion: TcxLabel;
    LblColnia: TcxLabel;
    LblCiudad: TcxLabel;
    LblCodigoPostal: TcxLabel;
    cxLabel1: TcxLabel;
    cxDbTxtFolio: TcxDBTextEdit;
    cxDBTxtCliente: TcxDBTextEdit;
    cxDBTxtNombre: TcxDBTextEdit;
    cxDBTxtRFC: TcxDBTextEdit;
    cxDBTxtDireccion: TcxDBTextEdit;
    cxDBTxtColonia: TcxDBTextEdit;
    cxDBTxtCiudad: TcxDBTextEdit;
    cxDBTxtCP: TcxDBTextEdit;
    cxDBDateFecha: TcxDBDateEdit;
    cxDBTxtSerie: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cbxFormaPago: TcxDBLookupComboBox;
    cxLabel2: TcxLabel;
    dsTicketFactura: TDADataSource;
    cxGroupBox1: TcxGroupBox;
    LblFacturacionIva: TcxLabel;
    LblFacturacionTotal: TcxLabel;
    txtTotalFactura: TcxDBTextEdit;
    txtImpuestoFactura: TcxDBTextEdit;
    txtSubTotalFactura: TcxDBTextEdit;
    LblFacturacionSubtotal: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    GridFacturacion: TcxGrid;
    GridFacturacionDBTableView1: TcxGridDBTableView;
    GridFacturacionDBTableView1ProductoID: TcxGridDBColumn;
    GridFacturacionDBTableView1Descripcion: TcxGridDBColumn;
    GridFacturacionDBTableView1Cantidad: TcxGridDBColumn;
    GridFacturacionDBTableView1PrecioCalculado: TcxGridDBColumn;
    GridFacturacionDBTableView1Importe: TcxGridDBColumn;
    GridFacturacionLevel1: TcxGridLevel;
    cxGroupBox3: TcxGroupBox;
    grdTicket: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1TicketID: TcxGridDBColumn;
    cxGridDBTableView1Fecha: TcxGridDBColumn;
    cxGridDBTableView1Producto: TcxGridDBColumn;
    cxGridDBTableView1Volumen: TcxGridDBColumn;
    cxGridDBTableView1Precio: TcxGridDBColumn;
    cxGridDBTableView1Importe: TcxGridDBColumn;
    cxGridDBTableView1Nombre: TcxGridDBColumn;
    cbxListaTicket: TcxComboBox;
    cbxTipoFactura: TcxDBLookupComboBox;
    cxLabel4: TcxLabel;
    cdsTipoFactura: TDACDSDataTable;
    dsTipoFactura: TDADataSource;
    cxTabCupones: TcxTabSheet;
    cdsCupones: TDACDSDataTable;
    dsCupones: TDADataSource;
    cxGrdCupon: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2Importe: TcxGridDBColumn;
    cxGridDBTableView2Referencia: TcxGridDBColumn;
    cxPagFacturacion: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    grbEncabezado: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxGroupBox5: TcxGroupBox;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxLabel19: TcxLabel;
    grbDetalles: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox7: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cxComboBox1: TcxComboBox;
    cxTabSheet3: TcxTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    dsDetalleCupon: TDADataSource;
    cdsDetalleCupon: TDACDSDataTable;
    dsDenominacion: TDADataSource;
    cdsDenominacion: TDACDSDataTable;
    cxGridDBTableView5Cantidad: TcxGridDBColumn;
    cxGridDBTableView5Referencia: TcxGridDBColumn;
    cxGridDBTableView5TotalCalculado: TcxGridDBColumn;
    cxGridDBTableView5Denom: TcxGridDBColumn;
    cdsTicketFactura: TDACDSDataTable;
    cdsDetalleFactura: TDACDSDataTable;
    cxGridDBTableView3Cantidad: TcxGridDBColumn;
    cxGridDBTableView3Precio: TcxGridDBColumn;
    cxGridDBTableView3ProductoID: TcxGridDBColumn;
    cxGridDBTableView3Descripcion: TcxGridDBColumn;
    cxGridDBTableView3Importe: TcxGridDBColumn;
    cxTabSheet4: TcxTabSheet;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    dbTxtSerie: TcxDBTextEdit;
    dbTxtFolio: TcxDBTextEdit;
    cxDbTipoFactura: TcxDBLookupComboBox;
    dbCbxFormaPago: TcxDBLookupComboBox;
    dbTxtCliente: TcxDBTextEdit;
    cbxListaVales: TcxComboBox;
    cdsFactura: TDACDSDataTable;
    cdsDetalleValesFactura: TDACDSDataTable;
    dsDetalleValesFactura: TDADataSource;
    cdsVales: TDACDSDataTable;
    dsVales: TDADataSource;
    cxGroupBox4: TcxGroupBox;
    grdVales: TcxGrid;
    grdValesDBTableView1: TcxGridDBTableView;
    grdValesDBTableView1NoVale: TcxGridDBColumn;
    grdValesDBTableView1Importe: TcxGridDBColumn;
    grdValesLevel1: TcxGridLevel;
    cxGroupBox6: TcxGroupBox;
    cxGrid5: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxCurrencyEdit3: TcxCurrencyEdit;
    cdsComparaFechas: TDACDSDataTable;
    dsComparaFechas: TDADataSource;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cdsFacturaNewRecord(DataTable: TDADataTable);
    procedure cdsDetalleFacturaNewRecord(DataTable: TDADataTable);
    procedure cdsDetalleFacturaAfterPost(DataTable: TDADataTable);
    procedure cdsFacturaAfterPost(DataTable: TDADataTable);
    procedure cxGrid1Exit(Sender: TObject);
    procedure cdsFacturaBeforePost(DataTable: TDADataTable);
    procedure cxDBTxtClienteExit(Sender: TObject);
    procedure cdsTicketFacturaNewRecord(DataTable: TDADataTable);
    procedure cdsTicketFacturaBeforePost(DataTable: TDADataTable);
    procedure cdsTicketFacturaBeforeDelete(DataTable: TDADataTable);
    procedure cxGridDBTableView1TicketIDPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cdsTicketFacturaAfterPost(DataTable: TDADataTable);
    procedure cdsDetalleCuponNewRecord(DataTable: TDADataTable);
    procedure cdsDetalleCuponCalcFields(DataTable: TDADataTable);
    procedure cdsDetalleCuponBeforePost(DataTable: TDADataTable);
    procedure cxGridDBTableView3ProductoIDPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure dbTxtClienteEnter(Sender: TObject);
    procedure cxGrid1Enter(Sender: TObject);
    procedure cxGridDBTableView6DblClick(Sender: TObject);
    procedure cdsDetalleValesFacturaNewRecord(DataTable: TDADataTable);
    procedure grdValesDBTableView1DblClick(Sender: TObject);
    procedure dbTxtFolioEnter(Sender: TObject);
    procedure dbCbxFormaPagoEnter(Sender: TObject);
    procedure cxPagFacturacionPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure cxGrid2Enter(Sender: TObject);
    procedure cxGrid2Exit(Sender: TObject);
    procedure cdsDetalleValesFacturaBeforeDelete(DataTable: TDADataTable);
    procedure cdsDetalleValesFacturaAfterPost(DataTable: TDADataTable);
    procedure cxGridDBTableView3CantidadPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridDBTableView3ImportePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cdsDetalleFacturaBeforePost(DataTable: TDADataTable);
    procedure cxGridDBTableView5DenomPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure dbTxtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsDetalleFacturaBeforeDelete(DataTable: TDADataTable);
    procedure dbTxtSerieExit(Sender: TObject);
    procedure cxDBTextEdit12PropertiesChange(Sender: TObject);
    procedure cxDBTextEdit11PropertiesChange(Sender: TObject);
    procedure cxDBTextEdit10PropertiesChange(Sender: TObject);
    procedure cdsFacturaFechaChange(Sender: TDACustomField);
    procedure cxGridDBTableView3EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
    procedure AgregarProducto;
    procedure EliminarProducto;
    procedure EliminarNulos;
    function StatusTicket(Valor:Integer;var Mensaje:String):boolean;
    function ExisteTicketEnLista(Valor:Integer):boolean;
    function ExisteProducto(ProductoID:Integer):Boolean;
    procedure BuscarCliente;
    procedure BuscarProducto;
    function ObtenerSecuencia:integer;
    procedure GrabarFactura;
    Procedure TotalFactura;
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
     procedure UpdateActionsState; override;
  end;

var
  FrmFacturacionDePiso: TFrmFacturacionDePiso;
  ImpuestoPorcentaje:Real;
  EstacionActual:Integer;
  Consulta:Byte;
  TotalNotas: Float;
  TotalCupon: Float;
  SerieFactura: String;
  FacturacionLibre:String;
  FechaServidor:DateTime;

implementation

  uses Modules, uDM, dmActions,  ufrmBuscarCliente,
  LibraryEmpresas_Intf, UtileriasComun, ufrmBuscarProducto;

{$R *.dfm}

procedure TFrmFacturacionDePiso.ActionNuevo(Action: TBasicAction);
var
  Folio:Integer;
begin
  Folio:=DM.Servidor.FolioActual('FolioFactura', SerieFactura);
  if not DM.Servidor.ValidaFolioFactura(SerieFactura, Folio) then
  begin
    MessageDlg('El folio de la factura ya existe', mtError, [mbOK], 0);
    Exit;
  end;

  FechaServidor:=DM.Servidor.Fecha;

  cbxListaTicket.Clear;
  cbxListaVales.Clear;

  grbEncabezado.Enabled := dmAppActions.actNuevo.Enabled;
  grbDetalles.Enabled := dmAppActions.actNuevo.Enabled;

  cdsFactura.Append;
  cdsFactura.FieldByName('Serie').AsString:=SerieFactura;

  cxPagFacturacion.ActivePageIndex:=0;
  cxPagFacturacion.Pages[1].Enabled:=False;
  cxPagFacturacion.Pages[2].Enabled:=False;
  cxPagFacturacion.Pages[1].Enabled:=True;   //Panel de Tickets
  cxPagFacturacion.Pages[2].Enabled:=False;  //Panel de Cupones
  cxPagFacturacion.Pages[3].Enabled:=False;  //Panel de Vales de Credito
  if grbEncabezado.CanFocus then
    grbEncabezado.SetFocus;
  //dbTxtSerie.SetFocus;

  TotalCupon:=0;

  cxGridDBTableView3ProductoID.Options.Editing:=True;
  cxGridDBTableView3Cantidad.Options.Editing:=True;
  cxGridDBTableView3Importe.Options.Editing:=True;

  cdsFactura.FieldByName('TipoFacturaID').AsInteger:=1;
  cdsFactura.FieldByName('Serie').AsString:=SerieFactura;

  if Folio > 0 then
  begin
     cdsFactura.FieldByName('Folio').AsInteger:=Folio;
  end
  else
  begin
    Showmessage('Serie No Existe !!!');
    cdsFactura.Cancel;
    if dbTxtSerie.CanFocus then
      dbTxtSerie.SetFocus;
  end;
  cdsFactura.FieldByName('FormaPagoID').AsInteger:=1;
  if dbtxtCliente.CanFocus then
    dbtxtCliente.SetFocus;

end;

procedure TFrmFacturacionDePiso.ActionGuardar(Action: TBasicAction);
begin
 if cdsFactura.FieldByName('ClienteID').AsInteger<=0 then
  Begin
    cdsCliente.Close;
    cdsCliente.ParamByName('ClienteID').AsInteger:=cdsFactura.FieldByName('ClienteID').AsInteger;
    cdsCliente.Open;
    if cdsCliente.RecordCount=0 then
    BEgin
      ShowMessage('Cliente No Existe');

      cxPagFacturacion.ActivePage:=cxTabSheet1;
      if dbTxtCliente.CanFocus then
        dbTxtCliente.SetFocus;
    End;
  end
  else
  begin

    if cdsDetalleFactura.RecordCount > 0 then
    begin
      if (cdsDetalleFactura.State = dsEdit) or
         (cdsDetalleFactura.State = dsInsert) then
        cdsDetalleFactura.Cancel;
      GrabarFactura;
      //cdsFactura.CancelUpdates(true);
      If (cdsFactura.State=dsEdit) or (cdsFactura.State=dsInsert) then
        cdsFactura.Cancel;
      //cdsDetalleFactura.CancelUpdates();
      cdsCupones.CancelUpdates();
      cdsDetalleCupon.CancelUpdates();
      cdsDetalleValesFactura.CancelUpdates();
      cdsCliente.Close;
      cxPagFacturacion.ActivePageIndex:=0;
      cxPagFacturacion.Pages[1].Enabled:=False;
      cxPagFacturacion.Pages[2].Enabled:=False;
    end
    else
      Showmessage('Registre al menos un Producto');
  end;
end;

procedure TFrmFacturacionDePiso.ActionCancelar(Action: TBasicAction);
begin
  cdsDetalleFactura.Cancel;
  cdsFactura.Cancel;
  cdsTicketFactura.Cancel;
  cxPagFacturacion.ActivePageIndex:=0;
  cxPagFacturacion.Pages[1].Enabled:=False;
  cxPagFacturacion.Pages[2].Enabled:=False;
  cxPagFacturacion.Pages[3].Enabled:=False;
  cxPagFacturacion.Enabled:=True;
  //dbTxtSerie.SetFocus;
  cdsCliente.Close;
end;

procedure TFrmFacturacionDePiso.ActionBuscar(Action: TBasicAction);
begin
  case Consulta of
    1:BuscarCliente;
    2:BuscarProducto;
  end;
end;

procedure TFrmFacturacionDePiso.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
end;

procedure TFrmFacturacionDePiso.UpdateActionsState;
begin
  inherited;
  dmAppActions.actNuevo.Enabled:=cdsFactura.State = dsBrowse;
  dmAppActions.actGuardar.Enabled:=(cdsFactura.State in dsEditModes);
  dmAppActions.actCancelar.Enabled:=cdsFactura.State in dsEditModes;
  dmAppActions.actEliminar.Enabled:=(cdsFactura.State = dsBrowse) and (cdsFactura.RecordCount > 0);
  dmAppActions.actBuscar.Enabled:=((cdsFactura.State=dsEdit) or (cdsFactura.State=dsInsert)) and (cxPagFacturacion.ActivePageIndex=0);
  grbEncabezado.Enabled := not (dmAppActions.actNuevo.Enabled);
  grbDetalles.Enabled := not(dmAppActions.actNuevo.Enabled);
end;


procedure TFrmFacturacionDePiso.cdsDetalleCuponBeforePost(
  DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleCupon.FieldByName('Total').AsFloat:=cdsDetalleCupon.FieldByName('TotalCalculado').AsFloat;

end;

procedure TFrmFacturacionDePiso.cdsDetalleCuponCalcFields(
  DataTable: TDADataTable);
begin
  inherited;
   // If cdsDetalleCupon.FieldByName('TotalCalculado').AsFloat<=cdsFactura.FieldByName('Total').AsFloat then
   // begin

   //IF (cdsDetallecupon.FieldByName * cdsDetalleCupon.FieldByName('Cantidad').AsFloat)>cdsFactura.FieldByName('Total').AsFloat then
   //begin

   // end;
   cdsDetalleCupon.FieldByName('TotalCalculado').AsFloat:=Decimales(cdsDetalleCupon.FieldByName('Denominacion').AsFloat *
                                                           cdsDetalleCupon.FieldByName('Cantidad').AsFloat, 2);
   //end
   //else
   //  Showmessage('El Total de Cupon es Mayor QUE LA FACTURA');
end;

procedure TFrmFacturacionDePiso.cdsDetalleCuponNewRecord(
  DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleCupon.FieldByName('FacturaID').AsInteger:=cdsFactura.FieldByName('FacturaID').AsInteger;
  cdsDetalleCupon.FieldByName('DetalleCuponID').AsInteger:=DM.Servidor.Folio('DetalleCuponID','');
  if cdsDenominacion.State = dsInactive then
    cdsDenominacion.Open;
end;

procedure TFrmFacturacionDePiso.cdsDetalleFacturaAfterPost(
  DataTable: TDADataTable);
//var
 // Total:Real;
begin
  inherited;
  TotalFactura;  //Calculamos el Total de la Factura;
 { Total:=0;
  cdsDetalleFactura.First;
  While not cdsDetalleFactura.EOF do
  begin
     Total:=Total + cdsDetalleFactura.FieldByName('Importe').AsFloat; //cdsDetalleFactura.FieldByName('Cantidad').AsFloat *
                   // cdsDetalleFactura.FieldByName('Precio').AsFloat;
     //Total:=Round(Total);
     cdsDetalleFactura.Next;
  end;
  cdsFactura.FieldByName('Total').AsFloat:=Total;
  cdsFactura.FieldByName('SubTotal').AsFloat:=Total/(1+(ImpuestoPorcentaje/100));
  cdsFactura.FieldByName('Impuesto').AsFloat:=cdsFactura.FieldByName('Total').AsFloat -
                                              cdsFactura.FieldByName('SubTotal').AsFloat;  }
  if (cdsFactura.FieldByName('Total').AsInteger>0) then
  begin
      if (cdsFactura.FieldByName('TipoFacturaID').AsInteger=2) then
        cxPagFacturacion.Pages[2].Enabled:=true
      else
        cxPagFacturacion.Pages[2].Enabled:=false
  end;


end;

procedure TFrmFacturacionDePiso.cdsDetalleFacturaBeforeDelete(
  DataTable: TDADataTable);
begin
  inherited;
  TotalFactura; //Calculamos el Total de la Factura
end;

procedure TFrmFacturacionDePiso.cdsDetalleFacturaBeforePost(
  DataTable: TDADataTable);
//var
//  Fecha:DateTime;
begin

  inherited;
 // Fecha:=Trunc(now);
  //***************************
 // if DM.ATicket.Fecha>Fecha-30 then
 // begin
    if (cdsDetalleFactura.FieldByName('Importe').AsInteger <= 0) then
    begin
      //raise TEx.Create('Importe no v�lido');
    end;
  //end;
  //***************************
end;

procedure TFrmFacturacionDePiso.cdsDetalleFacturaNewRecord(
  DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleFactura.FieldByName('DetalleFacturaID').AsInteger:=DM.Servidor.Folio('DetalleFacturaID','');
  cdsDetalleFactura.FieldByName('FacturaID').AsInteger:=cdsFactura.FieldByName('FacturaID').AsInteger;
  cdsDetalleFactura.FieldByName('ItemNo').AsInteger:=cdsDetalleFactura.RecordCount+1;
  cdsDetalleFactura.FieldByName('Cantidad').AsFloat:=0;
  cdsDetalleFactura.FieldByName('Importe').AsFloat:=0;
end;

procedure TFrmFacturacionDePiso.cdsDetalleValesFacturaAfterPost(
  DataTable: TDADataTable);
begin
  inherited;
  if cbxListaVales.Properties.Items.IndexOf(cdsDetalleValesFactura.FieldByName('NoVale').AsString)= -1 then
    cbxListaVales.Properties.Items.Add(cdsDetalleValesFactura.FieldByName('NoVale').AsString);
end;

procedure TFrmFacturacionDePiso.cdsDetalleValesFacturaBeforeDelete(
  DataTable: TDADataTable);
begin
  inherited;
  if cbxListaVales.Properties.Items.IndexOf(cdsDetalleValesFactura.FieldByName('NoVale').AsString) >=0 then
    cbxListaVales.Properties.Items.Delete(cbxListaVales.Properties.Items.IndexOf(cdsDetalleValesFactura.FieldByName('NoVale').AsString));
end;

procedure TFrmFacturacionDePiso.cdsDetalleValesFacturaNewRecord(
  DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleValesFactura.FieldByName('DetalleValeCreditoFacturaID').AsInteger:=DM.Servidor.Folio('DetalleValeCreditoFacturaID','');
end;

procedure TFrmFacturacionDePiso.cdsFacturaAfterPost(DataTable: TDADataTable);
begin
  inherited;

  cdsFactura.ApplyUpdates();
  cdsDetalleFactura.ApplyUpdates();
  //if (cdsDetalleValesFactura.RecordCount > 0) then
  //  AfectarCartera;
  cdsCupones.ApplyUpdates();
  cdsDetalleCupon.ApplyUpdates();
  cdsDetalleValesFactura.ApplyUpdates();
  //cdsMovimientoCartera.ApplyUpdates(true);
  //cdsCartera.ApplyUpdates(true);
end;

procedure TFrmFacturacionDePiso.cdsFacturaBeforePost(DataTable: TDADataTable);
begin
  inherited;
  EliminarNulos;
end;

procedure TFrmFacturacionDePiso.cdsFacturaFechaChange(Sender: TDACustomField);
var
  Fecha: TDateTime;
  FechaServer: TDateTime;
begin
  inherited;
  Fecha:=cdsFactura.FieldByName('Fecha').asDatetime;
  FechaServer:=DM.Servidor.Fecha;
  if  (Fecha > FechaServidor) or ((FormatDateTime('mm', FechaServer) > FormatDateTime('mm', Fecha)) and (FormatDateTime('00', FechaServer) > '05')) then
  begin
     showMessage('No se puede facturar en la fecha seleccionada');
     if cxDBDateEdit1.CanFocus then
       cxDBDateEdit1.SetFocus;
  end;
end;

procedure TFrmFacturacionDePiso.cdsFacturaNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsFactura.FieldByName('FacturaID').AsInteger:=DM.Servidor.Folio('FacturaID','');
  cdsFactura.FieldByName('Fecha').AsDateTime:=DM.Servidor.Fecha;
  cdsFactura.FieldByName('Ejercicio').AsInteger:=StrToInt(FormatDateTime('yyyy',DM.Servidor.Fecha));
  cdsFactura.FieldByName('Periodo').AsInteger:=StrToInt(FormatDateTime('mm',DM.Servidor.Fecha));
  cdsFactura.FieldByName('Dia').AsInteger:=StrToInt(FormatDateTime('dd',DM.Servidor.Fecha));
  cdsFactura.FieldByName('ImpuestoPorcentaje').AsFloat:=ImpuestoPorcentaje;
  cdsFactura.FieldByName('Turno').AsInteger:=ObtenerSecuencia;
  cdsFactura.FieldByName('EstacionID').AsInteger:=EstacionActual;
  cdsFactura.FieldByName('Cancelada').AsBoolean:=False;
  cdsCliente.Close;
end;

procedure TFrmFacturacionDePiso.cdsTicketFacturaAfterPost(
  DataTable: TDADataTable);
//var
//  Fecha:DateTime;
begin
  inherited;
 // Fecha:=Trunc(now);
 // if DM.ATicket.Fecha>Fecha-30 then
    cbxListaTicket.Properties.Items.Add(cdsTicketFactura.FieldByName('TicketID').AsString);
end;

procedure TFrmFacturacionDePiso.cdsTicketFacturaBeforeDelete(
  DataTable: TDADataTable);
begin
  inherited;
  EliminarProducto;
  cbxListaTicket.Properties.Items.Delete(cbxListaTicket.Properties.Items.IndexOf(cdsTicketFactura.FieldByName('TicketID').AsString));
end;

procedure TFrmFacturacionDePiso.cdsTicketFacturaBeforePost(
  DataTable: TDADataTable);
var
  Fecha:DateTime;
begin
  inherited;
  Fecha:=Trunc(now);
  //if DM.ATicket.Fecha>Fecha-30 then     //solo se aceptan tickets con 30 dias despues de 30 dias no se facturan
  //begin
  //  cdsTicketFactura.FieldByName('TicketFacturaID').AsInteger:=DM.Servidor.Folio('TicketFacturaID','');
  //  AgregarProducto;
  //end;
end;

procedure TFrmFacturacionDePiso.cdsTicketFacturaNewRecord(
  DataTable: TDADataTable);
begin
  inherited;
  cdsTicketFactura.FieldByName('FacturaID').AsInteger:=cdsFactura.FieldByName('FacturaID').AsInteger;
  cdsTicketFactura.FieldByName('EstacionID').AsInteger:=cdsFactura.FieldByName('EstacionID').AsInteger;
end;

procedure TFrmFacturacionDePiso.cxButton1Click(Sender: TObject);
var
  MiCliente: Integer;
begin
  inherited;
  MiCliente:=cdsCliente.FieldByName('ClienteID').AsInteger;
  if (cdsCliente.Active) and (MiCliente > 0) then
  begin
    //if EditarCliente(MiCliente) then
    //begin
    //  cdsCliente.Close;
    //  cdsCliente.ParamByName('ClienteID').AsInteger:=MiCliente;
    //  cdsCliente.Open;
    //end;
  end;
end;

procedure TFrmFacturacionDePiso.cxDBTextEdit10PropertiesChange(Sender: TObject);
begin
  inherited;
  cxCurrencyEdit3.EditValue:= cxDBTextEdit10.EditValue;

end;

procedure TFrmFacturacionDePiso.cxDBTextEdit11PropertiesChange(Sender: TObject);
begin
  inherited;
  cxCurrencyEdit2.EditValue:=cxDBTextEdit11.EditValue;
  
end;

procedure TFrmFacturacionDePiso.cxDBTextEdit12PropertiesChange(Sender: TObject);
begin
  inherited;
 //  txtSubtotal.Text:=cxDBTextEdit12.Text;
 //cxMaskEdit1.Text:=cxDBTextEdit12.Text;
 cxCurrencyEdit1.EditValue:=cxDBTextEdit12.EditValue;
end;

procedure TFrmFacturacionDePiso.cxDBTxtClienteExit(Sender: TObject);
begin
  inherited;
  if dbTxtCliente.Text = '' then
    Exit;
  Consulta:=0;
  If FacturacionLibre='True' then
  Begin
    //ponemos el control en agregar al grid de detallefactura
      //cdsDetalleFactura.Append;
     cxPagFacturacion.ActivePageIndex:=0;
     if cxGrid1.CanFocus then
     begin
       cxGrid1.SetFocus;
       cxGridDBTableView3.ViewData.NewItemRow.Focused:=True;
     end;

     cdsCliente.Close;
     cdsCliente.ParamByName('ClienteID').AsInteger:=cdsFactura.FieldByName('ClienteID').AsInteger;
     cdsCliente.Open
  End
  else
  begin
   cxPagFacturacion.ActivePage:=cxTabSheet2;
   cdsTicketFactura.Append;
  end;
end;

procedure TFrmFacturacionDePiso.cxGrid1Enter(Sender: TObject);
begin
  inherited;
  dmAppActions.actBuscar.Enabled:=((cdsFactura.State=dsEdit) or (cdsFactura.State=dsInsert)) and (cxPagFacturacion.ActivePageIndex=0);
  Consulta:=2;
  cdsCliente.Close;
  cdsCliente.ParamByName('ClienteID').AsInteger:=cdsFactura.FieldByName('ClienteID').AsInteger;
  cdsCliente.Open;
  if cdsCliente.RecordCount=0 then
  begin
    Showmessage('Cliente No Existe');
    if dbTxtCliente.CanFocus then
      dbTxtCliente.SetFocus;
  end
  else
  begin
    cdsVales.Close;
    cdsVales.ParamByName('ClienteID').AsInteger:=cdsCliente.ParamByName('ClienteID').AsInteger;
    cdsVales.ParamByName('EstacionID').AsInteger:=EstacionActual;
    cdsVales.Open;
  end;
end;

procedure TFrmFacturacionDePiso.cxGrid1Exit(Sender: TObject);
begin
  inherited;
  if (cdsDetalleFactura.State = dsEdit) or
    (cdsDetalleFactura.State = dsInsert) then
    cdsDetalleFactura.Cancel;
  Consulta:=0;
end;

procedure TFrmFacturacionDePiso.cxGrid2Enter(Sender: TObject);
begin
  inherited;
  OkEnter:=False;
end;

procedure TFrmFacturacionDePiso.cxGrid2Exit(Sender: TObject);
begin
  inherited;
  OKEnter:=True;
end;

procedure TFrmFacturacionDePiso.cxGridDBTableView1TicketIDPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  MensajeError:String;
  Fecha:Datetime;
begin
  inherited;
  Fecha:=Trunc(now);
  MensajeError:='Capture Ticket';
  if DisplayValue > 0 then
  begin
    if not StatusTicket(DisplayValue,MensajeError) then
    begin
      Error:=True;
      ErrorText:=MensajeError;
      DisplayValue:='0';
    end
    else
    begin
      {DM.ATicket:=DM.ObtenerTicket(EstacionActual, DisplayValue);
      if DM.ATicket.ProductoID > 0 then
      begin
        if DM.ATicket.Fecha>Fecha-30 then
        begin
          cdsTicketFactura.FieldByName('TicketID').AsInteger:=DisplayValue;
          cdsTicketFactura.FieldByName('Fecha').AsDateTime:=Trunc(DM.ATicket.Fecha);
          cdsTicketFactura.FieldByName('ProductoID').AsInteger:=DM.ATicket.ProductoID;
          cdsTicketFactura.FieldByName('Volumen').AsFloat:=DM.ATicket.Volumen;
          cdsTicketFactura.FieldByName('Importe').AsFloat:=DM.ATicket.Importe;
          cdsTicketFactura.FieldByName('Precio').AsFloat:=DM.ATicket.Precio;
        end
        else
        begin
           ShowMessage('el Ticket esta fuera de fecha'+ DateTimetoStr(DM.ATicket.Fecha) );
           cdsTicketFactura.Cancel;
        end;
      end
      else
      begin
        Error:=True;
        ErrorText:='Ticket No Existe';
        DisplayValue:='0';
      end;}
    end;
  end;
end;

procedure TFrmFacturacionDePiso.cxGridDBTableView3CantidadPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cdsDetalleFactura.FieldByName('Cantidad').AsFloat:=DisplayValue;
  cdsDetalleFactura.FieldByName('Importe').AsFloat:=Decimales(cdsDetalleFactura.FieldByName('Cantidad').AsFloat*
                                                    cdsDetalleFactura.FieldByName('Precio').AsFloat, 2);
end;

procedure TFrmFacturacionDePiso.cxGridDBTableView3EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key=VK_F2 then
  begin
    BuscarProducto;
  end;
end;

procedure TFrmFacturacionDePiso.cxGridDBTableView3ImportePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  cdsDetalleFactura.FieldByName('Importe').AsFloat:=DisplayValue;
  cdsDetalleFactura.FieldByName('Cantidad').AsFloat:=Decimales(cdsDetalleFactura.FieldByName('Importe').AsFloat /
                                                    cdsDetalleFactura.FieldByName('Precio').AsFloat, 4);
end;

procedure TFrmFacturacionDePiso.cxGridDBTableView3ProductoIDPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue > 0 then
  begin
    if ExisteProducto(DisplayValue) then
    begin
      if (FacturacionLibre <> 'True') and (DisplayValue <= 3) then
      begin
        Error:=False;
        ShowMessage('No se puede facturar Combustible sin ticket');
        Exit;
      end;
      cdsDetalleFactura.FieldByName('Precio').AsFloat:=DM.Servidor.PrecioProducto(EstacionActual,DisplayValue);
      cdsDetalleFactura.FieldByName('ProductoID').AsInteger:=DisplayValue;
      if  (cdsFactura.FieldByName('TipoFacturaID').AsInteger > 0) then
       begin
         case cdsFactura.FieldByName('TipoFacturaID').AsInteger of
            3:begin
             cdsDetalleFactura.FieldByName('Importe').AsFloat:=TotalNotas;
             cdsDetalleFactura.FieldByName('Cantidad').AsFloat:=Decimales(cdsDetalleFactura.FieldByName('Importe').AsFloat / cdsDetalleFactura.FieldByName('Precio').AsFloat, 4);

            end;
         end;
       end;


    end
    else
    begin
      Error:=False;
      Showmessage('Producto No Existe');
    end;
  end;
end;

procedure TFrmFacturacionDePiso.cxGridDBTableView5DenomPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  {IF (DisplayValue * cdsDetalleCupon.FieldByName('Cantidad').AsFloat)>cdsFactura.FieldByName('Total').AsFloat then
    begin
      Error:=True;
      ErrorText:='Importe Excede Total de Factura';
      DisplayValue:=0;
    end;}
    TotalCupon:=TotalCupon + Decimales(DisplayValue * cdsDetalleCupon.FieldByName('Cantidad').AsFloat, 2);
    If TotalCupon > cdsFactura.FieldByName('Total').AsFloat then
    begin
      TotalCupon:=TotalCupon - DisplayValue;
      Error:=True;
      ErrorText:='Importe Excede Total de Factura';
      DisplayValue:=0;
    end;

    {else
    begin
       cdsDetalleCupon.FieldByName('TotalCalculado').AsFloat:=DisplayValue * //cdsDetalleCupon.FieldByName('Denominacion').AsFloat *
                                                           cdsDetalleCupon.FieldByName('Cantidad').AsFloat;
    end;}
end;

procedure TFrmFacturacionDePiso.cxGridDBTableView6DblClick(Sender: TObject);
begin
  inherited;
  if cdsVales.RecordCount>0  then
  begin
    if cbxListaVales.Properties.Items.IndexOf(cdsVales.FieldByName('Novale').AsString)=-1 then
    begin
      cdsDetalleValesFactura.Append;
      cdsDetalleValesFactura.FieldByName('FacturaID').AsInteger:=cdsFactura.FieldByName('FacturaID').AsInteger;
      cdsDetalleValesFactura.FieldByName('NoVale').AsString:=cdsVales.FieldByName('Novale').AsString;
      cdsDetalleValesFactura.FieldByName('Importe').AsFloat:=cdsVales.FieldByName('Importe').AsFloat;
      cdsDetalleValesFactura.FieldByName('CarteraValeCreditoID').AsFloat:=cdsVales.FieldByName('CarteraValeCreditoID').AsInteger;
      cdsDetalleValesFactura.Post;
      TotalNotas:=TotalNotas + cdsVales.FieldByName('Importe').AsFloat;
    //DM.Servidor.ActualizarStatusValeCredito(cdsVales.FieldByName('CarteraValeCreditoID').AsInteger, 'FA');
      cdsVales.Close;
      cdsVales.ParamByName('ClienteID').AsInteger:=cdsCliente.ParamByName('ClienteID').AsInteger;
      cdsVales.ParamByName('EstacionID').AsInteger:=EstacionActual;
      cdsVales.Open;
    end;
  end;
end;

procedure TFrmFacturacionDePiso.cxPagFacturacionPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  inherited;
  if cxPagFacturacion.ActivePageIndex=0 then
  begin
    if cdsFactura.FieldByName('ClienteID').AsInteger>0 then
    begin
      cdsCliente.Close;
      cdsCliente.ParamByName('ClienteID').AsInteger:=cdsFactura.FieldByName('ClienteID').AsInteger;
      cdsCliente.Open;
    if cdsCliente.RecordCount=0 then
    begin
      Showmessage('Cliente No Existe');
      AllowChange:=False;
      if dbTxtCliente.CanFocus then
        dbTxtCliente.SetFocus;
      end
    end
    else
    begin
      cdsVales.Close;
      cdsVales.ParamByName('ClienteID').AsInteger:=cdsCliente.ParamByName('ClienteID').AsInteger;
      cdsVales.ParamByName('EstacionID').AsInteger:=EstacionActual;
      cdsVales.Open;
    end;
  end;
end;

procedure TFrmFacturacionDePiso.dbCbxFormaPagoEnter(Sender: TObject);
begin
  inherited;
  if  (cdsFactura.FieldByName('TipoFacturaID').AsInteger > 0) then
  begin
    case cdsFactura.FieldByName('TipoFacturaID').AsInteger of
      1:begin
        cxPagFacturacion.Pages[1].Enabled:=True;   //Panel de Tickets
        cxPagFacturacion.Pages[2].Enabled:=False;  //Panel de Cupones
        cxPagFacturacion.Pages[3].Enabled:=False;  //Panel de Vales de Credito
      end;
     { 2:begin
        cxPagFacturacion.Pages[1].Enabled:=False;
        cxPagFacturacion.Pages[2].Enabled:=True;
        cxPagFacturacion.Pages[3].Enabled:=False;
      end;
      3:begin
        cxPagFacturacion.Pages[1].Enabled:=False;
        cxPagFacturacion.Pages[2].Enabled:=False;
        cxPagFacturacion.Pages[3].Enabled:=True;
      end;}
    end;
  end
  else
  begin
  end;
end;

procedure TFrmFacturacionDePiso.dbTxtClienteEnter(Sender: TObject);
begin
  inherited;
  dmAppActions.actBuscar.Enabled:=((cdsFactura.State=dsEdit) or (cdsFactura.State=dsInsert)) and (cxPagFacturacion.ActivePageIndex=0);
  Consulta:=1;
  if (cdsFactura.FieldByName('FormaPagoID').AsInteger=0) then
  begin
    Showmessage('Seleccione una Forma de Pago');
    if dbCbxFormaPago.CanFocus then
      dbCbxFormaPago.SetFocus;
  end;

end;

procedure TFrmFacturacionDePiso.dbTxtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if key=VK_F2 then
  begin
    case Consulta of
      1:BuscarCliente;
      2:BuscarProducto;
    end;
  end;
end;

procedure TFrmFacturacionDePiso.dbTxtFolioEnter(Sender: TObject);
var
  Folio:Integer;
begin
  inherited;
  Folio:=DM.Servidor.FolioActual('FolioFactura',cdsFactura.FieldByName('Serie').AsString);
  if Folio > 0 then
  begin
     cdsFactura.FieldByName('Folio').AsInteger:=Folio;
  end
  else
  begin
    Showmessage('Serie No Existe !!!');
    cdsFactura.Cancel;
    if dbTxtSerie.CanFocus then
      dbTxtSerie.SetFocus;
  end;
end;

procedure TFrmFacturacionDePiso.dbTxtSerieExit(Sender: TObject);
var
  Folio:Integer;
begin
  inherited;
  Folio:=DM.Servidor.FolioActual('FolioFactura',cdsFactura.FieldByName('Serie').AsString);
  if Folio > 0 then
  begin
     cdsFactura.FieldByName('Folio').AsInteger:=Folio;
  end
  else
  begin
    Showmessage('Serie No Existe !!!');
    cdsFactura.Cancel;
    if dbTxtSerie.CanFocus then
      dbTxtSerie.SetFocus;
  end;
end;

procedure TFrmFacturacionDePiso.FormCreate(Sender: TObject);
begin
  inherited;
  EstacionActual:=DM.Estacion;
  SerieFactura:=DM.Serie;
  //FacturacionLibre:=UtileriasComun.LeerRegistro('FacturacionLibre','True');
  If DM.Seguridad.SeguridadPorNombre('Facturaci�n Libre')<> nil then
    FacturacionLibre:='True';
{   if DM.Seguridad.SeguridadPorNombre('Facturar a Impresora')<>nil then
     FacturaAImpresora:=True
   else
     FacturaAImpresora:=False;}


  cdsEmpresa.Close;
  cdsEmpresa.ParamByName('EstacionID').asInteger:=EstacionActual;
  cdsEmpresa.Open;
  cdsFormaPago.Open;
  cdsTipoFactura.Open;
  cdsDenominacion.Open;
  cdsProducto.ParamByName('EstacionID').asInteger:=EstacionActual;
  cdsProducto.Open;
  IF DM.Seguridad.SeguridadPorNombre('Factura Por Fecha') <> nil then
     cxDBDateEdit1.Enabled:=True;
 // DM.Seguridad.idEmpleado;// Para saber el Id del Empleado que esta Logeado

  //cdsMovimientoCartera.Open;
  //cdsCartera.Open;
  cdsFactura.Open;
  cdsDetalleFactura.Open;
  cdsDetalleCupon.Open;
  cdsCupones.Open;
  ImpuestoPorcentaje:=cdsEmpresa.FieldByName('Impuesto').AsFloat;
  cxPagFacturacion.ActivePageIndex:=0;
  cxPagFacturacion.Pages[1].Enabled:=False;
  cxPagFacturacion.Pages[2].Enabled:=False;
end;

procedure TFrmFacturacionDePiso.GrabarFactura;
var
  Detalle:TDetalleFactura;
  Ticket:TTicketFactura;
  DetalleCupon:TDetalleCupon;
  Vale:TDetalleValeCreditoFactura;
begin
  cdsTicketFactura.First;
  while not cdsTicketFactura.EOF do
  begin
    cdsFactura.FieldByName('Tickets').AsString:=cdsFactura.FieldByName('Tickets').AsString + cdsTicketFactura.FieldByName('TicketID').AsString + ',';
    cdsTicketFactura.Next;
  end;

  DM.DatosFactura:=TDatosFactura.Create;
  DM.DatosFactura.Factura:=TFactura.Create;
  DM.DatosFactura.Factura.FacturaID:=DM.Servidor.Folio('FacturaID', '');
  DM.DatosFactura.Factura.Serie:=cdsFactura.FieldByName('Serie').AsString;
  DM.DatosFactura.Factura.Fecha:=cdsFactura.FieldByName('Fecha').AsDateTime;
  DM.DatosFactura.Factura.Subtotal:=cdsFactura.FieldByName('Subtotal').AsFloat;
  DM.DatosFactura.Factura.Impuesto:=cdsFactura.FieldByName('Impuesto').AsFloat;
  DM.DatosFactura.Factura.Total:=cdsFactura.FieldByName('Total').AsFloat;
  DM.DatosFactura.Factura.ImpuestoPorcentaje:=cdsFactura.FieldByName('ImpuestoPorcentaje').AsFloat;
  DM.DatosFactura.Factura.Turno:=cdsFactura.FieldByName('Turno').AsInteger;
  DM.DatosFactura.Factura.EstacionID:=EstacionActual;
  DM.DatosFactura.Factura.ClienteID:=cdsFactura.FieldByName('ClienteID').AsInteger;
  DM.DatosFactura.Factura.FormaPagoID:=cdsFactura.FieldByName('FormaPagoID').AsInteger;
  DM.DatosFactura.Factura.TipoFacturaID:=cdsFactura.FieldByName('TipoFacturaID').AsInteger;
  DM.DatosFactura.Factura.Tickets:=cdsFactura.FieldByName('Tickets').AsString;
  DM.DatosFactura.Factura.UsuarioID:=DM.Seguridad.idEmpleado;
  DM.DatosFactura.Detalles:=ATDetalleFactura.Create;
  DM.DatosFactura.Tickets:=ATTicketFactura.Create;
  DM.DatosFactura.DetalleCupon:=ATDetalleCupon.Create;
  DM.DatosFactura.Vales:=ATDetalleValeCreditoFactura.Create;
  cdsDetalleFactura.First;
  while not cdsDetalleFactura.EOF do
  begin
    Detalle:=TDetalleFactura.Create;
    Detalle.Cantidad:=cdsDetalleFactura.FieldByName('Cantidad').AsFloat;
    Detalle.Precio:=cdsDetalleFactura.FieldByName('Precio').AsFloat;
    Detalle.Importe:=cdsDetalleFactura.FieldByName('Importe').AsFloat;
    Detalle.ProductoID:=cdsDetalleFactura.FieldByName('ProductoID').AsInteger;
    DM.DatosFactura.Detalles.Add(Detalle);
    cdsDetalleFactura.Next;
  end;
  cdsTicketFactura.First;
  while not cdsTicketFactura.EOF do
  begin
    Ticket:=TTicketFactura.Create;
    Ticket.TicketID:=cdsTicketFactura.FieldByName('TicketID').AsInteger;
    Ticket.ProductoID:=cdsTicketFactura.FieldByName('ProductoID').AsInteger;
    Ticket.Fecha:=cdsTicketFactura.FieldByName('Fecha').AsDateTime;
    Ticket.Volumen:=cdsTicketFactura.FieldByName('Volumen').AsFloat;
    Ticket.Precio:=cdsTicketFactura.FieldByName('Precio').AsFloat;
    Ticket.Importe:=cdsTicketFactura.FieldByName('Importe').AsFloat;
    Ticket.EstacionID:=EstacionActual;
    DM.DatosFactura.Tickets.Add(Ticket);
    cdsTicketFactura.Next;
  end;
  cdsDetalleCupon.First;
  while not cdsDetalleCupon.EOF do
  begin
    DetalleCupon:=TDetalleCupon.Create;
    DetalleCupon.Denominacion:=cdsDetalleCupon.FieldByName('Denominacion').AsFloat;
    DetalleCupon.Cantidad:=cdsDetalleCupon.FieldByName('Cantidad').AsFloat;
    DetalleCupon.Referencia:=cdsDetalleCupon.FieldByName('Referencia').AsString;
    DM.DatosFactura.DetalleCupon.Add(DetalleCupon);
    cdsDetalleCupon.Next;
  end;
  cdsDetalleValesFactura.First;
  while not cdsDetalleValesFactura.EOF do
  begin
    Vale:=TDetalleValeCreditoFactura.Create;
    Vale.NoVale:=cdsDetalleValesFactura.FieldByName('NoVale').AsInteger;
    Vale.Importe:=cdsDetalleValesFactura.FieldByName('Importe').AsFloat;
    Vale.CarteraValeCreditoID:=cdsDetalleValesFactura.FieldByName('CarteraValeCreditoID').AsInteger;
    DM.DatosFactura.Vales.Add(Vale);
    cdsDetalleValesFactura.Next;
  end;
  DM.Servidor.GuardarDatosFactura(DM.DatosFactura);
  //DM.ImprimirFactura(DM.DatosFactura.Factura.FacturaID);
end;

procedure TFrmFacturacionDePiso.grdValesDBTableView1DblClick(Sender: TObject);
begin
  inherited;
  if cdsDetalleValesFactura.RecordCount>0 then
  begin
    cdsDetalleValesFactura.Delete;
    cdsVales.Close;
    cdsVales.ParamByName('ClienteID').AsInteger:=cdsCliente.ParamByName('ClienteID').AsInteger;
    cdsVales.ParamByName('EstacionID').AsInteger:=EstacionActual;
    cdsVales.Open;
  end;
end;

function TFrmFacturacionDePiso.ObtenerSecuencia: integer;
begin
  Result:=1;
end;

procedure TFrmFacturacionDePiso.AgregarProducto();
var
   Insertar:boolean;
begin
  Insertar:=True;
  cdsDetalleFactura.First;
  while not cdsDetalleFactura.EOF  do
  begin
    if (cdsDetalleFactura.FieldByName('ProductoID').AsInteger=cdsTicketFactura.FieldByName('ProductoID').AsInteger) and
       (cdsDetalleFactura.FieldByName('Precio').AsFloat=cdsTicketFactura.FieldByName('Precio').AsFloat) then
    begin
      cdsDetalleFactura.Edit;
      cdsDetalleFactura.FieldByName('Cantidad').AsFloat:= cdsDetalleFactura.FieldByName('Cantidad').AsFloat +
                                                         cdsTicketFactura.FieldByName('Volumen').AsFloat;

      cdsDetalleFactura.FieldByName('Importe').AsFloat:= cdsDetalleFactura.FieldByName('Importe').AsFloat +
                                                         cdsTicketFactura.FieldByName('Importe').AsFloat;
      cdsDetalleFactura.Post;
      Insertar:=False;
    end;
    cdsDetalleFactura.Next;
  end;
  if Insertar then
  begin
    cdsDetalleFactura.Append;
    cdsDetalleFactura.FieldByName('DetalleFacturaID').AsInteger:=DM.Servidor.Folio('DetalleFacturaID','');
    cdsDetalleFactura.FieldByName('FacturaID').AsInteger:=cdsFactura.FieldByName('FacturaID').AsInteger;
    cdsDetalleFactura.FieldByName('ItemNo').AsInteger:=cdsDetalleFactura.RecordCount+1;
    cdsDetalleFactura.FieldByName('ProductoID').AsInteger:=cdsTicketFactura.FieldByName('ProductoID').AsInteger;
    cdsDetalleFactura.FieldByName('Cantidad').AsFloat:=cdsTicketFactura.FieldByName('Volumen').AsFloat;
    cdsDetalleFactura.FieldByName('Precio').AsFloat:=cdsTicketFactura.FieldByName('Precio').AsFloat;
    cdsDetalleFactura.FieldByName('Importe').AsFloat:=cdsTicketFactura.FieldByName('Importe').AsFloat;
    cdsDetalleFactura.Post;
  end;
end;

procedure TFrmFacturacionDePiso.BuscarCliente;
begin
  frmBuscarCliente:=TfrmBuscarCliente.Create(nil);
  frmBuscarCliente.ShowModal;
  if (frmBuscarCliente.OK) or (frmBuscarCliente.OKClienteNuevo) then
  begin
    cdsFactura.FieldByName('ClienteID').AsInteger:=frmBuscarCliente.Clave;
    cxDBTxtClienteExit(cxDBTxtCliente);
  end;
end;

procedure TFrmFacturacionDePiso.BuscarProducto;
begin
  frmBuscarProducto:=TfrmBuscarProducto.Create(Self);
  if (cdsFactura.FieldByName('TipoFacturaID').AsInteger=1) or (cdsFactura.FieldByName('TipoFacturaID').AsInteger=3) then
    frmBuscarProducto.IniciarBusqueda(4)
  else
    frmBuscarProducto.IniciarBusqueda(3);
  frmBuscarProducto.ShowModal;
  if frmBuscarProducto.OK then
  begin
    if (FacturacionLibre <> 'True') and (frmBuscarProducto.Clave <= 3) then
    begin
      ShowMessage('No se puede facturar Combustible sin ticket');
      Exit;
    end;
    if (cdsDetalleFactura.State = dsBrowse) then
      cdsDetalleFactura.Append;
    cdsDetalleFactura.FieldByName('ProductoID').AsInteger:=frmBuscarProducto.Clave;
    cdsDetalleFactura.FieldByName('Precio').AsFloat:=DM.Servidor.PrecioProducto(EstacionActual,cdsDetalleFactura.FieldByName('ProductoID').AsInteger);
  end;
end;

procedure TFrmFacturacionDePiso.EliminarNulos;
begin
  cdsDetalleFactura.First;
  while not cdsDetalleFactura.EOF  do
  begin
    if (cdsDetalleFactura.FieldByName('ProductoID').AsInteger=0) then
      cdsDetalleFactura.Delete;
    cdsDetalleFactura.Next;
  end;
end;

procedure TFrmFacturacionDePiso.EliminarProducto();
var
  Cantidad:float;
begin
  cdsDetalleFactura.First;
  while not cdsDetalleFactura.EOF  do
  begin
    if (cdsDetalleFactura.FieldByName('ProductoID').AsInteger=cdsTicketFactura.FieldByName('ProductoID').AsInteger)  and
       (cdsDEtalleFactura.FieldByName('Precio').AsFloat=cdsTicketFactura.FieldByName('Precio').AsFloat) then
    begin

      Cantidad:=cdsDetalleFactura.FieldByName('Cantidad').AsFloat - cdsTicketFactura.FieldByName('Volumen').AsFloat;
      IF Cantidad>0 then
      begin
        cdsDetalleFactura.Edit;
        cdsDetalleFactura.FieldByName('Cantidad').AsFloat:= cdsDetalleFactura.FieldByName('Cantidad').AsFloat -
                                                          cdsTicketFactura.FieldByName('Volumen').AsFloat;

        cdsDetalleFactura.FieldByName('Importe').AsFloat:=cdsDetalleFactura.FieldByName('Importe').AsFloat -
                                                        cdsTicketFactura.FieldByName('Importe').AsFloat;
        cdsDetalleFactura.Post;
      end;
      //if cdsDetalleFactura.FieldByName('Cantidad').AsFloat = 0 then
      if Cantidad=0 then
        cdsDetalleFactura.Delete;
    end;
    cdsDetalleFactura.Next;
  end;
end;

function TFrmFacturacionDePiso.ExisteProducto(ProductoID: Integer): Boolean;
begin
  Result:=cdsProducto.Locate('ProductoID',ProductoID, [loCaseInsensitive]);
end;

function TFrmFacturacionDePiso.ExisteTicketEnLista(Valor: integer): boolean;
begin
  Result:=cbxListaTicket.Properties.Items.IndexOf(IntToStr(Valor))>-1;
end;

function TFrmFacturacionDePiso.StatusTicket(Valor:Integer;var Mensaje:String):boolean;
var
  EstacionID : integer;
  TicketID   : integer;
begin
  EstacionID:=cdsFactura.FieldByName('EstacionID').AsInteger;
  TicketID:=Valor;
  case DM.Servidor.StatusTicket(EstacionID, TicketID) of
    0, 2, 3:  if ExisteTicketEnLista(TicketID) then
              begin
                Mensaje:='Ticket Existe En La Lista';
                Result:=False;
              end
              else
                Result:=True;
    1, 4: begin
               Mensaje:='El Ticket ya fue utilizado en factura';
               Result:=False;
             end;
  else
    Result:=False;
  end;
end;

procedure TFrmFacturacionDePiso.TotalFactura;
var
  Total:Real;
begin
  inherited;
  Total:=0;
  cdsDetalleFactura.First;
  While not cdsDetalleFactura.EOF do
  begin
     Total:=Total + cdsDetalleFactura.FieldByName('Importe').AsFloat; 
     cdsDetalleFactura.Next;
  end;
  cdsFactura.FieldByName('Total').AsFloat:=Decimales(Total, 2);
  cdsFactura.FieldByName('SubTotal').AsFloat:=Decimales(Total/(1+(ImpuestoPorcentaje/100)), 2);
  cdsFactura.FieldByName('Impuesto').AsFloat:=Decimales(cdsFactura.FieldByName('Total').AsFloat -
                                              cdsFactura.FieldByName('SubTotal').AsFloat, 2);

end;

initialization
  ModuleInfoManager.RegisterModule('Facturas', TFrmFacturacionDePiso);
end.
