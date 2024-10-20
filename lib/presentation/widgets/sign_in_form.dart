import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/logic/login_cubit/login_cubit.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // final GlobalKey<FormState> formKey = GlobalKey();

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  bool isVisable = true;

  // Widget buildSignInBloc() {
  //   return BlocListener<LoginCubit, LoginState>(
  //     listener: (context, state) {
  //       if (state is Loading) {
  //         return;
  //       } else if (state is SuccessfullyLogin) {
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           content: Text('SuccessfullyLogin'),
  //           backgroundColor: Colors.black,
  //           duration: Duration(seconds: 6),
  //         ));
  //       } else if (state is ErrorOccured) {
  //         String errMsg = (state).errMsg;

  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text(errMsg),
  //           backgroundColor: Colors.black,
  //           duration: const Duration(seconds: 3),
  //         ));
  //       }
  //     },
  //     child: Container(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
            ),
          );
        }
        if (state is LoginSuccessState) {
          String message = state.message;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
        if (state is LoginErrorState) {
          String message = state.errMsg;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<LoginCubit>(context).loginKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<LoginCubit>(context).signInEmail,
                decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.email_outlined, color: Colors.black),
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
                    
                    contentPadding: const EdgeInsets.all(8),
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
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: isVisable ? true : false,
                controller: BlocProvider.of<LoginCubit>(context).signInPassword,
                decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.lock_outlined, color: Colors.black),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                        icon: isVisable
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
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
                    contentPadding: const EdgeInsets.all(8),
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
              const SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, forgotPasswordEmailScreen);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: AppStyle.styleSemiBold16(context).copyWith(fontSize: 13 , color: MyColors.premiumColor),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!BlocProvider.of<LoginCubit>(context)
                          .loginKey
                          .currentState!
                          .validate()) {
                        return;
                      } else {
                        BlocProvider.of<LoginCubit>(context).login();
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
              // buildSignInBloc()
            ],
          ),
        );
      },
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(width: 1));
  }
}
