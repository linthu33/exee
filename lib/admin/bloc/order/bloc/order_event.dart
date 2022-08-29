part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {
  const OrderEvent();
}

class Orderloaded extends OrderEvent {
  const Orderloaded();
  List<Object?> get props => [];
}

class OrderEdit extends OrderEvent {
  const OrderEdit();
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class OrderStatusUpdate extends OrderEvent {
  late String orderstatus;

  String get props => orderstatus;
}
