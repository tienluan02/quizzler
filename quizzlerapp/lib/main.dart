import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
            padding: EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 200),
            child: Center(
              child: Text(
                'Quizzler Time !',
                style: TextStyle(
                  fontSize: 50.0,
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
                  MaterialPageRoute(builder: (context) => const CreateQuestion()),
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
                  MaterialPageRoute(builder: (context) => const QuizPage()),
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
  List<String> questionstore = [

  ];
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
            padding: const EdgeInsets.only(left: 15.0),
            child: Expanded(
                child: Text(
                  'Enter the questions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
            ),
          ),
          TextField(
            controller: _questionController,
            decoration: const InputDecoration(labelText: 'Who are you ?'),
          ),
        ],
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

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

  List<String> questionstore = [];

  int scoreCount() {
    for (int i = 0; i < scorekeeper.length; i++) {
      if (scorekeeper[i] == scorebuilder[0]) {
        score++;
      }
    }
    return score;
  }

  int scoreprinter() {
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
// Expanded(child: child)
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questionstore[questioncounter],
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
                    scorekeeper.add(scorebuilder[0]);
                    questioncounter++;
                    if (questioncounter == questionstore.length) {
                      questioncounter = 0;
                    }
                  });
                },
                child: Center(
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
                    scorekeeper.add(scorebuilder[1]);
                    questioncounter++;
                    if (questioncounter == questionstore.length) {
                      questioncounter = 0;
                    }
                  });
                },
                child: Center(
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
