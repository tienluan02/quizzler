import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

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

  static const List<String> questionstore = [
    'are you a boy',
    'are you gay',
    'do you want to have a date with me',
  ];

  static const List<bool> answers = [true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Center(
          child: Text(
            'Quizzler',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 200),
            child: Center(
              child: Text(
                'Quizzler Time !',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
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
              child: const Text('Create the quiz'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizPage(
                          questionstore: questionstore, answers: answers)),
                );
              },
              child: const Text('Start the quiz'),
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
  TextEditingController _questionController = TextEditingController();
  TextEditingController _studentName = TextEditingController();
  List<String> questionstore = [];
  List<bool> answers = [];
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Center(
          child: Text(
            'Create the quiz !         ',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              'Enter your name:',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
          ),
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
                  name = value;
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Expanded(
                child: Text(
              'Enter the questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
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
                        questionstore.add(_questionController.text);
                        answers.add(true);
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
                        questionstore.add(_questionController.text);
                        answers.add(false);
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
          Text (
            'Your name: ' + name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            'Questions added:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questionstore.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    questionstore[index] + ' - ' + answers[index].toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
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
                            questionstore: questionstore, answers: answers)),
                  );
                },
                child: const Text('Start the quiz'),
              ))
        ],
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final List<String> questionstore;
  final List<bool> answers;

  const QuizPage(
      {super.key, required this.questionstore, required this.answers});

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
        title: const Text(
          'Quizzler',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('your points: $score',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      widget.questionstore[questioncounter],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    if (widget.answers[questioncounter] == true) {
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
                    if (widget.answers[questioncounter] == false) {
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
