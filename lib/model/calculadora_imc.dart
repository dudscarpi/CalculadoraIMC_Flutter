class CalculadoraImc {
  String _nome;
  String _classificacao;
  double _pesoController = 0.0;
  double _alturaController = 0.0;
  double _imcResult = 0.0;

  CalculadoraImc(this._nome, this._classificacao, this._pesoController,
      this._alturaController, this._imcResult);

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  String get classificacao => _classificacao;

  set classificacao(String classificacao) {
    _classificacao = classificacao;
  }

  double get pesoController => _pesoController;

  set pesoController(double peso) {
    _pesoController = peso;
  }

  double get alturaController => _alturaController;

  set alturaController(double altura) {
    _alturaController = altura;
  }

  double get imcResult => _imcResult;

  set imcResult(double imc) {
    _imcResult = imc;
  }
}
