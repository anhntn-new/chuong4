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
      body: SafeArea(
        child: Consumer<SplashProvider>(
          builder: (context, provider, child) {
            return Container(
              alignment: Alignment.center,
              child: provider.isLoading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          provider.process,
                          style: const TextStyle(
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
                      child: Container(
                        color: Colors.green,
                        height: 30,
                        alignment: Alignment.center,
                        width: 100,
                        child: const Text(
                          'Tap to start',
                          style: TextStyle(color: Colors.black),
                        ),
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
      provider.setIsLoading(true);
      provider.setProcess('CheckLogin');
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
          Navigator.pushNamed(context, RoutePaths.App);
        });
      } else {
        String? session;
        String userName = '';
        Future.delayed(const Duration(seconds: 2), () async {});
        provider.setProcess('Request permission connect database...');
        String? token = '';
        token = await Services.requestToken();

        if (token != null && token != '') {
          provider.setProcess('Login to account ANHNTN');
          String? token2 = await Services.requestToken2(token!);
          if (token2 != null && token2 != '') {
            session = await Services.requestSession(token2!);
            if (session != null && session != '') {
              userName = await Services.getUserInfo(session);
              appProvider.setUserName(userName);
              provider.setProcess('Login to ANHNTN - done');
              Future.delayed(const Duration(seconds: 2), () {
                provider.setIsLoading(false);
                Navigator.pushNamed(context, RoutePaths.App);
              });
            } else {
              provider.setProcess('❌ ERROR request session ');
            }
          } else {
            provider.setProcess('❌ ERROR request token 2');
          }
        }
      }
    } catch (e) {
      print('❌ Login Fail : $e');
    }
  }
}
