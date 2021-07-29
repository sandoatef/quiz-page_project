import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> answersList = [];
  double score = 0;
  int questionNumber = 0;
  Map<String, bool> questions = {
    "The Result of 5 * 5 = 10": false,
    "Cat is an animal": true,
    "The Result of 20 +20 = 40": true,
    "Birds can flay ": true,
    "The Result of 2 * 2 + 50 = 54 ": true,
    "The Result of 100 * 10 = 1000": true,
    "The Result of 10 * 70 + 80 = 700": false,
    "The Result of 15 *10 + 50 = 170": false,
    "The Result of 10 * 70 + 80 = 780": true,
    "The Result of 10 * 200 + 80 = 20100": false,
  };

  loadNextQuestion() {
    if (questionNumber < questions.length) {
      setState(() {
        questionNumber++;
      });
    } else {
      return;
    }
  }

  calculateScore() {
    setState(() {
      score += 10;
    });
  }

  loadPreviousQuestion() {
    if (questions.length > 0) {
      setState(() {
        questionNumber--;
        score += 10;
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Quiz App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: questionNumber == questions.length
          ? Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      score >= 60 ? Icons.check_circle : Icons.clear,
                      size: 50,
                      color: score >= 60 ? Colors.green : Colors.red,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30.0, right: 10, left: 10),
                      child: Text(
                        score < 60
                            ? "You fail and your grade is $score"
                            : "You pass and your grade is $score",
                        style: TextStyle(
                          color: score < 60 ? Colors.red : Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Your Grade Is ${(score * 100) / 100}\%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        width: screenWidth * .6,
                        height: screenHeight * .12,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              score = 0;
                              questionNumber = 0;
                              answersList.clear();
                            });
                          },
                          child: Text(
                            "Retake",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: Text(
                          questions.keys.elementAt(questionNumber).toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50.0, right: 20, left: 20, bottom: 20),
                      child: Container(
                        height: screenHeight * .1,
                        width: screenWidth * .6,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            if (questions.values.elementAt(questionNumber) ==
                                true) {
                              answersList.add(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ));
                              print(score);
                              calculateScore();
                              loadNextQuestion();
                            } else {
                              answersList.add(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.close,
                                    color: Colors.red, size: 20),
                              ));
                              loadNextQuestion();
                            }
                          },
                          child: Text(
                            "True",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: screenHeight * .1,
                        width: screenWidth * .6,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            if (questions.values.elementAt(questionNumber) ==
                                false) {
                              answersList.add(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ));
                              print(score);
                              calculateScore();
                              loadNextQuestion();
                            } else {
                              answersList.add(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.close,
                                    color: Colors.red, size: 20),
                              ));
                              loadNextQuestion();
                            }
                          },
                          child: Text(
                            "False",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * .15,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Your Result",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: screenHeight * .06,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: answersList,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
