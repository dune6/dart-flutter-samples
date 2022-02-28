import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class ExampleWidgetModel extends ChangeNotifier {
  void readFile() async {
    // for files with user should to know
    // pathProvider.getApplicationDocumentsDirectory()

    // For helping files
    // pathProvider.getApplicationSupportDirectory()

    // cache
    // pathProvider.getTemporaryDirectory();

    // downloads for android
    // pathProvider.getDownloadsDirectory()

    // iOS only for tech information for app
    // pathProvider.getLibraryDirectory()

    // externals - for SD cards

    final directory = await pathProvider.getApplicationDocumentsDirectory();
    final filePath = directory.path + '/my_file.txt';
    final file = File(filePath);
    await file.writeAsString('Hello, world!');
    print(await file.readAsString());
    // file.stat() - for statistics
  }
}