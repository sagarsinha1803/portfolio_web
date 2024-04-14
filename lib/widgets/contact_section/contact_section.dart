import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/profile_data.dart';
import 'package:portfolio_web/constants/size.dart';
import 'package:portfolio_web/constants/svg_string.dart';
import 'package:portfolio_web/styles/style.dart';
import 'package:portfolio_web/widgets/contact_section/custome_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  final double screenWidth;
  const ContactSection({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1.withOpacity(0.3),
      child: Column(
        children: [
          Text(
            "Get in touch",
            style: GoogleFonts.sriracha(
              color: CustomColor.whitePrimary,
              fontSize: 40,
              wordSpacing: 5,
            ),
          ),
          Flex(
            direction: screenWidth > 1300 ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.string(
                svgString,
                // colorFilter: ColorFilter.mode(
                // CustomColor.yellowPrimary.withOpacity(0.5), BlendMode.srcIn),
                alignment: Alignment.center,
                width: screenWidth > 1300 ? screenWidth / 3 : screenWidth / 2,
                fit: BoxFit.fitHeight,
              ),
              Column(
                children: [
                  //Title
                  const SizedBox(
                    height: 50,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 700,
                      maxHeight: 100,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth >=
                            minDesktopWindowWidthImage) {
                          return buildNameEmailFieldDesktop();
                        } else {
                          return buildNameEmailFiledMobile();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 700,
                    ),
                    child: const CustomTextField(
                      hintText: "Your Message",
                      maxLines: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //send Button
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 700,
                    ),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: elevatedButtonStyle,
                        child: const Text(
                          "Get in touch",
                          style: elevatedButtonTextStyle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Icon Button Links
                ],
              ),
            ],
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            child: const Divider(),
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [ProfileLinks.facebook]);
                },
                child: Image.asset(
                  "assets/icons8-facebook-48.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [ProfileLinks.telegram]);
                },
                child: Image.asset(
                  "assets/icons8-telegram-48.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [ProfileLinks.instagram]);
                },
                child: Image.asset(
                  "assets/icons8-instagram-48.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [ProfileLinks.linkedin]);
                },
                child: Image.asset(
                  "assets/icons8-linkedin-48.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [ProfileLinks.github]);
                },
                child: Image.asset(
                  "assets/icons8-github-48.png",
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return const Row(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your Name",
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Flexible(
          child: CustomTextField(
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFiledMobile() {
    return const Column(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your Name",
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Flexible(
          child: CustomTextField(
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }
}
