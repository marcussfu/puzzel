import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'package:puzzel/app.dart';
import 'package:puzzel/puzzel_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: PuzzelObserver(),
  );
}
