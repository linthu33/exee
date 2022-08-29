import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/admin/bloc/order/bloc/order_bloc.dart';
import 'package:mystore/admin/models/orderproductModel.dart';
import 'package:mystore/admin/ui/order/orderdetails.dart';

import '../../constants.dart';

class OrderHome extends StatelessWidget {
  const OrderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalsum = '';
    return Scaffold(
        body: BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
      if (state is OrderInitial) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is OrderLoadedState) {
        //BlocProvider.of<OrderBloc>(context).add(const Productloaded());
        List<Orderproduct> products = state.orders;
        totalsum = state.orders
            .map((s) => s.orderitem!.map((e) => e.totalamount))
            .toString();
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
                          "Order Status",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text("totalsum")),
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

Container _ProductList(Orderproduct product, BuildContext ctx) {
  final ord = product.orderitem!.map(((e) => e.totalamount));
  var sumdata = ord.reduce((a, b) => a! + b!);
  return Container(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        product.barcode.toString(),
        style: TextStyle(color: Colors.white),
      ),
      Text(
        product.barcode.toString(),
        style: TextStyle(color: Colors.white),
      ),
      Text(
        sumdata.toString(),
        style: TextStyle(color: Colors.white),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            ctx,
            MaterialPageRoute(
                builder: (context) => OrderDetails(
                      odlist: product,
                    )),
          );
        },
        child: Text('enter'),
      )
    ]),
  );
}
