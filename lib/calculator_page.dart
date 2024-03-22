import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'utils/calculator/calculator.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Calculator calculator = Calculator();

  Widget _createButton(
      {
        String? label,
      IconData? icon,
      bool black = false,
      double? width,
      double? height = 60,
      void Function()? onPressed,
      void Function()? onLongPressed,
      }) {
    if (label == null && icon == null) {
      throw UnsupportedError("Button must contain anything");
    } else if (label != null && icon != null) {
      throw UnsupportedError("Button can't contain both icon and text");
    }

    Color background = black ? Colors.black : Colors.white;
    Color foreground = black ? Colors.white : Colors.black;

    return Expanded(
      child: Material(
        color: background,
        child: InkWell(
          onLongPress: onLongPressed,
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black)),
            child: icon != null
                ? Icon(
                    icon,
                    color: foreground,
                    size: 24,
                  )
                : Text(label!, style: TextStyle(color: foreground, fontSize: 32)),
          ),
        ),
      ),
    );
  }

  Widget _createSelector({required String label}) {
    return Expanded(
      child:
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: Colors.black)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(label), Icon(Icons.arrow_drop_down)],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    String arithmeticToDisplay = calculator.toDisplay();
    if (arithmeticToDisplay.length > 18) {
      arithmeticToDisplay = "..." + arithmeticToDisplay.substring(arithmeticToDisplay.length - 12);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // TODO: Filtration on defined account(wallet)
        title: const Text("Accountify"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            height: 50,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child:
                  Text("Создать новую запись", style: TextStyle(fontSize: 20)),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(""),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                child: Row(
                  children: [
                    _createSelector(label: "Категория"),
                    _createSelector(label: "Источник"),
                  ],
                ),
              ),

              Container(
                height: 60,
                child: Row(
                  children: [
                    _createSelector(label: "Счет"),
                    _createSelector(label: "Тип"),
                  ],
                ),
              ),
              Container(
                height: 70,
                // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                color: Colors.black,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white),
                  ),
                  child: Text(
                    arithmeticToDisplay,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.white
                    ),
                    maxLines: 1,
                  )
                ),
              ),
              TextField(
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    hintText: "Метка...",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(0))),
              ),
              Row(children: [
                _createButton(onPressed: () {
                  setState(() {
                    calculator.divide();
                  });
                }, icon: FontAwesome5.divide, black: true),
                _createButton(onPressed: () {
                  setState(() {
                    calculator.numb(7);
                  });
                }, label: "7"),
                _createButton(onPressed: () {
                  setState(() {
                    calculator.numb(8);
                  });
                }, label: "8"),
                _createButton(onPressed: () {
                  setState(() {
                    calculator.numb(9);
                  });
                }, label: "9"),
                _createButton(
                  onPressed: () {
                    setState(() {
                      calculator.back();
                    });
                  },
                  onLongPressed: () {

                  }, icon: Icons.backspace, black: true),
              ]),
              Row(children: [
                _createButton(onPressed: () {
                  setState(() {
                    calculator.times();
                  });
                }, icon: FontAwesome5.times, black: true),
                _createButton(onPressed: () {
                  setState(() {
                    calculator.numb(4);
                  });
                }, label: "4"),
                _createButton(onPressed: () {
                  setState(() {
                    calculator.numb(5);
                  });
                }, label: "5"),
                _createButton(onPressed: () {
                  setState(() {
                    calculator.numb(6);
                  });
                }, label: "6"),
                _createButton(icon: FontAwesome5.calendar_alt, black: true),
              ]),
              LayoutBuilder(
                  builder: (_, constraints) => Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 4 / 5,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    _createButton(
                                      onPressed: () {
                                        setState(() {
                                          calculator.minus();
                                        });
                                      },
                                      icon: FontAwesome5.minus,
                                      black: true,
                                    ),
                                    _createButton(onPressed: () {
                                      setState(() {
                                        calculator.numb(1);
                                      });
                                    }, label: "1"),
                                    _createButton(onPressed: () {
                                      setState(() {
                                        calculator.numb(2);
                                      });
                                    }, label: "2"),
                                    _createButton(onPressed: () {
                                      setState(() {
                                        calculator.numb(3);
                                      });
                                    }, label: "3"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _createButton(
                                      onPressed: () {
                                        setState(() {
                                          calculator.plus();
                                        });
                                      },
                                      icon: FontAwesome5.plus,
                                      black: true,
                                    ),
                                    SizedBox(
                                        width: constraints.maxWidth * 2 / 5,
                                        child: _createButton(onPressed: () {
                                          setState(() {
                                            calculator.numb(0);
                                          });
                                        }, label: "0")),
                                    _createButton(onPressed: () {
                                      setState(() {
                                        calculator.dot();
                                      });
                                    },label: "."),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          _createButton(
                            onPressed: () {
                              setState(() {
                                calculator.equals();
                              });
                            },
                            icon: FontAwesome5.equals,
                            black: true,
                            width: constraints.maxWidth * 1 / 5,
                            height: 120),
                        ],
                      ))
            ],
          )
        ],
      ),
    );
  }
}
