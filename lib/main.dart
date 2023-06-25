import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

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

