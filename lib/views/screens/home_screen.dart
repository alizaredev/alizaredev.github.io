import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/views/screens/skills_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_me_screen.dart';
import 'contact_me_screen.dart';
import 'projects_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffbf6ed),
      appBar: AppBar(
        backgroundColor: Color(0xfffbf6ed),
        automaticallyImplyLeading: false,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Ali Asghar Zare",
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  DrawerButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Ali Asghar Zare",
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppBarMenu(
                    aboutKey: aboutKey,
                    skillsKey: skillsKey,
                    projectKey: projectKey,
                    contactKey: contactKey,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      launchUrl(
                        Uri.parse(
                          "https://drive.google.com/file/d/1Eq0LJSJGbXcp0-Uo0_b6uXoyTjAJ1APc/view?usp=sharing",
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff12140b),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    label: Text("Resume", style: GoogleFonts.sora()),
                    icon: const FaIcon(FontAwesomeIcons.file),
                  ),
                ],
              );
            }
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          spacing: 10,
          children: [
            Container(
              color: Color(0xff12140b),
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    "M E N U",
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            AppBarMenu(
              aboutKey: aboutKey,
              skillsKey: skillsKey,
              projectKey: projectKey,
              contactKey: contactKey,
            ),
            Divider(),
            ElevatedButton.icon(
              onPressed: () {
                launchUrl(
                  Uri.parse(
                    "https://drive.google.com/file/d/1Eq0LJSJGbXcp0-Uo0_b6uXoyTjAJ1APc/view?usp=sharing",
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff12140b),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              label: Text("Resume", style: GoogleFonts.sora()),
              icon: const FaIcon(FontAwesomeIcons.file),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(key: aboutKey, child: const AboutMeScreen()),
            Container(
              key: skillsKey,
              color: Color(0xff12140b),
              child: SkillsScreen(),
            ),
            Container(key: projectKey, child: ProjectsScreen()),
            Container(
              key: contactKey,
              color: Color(0xff12140b),
              child: const ContactMeScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({
    super.key,
    required this.aboutKey,
    required this.skillsKey,
    required this.projectKey,
    required this.contactKey,
  });

  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey projectKey;
  final GlobalKey contactKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Color(0xff12140b)),
                onPressed: () {
                  Scrollable.ensureVisible(
                    aboutKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text("A B O U T  M E", style: GoogleFonts.sora()),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Color(0xff12140b)),
                onPressed: () {
                  Scrollable.ensureVisible(
                    skillsKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text("S K I L L I S", style: GoogleFonts.sora()),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Color(0xff12140b)),
                onPressed: () {
                  Scrollable.ensureVisible(
                    projectKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text("P R O J E C T S", style: GoogleFonts.sora()),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Color(0xff12140b)),
                onPressed: () {
                  Scrollable.ensureVisible(
                    contactKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text("C O N T A C T   M E", style: GoogleFonts.sora()),
              ),
            ],
          );
        } else {
          return Row(
            spacing: 8.0,
            children: [
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Color(0xff12140b)),
                onPressed: () {
                  Scrollable.ensureVisible(
                    aboutKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text("A B O U T   M E", style: GoogleFonts.sora()),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Color(0xff12140b)),
                onPressed: () {
                  Scrollable.ensureVisible(
                    skillsKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text("S K I L L I S", style: GoogleFonts.sora()),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Color(0xff12140b)),
                onPressed: () {
                  Scrollable.ensureVisible(
                    projectKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text("P R O J E C T S", style: GoogleFonts.sora()),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Color(0xff12140b)),
                onPressed: () {
                  Scrollable.ensureVisible(
                    contactKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text("C O N T A C T   M E", style: GoogleFonts.sora()),
              ),
            ],
          );
        }
      },
    );
  }
}
