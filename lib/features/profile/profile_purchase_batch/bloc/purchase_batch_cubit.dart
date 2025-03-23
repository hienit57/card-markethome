import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'purchase_batch_state.dart';

class PurchaseBatchCubit extends Cubit<PurchaseBatchState> {
  PurchaseBatchCubit() : super(const PurchaseBatchState());
}
