import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/skill.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final List<Skill> skills = [
    Skill(name: "Flutter", icon: FontAwesomeIcons.flutter),
    Skill(name: "Git", icon: FontAwesomeIcons.git),
    Skill(name: "Dart", icon: FontAwesomeIcons.dartLang),
    Skill(name: "GetX", icon: FontAwesomeIcons.diagramProject),
    Skill(name: "Hive Database", icon: FontAwesomeIcons.database),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              children: [
                Text(
                  "My Skills",
                  style: GoogleFonts.sora(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: skills.length,
                      itemBuilder: (BuildContext context, int index) {
                        Skill skill = skills[index];
                        return SkillContainer(skill: skill);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "My Skills",
                    style: GoogleFonts.sora(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 1,
                          crossAxisSpacing: 45,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: skills.length,
                        itemBuilder: (BuildContext context, int index) {
                          Skill skill = skills[index];
                          return SkillContainer(skill: skill);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -121.5,
              right: 33,
              child: Image.asset("assets/images/cat.png", height: 200),
            ),
          ],
        );
      },
    );
  }
}

class SkillContainer extends StatefulWidget {
  const SkillContainer({super.key, required this.skill});
  final Skill skill;

  @override
  State<SkillContainer> createState() => _SkillContainerState();
}

class _SkillContainerState extends State<SkillContainer> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isHover ? Color(0xfffbf6ed) : Color(0xff12140b),
          border: Border.all(
            color: isHover ? Color(0xff12140b) : Color(0xfffbf6ed),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (MediaQuery.sizeOf(context).width < 600) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    widget.skill.icon,
                    color: isHover ? Color(0xff12140b) : Colors.white,
                    size: 36,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      widget.skill.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isHover ? Color(0xff12140b) : Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  widget.skill.icon,
                  color: isHover ? Color(0xff12140b) : Colors.white,
                  size: 40,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    widget.skill.name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: isHover ? Color(0xff12140b) : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
