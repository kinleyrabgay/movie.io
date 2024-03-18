import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieio/screens/welcome/controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
    );
  }
}
