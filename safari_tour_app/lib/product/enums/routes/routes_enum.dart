enum RouteEnum {
  splash('splash'),
  launch('launch'),
  login('login'),
  register('register'),
  home('home');

  const RouteEnum(this.value);
  final String value;

  String get withSlash => '/$value';
  String get withQuestionMark => '?$value=';
  String get withDot => '.$name';
}
