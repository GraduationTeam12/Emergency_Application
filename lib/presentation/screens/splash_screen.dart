// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/screens/selecting_method_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerUp;
  late AnimationController _animationControllerDown;
  late Animation<double> _animationLogoMovementUp;
  late Animation<double> _animationLogoMovementDown;

  late AnimationController _animationControllerLeftText;
  late AnimationController _animationControllerSecondText;
  late AnimationController
      _animationControllerMoveUp; // Controller for moving up animation
  late Animation<double> _animationLeftTextPosition;
  late Animation<double> _animationSecondTextPosition;
  late Animation<double> _animationMoveUp; // Animation for moving up

  bool _showLeftText = false;

  @override
  void initState() {
    super.initState();
     
    // Move after 8 seconds
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelectingMethodScreen()),
      );
    });

    // Animation controller for upward logo movement
    _animationControllerUp =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationLogoMovementUp =
        Tween<double>(begin: 0.5, end: -0.5).animate(CurvedAnimation(
      parent: _animationControllerUp,
      curve:const Interval(0.4,  1, curve: Curves.easeInOut),
    ));

    // Animation controller for downward logo movement
    _animationControllerDown =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationLogoMovementDown =
        Tween<double>(begin: -1, end: 0.5).animate(CurvedAnimation(
      parent: _animationControllerDown,
      curve: Curves.easeInOut,
    ));

    // Animation controller for left text movement
    _animationControllerLeftText =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationLeftTextPosition = Tween<double>(begin: -4000, end: 0).animate(
      CurvedAnimation(
        parent: _animationControllerLeftText,
        curve: Curves.easeInOut,
      ),
    );

    // Animation controller for second text movement
    _animationControllerSecondText =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationSecondTextPosition = Tween<double>(begin: -4000, end: 0).animate(
      CurvedAnimation(
        parent: _animationControllerSecondText,
        curve: Curves.easeInOut,
      ),
    );

    // New animation controller for moving both logo and text up
    _animationControllerMoveUp =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationMoveUp = Tween<double>(begin: 0, end: 0.1).animate(
      CurvedAnimation(
        parent: _animationControllerMoveUp,
        curve: Curves.easeInOut,
      ),
    );
    
    // Start animations in sequence
    _animationControllerUp.forward();
    _animationControllerUp.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationControllerDown.forward();
      }
    });

    // Add listener for when the downward logo animation completes
    _animationControllerDown.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showLeftText = true; // Show the text when logo animation ends
        });
        _animationControllerLeftText
            .forward(); // Start the left text movement after logo finishes
      }
    });

    // Add listener for left text completion to trigger second text and movement up
    _animationControllerLeftText.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationControllerSecondText
            .forward(); // Start the second text movement after the first text finishes
        _animationControllerMoveUp
            .forward(); // Move the logo and text up after second text appears
      }
    });
  }


  @override
  void dispose() {
    _animationControllerUp.dispose();
    _animationControllerDown.dispose();
    _animationControllerLeftText.dispose();
    _animationControllerSecondText.dispose();
    _animationControllerMoveUp
        .dispose(); // Dispose the new animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width;
    double heightScreen = MediaQuery.sizeOf(context).height;
    
    return AnimatedBuilder(
      animation: _animationControllerUp,
      builder: (context, _) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    (_animationLogoMovementUp.value == -0.5)
                        ? const Color.fromRGBO(61, 100, 152, 0)
                        : const Color.fromRGBO(61, 100, 152, 1),
                    (_animationLogoMovementUp.value == -0.5)
                        ? const Color.fromRGBO(73, 105, 146, 0)
                        : const Color.fromRGBO(73, 105, 146, 1),
                    (_animationLogoMovementUp.value == -0.5)
                        ? const Color.fromRGBO(20, 33, 50, 0)
                        : const Color.fromRGBO(20, 33, 50, 1),
                  ],
                  stops: const [0, 0.5, 1],
                ),
              ),
              child: Stack(
                children: [
                  // Logo moves up
                  AnimatedBuilder(
                    animation: _animationMoveUp, // Add move up animation
                    builder: (context, child) {
                      return Positioned(
                        top: widthScreen > 500
                            ? (heightScreen) * _animationLogoMovementUp.value
                            : (heightScreen) *
                                0.8 *
                                _animationLogoMovementUp
                                    .value, // Add move up animation
                        right: 0,
                        left: 0,
                        child: Transform.scale(
                          scale: widthScreen > 500
                              ? 1.5
                              : widthScreen > 400
                                  ? 1.1
                                  : 0.9,
                          child: Image.asset(
                            Assets.imagesAuthImagesLogo,
                            height: 200,
                            width: 200,
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                      animation: _animationControllerMoveUp,
                      builder: (context, _) {
                        return Stack(
                          children: [
                            // Logo moves down after upward animation
                            AnimatedBuilder(
                              animation: _animationControllerDown,
                              builder: (context, _) {
                                return Positioned(
                                  top: widthScreen > 500
                                      ? (heightScreen) *
                                              _animationLogoMovementDown.value -
                                          heightScreen * _animationMoveUp.value
                                      : (heightScreen) *
                                              0.8 *
                                              _animationLogoMovementDown.value -
                                          heightScreen *
                                              _animationMoveUp
                                                  .value, // Add move up animation
                                  right: 0,
                                  left: 0,
                                  child: Transform.scale(
                                    scale: widthScreen > 500
                                        ? 1.5
                                        : widthScreen > 400
                                            ? 1.1
                                            : 0.9,
                                    child: Image.asset(
                                      Assets.imagesAuthImagesLogo,
                                      height: 200,
                                      width: 200,
                                    ),
                                  ),
                                );
                              },
                            ),
                            // Moving text from left to center, now placed below the logo
                            if (_showLeftText)
                              AnimatedBuilder(
                                animation: _animationLeftTextPosition,
                                builder: (context, _) {
                                  return Positioned(
                                    top: widthScreen > 500
                                        ? (heightScreen) *
                                                _animationLogoMovementDown
                                                    .value -
                                            heightScreen *
                                                _animationMoveUp.value +
                                            200
                                        : widthScreen > 400
                                            ? (heightScreen) *
                                                    0.8 *
                                                    _animationLogoMovementDown
                                                        .value -
                                                heightScreen *
                                                    _animationMoveUp.value +
                                                195
                                            : (heightScreen) *
                                                    0.8 *
                                                    _animationLogoMovementDown
                                                        .value -
                                                heightScreen *
                                                    _animationMoveUp.value +
                                                170, // Add move up animation

                                    child: SizedBox(
                                      width: widthScreen,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // The item we want to move to the middle of the screen
                                          SlideTransition(
                                            position: Tween<Offset>(
                                              begin: const Offset(-20,
                                                  0), // Start from the left
                                              end: const Offset(0,
                                                  0), // Go to the middle of the screen
                                            ).animate(CurvedAnimation(
                                              parent:
                                                  _animationControllerLeftText,
                                              curve: Curves.easeInOut,
                                            )),
                                            child: ShaderMask(
                                              shaderCallback: (bounds) =>
                                                  const LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(
                                                      163, 183, 211, 1),
                                                  Color.fromRGBO(25, 53, 90, 1)
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ).createShader(bounds),
                                              child: Text(
                                                'SATARS',
                                                style: TextStyle(
                                                    fontSize: widthScreen > 500
                                                        ? 60
                                                        : widthScreen > 400
                                                            ? 40
                                                            : 35,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors
                                                        .white, // Must be set to a color for ShaderMask to apply the gradient
                                                    fontFamily: "Inter"),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ],
                        );
                      }),
                  // Second text moves after first text
                  if (_showLeftText)
                    AnimatedBuilder(
                      animation: _animationSecondTextPosition,
                      builder: (context, _) {
                        return Positioned(
                          top: widthScreen > 500
                              ? (heightScreen) *
                                      _animationLogoMovementDown.value -
                                  heightScreen * _animationMoveUp.value +
                                  200 +
                                  100
                              : widthScreen > 400
                                  ? (heightScreen) *
                                          0.8 *
                                          _animationLogoMovementDown.value -
                                      heightScreen * _animationMoveUp.value +
                                      200 +
                                      60
                                  : (heightScreen) *
                                          0.8 *
                                          _animationLogoMovementDown.value -
                                      heightScreen * _animationMoveUp.value +
                                      170 +
                                      50, // Add move up animation

                          child: SizedBox(
                            width: widthScreen,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // The item we want to move to the middle of the screen
                                Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(
                                            20, 0), //Start from the right
                                        end: const Offset(
                                            0, 0), // Go to the middle of the screen
                                      ).animate(CurvedAnimation(
                                        parent: _animationControllerSecondText,
                                        curve: Curves.easeInOut,
                                      )),
                                      child: ShaderMask(
                                        shaderCallback: (bounds) =>
                                                  const LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(220, 92, 34, 1),
                                                  Color.fromRGBO(30, 69, 121, 1)
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ).createShader(bounds),
                                        child: Text(
                                          'Smart Accident Tracking And Rescue System',
                                          style:
                                           AppStyle.styleBold25(context).copyWith(color: Colors.white , fontSize: 18)
                                          //  TextStyle(
                                          //     fontSize: widthScreen > 500
                                          //         ? 18
                                          //         : widthScreen > 400
                                          //             ? 12
                                          //             : 10,
                                          //     fontWeight: FontWeight.w600,
                                          //     color: Colors.white,
                                          //     // color:
                                          //     //     const Color.fromRGBO(51, 51, 51, 1),
                                          //     fontFamily: "Roboto"),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
