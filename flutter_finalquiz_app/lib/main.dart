import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}
class SingleModelclass {
  final String? questions;
  final List<String>? options;
  final int? answerIndex;
  const SingleModelclass({this.questions, this.options, this.answerIndex});
}
class _QuizAppState extends State<QuizApp> {
  List allquestions = [
    const SingleModelclass(
      questions: "Who is the founder of ChatGPT?",
      options: ["Sam Altman", "Steve Ballmer", "David Filo", "Steve Chen"],
      answerIndex: 0,
    ),
    const SingleModelclass(
      questions: "The first version of HTML was written by?",
      options: [
        "Tim Berners-Lee",
        "John Brunner",
        "John McCarthy",
        "JP Eckert"
      ],
      answerIndex: 0,
    ),
    const SingleModelclass(
      questions: "How many bits is a byte?",
      options: ["4", "8", "16", "32"],
      answerIndex: 1,
    ),
    const SingleModelclass(
      questions: "Who created the first version of UNIX operating system?",
      options: [
        "Ken Thompson and Dennis Ritchie",
        "Linus Torvalds",
        "Mark Richard Shuttleworth",
        "Tim Paterson"
      ],
      answerIndex: 0,
    ),
    const SingleModelclass(
      questions: "Which of these is a search engine?",
      options: ["FTP", "Google", "Archie", "ARPANET"],
      answerIndex: 1,
    ),
  ];
  int selectedAnswer = -1;
  bool questionscreenPage = true;
  int questionIndex = 0;
  int correctanswer = 0;
  MaterialStateProperty<Color?> buttonColor(int buttonindex) {
    if (selectedAnswer != -1) {
      if (buttonindex == allquestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonindex == selectedAnswer) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.purple);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.purple);
    }
  }
  void nextQuestionPage() {
    if (selectedAnswer ==
        -1) //compulsory choose one option ,otherwise question will not change
    {
      return;
    }
    if (selectedAnswer == allquestions[questionIndex].answerIndex) {
      correctanswer++;
    }
    setState(() {
      if (questionIndex == allquestions.length - 1) {
        questionscreenPage = false;
      }
      questionIndex++;
      selectedAnswer = -1;
    });
  }
  Scaffold questionPage() {
    if (questionscreenPage == true) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 207, 235),
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          //centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question: ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${questionIndex + 1}/${allquestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 55,
              child: Text(
                allquestions[questionIndex].questions,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: buttonColor(0),
                    ),
                    onPressed: () {
                      if (selectedAnswer == -1) {
                        setState(() {
                          selectedAnswer = 0;
                        });
                      }
                    },
                    child: Text(
                      "A. ${allquestions[questionIndex].options[0]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ))),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: buttonColor(1),
                    ),
                    onPressed: () {
                      if (selectedAnswer == -1) {
                        setState(() {
                          selectedAnswer = 1;
                        });
                      }
                    },
                    child: Text(
                      "B. ${allquestions[questionIndex].options[1]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ))),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: buttonColor(2),
                    ),
                    onPressed: () {
                      if (selectedAnswer == -1) {
                        setState(() {
                          selectedAnswer = 2;
                        });
                      }
                    },
                    child: Text(
                      "C. ${allquestions[questionIndex].options[2]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ))),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: buttonColor(3),
                    ),
                    onPressed: () {
                      if (selectedAnswer == -1) {
                        setState(() {
                          selectedAnswer = 3;
                        });
                      }
                    },
                    child: Text(
                      "D. ${allquestions[questionIndex].options[3]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            nextQuestionPage();
          },
          backgroundColor: Colors.purple,
          child: const Icon(Icons.forward),
        ),
      );
    } else {
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 238, 207, 235),
          appBar: AppBar(
            title: const Text(
              "Quiz App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // centerTitle: true,
            backgroundColor: Colors.purple,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.network(
                "https://img.freepik.com/free-psd/winner-background-rendering_23-2150702443.jpg",
                width: 800,
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 200,
                child: Text(
                  "Congratulations!!!",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                height: 30,
                child: Text(
                  "Your Score Is: $correctanswer/${allquestions.length} ",
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {
                    setState(() {
                      questionIndex = 0;
                      correctanswer = 0;
                      selectedAnswer = -1;
                      questionscreenPage = true;
                    });
                  },
                  child: const Text(
                    "Reset Quiz",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return questionPage();
  }
}
