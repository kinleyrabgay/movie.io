import 'package:flutter/material.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:movieio/common/utils/constants/text.dart';
import 'package:movieio/common/widgets/divider.dart';
import 'package:movieio/common/widgets/header.text.dart';
import 'package:movieio/screens/authentication/sign_in/widgets/_login.form.dart';
import 'package:movieio/screens/authentication/sign_in/widgets/_social.authentication.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MVSizes.defaultSpace),
            child: Column(
              children: [
                // Auth Email Header
                MVHeaderText(
                    title: MVTextString.authEmailTitle,
                    subTitle: MVTextString.authEmailSubTitle),
                SizedBox(height: MVSizes.spaceBtwSections),

                // --- Login form
                MVLoginForm(),
                SizedBox(height: MVSizes.spaceBtwSections),

                // --- Divier
                MVFormDivider(divierText: MVTextString.orSignInWith),
                SizedBox(height: MVSizes.spaceBtwSections),

                // ---- Social button
                MVSocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
