import 'package:flutter/material.dart';
import 'package:tic_tac_teo/extensions/responsive_size.dart';
import 'package:tic_tac_teo/view/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(context.width(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TIC TOC TOE",
              style: TextStyle(
                fontSize: context.width(35),
                color: Colors.white,
                fontFamily: "Silikscreen",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: context.width(30),
            ),
            Container(
              height: context.width(400),
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/giphy.gif",
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.width(160),
                    width: context.width(160),
                    child: Image.asset(
                      "assets/images/tic-tac-toe-hand-drawn-game.png",
                      color: Colors.white,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "@CREATEDNAVVS.N",
              style: TextStyle(
                  fontSize: context.width(23),
                  color: Colors.white,
                  fontFamily: "Silikscreen"),
            ),
            SizedBox(
              height: context.width(30),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const GameScreen(),
                    transitionDuration: const Duration(milliseconds: 600),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                );
              },
              child: Container(
                width: context.width(200),
                height: context.width(50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    context.width(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    "START",
                    style: TextStyle(
                        fontSize: context.width(25),
                        fontFamily: "Silikscreen",
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
