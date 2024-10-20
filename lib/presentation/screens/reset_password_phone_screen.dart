import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/presentation/widgets/custom_app_bar.dart';
import 'package:user_accident/presentation/widgets/custom_elevated_button.dart';
import 'package:user_accident/presentation/widgets/reset_passwor_pin_code.dart';

class ResetPasswordPhoneScreen extends StatelessWidget {
  const ResetPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
        FocusScope.of(context).unfocus();
      },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildCustomAppBar(context, 'Reset Password'),
          body: Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.imagesAuthImagesVerify),
                    const SizedBox(
                      height: 50,
                    ),

                    Column(
                        children: [

                          FittedBox(child: Text("Please enter the 4 digit code", style: AppStyle.styleRegular17(context),)),
                          FittedBox(
                            child: RichText(
                                text:  TextSpan(
                                    text:
                                        "sent to: ",
                                    style: AppStyle.styleRegular17(context),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: "+20 1501142409",
                                      style: AppStyle.styleRegular17(context).copyWith(color: MyColors.premiumColor)),
                                ])),
                          ),
                        ],
                      ),

                     
                    const SizedBox(height: 40,),

                    const PinCode(),

                    CustomElevatedButton(title: 'Verify Code', onPressed: (){}),

                    const SizedBox(height: 30,),

                    TextButton(onPressed: (){},
                     child: Text("Resend Code", style: AppStyle.styleRegular17(context).copyWith(color: const Color(0xFF3D6498)),))
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