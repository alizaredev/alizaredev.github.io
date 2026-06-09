import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'about_me_screen.dart';

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
            }
            else {
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)
                      )
                    ),
                    label: Text(
                      "Resume",
                      style: GoogleFonts.sora(),
                    ),
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
              color: Colors.black,
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    "Ali Asghar Zare", 
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            AppBarMenu(aboutKey: aboutKey, skillsKey: skillsKey, projectKey: projectKey, contactKey: contactKey),
            Divider(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              key: aboutKey,
              child: const AboutMeScreen(),
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
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Scrollable.ensureVisible(
                    aboutKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  "A B O U T  M E",
                  style: GoogleFonts.sora(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Scrollable.ensureVisible(
                    skillsKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  "S K I L L I S",
                  style: GoogleFonts.sora(),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Scrollable.ensureVisible(
                    projectKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  "P R O J E C T S",
                  style: GoogleFonts.sora(),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Scrollable.ensureVisible(
                    contactKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  "C O N T A C T   M E",
                  style: GoogleFonts.sora(),
                ),
              ),
            ],
          );
        }
        else {
        return Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Scrollable.ensureVisible(
                  aboutKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                "A B O U T   M E",
                style: GoogleFonts.sora(),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Scrollable.ensureVisible(
                  skillsKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                "S K I L L I S",
                style: GoogleFonts.sora(),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Scrollable.ensureVisible(
                  projectKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                "P R O J E C T S",
                style: GoogleFonts.sora(),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Scrollable.ensureVisible(
                  contactKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                "C O N T A C T   M E",
                style: GoogleFonts.sora(),
              ),
            ),
          ],
        );
        }
      }
    );
  }
}
