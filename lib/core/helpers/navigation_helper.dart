import 'package:flutter/material.dart';

import '../dependency_injection/get_it_injection.dart';

class NavHelper {
  Future<dynamic> _navigate(
    String route,
    BuildContext context, {
    bool removeAll = false,
    bool replace = false,
    Function? onResult,
    Object? arguments,
  }) async {
    if (removeAll) {
      var result = await Navigator.pushNamedAndRemoveUntil(
        context,
        route,
        (route) => false,
        arguments: arguments,
      );
      if (onResult != null) onResult(result);
    } else if (replace) {
      var result = await Navigator.pushReplacementNamed(
        context,
        route,
        arguments: arguments,
      );
      if (onResult != null) onResult(result);
    } else {
      var result = await Navigator.pushNamed(
        context,
        route,
        arguments: arguments,
      );
      if (onResult != null) onResult(result);
    }
  }

  void _goBack(context) {
    Navigator.pop(context);
  }
}

navigateTo(
  BuildContext context,
  String route, {
  bool removeAll = false,
  bool replace = false,
  Function? onResult,
  Object? arguments,
}) async {
  getIt<NavHelper>()._navigate(
    route,
    context,
    removeAll: removeAll,
    replace: replace,
    onResult: onResult,
    arguments: arguments,
  );
}

void goBack(context) {
  getIt<NavHelper>()._goBack(context);
}

hideKeyboard(BuildContext context) {
  FocusScopeNode scope = FocusScope.of(context);
  if (!scope.hasPrimaryFocus) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
