import 'package:flutter/material.dart';
import 'package:mystore/admin/models/orderproductModel.dart';
import 'package:mystore/admin/ui/dashboard/WidgetTree.dart';
import 'package:mystore/admin/ui/enum.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key, required this.odlist}) : super(key: key);
  final Orderproduct? odlist;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late bool _activeshipping = true;
  late bool _activepaymnet = true;
  late bool _activeorder = true;
  late String dropdownvalue = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 20.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WidgetTree()));
            },
          ),
          centerTitle: true,
          title: const Text('Order Details')),
      body: Column(children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              if (index == 0) {
                _activeshipping = !_activeshipping;
              } else if (index == 1) {
                _activepaymnet = !_activepaymnet;
              } else {
                _activeorder = !_activeorder;
              }
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  title: Text('Shipping Address'),
                );
              },
              body: Column(
                children: [
                  Text(widget.odlist!.shippingaddress!.fullName.toString()),
                  Text(widget.odlist!.shippingaddress!.country.toString()),
                  Text(widget.odlist!.shippingaddress!.city.toString()),
                  Text(widget.odlist!.shippingaddress!.address.toString()),
                  Text(widget.odlist!.shippingaddress!.phone.toString())
                ],
              ),
              isExpanded: _activeshipping,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  title: Text(
                    'Payment Status',
                  ),
                );
              },
              body: Column(
                children: [
                  Text(widget.odlist!.paymentmethod.toString()),
                  Text(widget.odlist!.paymentstatus.toString()),
                ],
              ),
              isExpanded: _activepaymnet,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  title: Text(
                    'Order List Status',
                  ),
                );
              },
              body: Column(
                children: [_orderlist(widget.odlist!.orderitem!)],
              ),
              isExpanded: _activeorder,
            ),
          ],
        ),
        DropdownButton(
            value: dropdownvalue,
            style: const TextStyle(height: 1.5),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: OrderStatus.values.map((OrderStatus classType) {
              return DropdownMenuItem(
                  value: classType.name.toString(),
                  child: Text(classType.name.toString()));
            }).toList(),
            onChanged: (value) {
              setState(() {
                dropdownvalue = value.toString();
              });
            }),
        ElevatedButton(onPressed: () {}, child: const Text('Comfirm Stats'))
      ]),
    );
  }
}

Card _orderlist(List<Orderitem> orderitem) {
  return Card(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: orderitem.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(orderitem[index].buyprice.toString()),
              Text(orderitem[index].sellprice.toString()),
              Text(orderitem[index].totalamount.toString())
            ],
          );
        }),
  );
}
