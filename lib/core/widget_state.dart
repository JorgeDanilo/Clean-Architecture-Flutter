import 'package:clean_architecture/core/bloc.dart';
import 'package:clean_architecture/di/di.dart';
import 'package:flutter/cupertino.dart';

abstract class WidgetState<T extends StatefulWidget, B extends Bloc> extends State<T> {

  B bloc;

  WidgetState() {
    bloc = getIt<B>();
  }

  @override
  void dispose() {
    bloc.onDispose();
    super.dispose();
  }
}