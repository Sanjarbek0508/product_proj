class AppResponse {
  bool success;
  String? message;
  dynamic data;

  AppResponse({this.data, this.message, required this.success});
}
