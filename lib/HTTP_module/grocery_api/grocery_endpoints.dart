import 'package:shopping_list/HTTP_module/app_info.dart';

enum GroceryAPIEndPoints {
  get,
  post;

  Uri url({required String path, String? base}) {
    final baseUrl = base ?? AppInfo.appBaseURL;
    switch (this) {
      case GroceryAPIEndPoints.get:
        return Uri.https(baseUrl, path);
      case GroceryAPIEndPoints.post:
        return Uri.https(baseUrl, path);
    }
  }
}
