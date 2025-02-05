// // // ignore_for_file: deprecated_member_use

// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:user_accident/constants/app_style.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:user_accident/constants/app_images.dart';
// // import 'package:user_accident/constants/colors.dart';
// // import 'package:user_accident/constants/pages_name.dart';

// // class ContactWithAdmin extends StatefulWidget {
// //   const ContactWithAdmin({super.key});

// //   @override
// //   State<ContactWithAdmin> createState() => _ContactWithAdminState();
// // }

// // class _ContactWithAdminState extends State<ContactWithAdmin> {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _messageController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: Colors.white,
// //           appBar: AppBar(
// //             scrolledUnderElevation: 0,
// //           title:   Text(
// //             "Contact with admin",
// //             style:  AppStyle.styleBold25(context).copyWith(color: Colors.black),
// //           ),
// //           leading: IconButton(onPressed: (){
// //             Navigator.pop(context);
// //           }, icon:  Icon(Icons.arrow_back,
// //           size: MediaQuery.sizeOf(context).width > 600 ? 50 : null,
// //           )),
// //           centerTitle: true,
// //           backgroundColor: Colors.white,
// //           elevation: 0,

// //         ),
// //         body: Container(
// //           margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
// //           child: SingleChildScrollView(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                   Text(
// //                   "You can contact technical support to find a solution for your issue",
// //                   style: AppStyle.styleRegular25(context)
// //                 ),
// //                 const SizedBox(
// //                   height: 40,
// //                 ),
// //                 // const Text(
// //                 //   "Contact With Admin",
// //                 //   style: TextStyle(
// //                 //       fontWeight: FontWeight.w500,
// //                 //       fontSize: 18,
// //                 //       color: Color.fromRGBO(0, 0, 0, 1)),
// //                 // ),
// //                 const SizedBox(
// //                   height: 30,
// //                 ),
// //                   Text(
// //                   "Email",
// //                   style: AppStyle.styleSemiBold20(context)
// //                 ),
// //                 const SizedBox(
// //                   height: 10,
// //                 ),
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(12.0),
// //                     color: Colors.white,
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.black.withOpacity(0.25),
// //                         offset: const Offset(0, 4),
// //                         blurRadius: 4.0,
// //                         spreadRadius: 0,
// //                       ),
// //                     ],
// //                   ),
// //                   child: TextField(
// //                     style: AppStyle.styleRegular17(context),
// //                     keyboardType: TextInputType.emailAddress,
// //                     decoration: InputDecoration(
// //                       hintText: 'Enter your email',
// //                       hintStyle: const TextStyle(color: Colors.grey),
// //                       prefixIcon: const Icon(
// //                         Icons.email,
// //                         color: Colors.grey,
// //                       ),

// //                       enabledBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12.0),
// //                         borderSide: const BorderSide(

// //                           color: Color.fromRGBO(222, 119, 28, 1),
// //                           width: 1.3,
// //                         ),
// //                       ),
// //                       focusedBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12.0),
// //                         borderSide: const BorderSide(

