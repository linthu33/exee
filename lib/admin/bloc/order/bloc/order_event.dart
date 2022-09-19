part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {
  const OrderEvent();
}

class Orderloaded extends OrderEvent {
  const Orderloaded();
  List<Object?> get props => [];
}

class OrderEditevent extends OrderEvent {
  const OrderEditevent();
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class OrderStatusUpdateEvent extends OrderEvent {
  //final String orderstatus;
  final String Id;
  final List<Order_DStatus> orderstatus;

  const OrderStatusUpdateEvent({required this.orderstatus, required this.Id});

  String get props => Id;
}
