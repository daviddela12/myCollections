import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_collections/src/carousel/services/carousel_service.dart';
import 'package:my_collections/src/categories/services/category_service.dart';
import 'package:my_collections/src/elements/services/elements_service.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'my_collections.dart';

void main() async {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    // Inicializar la base de datos para escritorio
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CategoryService()),
      ChangeNotifierProvider(
          create: (context) => ElementsService(
              Provider.of<CategoryService>(context, listen: false))),
      ChangeNotifierProvider(create: (_) => CarouselService()),
    ],
    child: const MyCollections(),
  ));
}
