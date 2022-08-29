import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/admin/bloc/products_bloc.dart';
import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:mystore/admin/ui/edittesttwo.dart';

import 'package:mystore/admin/ui/wizard.dart';

import '../constants.dart';

class ProductListHome extends StatelessWidget {
  const ProductListHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      if (state is ProductsLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProductsLoadedState) {
        BlocProvider.of<ProductsBloc>(context).add(const Productloaded());
        List<ProductsModel> products = state.products;
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    left: Constants.kPadding / 2),
                child: Card(
                  color: Constants.purpleLight,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: const ListTile(
                      //leading: Icon(Icons.sell),
                      title: Text(
                        "Products Available",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "82% of Products Avail.",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Chip(
                        label: Text(
                          "20,500",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //BarChartSample2(),
              Padding(
                padding: const EdgeInsets.only(
                    top: Constants.kPadding,
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    bottom: Constants.kPadding),
                child: Card(
                  color: Constants.purpleLight,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _ProductList(products[index], context);
                      }),
                ),
              ),
            ],
          ),
        );
      }
      return const Center(
        child: Text('Something went wrong!'),
      );
    }));
  }
}

Container _ProductList(ProductsModel product, BuildContext ctx) {
  return Container(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        product.color.toString(),
        style: TextStyle(color: Colors.white),
      ),
      Text(
        product.title.toString(),
        style: TextStyle(color: Colors.white),
      ),
      Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    ctx,
                    MaterialPageRoute(
                        builder: (context) => EditTestTwo(
                              prodedit: product,
                            )));
              },
              icon: const Icon(
                Icons.add_task,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                ctx
                    .read<ProductsBloc>()
                    .add(ProductDelete(productid: product.Id.toString()));
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.white,
              ))
        ],
      )
    ]),
  );
}
