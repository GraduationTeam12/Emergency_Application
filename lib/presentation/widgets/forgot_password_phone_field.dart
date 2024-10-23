import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/presentation/widgets/custom_elevated_button.dart';

class ForgotPasswordByPhoneField extends StatefulWidget {
  const ForgotPasswordByPhoneField({super.key});

  @override
  State<ForgotPasswordByPhoneField> createState() =>
      _ForgotPasswordByPhoneFieldState();
}

class _ForgotPasswordByPhoneFieldState
    extends State<ForgotPasswordByPhoneField> {
  final phoneController = TextEditingController();

  final List<Map<String, String>> countries = [
    {'code': 'eg', 'dial_code': '+20'},
    {'code': 'us', 'dial_code': '+1'},
    {'code': 'gb', 'dial_code': '+44'},
    {'code': 'fr', 'dial_code': '+33'},
    {'code': 'de', 'dial_code': '+49'},
    {'code': 'sa', 'dial_code': '+966'},
  ];

  String selectedCountryCode = 'eg';
  String selectedDialCode = '+20';

  String generateCountryFlag(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: AppStyle.styleRegular16(context).copyWith(color: Colors.black),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          controller: phoneController,
          decoration: InputDecoration(
              errorStyle: AppStyle.styleRegular16(context).copyWith(color: Colors.red),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.phone_iphone,
                    color: Colors.black,
                    size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    underline: const SizedBox.shrink(),
                    value: selectedCountryCode,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountryCode = newValue!;
                        selectedDialCode = countries.firstWhere((country) =>
                            country['code'] ==
                            selectedCountryCode)['dial_code']!;
                      });
                    },
                    items: countries.map<DropdownMenuItem<String>>(
                        (Map<String, String> country) {
                      return DropdownMenuItem<String>(
                        value: country['code'],
                        child: Row(
                          children: [
                            Text(
                              generateCountryFlag(country['code']!),
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).width > 600
                                          ? 35
                                          : 17),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  Text(selectedDialCode,
                      style: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.black)),
                ],
              ),
            ),
            labelText: "Phone Number",
            labelStyle: AppStyle.styleRegular16(context),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    const BorderSide(width: 2, color: MyColors.premiumColor)),
            floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
                color: MyColors.premiumColor, fontWeight: FontWeight.w600),
            contentPadding: MediaQuery.sizeOf(context).width > 600
                ? const EdgeInsets.all(38)
                : const EdgeInsets.all(15),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: MyColors.premiumColor,
              ),
            ),
            border: buildBorder(),
          ),
          validator: (phone) {
            if (phone!.isEmpty) {
              return "Please enter your phone number";
            }
            return null;
          },
        ),
        const SizedBox(height: 5),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: GestureDetector(
        //     onTap: () {
        //       Navigator.pushReplacementNamed(
        //           context, forgotPasswordEmailScreen);
        //     },
        //     child: Text(
        //       "Reset Password by email ?",
        //       style: AppStyle.styleSemiBold16(context)
        //           .copyWith(color: const Color(0xFF3D6498)),
        //     ),
        //   ),
        // ),
        const SizedBox(height: 25),
        CustomElevatedButton(title: "Send Code", onPressed: () {}),
      ],
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(width: 1),
  );
}
