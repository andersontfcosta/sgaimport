object frmImportaCSV: TfrmImportaCSV
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'vSIAC | Importa'#231#227'o de CSV'
  ClientHeight = 318
  ClientWidth = 863
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 8676139
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  ShowHint = True
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 863
    Height = 69
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 859
    object lblTituloJanela: TLabel
      Left = 7
      Top = 16
      Width = 176
      Height = 23
      Caption = 'IMPORTA'#199#195'O DE CSV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8676139
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubTituloJanela: TLabel
      Left = 7
      Top = 35
      Width = 176
      Height = 17
      Caption = 'Importa'#231#227'o de dados em CSV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8676139
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnSeparador01: TPanel
    Left = 0
    Top = 69
    Width = 863
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    Color = 8676139
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 859
  end
  object pnConteudo: TPanel
    Left = 0
    Top = 71
    Width = 863
    Height = 247
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8676139
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 859
    ExplicitHeight = 246
    DesignSize = (
      863
      247)
    object lblCaminhoCSV: TLabel
      Left = 399
      Top = 24
      Width = 149
      Height = 17
      Caption = 'Caminho do arquivo CSV:'
    end
    object lblImportarTabela: TLabel
      Left = 7
      Top = 24
      Width = 125
      Height = 17
      Caption = 'Importar para tabela:'
    end
    object lblProgresso: TLabel
      Left = 7
      Top = 177
      Width = 230
      Height = 17
      Caption = 'Importando registro 000000 de 000000'
      Visible = False
    end
    object pnImportar: TPanel
      Left = 755
      Top = 205
      Width = 100
      Height = 30
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      BevelOuter = bvNone
      Color = 8676139
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 751
      ExplicitTop = 204
      object btImportar: TSpeedButton
        Left = 0
        Top = 0
        Width = 100
        Height = 30
        Align = alClient
        Caption = '&Importar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btImportarClick
        ExplicitLeft = -16
        ExplicitTop = 24
        ExplicitWidth = 110
        ExplicitHeight = 35
      end
    end
    object edtCaminhoCSV: TEdit
      Left = 399
      Top = 47
      Width = 428
      Height = 25
      TabOrder = 1
    end
    object pnPesquisar: TPanel
      Left = 830
      Top = 47
      Width = 26
      Height = 25
      Color = 8676139
      ParentBackground = False
      TabOrder = 2
      object btPesquisar: TSpeedButton
        Left = 1
        Top = 1
        Width = 24
        Height = 23
        Hint = 'Pesquisar o arquivo CSV a importar'
        Align = alClient
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btPesquisarClick
        ExplicitLeft = 17
      end
    end
    object cbImportarTabela: TComboBox
      Left = 7
      Top = 47
      Width = 386
      Height = 25
      TabOrder = 0
      Text = 'Selecione uma tabela...'
      OnChange = cbImportarTabelaChange
      Items.Strings = (
        '0 - Todas as tabelas constanes na pasta'
        '1 - SES-RR-22 - Tabela de markup de produtos (SESRR22.CSV)'
        '2 - Cadastro de clientes (clientes.csv)'
        '3 - Duplicatas contas a receber (duplicatas.csv)'
        '4 - Fornecedores (fornecedores.csv)'
        '5 - Titulos a pagar (titulos.csv)'
        '6 - Vendas (vendas.csv)'
        '7 - Pedidos de compra (pedidos.csv)'
        '8 - Estoque (estoques.csv)'
        '9 - Estoque reduzido (apenas atualiza'#231#227'o de saldos)')
    end
    object pnCancelar: TPanel
      Left = 652
      Top = 205
      Width = 100
      Height = 30
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 4
      ExplicitLeft = 648
      ExplicitTop = 204
      object btCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 100
        Height = 30
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btCancelarClick
        ExplicitLeft = 24
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object ProgressBar: TProgressBar
      Left = 7
      Top = 200
      Width = 580
      Height = 33
      TabOrder = 5
      Visible = False
    end
  end
  object ActionList1: TActionList
    Left = 687
    Top = 23
    object actCancelar: TAction
      Caption = '&Cancelar'
      OnExecute = actCancelarExecute
    end
    object actImportar: TAction
      Caption = '&Importar'
      OnExecute = actImportarExecute
    end
    object actPesquisar: TAction
      Caption = 'Procurar arquivo CSV'
      OnExecute = actPesquisarExecute
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivo CSV|*.csv'
    Title = 'IMPORTA'#199#195'O | Arquivo CSV'
    Left = 816
    Top = 24
  end
end
