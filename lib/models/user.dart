class User {
  String login;
  String nome;
  String email;
  String token;
  List<String> roles;

  User.fromJson(Map<String, dynamic> map)
      : nome = map['nome'],
        email = map['email'],
        login = map['login'],
        token = map['token'],
        roles = map['roles'] != null
            ? map['roles'].map<String>((r) => r.toString()).toList()
            : null;

  @override
  String toString() {
    return 'User{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }
}
