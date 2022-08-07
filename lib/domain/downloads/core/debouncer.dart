import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debouncer {
  final int millseconds;
  VoidCallback? action;
  Timer? timer;

  Debouncer({required this.millseconds});
  run(VoidCallback action) {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: millseconds), action);
  }
}
  