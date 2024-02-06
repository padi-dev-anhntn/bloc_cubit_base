import 'package:bloc_cubit_base/constants/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'splash_cubit.dart';

class SplashArguments {
  String param;

  SplashArguments({
    required this.param,
  });
}

class SplashPage extends StatelessWidget {
  final SplashArguments? arguments;

  const SplashPage({
    super.key,
    this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SplashCubit();
      },
      child: const SplashChildPage(),
    );
  }
}

class SplashChildPage extends StatefulWidget {
  const SplashChildPage({super.key});

  @override
  State<SplashChildPage> createState() => _SplashChildPageState();
}

class _SplashChildPageState extends State<SplashChildPage> {
  late final SplashCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
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
    return Center(
      child: Column(
        children: [
          const Text('splash'),
          TextButton(
            onPressed: () {
              GoRouter.of(context).goNamed(AppRouter.login);
            },
            child: const Text('go to login page'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
