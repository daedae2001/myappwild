import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _selectedButtonIndex = 0;
  late AnimationController _animationController;
  final List<Color> _buttonColors = [
    Colors.blue.shade200,
    Colors.blue.shade300,
    Colors.blue.shade400,
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
    _animationController.reset();
    _animationController.forward();
  }

  Widget _getBodyWidget() {
    switch (_selectedButtonIndex) {
      case 0:
        return FirstWidget(buttonColors: _buttonColors);
      case 1:
        return SecondWidget(buttonColors: _buttonColors);
      case 2:
        return ThirdWidget(buttonColors: _buttonColors);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: _getBodyWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedButtonIndex,
        onTap: _onButtonPressed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Button 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Button 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Button 3',
          ),
        ],
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  final List<Color> buttonColors;

  const FirstWidget({Key? key, required this.buttonColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print('Button 1 pressed');
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColors[0]),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return buttonColors[0].withOpacity(0.8);
                  }
                  return Colors.transparent;
                },
              ),
            ),
            child: const Text('Button 1'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print('Button 2 pressed');
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColors[1]),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return buttonColors[1].withOpacity(0.8);
                  }
                  return Colors.transparent;
                },
              ),
            ),
            child: const Text('Button 2'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print('Button 3 pressed');
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColors[2]),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return buttonColors[2].withOpacity(0.8);
                  }
                  return Colors.transparent;
                },
              ),
            ),
            child: const Text('Button 3'),
          ),
        ],
      ),
    );
  }
}

class SecondWidget extends StatelessWidget {
  final List<Color> buttonColors;

  SecondWidget({Key? key, required this.buttonColors}) : super(key: key);

  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _textController1,
            decoration: const InputDecoration(
              labelText: 'Text 1',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _textController2,
            decoration: const InputDecoration(
              labelText: 'Text 2',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _textController3,
            decoration: const InputDecoration(
              labelText: 'Number',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              String text1 = _textController1.text;
              String text2 = _textController2.text;
              int number = int.tryParse(_textController3.text) ?? 0;

              if (kDebugMode) {
                print('Text 1: $text1');
              }
              if (kDebugMode) {
                print('Text 2: $text2');
              }
              if (kDebugMode) {
                print('Number: $number');
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColors[0]),
              overlayColor: MaterialStateProperty.all<Color>(buttonColors[0].withOpacity(0.8)),
            ),
            child: const Text('Show Content'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print('Button pressed');
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColors[1]),
              overlayColor: MaterialStateProperty.all<Color>(buttonColors[1].withOpacity(0.8)),
            ),
            child: const Text('Show Pressed Button'),
          ),
        ],
      ),
    );
  }
}

class ThirdWidget extends StatelessWidget {
  final List<Color> buttonColors;

  ThirdWidget({Key? key, required this.buttonColors}) : super(key: key);

  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _textController1,
            decoration: const InputDecoration(
              labelText: 'Text 1',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _textController2,
            decoration: const InputDecoration(
              labelText: 'Text 2',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _textController3,
            decoration: const InputDecoration(
              labelText: 'Number',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              String text1 = _textController1.text;
              String text2 = _textController2.text;

              _textController3.text = '$text1 $text2';
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColors[2]),
              overlayColor: MaterialStateProperty.all<Color>(buttonColors[2].withOpacity(0.8)),
            ),
            child: const Text('Show Content'),
          ),
        ],
      ),
    );
  }
}
