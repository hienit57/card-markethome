import 'package:card_markethome/domain/model/responses/character.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit({
    required Character character,
  }) : super(CharacterDetailsState(character));
}
