part of 'order_bloc.dart';

@immutable
abstract class OrderState extends Equatable {
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoadedState extends OrderState {
  final List<Orderproduct> orders;

  OrderLoadedState({required this.orders});
  @override
  List<Object?> get props => [orders];
}

class OrderErrorState extends OrderState {
  final errors;

  OrderErrorState(this.errors);
}
