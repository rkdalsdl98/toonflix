import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toonflix/globalfuncs/System.dart';
import 'package:toonflix/screens/homescreen.dart';
import 'package:toonflix/service/UserService.dart';
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

  Future<void> initData() async {
    showingPage = DefaultPage(
      onChangePage: onChangePage,
    );
    final isLogined = await UserService.getLogined();

    if (isLogined == null) {
      await UserService.setLogined(false);
    } else if (isLogined) {
      final now = DateTime.now();
      final day = now.day;

      final lastLoginedday = await UserService.getStorageIntData('day');

      if (lastLoginedday != day) {
        await UserService.resetYesterDayData(day);
      }

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(identifier: 'login'),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (nowPage != 'default') {
            bool result = false;
            await alertMessageYesOrNo(
                '로그인 화면으로 돌아 가시겠습니까?\n(계정은 자동으로 로그아웃 됩니다.)',
                context,
                (state) => result = state);
            return result;
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
          showRefreshButtion: false,
        ),
      ),
    );
  }
}

// 칼럼 부분 위젯으로 분할 관리 필요
