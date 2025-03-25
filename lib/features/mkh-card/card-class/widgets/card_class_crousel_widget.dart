import 'package:card_markethome/index.dart';

class CardClassCarouselWidget extends StatefulWidget {
  const CardClassCarouselWidget({super.key, required this.cardRanks});

  final List<CardRankModel>? cardRanks;

  @override
  State<CardClassCarouselWidget> createState() =>
      CardClassCarouselWidgetState();
}

class CardClassCarouselWidgetState extends State<CardClassCarouselWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.42);
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(1000);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _pageController.hasClients) {
        _pageController.jumpToPage(_currentPage.value);
      }
    });

    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage.value++;
        _pageController.animateToPage(
          _currentPage.value,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24, bottom: 4),
          child: AppImage(
            assetImage: Assets.lib_assets_images_img_home_nav_card_class,
          ),
        ),
        Stack(
          children: [
            SizedBox(
              height: 309,
              width: context.maxWidth,
              child: const AppImage(
                assetImage: Assets.lib_assets_images_img_bg_card,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: (() {
                if (widget.cardRanks?.isNotEmpty ?? false) {
                  return SizedBox(
                    height: 239,
                    child: ValueListenableBuilder<int>(
                      valueListenable: _currentPage,
                      builder: (context, currentIndex, _) {
                        return PageView.builder(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final carouselItems = widget.cardRanks!;
                            final totalItems = carouselItems.length;

                            int realIndex = index % totalItems;
                            bool isFocused =
                                realIndex == currentIndex % totalItems;

                            return TweenAnimationBuilder(
                              duration: const Duration(milliseconds: 300),
                              tween: Tween<double>(
                                  begin: isFocused ? 0.9 : 0.7,
                                  end: isFocused ? 1.0 : 0.8),
                              builder: (context, scale, child) {
                                return Transform.scale(
                                  scale: scale,
                                  child: CardClassItemWidget(
                                    item: carouselItems[realIndex],
                                    isFocused: isFocused,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              }()),
            ),
          ],
        ),
      ],
    );
  }
}
