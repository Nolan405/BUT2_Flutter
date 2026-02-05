import 'package:flutter/material.dart';
import 'myButtons.dart';
import '../model/question.dart';

class MyWidget extends StatefulWidget {
  final Color color;
  final double textSize;
  final ButtonStyle? btnStyle;
  const MyWidget({
    super.key,
    required this.color,
    required this.textSize,
    this.btnStyle,
  });
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _currentQuestion = 0;
  static final List<Question> _questions = [
    Question.name("The question number 1 is a "
        "very long question and her answer is true.", true, "quiz.png"),
    Question.name("The question number 2 is true again.", true,
        "quiz.png"),
    Question.name("The question number 3 is false.", false, "quiz.png"),
    Question.name("The question number 4 is false again.", false,
        "quiz.png"),
    Question.name("The question number 5 is true.", true, "quiz.png"),
    Question.name("The question number 6 is true again.", true,
        "quiz.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              "Quiz App",
              style: TextStyle(
                color: Colors.white,
              ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
        ),
        backgroundColor: widget.color,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Image.asset("img/quiz.png",width: 250,height: 180,),
                Container(
                    decoration: BoxDecoration(
                        color: widget.color,
                       borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(5, 5),
                          ),
                        ],
                    ),
                    height:120.0,
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          _questions[_currentQuestion].questionText,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: widget.textSize,
                          ),
                        )
                    )
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: ()=> _previousQuestion(),
                        style: myButtonStyle,
                        child: const Icon(Icons.arrow_back, color:
                        Colors.white,),),
                      ElevatedButton(onPressed: ()=> _checkAnswer(true, context),
                        style: myButtonStyle,
                        child: const Text("TRUE",style: TextStyle(color:
                        Colors.white)),),
                      ElevatedButton(onPressed: ()=> _checkAnswer(false, context),
                        style: myButtonStyle,
                        child: const Text("FALSE",style: TextStyle(color:
                        Colors.white)),),
                      ElevatedButton(onPressed: ()=> _nextQuestion(),
                        style: myButtonStyle,
                        child: const Icon(Icons.arrow_forward, color:
                        Colors.white,),),
                    ])
              ]
            )
        )
    );
  }

  void _previousQuestion() {
    setState(() {
      _currentQuestion = (_currentQuestion-1)%_questions.length;
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestion = (_currentQuestion+1)%_questions.length;
    });
  }

  void _checkAnswer(bool choice, BuildContext context) {
    if (choice == _questions[_currentQuestion].isCorrect){
      debugPrint("good");
      const mySnackBar = SnackBar(
        content: Text("GOOD ANSWER!!!",style: TextStyle(fontSize: 20)),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.lightGreen,
        width: 180.0,
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),);
      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
    } else{
      debugPrint("bad");
      const mySnackBar = SnackBar(
          content: Text("BAD ANSWER!!!",style: TextStyle(fontSize: 20),),
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.red,
          width: 180.0,
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),);
      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
    }
    _nextQuestion();
  }
}