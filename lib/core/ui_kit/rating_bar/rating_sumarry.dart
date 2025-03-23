import 'package:card_markethome/index.dart';
import 'rating_bar.dart';

/// A widget that displays a summary of a rating.
///
/// Example:
///
/// ```dart
/// RatingSummary(
///   counter: 13,
///   average: 3.846,
///   counterFiveStars: 5,
///   counterFourStars: 4,
///   counterThreeStars: 2,
///   counterTwoStars: 1,
///   counterOneStars: 1,
/// )
/// ```
class RatingSummary extends StatelessWidget {
  const RatingSummary({
    super.key,
    required this.counter,
    this.average = 0.0,
    this.showAverage = true,
    this.averageStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    this.counterFiveStars = 0,
    this.counterFourStars = 0,
    this.counterThreeStars = 0,
    this.counterTwoStars = 0,
    this.counterOneStars = 0,
    this.labelCounterFiveStars = '5',
    this.labelCounterFourStars = '4',
    this.labelCounterThreeStars = '3',
    this.labelCounterTwoStars = '2',
    this.labelCounterOneStars = '1',
    this.labelCounterFiveStarsStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    this.labelCounterFourStarsStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    this.labelCounterThreeStarsStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    this.labelCounterTwoStarsStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    this.labelCounterOneStarsStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    this.label = 'Đánh giá',
    this.labelStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.neutral500,
    ),
    this.color = AppColors.black,
    this.backgroundColor = const Color(0xFFEEEEEE),
  });

  /// The total number of ratings.
  ///
  /// This is the number of ratings that will be displayed in the [label].
  final int counter;

  /// The average rating.
  ///
  /// This is the average rating that will be displayed when [showAverage] is true.
  /// You can use the [averageStyle] to customize the look of the average rating.
  /// The default value is 0.0.
  /// This value will NOT be calculated from the given parameters.
  final double average;

  /// Whether to show the average rating.
  ///
  /// If true, the average rating will be displayed. If not specified, the default value is true.
  final bool showAverage;

  /// The style of the [average] rating.
  ///
  /// You can use this to customize the look of it.
  /// The default value is a bold font size of 40.
  final TextStyle averageStyle;

  /// The number of ratings with 5 stars.
  ///
  /// This is the number of ratings with 5 stars that will be displayed in the [_ReviewBar].
  /// The default value is 0.
  final int counterFiveStars;

  /// The number of ratings with 4 stars.
  ///
  /// This is the number of ratings with 4 stars that will be displayed in the [_ReviewBar].
  /// The default value is 0.
  final int counterFourStars;

  /// The number of ratings with 3 stars.
  ///
  /// This is the number of ratings with 3 stars that will be displayed in the [_ReviewBar].
  /// The default value is 0.
  final int counterThreeStars;

  /// The number of ratings with 2 stars.
  ///
  /// This is the number of ratings with 2 stars that will be displayed in the [_ReviewBar].
  /// The default value is 0.
  final int counterTwoStars;

  /// The number of ratings with 1 stars.
  ///
  /// This is the number of ratings with 1 stars that will be displayed in the [_ReviewBar].
  final int counterOneStars;

  /// The label of the [counterFiveStars].
  ///
  /// It will be displayed left of the [_ReviewBar] with 5 stars. The default value is '5'.
  final String labelCounterFiveStars;

  /// The label of the [counterFourStars].
  ///
  /// It will be displayed left of the [_ReviewBar] with 4 stars. The default value is '4'.
  final String labelCounterFourStars;

  /// The label of the [counterThreeStars].
  ///
  /// It will be displayed left of the [_ReviewBar] with 3 stars. The default value is '3'.
  final String labelCounterThreeStars;

  /// The label of the [counterTwoStars].
  ///
  /// It will be displayed left of the [_ReviewBar] with 2 stars. The default value is '2'.
  final String labelCounterTwoStars;

  /// The label of the [counterOneStars].
  ///
  /// It will be displayed left of the [_ReviewBar] with 1 stars. The default value is '1'.
  final String labelCounterOneStars;

  /// The style of the [labelCounterFiveStars].
  ///
  /// You can use this to customize the look of it. The default value is a bold font size of 14.
  final TextStyle labelCounterFiveStarsStyle;

  /// The style of the [labelCounterFourStars].
  ///
  /// You can use this to customize the look of it. The default value is a bold font size of 14.
  final TextStyle labelCounterFourStarsStyle;

  /// The style of the [labelCounterThreeStars].
  ///
  /// You can use this to customize the look of it. The default value is a bold font size of 14.
  final TextStyle labelCounterThreeStarsStyle;

  /// The style of the [labelCounterTwoStars].
  ///
  /// You can use this to customize the look of it. The default value is a bold font size of 14.
  final TextStyle labelCounterTwoStarsStyle;

  /// The style of the [labelCounterOneStars].
  ///
  /// You can use this to customize the look of it. The default value is a bold font size of 14.
  final TextStyle labelCounterOneStarsStyle;

  /// The label of the [counter]
  ///
  /// It will be displayed below the [average] counter with stars. It only appears when [showAverage] is true.
  final String label;

  /// The style of the [label].
  ///
  /// You can use this to customize the look of it. The default value is a semi-bold font.
  final TextStyle labelStyle;

  /// The color of the stars and the horizontal bar [_ReviewBar].
  ///
  /// The default value is Colors.amber.
  final Color color;

  /// The color of the unused stars and the background of the horizontal bar [_ReviewBar].
  ///
  /// The default value is Color(0xFFEEEEEE).
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (showAverage)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(average.toStringAsFixed(1), style: averageStyle),
                CustomRatingBar(
                  initialRating: average,
                  itemSize: 16,
                  onRatingUpdate: (double value) {},
                ),
                const SizedBox(height: 10),
                Text(
                  '$counter $label',
                  style: labelStyle,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          kSpacingWidth22,
          const SizedBox(
            height: 96,
            child: VerticalDivider(
              width: 1,
              indent: 0,
              endIndent: 0,
              thickness: 1,
              color: AppColors.neutral200,
            ),
          ),
          kSpacingWidth22,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _ReviewBar(
                  initialRating: 5,
                  value: counterFiveStars / counter,
                  color: color,
                  backgroundColor: backgroundColor,
                ),
                _ReviewBar(
                  initialRating: 4,
                  value: counterFourStars / counter,
                  color: color,
                  backgroundColor: backgroundColor,
                ),
                _ReviewBar(
                  initialRating: 3,
                  value: counterThreeStars / counter,
                  color: color,
                  backgroundColor: backgroundColor,
                ),
                _ReviewBar(
                  initialRating: 2,
                  value: counterTwoStars / counter,
                  color: color,
                  backgroundColor: backgroundColor,
                ),
                _ReviewBar(
                  initialRating: 1,
                  value: counterOneStars / counter,
                  color: color,
                  backgroundColor: backgroundColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A widget that displays a horizontal bar with a label.
///
/// Example:
/// ```dart
///  _ReviewBar(
///    label: "5",
///    value: counterFiveStars / counter,
///    color: color,
///    secondaryColor: secondaryColor,
///  )
/// ```
class _ReviewBar extends StatelessWidget {
  const _ReviewBar({
    required this.initialRating,
    required this.value,
    this.color = Colors.amber,
    this.backgroundColor = const Color(0xFFEEEEEE),
  });

  /// The rating of the bar.
  ///
  /// It will be displayed on the left side of the bar.
  final double initialRating;

  /// The progress value of the bar.
  ///
  /// It must be between 0.0 and 1.0.
  final double value;

  /// The color of the bar.
  ///
  /// The default value is Colors.amber.
  final Color color;

  /// The backgroundcolor of the bar.
  ///
  /// The default value is Color(0xFFEEEEEE).
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomRatingBar(
            initialRating: initialRating,
            itemSize: 16,
            onRatingUpdate: (double value) {},
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 4,
                child: LinearProgressIndicator(
                  value: value,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  backgroundColor: backgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
