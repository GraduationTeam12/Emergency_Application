import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';

class SidebarIcons extends StatefulWidget {
  @override
  _SidebarIconsState createState() => _SidebarIconsState();
  final String userType;

  const SidebarIcons({super.key, required this.userType});
}

class _SidebarIconsState extends State<SidebarIcons> {
  bool hideOthers = false;

  final List<IconData> icons = [
    Icons.notifications_outlined,
    Icons.person,
    Icons.settings,
    Icons.tune_outlined,
  ];

  void onIconTap(int index) {
    if (index == 3) {
      setState(() {
        hideOthers = !hideOthers;
      });
    } else {
      if (index == 0) {
        Navigator.pushNamed(context, notificationsScreen);
      }
      if (index == 2) {
        Navigator.pushNamed(context, settingScreen);
      }
      print("Open Page: $index");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10),
        child: Column(
          children: List.generate(4, (index) {
            final bool isHidden = hideOthers && index != 3;
            if (widget.userType != 'hospitals' && index == 1) {
              return SizedBox.shrink();
            }
            if (isHidden) return SizedBox.shrink();
            return GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _pressedIndex = index;
                });
              },
              onTapUp: (_) async {
                await Future.delayed(const Duration(milliseconds: 300));
                setState(() {
                  _pressedIndex = null;
                });
                onIconTap(index);
              },
              onTapCancel: () {
                setState(() {
                  _pressedIndex = null;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _pressedIndex == index
                      ? Colors.white
                      : MyColors.premiumColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    if (_pressedIndex == index)
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 6,
                      ),
                  ],
                ),
                child: Builder(
                  builder: (context) {
                    Widget iconWidget;

                    if (index == 0) {
                      iconWidget = Transform.translate(
                        offset: Offset(_pressedIndex == index ? 0 : 0, 0),
                        child: Icon(
                          icons[index],
                          size:
                              MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                          color: _pressedIndex == index
                              ? MyColors.premiumColor
                              : Colors.white,
                          key: ValueKey('icon_$index'),
                        ),
                      );
                    } else if (index == 1) {
                      // SVG بمقياس
                      iconWidget = TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: 1.0,
                          end: _pressedIndex == index ? 1.2 : 1.0,
                        ),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        builder: (context, scale, child) {
                          return Transform.scale(
                            scale: scale,
                            child: SvgPicture.asset(
                              Assets
                                  .imagesAuthImagesEmergencyImagesEmojisHospital,
                              width: MediaQuery.sizeOf(context).width > 600
                                  ? 40
                                  : 25,
                              height: MediaQuery.sizeOf(context).width > 600
                                  ? 40
                                  : 25,
                              key: ValueKey('svg_$index'),
                            ),
                          );
                        },
                      );
                    } else if (index == 2) {
                      iconWidget = TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: 0,
                          end: _pressedIndex == index ? 6.28 : 0,
                        ),
                        duration: Duration(milliseconds: 300),
                        builder: (context, angle, _) {
                          return Transform.rotate(
                            angle: angle,
                            child: Icon(
                              icons[index],
                              size: MediaQuery.sizeOf(context).width > 600
                                  ? 40
                                  : 25,
                              color: _pressedIndex == index
                                  ? MyColors.premiumColor
                                  : Colors.white,
                              key: ValueKey('icon_$index'),
                            ),
                          );
                        },
                      );
                    } else {
                      iconWidget = Transform.rotate(
                        angle: _pressedIndex == index ? -1.8 : -1.5708,
                        child: Icon(
                          icons[index],
                          size:
                              MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                          color: _pressedIndex == index
                              ? MyColors.premiumColor
                              : Colors.white,
                          key: ValueKey('icon_$index'),
                        ),
                      );
                    }

                    return iconWidget;
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  int? _pressedIndex;
}
