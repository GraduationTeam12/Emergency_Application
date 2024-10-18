import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/logic/auth_cubit/auth_cubit.dart';
import 'package:user_accident/presentation/screens/forgot_password_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.isOwner});
  final bool isOwner;
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisable = false;

  Widget buildSignInBloc() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Loading) {
          return;
        } else if (state is SuccessfullyLogin) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('SuccessfullyLogin'),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 6),
          ));
        } else if (state is ErrorOccured) {
          String errMsg = (state).errMsg;

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(errMsg),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
          ));
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: emailController,
            decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.email_outlined, color: Colors.black),
                hintText: "E-mail",
                hintStyle: AppStyle.styleRegular16(context),
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
            obscureText: isVisable ? false : true,
            controller: passwordController,
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
                hintText: " Password",
                hintStyle: AppStyle.styleRegular16(context),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                            builder: (_) => BlocProvider(
                                       create: (BuildContext context) => AuthCubit(),
                                       child:  ForgotPasswordScreen(isOwner: widget.isOwner,),
                )));
                },
                child: Text(
                  "Forgot Password ?",
                  style: AppStyle.styleRegular12(context),
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
                  if (!formKey.currentState!.validate()) {
                    return;
                  } else {
                    await BlocProvider.of<AuthCubit>(context)
                        .signInWithEmailAndPassword(
                            emailController, passwordController);
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
          buildSignInBloc()
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
