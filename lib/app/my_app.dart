import 'package:bloc_cubit_base/app/app_cubit.dart';
import 'package:bloc_cubit_base/app_setting/app_setting_cubit.dart';
import 'package:bloc_cubit_base/common_widgets/app_themes.dart';
import 'package:bloc_cubit_base/configs/app_configs.dart';
import 'package:bloc_cubit_base/constants/route_config.dart';
import 'package:bloc_cubit_base/repositories/auth_repository.dart';
import 'package:bloc_cubit_base/repositories/notify_repository.dart';
import 'package:bloc_cubit_base/repositories/user_repository.dart';
import 'package:bloc_cubit_base/services/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late GraphQLService _graphQLService;

  @override
  void initState() {
    _graphQLService = GraphQLService();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Setup PortraitUp only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (context) {
          return AuthRepository(graphQLService: _graphQLService);
        }),
        RepositoryProvider<UserRepository>(create: (context) {
          return UserRepository(graphQLService: _graphQLService);
        }),
        RepositoryProvider<NotificationRepository>(create: (context) {
          return NotificationRepository(graphQLService: _graphQLService);
        }),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(create: (context) {
            final userRepo = RepositoryProvider.of<UserRepository>(context);
            final authRepo = RepositoryProvider.of<AuthRepository>(context);
            return AppCubit(
              userRepo: userRepo,
              authRepo: authRepo,
            );
          }),
          BlocProvider<AppSettingCubit>(create: (context) {
            return AppSettingCubit();
          }),
        ],
        child: BlocBuilder<AppSettingCubit, AppSettingState>(
          builder: (context, state) {
            bool isDarkMode = context.read<AppSettingCubit>().state.themeMode == ThemeMode.dark;
            return GestureDetector(
              onTap: () {
                _hideKeyboard(context);
              },
              child: MaterialApp.router(
                title: AppConfigs.appName,
                theme: AppThemes(
                  isDarkMode: isDarkMode,
                  primaryColor: state.primaryColor,
                ).theme,
                themeMode: state.themeMode,
                routerConfig: AppRouter.router,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                locale: state.locale,
                supportedLocales: AppLocalizations.supportedLocales,
              ),
            );
          },
        ),
      ),
    );
  }

  void _hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
