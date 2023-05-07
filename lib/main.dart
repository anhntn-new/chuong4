import 'package:chuong4/unit_5/app_provider.dart';
import 'package:chuong4/unit_5/config/custom_router.dart';
import 'package:chuong4/unit_5/config/route_paths.dart';
import 'package:chuong4/unit_5/view/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const SplashScreen(),
        initialRoute: RoutePaths.Splash,
        onGenerateRoute: CustomRouter.onGenerateRoute,
      ),
    );
  }
}
