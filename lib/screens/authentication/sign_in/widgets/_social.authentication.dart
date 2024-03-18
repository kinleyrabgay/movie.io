import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/image.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieio/screens/authentication/sign_in/controller.dart';

class MVSocialLogin extends GetView<LoginController> {
  const MVSocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => controller.googleSignIn(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: MVSizes.iconMd,
                  height: MVSizes.iconMd,
                  image: AssetImage(MVImageString.goggle),
                ),
                const SizedBox(width: MVSizes.spaceBtwItems),
                Text(
                  'Continue with Google',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: MVColors.black),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: MVSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => controller.facebookSignIn(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: MVSizes.iconMd,
                  height: MVSizes.iconMd,
                  image: AssetImage(MVImageString.facebook),
                ),
                const SizedBox(width: MVSizes.spaceBtwItems),
                Text(
                  'Continue with Facebook',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: MVColors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
