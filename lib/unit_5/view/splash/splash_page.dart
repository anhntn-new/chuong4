import 'package:chuong4/unit_5/app_provider.dart';
import 'package:chuong4/unit_5/config/route_paths.dart';
import 'package:chuong4/unit_5/database/shared_preference.dart';
import 'package:chuong4/unit_5/services/services.dart';
import 'package:chuong4/unit_5/view/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  bool isLoading = false;
  String? token;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      body: Center(
        child: Consumer<SplashProvider>(
          builder: (context, provider, child) {
            return Container(
              color: Colors.green,
              height: 40,
              width: 100,
              child: provider.isLoading
                  ? Column(
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          provider.process,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  : InkWell(
                      onTap: () async {
                        login(provider, appProvider);
                      },
                      child: Text(
                        'Tap to start',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }

  void login(SplashProvider provider, AppProvider appProvider) async {
    try {
      provider.setProcess('CheckLogin');
      // Future.delayed(const Duration(seconds: 2), () async {
      //   bool isLogin = await Services.checkLogin();
      // });
      bool isLogin = await Services.checkLogin();
      if (isLogin == true) {
        Future.delayed(const Duration(seconds: 1), () async {
          provider.setProcess('Already login');
        });

        String? session = await SharedPreference.getSession();

        provider.setProcess('Get user info ....');
        String userName = '';
        Future.delayed(const Duration(seconds: 2), () async {
          userName = await Services.getUserInfo(session ?? '');
          appProvider.setUserName(userName);
          provider.setProcess('Get user info --- done');
        });
        Future.delayed(const Duration(seconds: 1), () {
          provider.setIsLoading(false);
          Navigator.pushReplacementNamed(context, RoutePaths.App);
        });
      } else {
        String? session;
        String userName = '';
        Future.delayed(const Duration(seconds: 1), () async {
          provider.setProcess('Not login');
        });
        provider.setProcess('Request permission connect database...');
        String? token = '';
        Future.delayed(const Duration(seconds: 2), () async {
          token = await Services.requestToken();
        });

        if (token != null && token != '') {
          provider.setProcess('Login to account ANHNTN');
          String? token2 = '';
          Future.delayed(const Duration(seconds: 1), () async {
            token2 = await Services.requestToken2(token!);
          });
          if (token2 != null && token2 != '') {
            session = await Services.requestSession(token2!);
            if (session != null && session != '') {
              userName = await Services.getUserInfo(session);
              appProvider.setUserName(userName);
              provider.setProcess('Had login to ANHNTN');
              Future.delayed(
                const Duration(milliseconds: 2000),
                () {
                  provider.setIsLoading(false);
                  Navigator.pushReplacementNamed(context, RoutePaths.App);
                },
              );
            }
          }
        }
      }
    } catch (e) {
      print('❌ Login Fail : $e');
    }
  }
}
