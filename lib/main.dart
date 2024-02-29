import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

List <Icon> myicon = [ ];

class _QuizPageState extends State<QuizPage> {

  int d= 0;

  void decison (bool slected){
      d++;
      print(d);


      if(quizBrain.questionreset() == true){
        Alert(
            context: context,
            title: "FINISHED!!",
            desc: "You have reached the end of the quizz").show();
        setState(() {
        quizBrain.reset();
        myicon.clear();
        });
      }
      else {
        setState(() {
          bool correct = quizBrain.getans();
          if (correct == slected) {
            myicon.add(Icon(Icons.check, color: Colors.green),);
            // print('CORRECT!!');
          }
          else {
            myicon.add(Icon(Icons.close, color: Colors.red),);
          }
          quizBrain.questionchange();
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getqbank(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child:Container(
              color:Colors.green,
              child: InkWell(
                child: Center(
                  child: Text(
                     'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onTap: () {
                  decison(true);
                },
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: InkWell(
                child: const Center(
                  child: Text(
                    'False',

                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                   decison(false);
                  },),
              ),
            ),
          ),

        Row(children: myicon),
      ],
    );
  }
}



// List <String> quest = <String> [
//   'You can lead a cow down stairs but not up stairs.',
//   'Approximately one quarter of human bones are in the feet.',
//   'A slug\'s blood is green.',
// ];
// List <bool> ans = [
//   false,
//   true,
//   false,
// ];