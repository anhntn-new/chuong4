import 'package:chuong4/unit_5/config/custom_router.dart';
import 'package:chuong4/unit_5/config/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePaths.Splash,
      onGenerateRoute: CustomRouter.onGenerateRoute,
      // routes: {
      //   '/': (context) => const MyHomePage(),
      //   // '/home': (context) => const Home(),
      //   '/detail': (context) => const DetailPage(),
      // },
    );
  }
}
