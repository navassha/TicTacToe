// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_teo/extensions/responsive_size.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int playero = 0;
  int playerx = 0;
  bool turn = true;
  List<String> showingVariable = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: EdgeInsets.all(context.width(10)),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: context.width(200),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        "SCORE BOARD!",
                        style: TextStyle(
                          fontSize: context.width(25),
                          fontFamily: "Silikscreen",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: context.width(40),
                      ),
                      Row(
                        children: [
                          Text(
                            "PLAYER X : $playerx",
                            style: TextStyle(
                                fontFamily: "Silikscreen",
                                fontSize: context.width(context.width(20)),
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Text(
                            "PLAYER 0 : $playero",
                            style: TextStyle(
                                fontFamily: "Silikscreen",
                                fontSize: context.width(context.width(20)),
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _tapping(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        // we are passing the position of each container clicked
                        showingVariable[index],

                        // index.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: context.width(70),
                          color: showingVariable[index] == "x"
                              ? const Color.fromARGB(255, 55, 165, 255)
                              : const Color.fromARGB(255, 255, 74, 74),
                          fontFamily: "Silikscreen",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: context.width(200),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // there we clear all things like player X and player O score into
                              // zero and cleaning the List
                              for (var i = 0; i < showingVariable.length; i++) {
                                showingVariable[i] = "";
                              }
                              playero = 0;
                              playerx = 0;
                            });
                          },
                          child: CircleAvatar(
                            radius: context.width(35),
                            backgroundColor: Colors.white,
                            child: Icon(
                              CupertinoIcons.restart,
                              color: Colors.black,
                              size: context.width(
                                context.width(35),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "@navvs.n",
                      style: TextStyle(
                        fontSize: context.width(15),
                        fontFamily: "Silikscreen",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapping(int index) {
    // there is the wotking of each container click
    // and showing Wich User is made a Move
    setState(() {
      if (turn && showingVariable[index] == "") {
        showingVariable[index] = "o";
      } else if (!turn && showingVariable[index] == "") {
        showingVariable[index] = "x";
      }
      turn = !turn;
      winner();
    });
  }

// this function guves us which column or row is
// giving a winner and checking each condition
  void winner() {
    if (showingVariable[0] == showingVariable[1] &&
        showingVariable[0] == showingVariable[2] &&
        showingVariable[0] != "") {
      showWinnerDailog(showingVariable[0]);
    } else if (showingVariable[3] == showingVariable[4] &&
        showingVariable[3] == showingVariable[5] &&
        showingVariable[3] != "") {
      showWinnerDailog(showingVariable[3]);
    } else if (showingVariable[6] == showingVariable[7] &&
        showingVariable[6] == showingVariable[8] &&
        showingVariable[6] != "") {
      showWinnerDailog(showingVariable[6]);
    } else if (showingVariable[0] == showingVariable[3] &&
        showingVariable[0] == showingVariable[6] &&
        showingVariable[0] != "") {
      showWinnerDailog(showingVariable[0]);
    } else if (showingVariable[1] == showingVariable[4] &&
        showingVariable[1] == showingVariable[7] &&
        showingVariable[1] != "") {
      showWinnerDailog(showingVariable[1]);
    } else if (showingVariable[2] == showingVariable[5] &&
        showingVariable[2] == showingVariable[8] &&
        showingVariable[2] != "") {
      showWinnerDailog(showingVariable[2]);
    } else if (showingVariable[0] == showingVariable[4] &&
        showingVariable[0] == showingVariable[8] &&
        showingVariable[0] != "") {
      showWinnerDailog(showingVariable[0]);
    } else if (showingVariable[2] == showingVariable[4] &&
        showingVariable[2] == showingVariable[6] &&
        showingVariable[2] != "") {
      showWinnerDailog(showingVariable[2]);
    } else if (showingVariable[0] != "" &&
        showingVariable[1] != "" &&
        showingVariable[2] != "" &&
        showingVariable[4] != "" &&
        showingVariable[5] != "" &&
        showingVariable[6] != "" &&
        showingVariable[7] != "" &&
        showingVariable[8] != "") {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: context.width(130),
            width: context.width(300),
            color: Colors.grey[600],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DRAW!",
                  style: TextStyle(
                    fontFamily: "Silikscreen",
                    fontWeight: FontWeight.w600,
                    fontSize: context.width(25),
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: context.width(10),
                ),
                _restartContainer(context)
              ],
            ),
          ),
        ),
      );
    }
  }

// this function gives a show dailog to show winner and reset the whole game

  void showWinnerDailog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          width: context.width(300),
          height: context.width(150),
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(
              context.width(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Winner is : $winner",
                style: TextStyle(
                    fontFamily: "Silikscreen",
                    fontWeight: FontWeight.w600,
                    fontSize: context.width(25),
                    color: Colors.white),
              ),
              SizedBox(
                height: context.width(10),
              ),
              _restartContainer(context)
            ],
          ),
        ),
      ),
    );

    // there we are finiding the winner and adding thair score into score board

    setState(() {
      if (winner == "x") {
        playerx += 1;
      } else if (winner == "o") {
        playero += 1;
      }
    });
  }

// this container used to restart the game
// and starts new game and adding the scores to score board

  GestureDetector _restartContainer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var i = 0; i < showingVariable.length; i++) {
            showingVariable[i] = "";
          }
        });
        Navigator.pop(context);
      },
      child: Container(
        width: context.width(160),
        height: context.width(50),
        decoration: BoxDecoration(
          border: Border.all(
            width: context.width(1),
            color: Colors.white,
          ),
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(
            context.width(10),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width(10)),
            child: Text(
              "PLAY AGAIN",
              style: TextStyle(
                fontFamily: "Silikscreen",
                fontWeight: FontWeight.w600,
                fontSize: context.width(19),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
