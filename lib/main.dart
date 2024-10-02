import 'package:flutter/material.dart';
import 'package:my_collections/src/carousel/services/carousel_service.dart';
import 'package:my_collections/src/categories/services/category_service.dart';
import 'package:provider/provider.dart';

import 'my_collections.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryService()),
        ChangeNotifierProvider(create: (_) => CarouselService()),
      ],
      child: const MyCollections(),
    ));
