import 'package:flutter/material.dart';
import 'package:hyperhire_client/di/di.dart';
import 'package:hyperhire_client/presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _appRouter.config());
  }
}
