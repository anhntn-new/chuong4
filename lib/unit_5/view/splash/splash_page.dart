import 'package:chuong4/unit_5/config/route_paths.dart';
import 'package:chuong4/unit_5/database/shared_preference.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to home page.
      Navigator.pushReplacementNamed(context, RoutePaths.App);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void init() async {
    setState(() {
      isLoading = true;
    });
    bool isLogin = await checkLogin();
    setState(() {
      isLoading = false;
    });
    if (isLogin == true) {
    } else {}
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, RoutePaths.App);
    });
  }

  Future<bool> checkLogin() async {
    String? token = await SharedPreference.getToken();
    if ((token != null) && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
