import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'card_overview_state.dart';

class CardOverviewCubit extends Cubit<CardOverviewState> {
  CardOverviewCubit() : super(const CardOverviewState());
}
