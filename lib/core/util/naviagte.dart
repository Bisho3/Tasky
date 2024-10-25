import 'app_import.dart';

extension Navigate on BuildContext {
  Future<dynamic> pushNamed({required String routeName, Object? arguments}) {
    return Navigator.of(this, rootNavigator: true)
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(
      {required String routeName, Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntil(
      {required String routeName, Object? arguments}) {
    return Navigator.of(this, rootNavigator: true).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
