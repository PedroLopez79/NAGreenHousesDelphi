unit ufrmCatalogoReportes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCatalogo, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, AdvMemo, AdvmSQLS, DBAdvMemo, cxContainer, cxGroupBox, StdCtrls,
  cxTextEdit, cxDBEdit, ppComm, ppEndUsr, raIDE, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, cxListBox, cxCheckListBox, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, Menus, cxLookAndFeelPainters,
  cxButtons, uDAInterfaces, uDAMemDataTable, ppDB, ppTypes, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinSilver, dxSkinStardust, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinSummer2008, cxLookAndFeels, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSpringTime, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxPCdxBarPopupMenu, cxNavigator, uDAFields,
  uROComponent;

type
  TfrmCatalogoReportes = class(TfrmCatalogo)
    dbgCatalogoDBTableView1ReporteID: TcxGridDBColumn;
    dbgCatalogoDBTableView1Nombre: TcxGridDBColumn;
    dbgCatalogoDBTableView1CampoJoin: TcxGridDBColumn;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    DBAdvMemo1: TDBAdvMemo;
    DBAdvMemo2: TDBAdvMemo;
    AdvSQLMemoStyler1: TAdvSQLMemoStyler;
    cxGroupBox1: TcxGroupBox;
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label2: TLabel;
    rdReportes: TppDesigner;
    Label3: TLabel;
    cxDBImaTipoReporte: TcxDBImageComboBox;
    clbParametros: TcxCheckListBox;
    Label4: TLabel;
    btnDuplicar: TcxButton;
    btnExportar: TcxButton;
    btnImportar: TcxButton;
    odImportar: TOpenDialog;
    sdExportar: TSaveDialog;
    tblExportar: TdxMemData;
    tblExportarNombre: TStringField;
    tblExportarTipo: TIntegerField;
    tblExportarParametros: TStringField;
    tblExportarTemplate: TMemoField;
    tblExportarMedia: TBlobField;
    tblExportarBaja: TMemoField;
    tblExportarSQL1: TMemoField;
    tblExportarSQL2: TMemoField;
    tblExportarCampoJoin: TStringField;
    tblUsuarios: TdxMemData;
    tblUsuariosUsuario: TBooleanField;
    tblUsuariosUsuarioID: TIntegerField;
    tblUsuariosNombre: TStringField;
    dsUsuarios: TDataSource;
    cdsUsuarios: TDACDSDataTable;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1Usuario: TcxGridDBColumn;
    cxGrid1DBTableView1UsuarioID: TcxGridDBColumn;
    cxGrid1DBTableView1Nombre: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label5: TLabel;
    procedure DBAdvMemo1Exit(Sender: TObject);
    procedure DBAdvMemo1Enter(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure pgcCatalogoPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure cdsCatalogoBeforePost(DataTable: TDADataTable);
    procedure cdsCatalogoAfterScroll(DataTable: TDADataTable);
    procedure clbParametrosClick(Sender: TObject);
    procedure cxGrid1DBTableView1EditChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
  private
    { Private declarations }
    Importando: Boolean;
    procedure ActionEliminar(Action: TBasicAction);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
    procedure UpdateActionsState; override;
    procedure LetrasAParametros(Cad: String);
    function ParametrosALetras: String;
    procedure ExportaReporte(Ruta: String);
    procedure ImportaReporte(Ruta: String; Nombre: String = '');
  end;

var
  frmCatalogoReportes: TfrmCatalogoReportes;
   Parametro:String;
implementation

uses uDM, Modules, LibraryEmpresas_Intf, ufrmParametros, UtileriasComun,
  dmActions;

{$R *.dfm}

procedure TfrmCatalogoReportes.ActionEliminar(Action: TBasicAction);
begin
  if (cdsCatalogo.State = dsBrowse) and (cdsCatalogo.RecordCount > 0) and
     (MessageDlg('�Desea eliminar el registro actual?', mtConfirmation, mbYesNo, 0) = mrYes) then
  begin
    cdsCatalogo.Delete;
    cdsCatalogo.ApplyUpdates();
  end;
end;

procedure TfrmCatalogoReportes.btnDuplicarClick(Sender: TObject);
begin
  inherited;
  if (cdsCatalogo.State = dsBrowse) then
  begin
    try
      Importando:=True;
      ExportaReporte('Temp.rcg');
      ImportaReporte('Temp.rcg', 'COPIA DE ' + cdsCatalogo.FieldByName('Nombre').AsString);
    finally
      Importando:=False;
      if FileExists('Temp.rcg') then
        DeleteFile('Temp.rcg');
    end;
  end;
end;

procedure TfrmCatalogoReportes.btnExportarClick(Sender: TObject);
begin
  inherited;
  sdExportar.FileName:=cdsCatalogo.FieldByName('Nombre').AsString;
  if (cdsCatalogo.State = dsBrowse) and (sdExportar.Execute) then
    ExportaReporte(sdExportar.FileName);
end;

procedure TfrmCatalogoReportes.btnImportarClick(Sender: TObject);
begin
  inherited;
  if (cdsCatalogo.State = dsBrowse) and (odImportar.Execute) then
    ImportaReporte(odImportar.FileName);
end;

procedure TfrmCatalogoReportes.cdsCatalogoAfterScroll(DataTable: TDADataTable);
begin
  inherited;
  if not Importando then
  begin
    if cdsCatalogo.State = dsBrowse then
      LetrasAParametros(cdsCatalogo.FieldByName('Parametros').AsString);
  end;
end;

procedure TfrmCatalogoReportes.cdsCatalogoBeforePost(DataTable: TDADataTable);
var
  CadProd, Cad, Cad2: String;
begin
  CadProd:= '@';
  if not Importando then
  begin
    cdsCatalogo.FieldByName('Parametros').AsString:=ParametrosALetras;
    cdsCatalogo.FieldByName('SQL1').AsString:=Trim(cdsCatalogo.FieldByName('SQL1').AsString);
    cdsCatalogo.FieldByName('SQL2').AsString:=Trim(cdsCatalogo.FieldByName('SQL2').AsString);

    if tblUsuarios.Active then
    begin
      tblUsuarios.First;
      while not tblUsuarios.Eof do
      begin
         if tblUsuarios.FieldByName('Usuario').AsBoolean then
         begin
         Cad:= CadProd + tblUsuarios.FieldByName('UsuarioID').AsString;
         Cad2:=Cad2 + Cad;
         end;
         tblUsuarios.Next;
      end;
      Cad2:= Cad2 + CadProd;
    end;
    cdsCatalogo.FieldByName('Usuarios').AsString:= Cad2;
  end;
end;

procedure TfrmCatalogoReportes.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('ReporteID').AsInteger:=DM.Servidor.Folio('ReporteID', '');
  cdsCatalogo.FieldByName('Parametros').AsString:='';
end;

procedure TfrmCatalogoReportes.clbParametrosClick(Sender: TObject);
begin
  inherited;
  if cdsCatalogo.State = dsBrowse then
    cdsCatalogo.Edit;
end;

procedure TfrmCatalogoReportes.cxGrid1DBTableView1EditChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  inherited;
  if cdsCatalogo.State = dsBrowse then
    cdsCatalogo.Edit;
end;

procedure TfrmCatalogoReportes.cxGrid1DBTableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
  inherited;
  if cdsCatalogo.State = dsBrowse then
    cdsCatalogo.Edit;
end;

procedure TfrmCatalogoReportes.DBAdvMemo1Enter(Sender: TObject);
begin
  inherited;
  OKEnter:=False;
end;

procedure TfrmCatalogoReportes.DBAdvMemo1Exit(Sender: TObject);
begin
  inherited;
  OkEnter:=True;
end;

procedure TfrmCatalogoReportes.ExportaReporte(Ruta: String);
begin
  try
    tblExportar.Open;
    tblExportar.Append;
    tblExportarNombre.AsString:=cdsCatalogo.FieldByName('Nombre').AsString;
    tblExportarTipo.AsInteger:=cdsCatalogo.FieldByName('Tipo').AsInteger;
    tblExportarParametros.AsString:=cdsCatalogo.FieldByName('Parametros').AsString;
    tblExportarTemplate.AsString:=cdsCatalogo.FieldByName('Template').AsString;
    tblExportarMedia.AsString:=cdsCatalogo.FieldByName('TemplateMedia').AsString;
    tblExportarBaja.AsString:=cdsCatalogo.FieldByName('TemplateBaja').AsString;
    tblExportarSQL1.AsString:=cdsCatalogo.FieldByName('SQL1').AsString;
    tblExportarSQL2.AsString:=cdsCatalogo.FieldByName('SQL2').AsString;
    tblExportarCampoJoin.AsString:=cdsCatalogo.FieldByName('CampoJoin').AsString;
    tblExportar.Post;
    tblExportar.SaveToBinaryFile(Ruta);
  finally
    tblExportar.Close;
  end;
end;

procedure TfrmCatalogoReportes.ImportaReporte(Ruta, Nombre: String);
begin
  Importando:=True;
  try
    if FileExists(Ruta) then
    begin
      tblExportar.Open;
      tblExportar.LoadFromBinaryFile(Ruta);
      if Nombre = '' then
        Nombre:=tblExportarNombre.AsString;
      if cdsCatalogo.Locate('Nombre', Nombre, [loCaseInsensitive]) then
        cdsCatalogo.Edit
      else
        cdsCatalogo.Append;
      cdsCatalogo.FieldByName('Nombre').AsString:=Nombre;
      cdsCatalogo.FieldByName('Tipo').AsInteger:=tblExportarTipo.AsInteger;
      cdsCatalogo.FieldByName('Parametros').AsString:=tblExportarParametros.AsString;
      cdsCatalogo.FieldByName('Template').AsString:=tblExportarTemplate.AsString;
      cdsCatalogo.FieldByName('TemplateMedia').AsString:=tblExportarMedia.AsString;
      cdsCatalogo.FieldByName('TemplateBaja').AsString:=tblExportarBaja.AsString;
      cdsCatalogo.FieldByName('SQL1').AsString:=tblExportarSQL1.AsString;
      cdsCatalogo.FieldByName('SQL2').AsString:=tblExportarSQL2.AsString;
      cdsCatalogo.FieldByName('CampoJoin').AsString:=tblExportarCampoJoin.AsString;
      LetrasAParametros(cdsCatalogo.FieldByName('Parametros').AsString);
    end;
  finally
    tblExportar.Close;
    Importando:=False;
  end;
end;

procedure TfrmCatalogoReportes.LetrasAParametros(Cad: String);
var
  I: Integer;
begin
  for I := 0 to clbParametros.Items.Count - 1 do    // Iterate
    clbParametros.Items[I].Checked:=Pos(Chr(clbParametros.Items[I].Tag), Cad) > 0;
end;

function TfrmCatalogoReportes.ParametrosALetras: String;
var
  I: Integer;
begin
  Result:='';
  for I := 0 to clbParametros.Items.Count - 1 do    // Iterate
  begin
    if clbParametros.Items[I].Checked then
      Result:= Result + Chr(clbParametros.Items[I].Tag);
  end;    // for
  if Result='' then
    Result:='1';   //esto es para los reportes donde no tienen parametros

end;

procedure TfrmCatalogoReportes.pgcCatalogoPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
  Aux: TStringStream;
  lFieldLink: TppMasterFieldLink;
const
  MisCampos: Array[4..6] of string = ('Template','TemplateMedia','TemplateBaja');
begin
  inherited;

  if (NewPage.PageIndex = 1) and (cxDBTextEdit1.Text <> '') then
  begin
    tblUsuarios.Close;
    tblUsuarios.Open;

    cdsUsuarios.Close;
    cdsUsuarios.Open;
    while not cdsUsuarios.EOF do
    begin
      tblUsuarios.Append;

      if Pos(cdsUsuarios.FieldByName('IDEMPLEADO').AsString,cdsCatalogo.FieldByName('Usuarios').AsString) > 0 then
           tblUsuarios.FieldByName('Usuario').AsBoolean:= True
      else tblUsuarios.FieldByName('Usuario').AsBoolean:= False;

      tblUsuarios.FieldByName('UsuarioID').AsInteger:= cdsUsuarios.FieldByName('IDEMPLEADO').AsInteger;
      tblUsuarios.FieldByName('Nombre').AsString:= cdsUsuarios.FieldByName('USERNAME').AsString;
      cdsUsuarios.Next;
    end;
    tblUsuarios.First;
    ActionCancelar(nil);
  end;

  if NewPage.PageIndex >= 4 then
  begin
    AllowChange:=False;
    if cdsCatalogo.State = dsBrowse then
    begin
      if cdsCatalogo.FieldByName(MisCampos[NewPage.PageIndex]).AsString = '' then
        DM.repReportes.Template.New
      else
      begin
         Aux:=TStringStream.Create(cdsCatalogo.FieldByName(MisCampos[NewPage.PageIndex]).AsString);
         try
           Aux.Position:=0;
           DM.repReportes.Template.LoadFromStream(Aux);
         finally
           Aux.Free;
         end;
      end;
      DM.Parametros:=ObtenParametros(cdsCatalogo.FieldByName('Parametros').AsString, cdsCatalogo.FieldByName('Nombre').AsString);
      if DM.Parametros = nil then
        Exit;
      DM.AbreDataSetsReportes(cdsCatalogo.FieldByName('SQL1').AsString,
                              cdsCatalogo.FieldByName('SQL2').AsString);
      if cdsCatalogo.FieldByName('CampoJoin').AsString <> '' then
      begin
        DM.dbpDetalle.MasterDataPipeline := DM.dbpMaestro;
        lFieldLink := TppMasterFieldLink.Create(nil);
        lFieldLink.Parent := DM.dbpDetalle;
        lFieldLink.DetailFieldName := cdsCatalogo.FieldByName('CampoJoin').AsString;
        lFieldLink.MasterFieldName := cdsCatalogo.FieldByName('CampoJoin').AsString;
      end;

      DM.repReportes.NoDataBehaviors:=[ndBlankReport];

      rdReportes.ShowModal;

      Aux:=TStringStream.Create('');
      try
        DM.repReportes.Template.SaveToStream(Aux);
        cdsCatalogo.Edit;
        cdsCatalogo.FieldByName(MisCampos[NewPage.PageIndex]).AsString:=Aux.DataString;
      finally
       Aux.Free;
      end;
    end;
  end;
end;

procedure TfrmCatalogoReportes.RegisterActions;
begin
  inherited;
  RegisterAction(AppActions.actEliminar, ActionEliminar);
end;

procedure TfrmCatalogoReportes.UpdateActionsState;
begin
  inherited UpdateActionsState;
  AppActions.actEliminar.Enabled:=cdsCatalogo.State = dsBrowse;
end;

initialization
  ModuleInfoManager.RegisterModule('Reportes', TfrmCatalogoReportes);

end.
