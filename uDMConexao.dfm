object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 521
  Width = 496
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=sgadados'
      'User_Name=sgadados'
      'Password=SGA@decker1209'
      'Server='
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object MySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 
      'D:\ArquivosTecnico\Programa\Delphi\SGAImport\Win32\Release\libmy' +
      'sql.dll'
    Left = 376
    Top = 24
  end
  object FBDriverLink: TFDPhysFBDriverLink
    VendorLib = 
      'D:\ArquivosTecnico\Programa\Delphi\SGAImport\Win32\Release\libmy' +
      'sql.dll'
    Left = 112
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 264
    Top = 24
  end
  object tbDuplicatas: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection
    TableName = 'duplicatas'
    Left = 32
    Top = 240
    object tbDuplicatasid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbDuplicatasfilial: TIntegerField
      FieldName = 'filial'
      Origin = 'filial'
      Required = True
    end
    object tbDuplicatasfilial_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'filial_desc'
      Origin = 'filial_desc'
      Size = 30
    end
    object tbDuplicatascliente: TIntegerField
      FieldName = 'cliente'
      Origin = 'cliente'
      Required = True
    end
    object tbDuplicatascliente_desc: TStringField
      FieldName = 'cliente_desc'
      Origin = 'cliente_desc'
      Required = True
      Size = 40
    end
    object tbDuplicatasduplicata: TStringField
      FieldName = 'duplicata'
      Origin = 'duplicata'
      Required = True
      Size = 15
    end
    object tbDuplicatasmodalidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'modalidade'
      Origin = 'modalidade'
    end
    object tbDuplicatasmod_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mod_desc'
      Origin = 'mod_desc'
      Size = 30
    end
    object tbDuplicatassituacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'situacao'
      Origin = 'situacao'
    end
    object tbDuplicatassituacao_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'situacao_desc'
      Origin = 'situacao_desc'
    end
    object tbDuplicatasvendedor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vendedor'
      Origin = 'vendedor'
      Size = 3
    end
    object tbDuplicatasvendedor_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vendedor_desc'
      Origin = 'vendedor_desc'
      Size = 50
    end
    object tbDuplicatasvalor: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
    end
    object tbDuplicatasemissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'emissao'
      Origin = 'emissao'
    end
    object tbDuplicatasvencimento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'vencimento'
      Origin = 'vencimento'
    end
    object tbDuplicataspagamento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'pagamento'
      Origin = 'pagamento'
    end
    object tbDuplicatasatraso: TIntegerField
      FieldName = 'atraso'
      Origin = 'atraso'
      Required = True
    end
    object tbDuplicatasjuros: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'juros'
      Origin = 'juros'
    end
    object tbDuplicatasdesconto: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
    end
    object tbDuplicatascod_lancto: TStringField
      FieldName = 'cod_lancto'
      Origin = 'cod_lancto'
      Required = True
      Size = 15
    end
    object tbDuplicatascod_lancto_desc: TStringField
      FieldName = 'cod_lancto_desc'
      Origin = 'cod_lancto_desc'
      Required = True
      Size = 30
    end
    object tbDuplicatascaixa: TStringField
      FieldName = 'caixa'
      Origin = 'caixa'
      Required = True
      Size = 3
    end
    object tbDuplicatascaixa_desc: TStringField
      FieldName = 'caixa_desc'
      Origin = 'caixa_desc'
      Required = True
      Size = 30
    end
    object tbDuplicatasprazo: TIntegerField
      FieldName = 'prazo'
      Origin = 'prazo'
      Required = True
    end
    object tbDuplicatasoperador: TStringField
      FieldName = 'operador'
      Origin = 'operador'
      Required = True
      Size = 3
    end
    object tbDuplicatasoperador_desc: TStringField
      FieldName = 'operador_desc'
      Origin = 'operador_desc'
      Required = True
      Size = 50
    end
    object tbDuplicatasstatus: TStringField
      FieldName = 'status'
      Origin = '`status`'
      Required = True
      Size = 30
    end
    object tbDuplicatasano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
      Required = True
    end
    object tbDuplicatasmes: TIntegerField
      FieldName = 'mes'
      Origin = 'mes'
      Required = True
    end
    object tbDuplicatasdia: TIntegerField
      FieldName = 'dia'
      Origin = 'dia'
      Required = True
    end
    object tbDuplicatastempo: TStringField
      FieldName = 'tempo'
      Origin = 'tempo'
      Required = True
      Size = 8
    end
    object tbDuplicatasMexExt: TStringField
      FieldName = 'MexExt'
      Origin = 'MexExt'
      Required = True
      Size = 10
    end
    object tbDuplicatascond_pagto: TStringField
      FieldName = 'cond_pagto'
      Origin = 'cond_pagto'
      Required = True
      Size = 3
    end
    object tbDuplicatasdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 50
    end
  end
  object dsDuplicatas: TDataSource
    DataSet = tbDuplicatas
    Left = 112
    Top = 240
  end
  object dsSESRR22: TDataSource
    DataSet = tbSESRR22
    Left = 112
    Top = 112
  end
  object tbClientes: TFDTable
    IndexFieldNames = 'idclientes'
    Connection = FDConnection
    TableName = 'sga.clientes'
    Left = 32
    Top = 176
    object tbClientesidclientes: TFDAutoIncField
      FieldName = 'idclientes'
      Origin = 'idclientes'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbClientescodigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
    end
    object tbClientescpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 14
    end
    object tbClientesdocumento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'documento'
      Origin = 'documento'
      Size = 15
    end
    object tbClientesnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object tbClientesnascimento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'nascimento'
      Origin = 'nascimento'
    end
    object tbClientestipo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object tbClientestipo_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo_desc'
      Origin = 'tipo_desc'
      Size = 15
    end
    object tbClientesestado_civil: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'estado_civil'
      Origin = 'estado_civil'
      Size = 15
    end
    object tbClientescalce: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'calce'
      Origin = 'calce'
      Size = 5
    end
    object tbClientesbloqueio: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bloqueio'
      Origin = 'bloqueio'
      Size = 15
    end
    object tbClientescep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object tbClienteslogradouro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 45
    end
    object tbClientesnumero: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'numero'
      Origin = 'numero'
      Size = 15
    end
    object tbClientescompleta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'completa'
      Origin = 'completa'
      Size = 25
    end
    object tbClientesbairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object tbClientescidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 45
    end
    object tbClientesuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object tbClientesfone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone'
      Origin = 'fone'
      Size = 15
    end
    object tbClientescelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      Size = 15
    end
    object tbClientesemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 45
    end
    object tbClientesfilial: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'filial'
      Origin = 'filial'
    end
    object tbClientesvendedor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vendedor'
      Origin = 'vendedor'
      Size = 5
    end
    object tbClientesvendedor_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vendedor_desc'
      Origin = 'vendedor_desc'
      Size = 45
    end
    object tbClientesprimeira_compra: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'primeira_compra'
      Origin = 'primeira_compra'
    end
    object tbClientesultima_compra: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ultima_compra'
      Origin = 'ultima_compra'
    end
    object tbClienteslimite: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'limite'
      Origin = 'limite'
    end
    object tbClientesvale: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'vale'
      Origin = 'vale'
    end
    object tbClientessaldo: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'saldo'
      Origin = 'saldo'
    end
    object tbClientesconjuge: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'conjuge'
      Origin = 'conjuge'
      Size = 45
    end
    object tbClientesnasc_conjuge: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'nasc_conjuge'
      Origin = 'nasc_conjuge'
    end
    object tbClientespai: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pai'
      Origin = 'pai'
      Size = 45
    end
    object tbClientesnasc_pai: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'nasc_pai'
      Origin = 'nasc_pai'
    end
    object tbClientesmae: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mae'
      Origin = 'mae'
      Size = 45
    end
    object tbClientesnasc_mae: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'nasc_mae'
      Origin = 'nasc_mae'
    end
    object tbClientesobervacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'obervacao'
      Origin = 'obervacao'
      Size = 45
    end
    object tbClientesvestuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vestuario'
      Origin = 'vestuario'
      Size = 5
    end
    object tbClientessexo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sexo'
      Origin = 'sexo'
      Size = 15
    end
    object tbClientesregiao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'regiao'
      Origin = 'regiao'
      Size = 45
    end
    object tbClientesmaior_compra: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'maior_compra'
      Origin = 'maior_compra'
    end
    object tbClientesnumero_compra: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numero_compra'
      Origin = 'numero_compra'
    end
    object tbClientesnumero_atrasos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numero_atrasos'
      Origin = 'numero_atrasos'
    end
    object tbClientesidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idade'
      Origin = 'idade'
    end
    object tbClientesatividade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'atividade'
      Origin = 'atividade'
      Size = 45
    end
  end
  object dsClientes: TDataSource
    DataSet = tbClientes
    Left = 112
    Top = 176
  end
  object tbAltPreco: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection
    TableName = 'sga.altpreco'
    Left = 32
    Top = 304
    object tbAltPrecoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbAltPrecodata: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
    end
    object tbAltPrecofilial: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'filial'
      Origin = 'filial'
    end
    object tbAltPrecoreferencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'referencia'
      Origin = 'referencia'
      Size = 15
    end
    object tbAltPrecopreco_de: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_de'
      Origin = 'preco_de'
      Precision = 15
      Size = 2
    end
    object tbAltPrecopreco_por: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_por'
      Origin = 'preco_por'
      Precision = 15
      Size = 2
    end
  end
  object dsAltPreco: TDataSource
    DataSet = tbAltPreco
    Left = 112
    Top = 304
  end
  object tbVendas: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'sga.vendas'
    Left = 32
    Top = 378
    object tbVendasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object tbVendasfilial: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'filial'
      Origin = 'filial'
    end
    object tbVendasvendedor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vendedor'
      Origin = 'vendedor'
    end
    object tbVendasvendedor_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vendedor_desc'
      Origin = 'vendedor_desc'
      Size = 40
    end
    object tbVendasgrupo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grupo'
      Origin = 'grupo'
    end
    object tbVendasgrupo_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grupo_desc'
      Origin = 'grupo_desc'
      Size = 30
    end
    object tbVendassubgrupo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'subgrupo'
      Origin = 'subgrupo'
      Size = 5
    end
    object tbVendassubgrupo_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'subgrupo_desc'
      Origin = 'subgrupo_desc'
      Size = 30
    end
    object tbVendasano: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ano'
      Origin = 'ano'
    end
    object tbVendasmes: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mes'
      Origin = 'mes'
    end
    object tbVendasdia: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'dia'
      Origin = 'dia'
    end
    object tbVendashora: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'hora'
      Origin = 'hora'
    end
    object tbVendasminuto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'minuto'
      Origin = 'minuto'
    end
    object tbVendasreferencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'referencia'
      Origin = 'referencia'
      Size = 15
    end
    object tbVendasreferencia_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'referencia_desc'
      Origin = 'referencia_desc'
      Size = 50
    end
    object tbVendascor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
    end
    object tbVendascor_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_desc'
      Origin = 'cor_desc'
      Size = 30
    end
    object tbVendastamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      Size = 3
    end
    object tbVendasquantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object tbVendasvr_total: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'vr_total'
      Origin = 'vr_total'
    end
    object tbVendascliente: TIntegerField
      FieldName = 'cliente'
      Origin = 'cliente'
      Required = True
    end
    object tbVendascliente_desc: TStringField
      FieldName = 'cliente_desc'
      Origin = 'cliente_desc'
      Required = True
      Size = 50
    end
    object tbVendascidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 50
    end
    object tbVendasuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      Size = 2
    end
    object tbVendasdocto: TIntegerField
      FieldName = 'docto'
      Origin = 'docto'
      Required = True
    end
    object tbVendasserie_docto: TStringField
      FieldName = 'serie_docto'
      Origin = 'serie_docto'
      Required = True
      Size = 3
    end
    object tbVendastipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 15
    end
    object tbVendascolecao: TIntegerField
      FieldName = 'colecao'
      Origin = 'colecao'
      Required = True
    end
    object tbVendascolecao_desc: TStringField
      FieldName = 'colecao_desc'
      Origin = 'colecao_desc'
      Required = True
      Size = 50
    end
    object tbVendasfornecedor: TIntegerField
      FieldName = 'fornecedor'
      Origin = 'fornecedor'
      Required = True
    end
    object tbVendasfornecedor_desc: TStringField
      FieldName = 'fornecedor_desc'
      Origin = 'fornecedor_desc'
      Required = True
      Size = 50
    end
    object tbVendasfornecedor_resumido: TStringField
      FieldName = 'fornecedor_resumido'
      Origin = 'fornecedor_resumido'
      Required = True
    end
    object tbVendasmarca: TIntegerField
      FieldName = 'marca'
      Origin = 'marca'
      Required = True
    end
    object tbVendasmarca_desc: TStringField
      FieldName = 'marca_desc'
      Origin = 'marca_desc'
      Required = True
      Size = 50
    end
    object tbVendasmesext: TStringField
      FieldName = 'mesext'
      Origin = 'mesext'
      Required = True
      Size = 5
    end
    object tbVendasreposicao: TFloatField
      FieldName = 'reposicao'
      Origin = 'reposicao'
      Required = True
    end
    object tbVendasdesconto: TFloatField
      FieldName = 'desconto'
      Origin = 'desconto'
      Required = True
    end
    object tbVendastempokey: TStringField
      FieldName = 'tempokey'
      Origin = 'tempokey'
      Required = True
      Size = 8
    end
    object tbVendasdata: TDateField
      FieldName = 'data'
      Origin = '`data`'
      Required = True
    end
    object tbVendasn_fiscal: TIntegerField
      FieldName = 'n_fiscal'
      Origin = 'n_fiscal'
      Required = True
    end
    object tbVendasserie_n_fiscal: TStringField
      FieldName = 'serie_n_fiscal'
      Origin = 'serie_n_fiscal'
      Required = True
      Size = 3
    end
    object tbVendasecf: TStringField
      FieldName = 'ecf'
      Origin = 'ecf'
      Required = True
      Size = 3
    end
    object tbVendasvr_avista: TFloatField
      FieldName = 'vr_avista'
      Origin = 'vr_avista'
      Required = True
    end
    object tbVendasvr_aprazo: TFloatField
      FieldName = 'vr_aprazo'
      Origin = 'vr_aprazo'
      Required = True
    end
    object tbVendasoriginal: TIntegerField
      FieldName = 'original'
      Origin = 'original'
      Required = True
    end
    object tbVendasvr_venda: TFloatField
      FieldName = 'vr_venda'
      Origin = 'vr_venda'
      Required = True
    end
    object tbVendaslinha: TIntegerField
      FieldName = 'linha'
      Origin = 'linha'
      Required = True
    end
    object tbVendaslinha_desc: TStringField
      FieldName = 'linha_desc'
      Origin = 'linha_desc'
      Required = True
      Size = 50
    end
    object tbVendasmodalidade: TIntegerField
      FieldName = 'modalidade'
      Origin = 'modalidade'
      Required = True
    end
    object tbVendasmodalidade_desc: TStringField
      FieldName = 'modalidade_desc'
      Origin = 'modalidade_desc'
      Required = True
      Size = 50
    end
    object tbVendasprazo: TStringField
      FieldName = 'prazo'
      Origin = 'prazo'
      Required = True
      Size = 2
    end
    object tbVendasprazo_desc: TStringField
      FieldName = 'prazo_desc'
      Origin = 'prazo_desc'
      Required = True
      Size = 50
    end
  end
  object dsVendas: TDataSource
    DataSet = tbVendas
    Left = 109
    Top = 378
  end
  object tbSESRR22: TFDTable
    IndexName = 'idx_filial_referencia_cor'
    MasterSource = dsAltPreco
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'sesrr22'
    Left = 32
    Top = 112
    object tbSESRR22id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbSESRR22filial: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'filial'
      Origin = 'filial'
    end
    object tbSESRR22nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 30
    end
    object tbSESRR22referencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'referencia'
      Origin = 'referencia'
      Size = 15
    end
    object tbSESRR22descricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 45
    end
    object tbSESRR22cor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
    end
    object tbSESRR22cor_descricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_descricao'
      Origin = 'cor_descricao'
      Size = 45
    end
    object tbSESRR22unidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'unidade'
      Origin = 'unidade'
      Size = 2
    end
    object tbSESRR22fornec: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fornec'
      Origin = 'fornec'
    end
    object tbSESRR22fornec_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fornec_desc'
      Origin = 'fornec_desc'
      Size = 45
    end
    object tbSESRR22resumido: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'resumido'
      Origin = 'resumido'
      Size = 45
    end
    object tbSESRR22grupo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grupo'
      Origin = 'grupo'
    end
    object tbSESRR22grupo_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'grupo_desc'
      Origin = 'grupo_desc'
      Size = 45
    end
    object tbSESRR22subgrupo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'subgrupo'
      Origin = 'subgrupo'
    end
    object tbSESRR22subgrupo_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'subgrupo_desc'
      Origin = 'subgrupo_desc'
      Size = 45
    end
    object tbSESRR22marca: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'marca'
      Origin = 'marca'
    end
    object tbSESRR22marca_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'marca_desc'
      Origin = 'marca_desc'
      Size = 45
    end
    object tbSESRR22colecao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'colecao'
      Origin = 'colecao'
    end
    object tbSESRR22colecao_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'colecao_desc'
      Origin = 'colecao_desc'
      Size = 45
    end
    object tbSESRR22linha: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'linha'
      Origin = 'linha'
    end
    object tbSESRR22linha_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'linha_desc'
      Origin = 'linha_desc'
      Size = 45
    end
    object tbSESRR22estoque: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'estoque'
      Origin = 'estoque'
    end
    object tbSESRR22custo: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'custo'
      Origin = 'custo'
    end
    object tbSESRR22reposicao: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'reposicao'
      Origin = 'reposicao'
    end
    object tbSESRR22venda: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'venda'
      Origin = 'venda'
    end
    object tbSESRR22preco1: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'preco1'
      Origin = 'preco1'
    end
    object tbSESRR22preco2: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'preco2'
      Origin = 'preco2'
    end
    object tbSESRR22preco3: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'preco3'
      Origin = 'preco3'
    end
    object tbSESRR22promocao: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'promocao'
      Origin = 'promocao'
    end
    object tbSESRR22marcacao: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'marcacao'
      Origin = 'marcacao'
    end
    object tbSESRR22ult_compra: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ult_compra'
      Origin = 'ult_compra'
    end
    object tbSESRR22inativos: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'inativos'
      Origin = 'inativos'
    end
    object tbSESRR22medio: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'medio'
      Origin = 'medio'
    end
    object tbSESRR22pontuacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pontuacao'
      Origin = 'pontuacao'
    end
    object tbSESRR22curva: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'curva'
      Origin = 'curva'
      Size = 3
    end
    object tbSESRR22tam_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_1'
      Origin = 'tam_1'
      Size = 2
    end
    object tbSESRR22tam_2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_2'
      Origin = 'tam_2'
      Size = 2
    end
    object tbSESRR22tam_3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_3'
      Origin = 'tam_3'
      Size = 2
    end
    object tbSESRR22tam_4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_4'
      Origin = 'tam_4'
      Size = 2
    end
    object tbSESRR22tam_5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_5'
      Origin = 'tam_5'
      Size = 2
    end
    object tbSESRR22tam_6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_6'
      Origin = 'tam_6'
      Size = 2
    end
    object tbSESRR22tam_7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_7'
      Origin = 'tam_7'
      Size = 2
    end
    object tbSESRR22tam_8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_8'
      Origin = 'tam_8'
      Size = 2
    end
    object tbSESRR22tam_9: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_9'
      Origin = 'tam_9'
      Size = 2
    end
    object tbSESRR22tam_10: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_10'
      Origin = 'tam_10'
      Size = 2
    end
    object tbSESRR22tam_11: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_11'
      Origin = 'tam_11'
      Size = 2
    end
    object tbSESRR22tam_12: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_12'
      Origin = 'tam_12'
      Size = 2
    end
    object tbSESRR22tam_13: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_13'
      Origin = 'tam_13'
      Size = 2
    end
    object tbSESRR22tam_14: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_14'
      Origin = 'tam_14'
      Size = 2
    end
    object tbSESRR22tam_15: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tam_15'
      Origin = 'tam_15'
      Size = 2
    end
    object tbSESRR22qtd_1: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_1'
      Origin = 'qtd_1'
    end
    object tbSESRR22qtd_2: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_2'
      Origin = 'qtd_2'
    end
    object tbSESRR22qtd_3: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_3'
      Origin = 'qtd_3'
    end
    object tbSESRR22qtd_4: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_4'
      Origin = 'qtd_4'
    end
    object tbSESRR22qtd_5: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_5'
      Origin = 'qtd_5'
    end
    object tbSESRR22qtd_6: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_6'
      Origin = 'qtd_6'
    end
    object tbSESRR22qtd_7: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_7'
      Origin = 'qtd_7'
    end
    object tbSESRR22qtd_8: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_8'
      Origin = 'qtd_8'
    end
    object tbSESRR22qtd_9: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_9'
      Origin = 'qtd_9'
    end
    object tbSESRR22qtd_10: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_10'
      Origin = 'qtd_10'
    end
    object tbSESRR22qtd_11: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_11'
      Origin = 'qtd_11'
    end
    object tbSESRR22qtd_12: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_12'
      Origin = 'qtd_12'
    end
    object tbSESRR22qtd_13: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_13'
      Origin = 'qtd_13'
    end
    object tbSESRR22qtd_14: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_14'
      Origin = 'qtd_14'
    end
    object tbSESRR22qtd_15: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_15'
      Origin = 'qtd_15'
    end
  end
end
