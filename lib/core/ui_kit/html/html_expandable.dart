import 'package:card_markethome/index.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlExpandable extends StatefulWidget {
  const HtmlExpandable({
    super.key,
    required this.html,
    this.padding = EdgeInsets.zero,
    this.collapsedHeight = 320,
  });

  final String html;
  final EdgeInsetsGeometry padding;
  final double collapsedHeight;

  @override
  State<HtmlExpandable> createState() => _HtmlExpandableState();
}

class _HtmlExpandableState extends State<HtmlExpandable> {
  bool _isExpanded = false;
  bool _showReadMore = true;

  late double _height = widget.collapsedHeight;

  final GlobalKey<State<StatefulWidget>> htmlKey =
      GlobalKey(debugLabel: 'html-key');

  void _toggleExpanded() => setState(
        () {
          _isExpanded = !_isExpanded;
        },
      );

  @override
  Widget build(BuildContext context) => Padding(
        padding: widget.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  height: _isExpanded ? null : _height,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: _MeasuredSize(
                      onChange: (Size size) {
                        if (size.height < widget.collapsedHeight) {
                          setState(() {
                            _isExpanded = true;
                            _showReadMore = false;
                            _height = size.height;
                          });
                        }
                      },
                      child: Column(
                        children: <Widget>[
                          HtmlWidget(
                            widget.html.replaceAll('\n', ''),
                            key: htmlKey,
                          ),
                          if (_showReadMore) ...<Widget>[
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = false;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Ẩn bớt',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                    kSpacingWidth8,
                                    Transform.rotate(
                                      angle: 3.141592653589793,
                                      child: Assets
                                          .lib_assets_icons_ic_chevron_down
                                          .svg(
                                        height: 24,
                                        width: 24,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
                if (!_isExpanded && _showReadMore) ...<Widget>[
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.white.withOpacity(0),
                          Colors.white,
                          Colors.white,
                        ],
                        stops: const <double>[0.0, 0.6, 1.0],
                        tileMode: TileMode.mirror,
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: _toggleExpanded,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Xem thêm',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                          kSpacingWidth8,
                          Assets.lib_assets_icons_ic_chevron_down.svg(
                            height: 24,
                            width: 24,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ],
        ),
      );
}

typedef OnWidgetSizeChange = void Function(Size size);

class _MeasuredSize extends StatefulWidget {
  const _MeasuredSize({
    required this.onChange,
    required this.child,
  });

  final Widget child;
  final OnWidgetSizeChange onChange;

  @override
  State<_MeasuredSize> createState() => _MeasuredSizeState();
}

class _MeasuredSizeState extends State<_MeasuredSize> {
  final GlobalKey<State<StatefulWidget>> widgetKey = GlobalKey();
  Size? oldSize;

  Future<void> postFrameCallback(_) async {
    final BuildContext context = widgetKey.currentContext!;
    await Future<void>.delayed(
        const Duration(milliseconds: 100)); // wait till the image is drawn
    // ignore: use_build_context_synchronously
    final Size newSize = context.size!;
    if (newSize == Size.zero) {
      return;
    }
    if (oldSize == newSize) {
      return;
    }
    oldSize = newSize;
    widget.onChange(newSize);
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}
