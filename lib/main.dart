import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Pages/order_page.dart';
import 'package:shop/Pages/product_detail_page.dart';
import 'package:shop/Pages/products_overview_page.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

import 'Pages/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => productList(),
        ),
        ChangeNotifierProvider(
          create: (_) => cart(),
        ),
        ChangeNotifierProvider(create: (_) => OrderList())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Lato',
            primarySwatch: Colors.purple,
            colorScheme: ColorScheme.fromSwatch(accentColor: Colors.red)),
        //home: productsOverviewPage(),
        routes: {
          AppRoutes.HOME: (context) => productsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailPage(),
          AppRoutes.CART: (context) => cartPage(),
          AppRoutes.ORDER: (context) => OrderPage()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
