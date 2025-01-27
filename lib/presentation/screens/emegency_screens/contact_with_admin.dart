import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';

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
    return Scaffold(
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
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Colors.black26,
                        spreadRadius: 0,
                      ),
                    ]),
                    child: Column(
                      children: [
                        const Text(
                          "Contact Admin",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                          ),
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
                            decoration: const InputDecoration(
                              labelText: 'Enter your email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
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
                              hintText: 'Enter your message here',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
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
                      const Text(
                        "Follow Us",
                        style: TextStyle(
                          color: Color.fromRGBO(92, 88, 88, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto",
                        ),
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
                        Navigator.popAndPushNamed(context, emergencySignInScreen);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    ))),
          ],
        ),
      ),
    );
  }
}
