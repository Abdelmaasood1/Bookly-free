import 'package:bookly/Features/splash_view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewbody(),
    );
  }
}