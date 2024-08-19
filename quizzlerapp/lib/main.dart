import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'question.dart';
import 'package:quizzlerapp/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
          ),
          body: const SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HomePage(),
          ))),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<bool> answers = [true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: quizBrain.createText('Quizzler', 30),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 200),
            child: Center(
              child: quizBrain.createText('Quizzler time', 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateQuestion()),
                );
              },
              child: const Text('You are a teacher ?'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const studentName()),
                );
              },
              child: const Text('You are a student ?'),
            ),
          ),
        ],
      ),
    );
  }
}

class studentName extends StatefulWidget {
  const studentName({super.key});

  @override
  State<studentName> createState() => _studentNameState();
}

class _studentNameState extends State<studentName> {
  TextEditingController _studentName = TextEditingController();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: quizBrain.createText('Quizzler', 30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              quizBrain.createText('Enter your name: ', 25),
              TextField(
                controller: _studentName,
                decoration: const InputDecoration(
                  labelText: 'Your name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (String value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
            ],
          ),
          Column(
            children: [
              quizBrain.createText('Enter your class', 25),
              TextField(
                controller: _studentName,
                decoration: const InputDecoration(
                  labelText: 'Your class',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (String value) {
                  setState(() {
                    name = value;
                  });
                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateQuestion()),
                );
              },
              child: const Text('Enter the quiz'),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateQuestion extends StatefulWidget {
  const CreateQuestion({super.key});

  @override
  State<CreateQuestion> createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _studentName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: quizBrain.createText('Create the quiz !         ', 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            quizBrain.createText('Enter your name:', 23),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _studentName,
                decoration: const InputDecoration(
                  labelText: 'Your name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (String value) {
                  setState(() {
                    quizBrain.name  = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 15),
              child: quizBrain.createText('Enter questions:', 23),
            ),
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Type here',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: MaterialButton(
                        color: Colors.green,
                        onPressed: () {
                          setState(() {
                            if (_questionController.text.isNotEmpty) {
                              quizBrain.questionBank.add(Question(question: _questionController.text, answer: true));
                              _questionController.clear();
                            }
                          });
                        },
                        child: const Center(
                          child: Text('True'),
                        ),
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: MaterialButton(
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            if (_questionController.text.isNotEmpty) {
                              quizBrain.questionBank.add(Question(question: _questionController.text, answer: false));
                              _questionController.clear();
                            }
                          });
                        },
                        child: const Center(
                          child: Text('False'),
                        ),
                      ),
                    )),
              ],
            ),
            quizBrain.createText('Your name: ' + _studentName.text, 20),
            const Text(
              'Questions added:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 200,  // Adjust this height based on your needs
              child: ListView.builder(
                itemCount: quizBrain.questionBank.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: quizBrain.createText(quizBrain.questionBank[index].questionText + ' - ' + quizBrain.questionBank[index].questionAnswer.toString(), 20),
                  );
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizPage(
                            questionstore: quizBrain.questionBank,
                              name: quizBrain.name)),
                    );
                  },
                  child: const Text('Start the quiz'),
                ))
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final List<Question> questionstore;
  final String name;

  const QuizPage(
      {super.key,
      required this.questionstore,
      required this.name});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  int questioncounter = 0;
  List<Icon> scorebuilder = [
    const Icon(
      Icons.check,
      color: Colors.green,
    ),
    const Icon(
      Icons.close,
      color: Colors.red,
    )
  ];

  List<Icon> scorekeeper = [];

  int scoreCount() {
    for (int i = 0; i < scorekeeper.length; i++) {
      if (scorekeeper[i] == scorebuilder[0]) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: quizBrain.createText('Quizzler', 30),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: quizBrain.createText(widget.name, 25),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: quizBrain.createText('your points: $score', 25)
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: quizBrain.createText(widget.questionstore[questioncounter].questionText, 30),
                  ),
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    if (widget.questionstore[questioncounter].questionAnswer == true) {
                      scorekeeper.add(scorebuilder[0]);
                      score++;
                    } else {
                      scorekeeper.add(scorebuilder[1]);
                    }
                    questioncounter++;
                    if (questioncounter == widget.questionstore.length) {
                      questioncounter = 0;
                    }
                  });
                },
                child: const Center(
                  child: Text('True'),
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    if (widget.questionstore[questioncounter].questionAnswer == false) {
                      scorekeeper.add(scorebuilder[0]);
                      score++;
                    } else {
                      scorekeeper.add(scorebuilder[1]);
                    }
                    questioncounter++;
                    if (questioncounter == widget.questionstore.length) {
                      questioncounter = 0;
                    }
                  });
                },
                child: const Center(
                  child: Text('False'),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: Row(
                children: scorekeeper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
