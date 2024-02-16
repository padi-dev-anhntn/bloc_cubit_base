import 'package:bloc_cubit_base/app/my_app.dart';
import 'package:bloc_cubit_base/configs/app_configs.dart';
import 'package:bloc_cubit_base/configs/app_env_config.dart';
import 'package:flutter/material.dart';

void main() async {
  AppConfigs.env = Environment.prod;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}