class AuthExceptionsMessages {
  static const String MESSAGE_BLANK_FIELDS =
      'Todos os campos devem ser preenchidos';
  static const String MESSAGE_PASSWORD_CONFIRMATION =
      'Senha e confirmação devem ser iguais';
  static const String MESSAGE_BLANK_EMAIL_PASSWORD =
      'E-mail e senha devem ser preenchidos';

  static const String MESSAGE_WRONG_PASSWORD = 'Senha inválida';
  static const String MESSAGE_INVALID_EMAIL = 'E-mail inválido';
  static const String MESSAGE_USER_NOT_FOUND = 'E-mail inválido';
  static const String MESSAGE_WEAK_PASSWORD =
      'Senha deve possuir no mínimo 6 caracteres';
  static const String MESSAGE_EMAIL_ALREADY_IN_USE =
      'Este e-mail já está cadastrado. Cadastre-se com outro e-mail ou faça o Login.';

  static const String MESSAGE_TOO_MANY_REQUESTS =
      'Você tentou efetuar o login muitas vezes. Tente novamente mais tarde.';
  static const String MESSAGE_NETWORK_REQUEST_FAILED =
      'Parece que você está sem internet. Verifique sua conexão e tente novamente';
}
