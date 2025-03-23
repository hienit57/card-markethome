import 'package:card_markethome/features/index.dart';
import 'package:card_markethome/index.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  ValueNotifier<int> selectedTab = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        selectedTab.value = _tabController.index;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorF0F9FF,
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          ActivityPage(),
          NotificationsPage(),
          ProfileOverviewPage(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.colorE8E8E8,
          ),
          ValueListenableBuilder<int>(
            valueListenable: selectedTab,
            builder: (context, value, _) {
              return TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicator: const BoxDecoration(),
                  tabs: TabsEnum.values.asMap().entries.map((tab) {
                    final indexItem = tab.key;

                    final item = TabsEnum.values[indexItem];

                    return TabWidget(
                      isSelected: item.indexTab == value,
                      tabEnum: item,
                    );
                  }).toList());
            },
          ),
        ],
      ),
    );
  }
}
