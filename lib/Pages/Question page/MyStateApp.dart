import 'package:flutter/material.dart';
import 'package:fluttertest/Extensions/HexColor.dart';
import 'package:fluttertest/Model/AnswerModel.dart';
import '../../Model/QuestionModel.dart';
import 'MyApp.dart';

class MyAppState extends State<MyApp> {

  // MARK:- TODO:- this my variable where store my data.
  List<QuestionModel> questions = [];
  var index = 0;

  // MARK:- TODO:- This Method draw the widget based on the specify structure
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // Devide Page to App Bar And Body.
            appBar: AppBar(
              title: Text('Home Screen'),
              centerTitle: true,
            ),

            // Body
            body: Column(children: childText())
        )
    );
  }

  // MARK:- TODO:- this my function that load data internal in the class.
  _initialiseData() {
    var questionmodel = QuestionModel(
        questionName: "what's' your name?",
        answers: [
          AnswerModel(answers: "Answer(1)",selected: false),
          AnswerModel(answers: "Answer(2)",selected: false),
          AnswerModel(answers: "Answer(3)",selected: false),
          AnswerModel(answers: "Answer(4)",selected: false)
        ]);
    questions.add(questionmodel);
    questionmodel = QuestionModel(
        questionName: "what's your hobby?",
        answers: [
          AnswerModel(answers: "Foot ball",selected: false),
          AnswerModel(answers: "Basket ball",selected: false),
          AnswerModel(answers: "Vally ball",selected: false),
          AnswerModel(answers: "Tennis",selected: false)
        ]);
    questions.add(questionmodel);
  }
  // -------------------------------------------------------------

  // MARK:- TODO:- this method initialise the Widgets based on data.
  List<Widget> childText() {
    // make widget and array for it.
    Widget text;
    List<Widget> arr = [];

    _initialiseData();

    QuestionModel q = questions[index];
    text = Text(q.questionName);
    arr.add(text);
    for (var j=0;j<q.answers.length;j++) {
      arr.add(ElevatedButton(onPressed: ()  {
        setState(() {
          print("Button ${q.answers[j].answers} pressed");
          if (index >= questions.length) {
            index = 0;
          }
          else {
            index += 1;
          }

          q.answers[j].selected = !q.answers[j].selected;
          print("Flag is ${q.answers[j].selected}");
        });
      },
          child: Text(q.answers[j].answers),
            style: ElevatedButton.styleFrom(
                primary: q.answers[j].selected == false ? HexColor.fromHex("#0883f6") : Colors.pink
            ))
      );

    }

    return arr;
  }
// -------------------------------------------------------------
}