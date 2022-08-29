import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mystore/admin/models/orderproductModel.dart';

import '../../../services/productrepository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ProductRepository productRepository;
  OrderBloc({required this.productRepository}) : super(OrderInitial()) {
    on<Orderloaded>(_onLoadedOrder);
  }
  void _onLoadedOrder(Orderloaded event, Emitter<OrderState> emit) async {
    final res = await productRepository.GetOrder();
    emit(OrderLoadedState(orders: res));
  }
}
