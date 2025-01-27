import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';

class ContactWithAdmin extends StatefulWidget {
  const ContactWithAdmin({super.key});

  @override
  State<ContactWithAdmin> createState() => _ContactWithAdminState();
}

class _ContactWithAdminState extends State<ContactWithAdmin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * (1 / 3),
                width: double.infinity,
                color: MyColors.premiumColor,
              ),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * (2 / 3) +
                    10 +
                    (MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8)),
                right: 25,
                left: 25,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width - 50,
                  height: MediaQuery.sizeOf(context).height * (1 / 3) -
                      2 * MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8) -
                      10,
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.imagesAuthImagesEmergencyImagesContactAdmin,
                      width: MediaQuery.sizeOf(context).width - 50,
                      height: MediaQuery.sizeOf(context).height * (1 / 3) -
                          2.5 *
                              MediaQuery.sizeOf(context).height *
                              (1 / 3) *
                              (1 / 8) -
                          10,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * (1 / 3) -
                          (MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration:
                          BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                           boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          color: Colors.black26,
                          spreadRadius: 0,
                        ),
                      ]),
                      child: Column(
                        children: [
                            Text(
                            "Contact Admin",
                            style:  AppStyle.styleSemiBold25(context).copyWith(color: Colors.black
                              
                            )
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4.0,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: TextField(
                              
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration:   InputDecoration(
                                labelText: 'Enter your email',
                                labelStyle: AppStyle.styleRegular17(context),
                                prefixIcon:   Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                  size: MediaQuery.sizeOf(context).width > 600
                                      ? 40
                                      : 20,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                            child: TextField(
                              maxLines: 8,
                              controller: _messageController,
                              decoration: InputDecoration(
                                labelText: "Message",
                                labelStyle: AppStyle.styleRegular25(context).copyWith(color: Colors.black),
                                hintText: 'Enter your message here',
                                
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: AppStyle.styleRegular17(context),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: MyColors.premiumColor,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                              Assets.imagesAuthImagesEmergencyImagesSend),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Text(
                          "Follow Us",
                          style: AppStyle.styleSemiBold20(context).copyWith(
                            color: const Color(0xFF5C5858)
                          )
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                Assets.imagesAuthImagesEmergencyImagesMageX),
                            const SizedBox(width: 15),
                            SvgPicture.asset(
                                Assets.imagesAuthImagesEmergencyImagesTikTok),
                            const SizedBox(width: 15),
                            SvgPicture.asset(
                                Assets.imagesAuthImagesEmergencyImagesFacebook),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8),
                  left: 25,
                  child: InkWell(
                      onTap: () {
                          Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 25,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}