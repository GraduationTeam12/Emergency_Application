import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/presentation/widgets/custom_app_bar.dart';
import 'package:user_accident/presentation/widgets/emergency_form.dart';

class EmergencySignInScreen extends StatefulWidget {
  const EmergencySignInScreen({super.key});

  @override
  State<EmergencySignInScreen> createState() => _EmergencySignInScreenState();
}

class _EmergencySignInScreenState extends State<EmergencySignInScreen> {
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
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width > 600
                          ? MediaQuery.sizeOf(context).width / 2
                          : null,
                      height: MediaQuery.sizeOf(context).width > 600
                          ? MediaQuery.of(context).size.height / 3
                          : null,
                      child: SvgPicture.asset(
                        'assets/images/auth_images/emergency_login.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const EmergencyForm(),
                    const SizedBox(
                      height: 20,
                    ),
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
