class TemplateException implements Exception {
  final String msg;

  TemplateException(this.msg);

  @override
  String toString() {
    return 'TemplateError( $msg )';
  }
}
