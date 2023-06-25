import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
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
            child: const Text('boton1'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(

            onPressed: () async {
              var contact = "+34655742214";
              var androidUrl = "whatsapp://send?phone=$contact&text=hola";
              var iosUrl = "https://wa.me/$contact?text=${Uri.parse('mi mensage')}";
              launchUrl(Uri.parse('https://wa.me/$contact?text=hola'),
                  mode: LaunchMode.externalApplication);

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
            child: const Text('Envia Whatsapp'),
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
