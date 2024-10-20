import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/presentation/widgets/change_password_fields.dart';
import 'package:user_accident/presentation/widgets/custom_app_bar.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildCustomAppBar(context, 'Change Password'),
        body: Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [

                  const SizedBox(
                    height: 50,
                  ),
                  SvgPicture.asset(Assets.imagesAuthImagesConfirm),
              
                  const SizedBox(
                    height: 30,
                  ), 
                  const ChangePasswordFields(),

                  const Expanded(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        ),
      ),
      ),
    );
  }
}