 import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class Simpleblocobservier extends BlocObserver {
  @override
  // void onEvent(Bloc bloc, Object? event) {
  //   super.onEvent(bloc, event);
  //   // TODO: implement onEvent
  // }

  @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   // TODO: implement onError
  //   super.onError(bloc, error, stackTrace);
  // }
void onClose(BlocBase bloc) {
    debugPrint("close$bloc");

    // TODO: implement onClose
    super.onClose(bloc);
  }
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    debugPrint("create$bloc");

    super.onCreate(bloc);
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("change$change");
    super.onChange(bloc, change);
    
    // TODO: implement onChange
  }
  

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   // TODO: implement onChange
  // }
}