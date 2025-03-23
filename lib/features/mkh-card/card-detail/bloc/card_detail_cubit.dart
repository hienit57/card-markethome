import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'card_detail_state.dart';

class CardDetailCubit extends Cubit<CardDetailState> {
  CardDetailCubit() : super(const CardDetailState());
}
