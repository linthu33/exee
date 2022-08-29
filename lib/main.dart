import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/admin/bloc/order/bloc/order_bloc.dart';
import 'package:mystore/admin/bloc/products_bloc.dart';
import 'package:mystore/admin/constants.dart';

import 'package:mystore/admin/services/productrepository.dart';
import 'package:mystore/admin/ui/admin_home.dart';
import 'package:mystore/admin/ui/dashboard/WidgetTree.dart';
import 'package:mystore/cart/bloc/cart_bloc.dart';
import 'package:mystore/cart/service/shopping_repository.dart';
import 'package:mystore/cart/view/cart_page.dart';
import 'package:mystore/catalog/bloc/catalog_bloc.dart';

import 'package:mystore/catalog/service/catalogrepository.dart';
import 'package:mystore/catalog/ui/catalog_page.dart';
import 'package:mystore/category/bloc/category_bloc.dart';
import 'package:mystore/category/service/CategoryRepository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
// This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Medical Store",
        home: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) =>
                      CatalogBloc(catalogRepository: CatalogRepository())
                        ..add(CatalogLoadedApiEvent())),
              BlocProvider(
                  create: (_) =>
                      CategoryBloc(categoryRepository: CategoryRepository())
                        ..add(CategoryLoadedEvent())),
              BlocProvider(
                  create: (_) =>
                      CartBloc(shoppingRepository: ShoppingRepository())
                        ..add(CartStarted())),
              BlocProvider(
                  create: (_) =>
                      ProductsBloc(productRepository: ProductRepository())
                        ..add(const Productloaded())),
              BlocProvider(
                  create: (_) =>
                      OrderBloc(productRepository: ProductRepository())
                        ..add(const Orderloaded())),
            ],
            child: MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Color.fromARGB(255, 235, 240, 236),
                primarySwatch: Colors.blue,
                //canvasColor: Constants.purpleLight,
              ),
              initialRoute: '/',
              routes: {
                '/': (_) => WidgetTree(),
                '/catalog': (_) => CatalogPage(),
                '/cart': (_) => const CartPage(),
              },
            )));
  }
}
