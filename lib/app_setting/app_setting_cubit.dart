import 'package:bloc_cubit_base/common_widgets/app_colors.dart';
import 'package:bloc_cubit_base/configs/app_configs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState>  {
  AppSettingCubit() : super(const AppSettingState());

  void resetSetting() {
    emit(const AppSettingState());
  }

  void changeThemeMode({required ThemeMode themeMode}) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void changePrimaryColor({required Color primaryColor}) {
    emit(state.copyWith(primaryColor: primaryColor));
  }

  void changeLocal({required Locale locale}) {
    emit(state.copyWith(locale: locale));
  }
}
