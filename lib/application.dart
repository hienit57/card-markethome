import 'package:card_markethome/data/card_impl.dart';
import 'package:card_markethome/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/setting/middle_ware_setting.dart';
import 'main.dart';

EventBus eventBus = EventBus();

class MarketHomeApplication extends StatelessWidget {
  MarketHomeApplication({
    super.key,
    required MiddleWareSetting settingConfig,
  }) {
    AppConfigSingleton.appSetting = settingConfig;
    _listenCallBack(settingConfig);
    _initFlavor(settingConfig.flavor);
  }

  void _listenCallBack(MiddleWareSetting settingConfig) {
    eventBus.on<String>().listen((event) {
      AppConfigSingleton.appSetting?.onCallBack({
        'type': event,
      });
    });
  }

  void _initFlavor(String flavor) async {
    WidgetsFlutterBinding.ensureInitialized();
    Routes.configureRoutes(Navigation.shared.getRouter);
    flavorSettings = await getFlavorSettings(flavor);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
            value: UserProfileUsecase(repository: UserProfileRepositoryImpl())),
        RepositoryProvider.value(
            value: CharacterUseCase(repository: CharacterRepositoryImpl())),
        RepositoryProvider.value(
            value: CardUsecase(repository: CardRepositoryImpl())),
        RepositoryProvider.value(
            value: AddressSelectorUsecase(
                repository: AddressSelectorRepositoryImpl())),
        RepositoryProvider.value(
            value: GlobalConfigByKeyUsecase(
                repository: GlobalConfigByKeyRepositoryImpl())),
        RepositoryProvider.value(
            value: MarshopUsecase(repository: MarshopRepositoryImpl())),
        RepositoryProvider.value(
            value: CardUsecase(repository: CardRepositoryImpl())),
        RepositoryProvider.value(
            value: RicebookUsecase(repository: RicebookRepositoryImpl())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Navigation.shared.getKey,
        onGenerateRoute: Navigation.shared.getRouter.generator,
        navigatorObservers: [Navigation.shared.observer],
        theme: theme.getTheme(Brightness.light),
        darkTheme: theme.getTheme(Brightness.dark),
        title: 'Card-MarketHome',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
