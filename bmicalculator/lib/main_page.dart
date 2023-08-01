import 'package:bmicalculator/constant.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 50;
  int weight = 70;

  String gender = '';

  late double bmi = calculateBMI(height: height, weight: weight);

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'Overweight';
    } else if (bmiValue > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Male");
                        setState(() {
                          gender = 'M';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: gender == 'M'
                                ? Colors.orange.withAlpha(150)
                                : Colors.orange.withAlpha(50),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.male, size: 150),
                              Text("Male"),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const Spacer(), //keep space in the middle
                    GestureDetector(
                      onTap: () {
                        print("Female");
                        setState(() {
                          gender = 'F';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: gender == 'F'
                                ? Colors.orange.withAlpha(150)
                                : Colors.orange.withAlpha(50),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.female, size: 150),
                              Text("FeMale"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Height"),
                          Text("$height", style: kInputLabelColor),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height >= 50) {
                                      height--;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: const Icon(Icons.remove, size: 40),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    height++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: const Icon(Icons.add, size: 40),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(), //keep space in the middle
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Weight"),
                          Text("$weight", style: kInputLabelColor),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 35) weight--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: const Icon(Icons.remove, size: 40),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 300) weight++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: const Icon(Icons.add, size: 40),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    const Text("BMI"),
                    Text(bmi.toStringAsFixed(2), style: kInputLabelColor),
                    Text(getResult(bmi))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
