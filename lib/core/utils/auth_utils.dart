class AuthUtils {
  static String cpfToEmail(String cpf) {
    final cleanCpf = cpf.replaceAll(RegExp(r'\D'), '');

    return '$cleanCpf@desafio.app';
  }
}