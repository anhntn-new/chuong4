import 'package:chuong4/unit_5/config/route_paths.dart';
import 'package:chuong4/unit_5/database/shared_preference.dart';
import 'package:chuong4/unit_5/services/services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  String? token;
  @override
  void initState() {
    init();
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
    try {
      bool isLogin = await Services.checkLogin();
      if (isLogin == true) {
        String? session = await SharedPreference.getSession();
        String userName = await Services.getUserInfo(session ?? '');

        Future.delayed(
          const Duration(milliseconds: 1000),
          () {
            Navigator.pushReplacementNamed(context, RoutePaths.App,
                arguments: {'userName': userName});
          },
        );
      } else {
        String? session;
        String userName = '';
        String? token = await Services.requestToken();
        if (token != null && token != '') {
          String? token2 = await Services.requestToken2(token);
          if (token2 != null && token2 != '') {
            session = await Services.requestSession(token2);
            if (session != null && session != '') {
              userName = await Services.getUserInfo(session ?? '');
              Future.delayed(const Duration(milliseconds: 3000), () {
                setState(() {
                  isLoading = false;
                });
                Navigator.pushReplacementNamed(context, RoutePaths.App,
                    arguments: {'userName': userName});
              });
            }
          }
        }
      }
    } catch (e) {
      print('❌ Login Fail : $e');
    }
  }
}
