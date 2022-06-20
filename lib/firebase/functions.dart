import 'package:cloud_functions/cloud_functions.dart';

class Functions {
  static Future<HttpsCallableResult<T>> call<T>(
      String functionName, dynamic arguments) async {
    return await FirebaseFunctions.instance
        .httpsCallable(functionName)
        .call<T>(arguments);
  }
}
