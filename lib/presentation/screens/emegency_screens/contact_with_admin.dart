// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';

class ContactWithAdmin extends StatefulWidget {
  const ContactWithAdmin({super.key});

  @override
  State<ContactWithAdmin> createState() => _ContactWithAdminState();
}

class _ContactWithAdminState extends State<ContactWithAdmin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0,
          title:   Text(
            "Contact with admin",
            style:  AppStyle.styleBold25(context).copyWith(color: Colors.black),
          ),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:  Icon(Icons.arrow_back,
          size: MediaQuery.sizeOf(context).width > 600 ? 50 : null,
          )),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
      
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                  "You can contact technical support to find a solution for your issue",
                  style: AppStyle.styleRegular25(context)
                ),
                const SizedBox(
                  height: 40,
                ),
                // const Text(
                //   "Contact With Admin",
                //   style: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 18,
                //       color: Color.fromRGBO(0, 0, 0, 1)),
                // ),
                const SizedBox(
                  height: 30,
                ),
                  Text(
                  "Email",
                  style: AppStyle.styleSemiBold20(context)
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4.0,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: TextField(
                    style: AppStyle.styleRegular17(context),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),

                       
                      
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          
                          color: Color.fromRGBO(222, 119, 28, 1),
                          width: 1.3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          
                          color: Color.fromRGBO(222, 119, 28, 1),
                          width: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                  Text(
                  "Message",
                  style: AppStyle.styleSemiBold20(context)
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: TextField(
                    style: AppStyle.styleRegular17(context),
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Enter your message here',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(222, 119, 28, 1),
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(222, 119, 28, 1),
                            width: 1.7,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius:
                            BorderRadius.circular(10.0), 
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4.0,
                            spreadRadius: 0
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print("Send button pressed");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(61, 100, 152, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.2 ,  vertical: 4),
                          child:   Text(
                            "Send",
                            style: AppStyle.styleBold20(context).copyWith(color: Colors.white)
                          ),
                        ),

                      
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
