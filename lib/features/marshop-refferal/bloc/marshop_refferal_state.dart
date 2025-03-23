part of 'marshop_refferal_cubit.dart';

class MarshopRefferalState extends Equatable {
  const MarshopRefferalState({
    this.onFetchMarshops = FormzSubmissionStatus.initial,
    this.marshops = const [],
    this.error = '',
  });

  final FormzSubmissionStatus onFetchMarshops;
  final List<MarshopModel> marshops;

  final String error;

  MarshopRefferalState copyWith({
    FormzSubmissionStatus? onFetchMarshops,
    List<MarshopModel>? marshops,
    String? error,
  }) {
    return MarshopRefferalState(
      onFetchMarshops: onFetchMarshops ?? this.onFetchMarshops,
      marshops: marshops ?? this.marshops,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        onFetchMarshops,
        marshops,
        error,
      ];
}
