import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/core/logic/login_cubit/login_cubit.dart';

class EmergencyForm extends StatefulWidget {
  const EmergencyForm({super.key});

  @override
  State<EmergencyForm> createState() => _EmergencyFormState();
}

class _EmergencyFormState extends State<EmergencyForm> {
  bool isVisable = true;

  TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    prefixIcon:
                         Padding(
                           padding: const EdgeInsets.only(right: 16.0,left: 16),
                           child: Icon(Icons.email_outlined, color: Colors.black,size: 22.sp* MediaQuery.sizeOf(context).width*0.001),
                         ),
                    labelText: "E-mail",
                    labelStyle: AppStyle.styleRegular16(context),
                    

                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                     
                    floatingLabelStyle: AppStyle.styleRegular16(context)
                        .copyWith(
                            color: MyColors.premiumColor,
                            fontWeight: FontWeight.w600),
                    
                    contentPadding:  EdgeInsets.all(29* MediaQuery.sizeOf(context).height*0.0005),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                    border: buildBorder()),
                validator: (email) {
                  if (email!.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
               SizedBox(
                height: 10.h * MediaQuery.sizeOf(context).width*0.0025,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: isVisable ? true : false,
                decoration: InputDecoration(
                    prefixIcon:
                         Padding(
                           padding: const EdgeInsets.only(right: 16.0,left: 16),
                           child: Icon(Icons.lock_outlined, color: Colors.black,size: 22.sp* MediaQuery.sizeOf(context).width*0.001),
                         ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                        icon: isVisable
                            ?  Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(Icons.visibility ,size: 22.sp* MediaQuery.sizeOf(context).width*0.001),
                            )
                            :  Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(Icons.visibility_off, size: 22.sp* MediaQuery.sizeOf(context).width*0.001),
                            )),
                    labelText: "Password",
                    labelStyle: AppStyle.styleRegular16(context),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                    floatingLabelStyle: AppStyle.styleRegular16(context)
                        .copyWith(
                            color: MyColors.premiumColor,
                            fontWeight: FontWeight.w600),
                    contentPadding: EdgeInsets.all(29* MediaQuery.sizeOf(context).height*0.0005),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                    border: buildBorder()),
                validator: (password) {
                  if (password!.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),
            
             SizedBox(
                height: 20.h * MediaQuery.sizeOf(context).width*0.0025,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 40 *MediaQuery.sizeOf(context).height*0.0013,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!BlocProvider.of<LoginCubit>(context)
                          .loginKey
                          .currentState!
                          .validate()) {
                        return;
                      } else {
                      }
                    },
                    
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.premiumColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Log In",
                      style: AppStyle.styleSemiBold18(context),
                    ),
                  )),
               
            ],
          ),
      );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(width: 1));
  }
}
