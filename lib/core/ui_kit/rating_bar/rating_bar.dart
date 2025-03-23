import 'package:card_markethome/index.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.initialRating,
    this.itemSize = 24,
    this.readOnly = false,
    required this.onRatingUpdate,
  }) : assert(initialRating >= 1 && initialRating <= 5,
            'initialRating must be between 1 and 5');

  final double initialRating;
  final double itemSize;
  final bool readOnly;

  final void Function(double) onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      maxRating: 5.0,
      minRating: 1.0,
      initialRating: initialRating,
      ratingWidget: RatingWidget(
        full: Assets.lib_assets_icons_ic_rating_start.svg(),
        half: Assets.lib_assets_icons_ic_star_half.svg(),
        empty: Assets.lib_assets_icons_ic_star_empty.svg(),
      ),
      itemSize: itemSize,
      ignoreGestures: readOnly,
      onRatingUpdate: onRatingUpdate,
      allowHalfRating: true,
    );
  }
}
