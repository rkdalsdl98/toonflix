import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toonflix/globalfuncs/System.dart';
import 'package:toonflix/screens/homescreen.dart';
import 'package:toonflix/widgets/login/LoginPage.dart';
import 'package:toonflix/widgets/login/RegistPage.dart';
import '../widgets/global/GlobalAppBar.dart';
import '../widgets/login/DefaultPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Widget showingPage;
  String nowPage = 'default';

  void onChangePage(String identifier) {
    setState(() {
      nowPage = identifier;

      switch (identifier) {
        case 'login':
          showingPage = const LoginPage();
          break;
        case 'regist':
          showingPage = const RegistPage();
          break;
        case 'guest':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(identifier: identifier),
            ),
          );
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    showingPage = DefaultPage(
      onChangePage: onChangePage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (nowPage != 'default') {
            await onBackToHome(context);
          }
          return true;
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/icons/화산귀환.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
            ),
          ),
          child: WillPopScope(
            child: showingPage,
            onWillPop: () async {
              setState(() {});
              if (nowPage == 'default') {
                SystemNavigator.pop();
                return true;
              } else {
                nowPage = 'default';
                showingPage = DefaultPage(onChangePage: onChangePage);
                return false;
              }
            },
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: GlobalAppBar(
          centerTitle: false,
        ),
      ),
    );
  }
}

// 칼럼 부분 위젯으로 분할 관리 필요
