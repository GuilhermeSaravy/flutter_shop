import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

import 'pages/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.purple,
              centerTitle: true,
              foregroundColor: Colors.white),
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.purple,
              secondary: Colors.deepOrange,
              background: Colors.white),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewPage(),
        routes: {AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage()},
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
