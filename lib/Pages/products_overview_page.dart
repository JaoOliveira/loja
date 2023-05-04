import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/bedgee.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

import '../components/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class productsOverviewPage extends StatelessWidget {
  productsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<productList>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Minha Loja'),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Somente Favoritos"),
                      value: FilterOptions.Favorite,
                    ),
                    PopupMenuItem(
                      child: Text("Todos"),
                      value: FilterOptions.All,
                    ),
                  ],
              onSelected: (FilterOptions selectValue) {
                if (selectValue == FilterOptions.Favorite) {
                  provider.showFavoriteOnly();
                } else {
                  provider.showAll();
                }
              }),
          Consumer<cart>(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
                icon: Icon(Icons.shopping_cart)),
            builder: (context, Cart, child) => bedgee(
              value: Cart.itemsCount().toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: ProductGrid(),
      drawer: AppDrawer(),
    );
  }
}
