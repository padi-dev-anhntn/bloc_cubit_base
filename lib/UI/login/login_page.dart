import 'package:bloc_cubit_base/app_setting/app_setting_cubit.dart';
import 'package:bloc_cubit_base/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'login_cubit.dart';

class LoginArguments {
  String param;

  LoginArguments({
    required this.param,
  });
}

class LoginPage extends StatelessWidget {
  final LoginArguments? arguments;

  const LoginPage({
    super.key,
    this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginCubit();
      },
      child: const LoginChildPage(),
    );
  }
}

class LoginChildPage extends StatefulWidget {
  const LoginChildPage({super.key});

  @override
  State<LoginChildPage> createState() => _LoginChildPageState();
}

class _LoginChildPageState extends State<LoginChildPage> {
  late final LoginCubit _cubit;
  late AppSettingCubit _appSettingCubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
    _appSettingCubit = BlocProvider.of<AppSettingCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<AppSettingCubit, AppSettingState>(
      buildWhen: (prev, current) {
        print("before: ${prev.themeMode} - ${prev.locale}");
        print("after: ${current.themeMode} - ${current.locale}");
        return prev.themeMode != current.themeMode ||
            (prev.locale != current.locale);
      },
      builder: (context, state) {
        return Column(
          children: [
            const Text('loginpage'),
            Column(
              children: [
                const Text('Theme'),
                RadioListTile(
                  title: const Text('Theme of system'),
                  value: ThemeMode.system,
                  groupValue: state.themeMode,
                  onChanged: (ThemeMode? value) {
                    if (value != null) {
                      _appSettingCubit.changeThemeMode(themeMode: value);
                    }
                  },
                ),
                RadioListTile(
                  title: const Text('Light'),
                  value: ThemeMode.light,
                  groupValue: state.themeMode,
                  onChanged: (ThemeMode? value) {
                    if (value != null) {
                      _appSettingCubit.changeThemeMode(themeMode: value);
                    }
                  },
                ),
                RadioListTile(
                  title: const Text('Dark'),
                  value: ThemeMode.dark,
                  groupValue: state.themeMode,
                  onChanged: (ThemeMode? value) {
                    if (value != null) {
                      _appSettingCubit.changeThemeMode(themeMode: value);
                    }
                  },
                ),
              ],
            ),
            Column(
              children: [
                const Text('Language'),
                Text(AppLocalizations.of(context)!.getStarted),
                RadioListTile(
                  title: const Text('En'),
                  value: AppConfigs.localEn,
                  groupValue: state.locale,
                  onChanged: (Locale? value) {
                    if (value != null) {
                      _appSettingCubit.changeLocal(locale: value);
                    }
                  },
                ),
                RadioListTile(
                  title: const Text('vi'),
                  value: AppConfigs.defaultLocal,
                  groupValue: state.locale,
                  onChanged: (Locale? value) {
                    if (value != null) {
                      _appSettingCubit.changeLocal(locale: value);
                    }
                  },
                ),
                RadioListTile(
                  title: const Text('Ja'),
                  value: AppConfigs.localJa,
                  groupValue: state.locale,
                  onChanged: (Locale? value) {
                    if (value != null) {
                      _appSettingCubit.changeLocal(locale: value);
                    }
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
