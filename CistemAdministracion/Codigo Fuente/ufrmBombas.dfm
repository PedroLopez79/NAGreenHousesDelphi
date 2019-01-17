inherited frmDistribucionBomba: TfrmDistribucionBomba
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    ActivePage = cxTabSheet2
    inherited cxTabSheet1: TcxTabSheet
      inherited dbgCatalogo: TcxGrid
        Width = 616
        Height = 416
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1BombaID: TcxGridDBColumn
            DataBinding.FieldName = 'BombaID'
          end
          object dbgCatalogoDBTableView1NoBomba: TcxGridDBColumn
            DataBinding.FieldName = 'NoBomba'
          end
          object dbgCatalogoDBTableView1PosicionCarga: TcxGridDBColumn
            DataBinding.FieldName = 'PosicionCarga'
            Width = 105
          end
          object dbgCatalogoDBTableView1EstacionID: TcxGridDBColumn
            DataBinding.FieldName = 'EstacionID'
            Width = 73
          end
          object dbgCatalogoDBTableView1ProductoID: TcxGridDBColumn
            DataBinding.FieldName = 'ProductoID'
            Width = 110
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      object cxGroupBox1: TcxGroupBox
        Left = 5
        Top = 0
        Caption = ' Salidas  '
        TabOrder = 0
        Height = 153
        Width = 388
        object txtBombaID: TcxDBTextEdit
          Left = 16
          Top = 48
          DataBinding.DataField = 'BombaID'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          Width = 57
        end
        object LblNoEstacion: TcxLabel
          Left = 16
          Top = 31
          Caption = 'BombaID'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object txtNoBomba: TcxDBTextEdit
          Left = 16
          Top = 88
          DataBinding.DataField = 'NoBomba'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = False
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 1
          Width = 58
        end
        object cxLabel2: TcxLabel
          Left = 16
          Top = 71
          Caption = 'No Bomba'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cbxProducto: TcxDBLookupComboBox
          Left = 144
          Top = 88
          DataBinding.DataField = 'ProductoID'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.KeyFieldNames = 'ProductoID'
          Properties.ListColumns = <
            item
              FieldName = 'Nombre'
            end>
          Properties.ListSource = dsProducto
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 3
          Width = 220
        end
        object LblCategoria: TcxLabel
          Left = 144
          Top = 71
          Caption = 'Producto'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 80
          Top = 88
          DataBinding.DataField = 'PosicionCarga'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = False
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 2
          Width = 58
        end
        object cxLabel1: TcxLabel
          Left = 80
          Top = 71
          Caption = 'Posici'#243'n'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'BombaID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'NoBomba'
        DataType = datInteger
      end
      item
        Name = 'PosicionCarga'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'ProductoID'
        DataType = datInteger
        Required = True
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo Bomba'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
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
        Required = True
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
        Name = 'CostoPromedio'
        DataType = datFloat
      end
      item
        Name = 'CategoriaID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'IEPS'
        DataType = datFloat
      end>
    Params = <>
    LogChanges = False
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterPost = cdsCatalogoAfterPost
    AfterDelete = cdsCatalogoAfterPost
    LogicalName = 'dbo Producto'
    IndexDefs = <>
    Left = 408
    Top = 88
  end
  object dsProducto: TDADataSource
    DataSet = cdsProducto.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsProducto
    Left = 408
    Top = 120
  end
end
