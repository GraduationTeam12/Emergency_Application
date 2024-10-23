import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/presentation/widgets/custom_app_bar.dart';
import 'package:user_accident/presentation/widgets/sign_in_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildCustomAppBar(context, 'Welcome Back !'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 4,
                      child: SvgPicture.asset(
                        Assets.imagesAuthImagesLogin,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const SignInForm(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              ),
              const SliverFillRemaining(
                hasScrollBody: false,
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
