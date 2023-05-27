import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BTVN051802 extends StatelessWidget {
  const BTVN051802({super.key});

  static const List<Color> lstColor1 = [
    Color(0xffFD8D61),
    Color(0xff74FF71),
    Color(0xffFC7FA8),
  ];

  static const List<Color> lstColor2 = [
    Color(0xffFDB99B),
    Color(0xffA8FFBB),
    Color(0xffFED5E1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TODO LIST-APP',
                    style: GoogleFonts.dancingScript(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        color: Color(0xff4c4c4c),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: const Color(0xffFDB99B),
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(
                      'Add Task',
                      style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                'Daily task',
                style: GoogleFonts.dancingScript(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    color: Color(0xff4c4c4c),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xffFAEADF),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 2,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: double.infinity,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: lstColor1[index % 3],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(40)),
                                ),
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Text(
                                    'Study',
                                    style: GoogleFonts.dancingScript(
                                      textStyle: const TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: lstColor2[index % 3],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: lstColor1[index % 3],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Hoc tap va lam viec',
                                                style:
                                                    GoogleFonts.dancingScript(
                                                  textStyle: const TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '8 AM - 1 PM',
                                                style:
                                                    GoogleFonts.dancingScript(
                                                  textStyle: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                'Consequatur maxime nam dolore qui optio molestiae laudantium sequi. Ipsam rerum ut. Ut iste repellendus et praesentium vero. Aut ea est nostrum. Explicabo laboriosam officiis placeat sed cum aut maiores.',
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            bottom: -15,
                            right: 0,
                            child: Row(
                              children: [
                                CustomButton(
                                  color: Color(0xffE29833),
                                  icon: Icons.workspace_premium,
                                ),
                                CustomButton(
                                  color: Color(0xffF2E45E),
                                  icon: Icons.browse_gallery,
                                ),
                                CustomButton(
                                  color: Color(0xff6EBF6E),
                                  icon: Icons.edit,
                                ),
                                CustomButton(
                                  color: Color(0xff57A3EC),
                                  icon: Icons.delete_forever,
                                ),
                                CustomButtonInk(
                                  color: Color(0xff57A3EC),
                                  icon: Icons.delete_forever,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 50);
                  },
                  itemCount: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.black,
      child: Container(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color,
              // spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 25, color: color),
      ),
    );
  }
}

class CustomButtonInk extends StatelessWidget {
  const CustomButtonInk({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.amber,
      child: Ink(
        padding: EdgeInsets.zero,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color,
              // spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 25, color: color),
      ),
    );
  }
}