// //                           color: Color.fromRGBO(222, 119, 28, 1),
// //                           width: 1.3,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 30,
// //                 ),
// //                   Text(
// //                   "Message",
// //                   style: AppStyle.styleSemiBold20(context)
// //                 ),
// //                 const SizedBox(
// //                   height: 10,
// //                 ),
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(12.0),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.black.withOpacity(0.25),
// //                         offset: const Offset(0, 4),
// //                         blurRadius: 4.0,
// //                       ),
// //                     ],
// //                   ),
// //                   child: TextField(
// //                     style: AppStyle.styleRegular17(context),
// //                       maxLines: 8,
// //                       decoration: InputDecoration(
// //                         hintText: 'Enter your message here',
// //                         hintStyle: const TextStyle(color: Colors.grey),
// //                         enabledBorder: OutlineInputBorder(
// //                           borderSide: const BorderSide(
// //                             color: Color.fromRGBO(222, 119, 28, 1),
// //                             width: 1.3,
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SizedBox(
// //         height: MediaQuery.sizeOf(context).height,
// //         width: double.infinity,
// //         child: Stack(
// //           children: [
// //             Container(
// //               height: MediaQuery.sizeOf(context).height * (1 / 3),
// //               width: double.infinity,
// //               color: MyColors.premiumColor,
// //             ),
// //             Positioned(
// //               bottom: MediaQuery.sizeOf(context).height * (2 / 3) +
// //                   10 +
// //                   (MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8)),
// //               right: 25,
// //               left: 25,
// //               child: SizedBox(
// //                 width: MediaQuery.sizeOf(context).width - 50,
// //                 height: MediaQuery.sizeOf(context).height * (1 / 3) -
// //                     2 * MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8) -
// //                     10,
// //                 child: Center(
// //                   child: SvgPicture.asset(
// //                     Assets.imagesAuthImagesEmergencyImagesContactAdmin,
// //                     width: MediaQuery.sizeOf(context).width - 50,
// //                     height: MediaQuery.sizeOf(context).height * (1 / 3) -
// //                         2.5 *
// //                             MediaQuery.sizeOf(context).height *
// //                             (1 / 3) *
// //                             (1 / 8) -
// //                         10,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   SizedBox(
// //                     height: MediaQuery.sizeOf(context).height * (1 / 3) -
// //                         (MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8)),
// //                   ),
// //                   Container(
// //                     margin: const EdgeInsets.symmetric(horizontal: 25),
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 15, vertical: 15),
// //                     decoration:
// //                         const BoxDecoration(color: Colors.white, boxShadow: [
// //                       BoxShadow(
// //                         blurRadius: 4,
// //                         offset: Offset(0, 4),
// //                         color: Colors.black26,
// //                         spreadRadius: 0,
// //                       ),
// //                     ]),
// //                     child: Column(
// //                       children: [
// //                         const Text(
// //                           "Contact Admin",
// //                           style: TextStyle(
// //                             color: Colors.black,
// //                             fontSize: 24,
// //                             fontWeight: FontWeight.w700,
// //                             fontFamily: "Roboto",
// //                           ),
// //                         ),
// //                         focusedBorder: OutlineInputBorder(
// //                           borderSide: const BorderSide(
// //                             color: Color.fromRGBO(222, 119, 28, 1),
// //                             width: 1.7,
// //                           ),
// //                           borderRadius: BorderRadius.circular(12.0),
// //                         ),
// //                       )),
// //                 ),
// //                 const SizedBox(
// //                   height: 40,
// //                 ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Container(
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         borderRadius:
// //                             BorderRadius.circular(10.0),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.black.withOpacity(0.25),
// //                             offset: const Offset(0, 4),
// //                             blurRadius: 4.0,
// //                             spreadRadius: 0
// //                           ),
// //                         ],
// //                       ),
// //                       child: ElevatedButton(
// //                         onPressed: () {
// //                           if (kDebugMode) {
// //                             print("Send button pressed");
// //                           }
// //                         },
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: const Color.fromRGBO(61, 100, 152, 1),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(10.0),
// //                           ),
// //                           padding: const EdgeInsets.symmetric(
// //                               vertical: 12, horizontal: 24),
// //                         ),
// //                         child: Padding(
// //                           padding:  EdgeInsets.symmetric(
// //                               horizontal: MediaQuery.of(context).size.width * 0.2 ,  vertical: 4),
// //                           child:   Text(
// //                             "Send",
// //                             style: AppStyle.styleBold20(context).copyWith(color: Colors.white)
// //                           ),
// //                         ),

// //                       ),
// //                     ),
// //                   ],
// //                 ),

