import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quickstart_learn/common/index.dart';
import 'package:flutter_quickstart_learn/pages/welcome.dart';

/// SPLASH PAGE
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int number = 3;
  late Timer _timer; // 使用 Timer 来控制倒计时

  // 倒计时
  void _countdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && number > 0) {
        setState(() {
          number--;
        });
      }
      // 倒计时结束, 进入 Welcome 页面
      if (number == 0) {
        timer.cancel(); // 取消计时器
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const WelcomePage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _countdown();
  }

  @override
  void dispose() {
    _timer.cancel(); // 页面销毁时取消计时器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundSplash,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 图标
              Stack(
                alignment: Alignment.center,
                children: [
                  // 底部
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(120 / 2),
                    ),
                  ),
                  // 图标
                  Image.asset(
                    AssetsImages.logoPng,
                    width: 84,
                    height: 80,
                  ),
                ],
              ),

              // 间距
              const SizedBox(height: 24),

              // 文字
              const Text(
                'Online Market',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // 间距
              const SizedBox(height: 20),

              // 计时器
              Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
