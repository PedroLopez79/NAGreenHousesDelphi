inherited FrmMermas: TFrmMermas
  Left = 320
  Align = alClient
  Position = poDesigned
  ExplicitWidth = 625
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFacturacion: TcxPageControl
    Left = 0
    Top = 0
    Width = 625
    Height = 449
    Align = alClient
    Images = dmImages.Imagenes
    LookAndFeel.NativeStyle = False
    TabOrder = 0
    TabPosition = tpBottom
    ClientRectBottom = 443
    ClientRectLeft = 3
    ClientRectRight = 619
    ClientRectTop = 3
  end
  object cxPagTraspaso: TcxPageControl
    Left = 0
    Top = 0
    Width = 625
    Height = 449
    ActivePage = cxTabMermas
    Align = alClient
    Images = dmImages.Imagenes
    LookAndFeel.NativeStyle = False
    TabOrder = 1
    TabPosition = tpBottom
    ClientRectBottom = 419
    ClientRectLeft = 3
    ClientRectRight = 619
    ClientRectTop = 3
    object cxTabMermas: TcxTabSheet
      Caption = 'Mermas '
      ImageIndex = 59
      object grbEncabezado: TcxGroupBox
        Left = 0
        Top = 0
        TabStop = True
        Align = alTop
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 97
        Width = 616
        object cxLabel5: TcxLabel
          Left = 125
          Top = 8
          Caption = 'Folio'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel8: TcxLabel
          Left = 10
          Top = 8
          Caption = 'Fecha'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object dbTxtFolio: TcxDBTextEdit
          Left = 125
          Top = 24
          DataBinding.DataField = 'Folio'
          DataBinding.DataSource = dsTransaccion
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          Width = 117
        end
        object dbDatFecha: TcxDBDateEdit
          Left = 12
          Top = 24
          TabStop = False
          DataBinding.DataField = 'Fecha'
          DataBinding.DataSource = dsTransaccion
          Enabled = False
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 3
          Width = 101
        end
      end
      object cxGroupBox6: TcxGroupBox
        Left = 0
        Top = 97
        Align = alClient
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 1
        Height = 319
        Width = 616
        object cxGrid1: TcxGrid
          Left = 2
          Top = 18
          Width = 612
          Height = 299
          Align = alClient
          TabOrder = 0
          OnEnter = cxGrid1Enter
          OnExit = cxGrid1Exit
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = True
          object cxGridDBTableView3: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnEditKeyDown = cxGridDBTableView3EditKeyDown
            DataController.DataSource = dsDetalleTransaccion
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '####0.#0'
                Kind = skSum
                Column = cxGridDBTableView3Cantidad
              end>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.Footer = True
            Styles.ContentEven = DM.cxStyle1
            object cxGridDBTableView3ProductoID: TcxGridDBColumn
              DataBinding.FieldName = 'ProductoID'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGridDBTableView3ProductoIDPropertiesValidate
              Width = 66
            end
            object cxGridDBTableView3Descripcion: TcxGridDBColumn
              DataBinding.FieldName = 'Descripcion'
              Options.Editing = False
              Options.Focusing = False
              Width = 326
            end
            object cxGridDBTableView3Cantidad: TcxGridDBColumn
              DataBinding.FieldName = 'Cantidad'
              Width = 87
            end
          end
          object cxGridLevel3: TcxGridLevel
            GridView = cxGridDBTableView3
          end
        end
      end
    end
  end
  object dbCbxAlmacenOrigen: TcxDBLookupComboBox
    AlignWithMargins = True
    Left = 12
    Top = 62
    DataBinding.DataField = 'AlmacenID'
    DataBinding.DataSource = dsTransaccion
    Properties.KeyFieldNames = 'AlmacenID'
    Properties.ListColumns = <
      item
        FieldName = 'Nombre'
      end>
    Properties.ListSource = dsAlmacen
    Style.BorderStyle = ebsUltraFlat
    TabOrder = 2
    Width = 230
  end
  object cxLabel1: TcxLabel
    Left = 12
    Top = 46
    Caption = 'Almacen'
    Style.BorderStyle = ebsNone
    Transparent = True
  end
  object dsProducto: TDADataSource
    DataSet = cdsProducto.Dataset
    DataTable = cdsProducto
    Left = 64
    Top = 392
  end
  object cdsProducto: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ProductoID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Codigo'
        DataType = datString
        Size = 10
        Required = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 30
        Required = True
      end
      item
        Name = 'PrecioVenta'
        DataType = datFloat
      end
      item
        Name = 'ClavePemex'
        DataType = datString
        Size = 10
      end
      item
        Name = 'Costo'
        DataType = datFloat
      end
      item
        Name = 'Status'
        DataType = datBoolean
      end
      item
        Name = 'Barras'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CuentaContableCompra'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CuentaContableVenta'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Inventariable'
        DataType = datBoolean
      end
      item
        Name = 'CategoriaID'
        DataType = datInteger
        Required = True
      end>
    Params = <
      item
        Name = 'Tipo'
        Value = '1'
        ParamType = daptInput
      end
      item
        Name = 'EstacionID'
        Value = '4120'
        ParamType = daptInput
      end>
    LogChanges = False
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    LogicalName = 'ObtenerProductoPorTipo'
    IndexDefs = <>
    Left = 64
    Top = 360
  end
  object dsDetalleTransaccion: TDADataSource
    DataSet = cdsDetalleTransaccion.Dataset
    DataTable = cdsDetalleTransaccion
    Left = 32
    Top = 392
  end
  object dsTransaccion: TDADataSource
    DataSet = cdsTransaccion.Dataset
    DataTable = cdsTransaccion
    Top = 390
  end
  object cdsEstacion: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'EstacionID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 70
        Required = True
      end
      item
        Name = 'RazonSocial'
        DataType = datString
        Size = 70
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 30
        Required = True
      end
      item
        Name = 'ClavePemex'
        DataType = datString
        Size = 10
        Required = True
      end
      item
        Name = 'NoBombas'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Colonia'
        DataType = datString
        Size = 80
      end
      item
        Name = 'Ciudad'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CodigoPostal'
        DataType = datString
        Size = 10
      end
      item
        Name = 'Host'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Impuesto'
        DataType = datFloat
        Required = True
      end>
    Params = <
      item
        Name = 'EstacionID'
        Value = ''
        ParamType = daptInput
      end>
    LogChanges = False
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    LogicalName = 'ObtenerDatosEstacion'
    IndexDefs = <>
    Left = 232
    Top = 456
  end
  object dsEstacion: TDADataSource
    DataSet = cdsEstacion.Dataset
    DataTable = cdsEstacion
    Left = 264
    Top = 456
  end
  object cdsTransaccion: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'TransaccionID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Folio'
        DataType = datInteger
      end
      item
        Name = 'Tipo'
        DataType = datString
        Size = 2
      end
      item
        Name = 'Credito'
        DataType = datBoolean
      end
      item
        Name = 'Referencia'
        DataType = datString
        Size = 20
        Required = True
      end
      item
        Name = 'Fecha'
        DataType = datDateTime
        Required = True
      end
      item
        Name = 'Ejercicio'
        DataType = datInteger
      end
      item
        Name = 'Periodo'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Dia'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Total'
        DataType = datFloat
      end
      item
        Name = 'SubTotal'
        DataType = datFloat
      end
      item
        Name = 'Impuesto'
        DataType = datFloat
      end
      item
        Name = 'Plazo'
        DataType = datInteger
      end
      item
        Name = 'Secuencia'
        DataType = datInteger
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'ProveedorId'
        DataType = datInteger
      end
      item
        Name = 'AlmacenID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'EstacionDestinoID'
        DataType = datInteger
      end
      item
        Name = 'AlmacenDestinoID'
        DataType = datInteger
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    BeforePost = cdsTransaccionBeforePost
    AfterPost = cdsTransaccionAfterPost
    OnNewRecord = cdsTransaccionNewRecord
    LogicalName = 'dbo Transaccion'
    IndexDefs = <>
    Top = 360
  end
  object cdsDetalleTransaccion: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'DetalleTransaccionID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Cantidad'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'Costo'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'TransaccionID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'ProductoID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 30
        LogChanges = False
        DisplayLabel = 'Descripci'#243'n'
        Lookup = True
        LookupSource = dsProducto
        LookupKeyFields = 'ProductoID'
        LookupResultField = 'Nombre'
        KeyFields = 'ProductoID'
        LookupCache = True
      end
      item
        Name = 'Importe'
        DataType = datFloat
        LogChanges = False
        DisplayFormat = '##,###,##0.#0'
        EditFormat = '##,###,##0.#0'
        Alignment = taRightJustify
        Calculated = True
      end>
    Params = <
      item
        Name = 'TransaccionID'
        Value = ''
        ParamType = daptInput
      end>
    MasterParamsMappings.Strings = (
      'TransaccionID=TransaccionID')
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsDetalleTransaccionNewRecord
    MasterSource = dsTransaccion
    MasterFields = 'TransaccionID'
    DetailFields = 'TransaccionID'
    LogicalName = 'DetalleTransaccion'
    IndexDefs = <>
    Left = 32
    Top = 360
  end
  object cdsAlmacen: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'AlmacenID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 30
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
        Required = True
      end>
    Params = <
      item
        Name = 'EstacionID'
        Value = ''
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    LogicalName = 'EstacionAlmacen'
    IndexDefs = <>
    Left = 96
    Top = 360
  end
  object dsAlmacen: TDADataSource
    DataSet = cdsAlmacen.Dataset
    DataTable = cdsAlmacen
    Left = 96
    Top = 392
  end
  object cdsDetalleMovimiento: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'DetalleMovimientoID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Tipo'
        DataType = datString
        Size = 2
        Required = True
      end
      item
        Name = 'Operador'
        DataType = datString
        Size = 2
        Required = True
      end
      item
        Name = 'Cantidad'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'Costo'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'MovimientoAlmacen'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'ProductoID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'TransaccionID'
        DataType = datInteger
      end>
    Params = <
      item
        Name = 'TransaccionID'
        Value = ''
        ParamType = daptInput
      end>
    MasterParamsMappings.Strings = (
      'FacturaID=FacturaID')
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    LogicalName = 'DetalleMovimiento'
    IndexDefs = <>
    Left = 128
    Top = 360
  end
  object dsDetalleMovimiento: TDADataSource
    DataSet = cdsDetalleMovimiento.Dataset
    DataTable = cdsDetalleMovimiento
    Left = 128
    Top = 392
  end
  object cdsMovimientoAlmacen: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'MovimientoAlmacen'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'AlmacenID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
        Required = True
      end>
    Params = <>
    MasterParamsMappings.Strings = (
      'FacturaID=FacturaID')
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    LogicalName = 'dbo MovimientoAlmacen'
    IndexDefs = <>
    Left = 160
    Top = 360
  end
  object dsMovimientoAlmacen: TDADataSource
    DataSet = cdsMovimientoAlmacen.Dataset
    DataTable = cdsMovimientoAlmacen
    Left = 160
    Top = 392
  end
end
