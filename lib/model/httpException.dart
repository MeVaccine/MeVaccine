class HttpException implements Exception {
  final String message;
  final String _messageTH;
  HttpException(this.message, [this._messageTH = ""]);

  String toString() {
    return message;
  }

  String get messageEN => this.message;
  String get messageTH => this._messageTH;
}
