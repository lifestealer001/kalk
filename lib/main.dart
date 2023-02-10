import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController controller = TextEditingController();


  Widget button(
    String l,
    
  ) {
    return ElevatedButton(
        onPressed: () {
          controller.text += l;
        },
        child: Text(l));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
          ),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.none,
            controller: controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button('x2'),
              button('%'),
              ElevatedButton(
                  onPressed: () {
                    String s = controller.text;
                    controller.text = s.substring(0, s.length - 1);
                  },
                  child: Text('C')),
              ElevatedButton(
                  onPressed: () {
                    controller.text = ' ';
                  },
                  child: Text('clear')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button('1'),
              button('2'),
              button('3'),
              button('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button('4'),
              button('5'),
              button('6'),
              button('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button('7'),
              button('8'),
              button('9'),
              button('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button('.'),
              button('0'),
              ElevatedButton(
                  onPressed: () {
                    
                    String s = controller.text;
                    String b = '/*-+';
                    List<int> ind = [];
                    List<num> numbers = [];

                    for (int i = 0; i < s.length; i++) {
                      if (b.contains(s[i])) {
                        ind.add(i);
                      }
                    }
                    numbers.add(num.parse(s.substring(0, ind[0])));
                    for (int t = 0; t < ind.length - 1; t++) {
                      numbers
                          .add(num.parse(s.substring(ind[t] + 1, ind[t + 1])));
                    }
                    numbers.add(num.parse(s.substring(ind[ind.length - 1])));
                    

                    for (int i = 0; i < ind.length; i++) {
                      if (s[ind[i]] == '*') {
                        numbers[i] = numbers[i] * numbers[i + 1];
                        numbers.removeAt(i + 1);
                        ind.removeAt(i);
                        i--;
                      } else if (s[ind[i]] == '/') {
                        numbers[i] = numbers[i] / numbers[i + 1];
                        numbers.removeAt(i + 1);
                        ind.removeAt(i);
                        i--;
                      }
                    }
                    for (int i = 0; i < ind.length; i++) {
                      if (s[ind[i]] == '+') {
                        numbers[i] = numbers[i] + numbers[i + 1];
                        numbers.removeAt(i + 1);
                        ind.removeAt(i);
                        i--;
                      } else if (s[ind[i]] == '-') {
                        numbers[i] = numbers[i] - numbers[i + 1];
                        numbers.removeAt(i + 1);
                        ind.removeAt(i);
                        i--;
                      }
                    }
                    controller.text = numbers[0].toString();
                  },
                  child: Text('=')),
              button('/'),
            ],
          ),
        ],
      )),
    );
  }
}