// //                 const SizedBox(height: 10,)
// //               ],
// //                         const SizedBox(height: 20),
// //                         Container(
// //                           decoration: const BoxDecoration(
// //                             color: Colors.white,
// //                             boxShadow: [
// //                               BoxShadow(
// //                                 color: Colors.black26,
// //                                 offset: Offset(0, 4),
// //                                 blurRadius: 4.0,
// //                                 spreadRadius: 0,
// //                               ),
// //                             ],
// //                           ),
// //                           child: TextField(
// //                             controller: _emailController,
// //                             keyboardType: TextInputType.emailAddress,
// //                             decoration: const InputDecoration(
// //                               labelText: 'Enter your email',
// //                               prefixIcon: Icon(
// //                                 Icons.email,
// //                                 color: Colors.grey,
// //                               ),
// //                               enabledBorder: UnderlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Colors.black,
// //                                   width: 1,
// //                                 ),
// //                               ),
// //                               focusedBorder: UnderlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Colors.black,
// //                                   width: 1.3,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(height: 30),
// //                         Container(
// //                           decoration: BoxDecoration(
// //                             color: Colors.white,
// //                             borderRadius: BorderRadius.circular(15.0),
// //                             boxShadow: const [
// //                               BoxShadow(
// //                                 color: Colors.black26,
// //                                 offset: Offset(0, 4),
// //                                 blurRadius: 4.0,
// //                               ),
// //                             ],
// //                           ),
// //                           child: TextField(
// //                             maxLines: 8,
// //                             controller: _messageController,
// //                             decoration: InputDecoration(
// //                               labelText: "Message",
// //                               hintText: 'Enter your message here',
// //                               floatingLabelBehavior:
// //                                   FloatingLabelBehavior.always,
// //                               hintStyle: const TextStyle(
// //                                 color: Colors.grey,
// //                               ),
// //                               enabledBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide.none,
// //                                 borderRadius: BorderRadius.circular(15.0),
// //                               ),
// //                               focusedBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide.none,
// //                                 borderRadius: BorderRadius.circular(15.0),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(height: 40),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   InkWell(
// //                     onTap: () {},
// //                     child: Container(
// //                       height: 60,
// //                       width: 60,
// //                       padding: const EdgeInsets.all(10.0),
// //                       decoration: BoxDecoration(
// //                         color: MyColors.premiumColor,
// //                         borderRadius: BorderRadius.circular(60),
// //                       ),
// //                       child: SizedBox(
// //                         height: 30,
// //                         width: 30,
// //                         child: SvgPicture.asset(
// //                             Assets.imagesAuthImagesEmergencyImagesSend),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 40),
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       const Text(
// //                         "Follow Us",
// //                         style: TextStyle(
// //                           color: Color.fromRGBO(92, 88, 88, 1),
// //                           fontSize: 15,
// //                           fontWeight: FontWeight.w700,
// //                           fontFamily: "Roboto",
// //                         ),
// //                       ),
// //                       const SizedBox(height: 15),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           SvgPicture.asset(
// //                               Assets.imagesAuthImagesEmergencyImagesMageX),
// //                           const SizedBox(width: 15),
// //                           SvgPicture.asset(
// //                               Assets.imagesAuthImagesEmergencyImagesTikTok),
// //                           const SizedBox(width: 15),
// //                           SvgPicture.asset(
// //                               Assets.imagesAuthImagesEmergencyImagesFacebook),
// //                         ],
// //                       ),
// //                       const SizedBox(
// //                         height: 50,
// //                       )
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Positioned(
// //                 top: MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8),
// //                 left: 25,
// //                 child: InkWell(
// //                     onTap: () {
// //                         Navigator.popAndPushNamed(context, emergencySignInScreen);
// //                     },
// //                     child: const Icon(
// //                       Icons.arrow_back,
// //                       size: 25,
// //                     ))),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:user_accident/constants/app_images.dart';
// import 'package:user_accident/constants/app_style.dart';
// import 'package:user_accident/constants/colors.dart';
// import 'package:user_accident/constants/pages_name.dart';

// class ContactWithAdmin extends StatefulWidget {
//   const ContactWithAdmin({super.key});

//   @override
//   State<ContactWithAdmin> createState() => _ContactWithAdminState();
// }

// class _ContactWithAdminState extends State<ContactWithAdmin> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SizedBox(
//         height: MediaQuery.sizeOf(context).height,
//         width: double.infinity,
//         child: Stack(
//           children: [
//             Container(
//               height: MediaQuery.sizeOf(context).height * (1 / 3),
//               width: double.infinity,
//               color: MyColors.premiumColor,
//             ),
//             Positioned(
//               bottom: MediaQuery.sizeOf(context).height * (2 / 3) +
//                   10 +
//                   (MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8)),
//               right: 25,
//               left: 25,
//               child: SizedBox(
//                 width: MediaQuery.sizeOf(context).width - 50,
//                 height: MediaQuery.sizeOf(context).height * (1 / 3) -
//                     2 * MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8) -
//                     10,
//                 child: Center(
//                   child: SvgPicture.asset(
//                     Assets.imagesAuthImagesEmergencyImagesContactAdmin,
//                     width: MediaQuery.sizeOf(context).width - 50,
//                     height: MediaQuery.sizeOf(context).height * (1 / 3) -
//                         2.5 *
//                             MediaQuery.sizeOf(context).height *
//                             (1 / 3) *
//                             (1 / 8) -
//                         10,
//                   ),
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.sizeOf(context).height * (1 / 3) -
//                         (MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8)),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 25),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 15, vertical: 15),
//                     decoration:
//                         const BoxDecoration(color: Colors.white, boxShadow: [
//                       BoxShadow(
//                         blurRadius: 4,
//                         offset: Offset(0, 4),
//                         color: Colors.black26,
//                         spreadRadius: 0,
//                       ),
//                     ]),
//                     child: Column(
//                       children: [
//                         const Text(
//                           "Contact Admin",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 24,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: "Roboto",
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Container(
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(0, 4),
//                                 blurRadius: 4.0,
//                                 spreadRadius: 0,
//                               ),
//                             ],
//                           ),
//                           child: TextField(
//                             controller: _emailController,
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: const InputDecoration(
//                               labelText: 'Enter your email',
//                               prefixIcon: Icon(
//                                 Icons.email,
//                                 color: Colors.grey,
//                               ),
//                               enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 ),
//                               ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1.3,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15.0),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(0, 4),
//                                 blurRadius: 4.0,
//                               ),
//                             ],
//                           ),
//                           child: TextField(
//                             maxLines: 8,
//                             controller: _messageController,
//                             decoration: InputDecoration(
//                               labelText: "Message",
//                               hintText: 'Enter your message here',
//                               floatingLabelBehavior:
//                                   FloatingLabelBehavior.always,
//                               hintStyle: const TextStyle(
//                                 color: Colors.grey,
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 40),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       height: 60,
//                       width: 60,
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: MyColors.premiumColor,
//                         borderRadius: BorderRadius.circular(60),
//                       ),
//                       child: SizedBox(
//                         height: 30,
//                         width: 30,
//                         child: SvgPicture.asset(
//                             Assets.imagesAuthImagesEmergencyImagesSend),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Follow Us",
//                         style: TextStyle(
//                           color: Color.fromRGBO(92, 88, 88, 1),
//                           fontSize: 15,
//                           fontWeight: FontWeight.w700,
//                           fontFamily: "Roboto",
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                               Assets.imagesAuthImagesEmergencyImagesMageX),
//                           const SizedBox(width: 15),
//                           SvgPicture.asset(
//                               Assets.imagesAuthImagesEmergencyImagesTikTok),
//                           const SizedBox(width: 15),
//                           SvgPicture.asset(
//                               Assets.imagesAuthImagesEmergencyImagesFacebook),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               Positioned(
//                   top: MediaQuery.sizeOf(context).height * (1 / 3) * (1 / 8),
//                   left: 25,
//                   child: InkWell(
//                       onTap: () {
//                           Navigator.pop(context);
//                       },
//                       child: const Icon(
//                         Icons.arrow_back,
//                         size: 25,
//                       ))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
                    Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            padding: const EdgeInsets.only(bottom: 50),
                            
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration:
                                  BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.white, boxShadow: const [
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
                                  "تواصل مع المشرف",
                                  style: AppStyle.styleSemiBold25(context).copyWith(color: Colors.black)
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
                                      labelText: 'ادخل بريدك الالكتروني',
                                      labelStyle: AppStyle.styleRegular17(context),
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.grey,
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
                                      labelText: "رسالتك",
                                      labelStyle: AppStyle.styleRegular30(context),
                                      hintText: 'اكتب رسالتك هنا',
                                      
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
                        ),
                         Positioned(
                          bottom: 20,
                          right: MediaQuery.sizeOf(context).width*0.5-30,
                          
                           child: InkWell(
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
                         ),
                    
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Text(
                          "تواصل معنا",
                          style:  AppStyle.styleSemiBold20(context).copyWith(color: const Color(0xFF5C5858)),
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
                  right: 25,
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
