import 'package:flutter/material.dart';

import '../dependency_injection/get_it_injection.dart';


class NavHelper {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigate(Widget page , {bool removeAll = false ,bool replace = false ,Function? onResult })async{
    assert(navigatorKey.currentState != null,
    'Please use NavHelper instance with getIt by =>  getIt<NavHelper>()');
    final route = MaterialPageRoute(builder: (c) => page);
    if(removeAll) {
      var result = await Navigator.pushAndRemoveUntil(navigatorKey.currentState!.context, route, (route) => false);
      if(onResult != null) onResult(result) ;
    }
    else if(replace){
      var result = await Navigator.pushReplacement(navigatorKey.currentState!.context,route);
      if(onResult != null) onResult(result) ;
    }
    else {
      var result = await Navigator.push(navigatorKey.currentState!.context,route);
      if(onResult != null) onResult(result) ;
    }
  }

  void goBack(){
    Navigator.pop(navigatorKey.currentState!.context);
  }

}

navigateTo(Widget page , {bool removeAll = false ,bool replace = false ,Function? onResult })async{
  getIt<NavHelper>().navigate(page,
    removeAll: removeAll,
    replace: replace,
    onResult: onResult,
);
}

void goBack(){
  getIt<NavHelper>().goBack();
}

hideKeyboard(BuildContext context){
  FocusScopeNode scope = FocusScope.of(context);
  if(!scope.hasPrimaryFocus){
    FocusScope.of(context).requestFocus(FocusNode());
  }
}