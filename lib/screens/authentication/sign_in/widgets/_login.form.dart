import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/sizes.dart';
import 'package:movieio/common/utils/validators/validator.dart';
import 'package:movieio/screens/authentication/sign_in/controller.dart';

class MVLoginForm extends GetView<LoginController> {
  const MVLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Email',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: MVSizes.spaceBtwItems / 2),
        TextFormField(
          controller: controller.email,
          validator: (value) => MVValidator.validateEmail(value),
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
            hintText: 'youremail@email.xyz',
            hintStyle: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        const SizedBox(height: MVSizes.spaceBtwSections),
        // Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => controller.redirectAuthScreen(),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Next', style: TextStyle(color: MVColors.white)),
                SizedBox(width: MVSizes.spaceBtwItems),
                Icon(Iconsax.arrow_right_1)
              ],
            ),
          ),
        )
      ],
    );
  }
}
