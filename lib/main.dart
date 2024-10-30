import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/application_color.dart';

void main() {
  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                "Learning State Managemnet Provider",
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: const EdgeInsets.only(bottom: 20),
                    color: applicationColor.color,
                    width: 100,
                    height: 100,
                    duration: const Duration(seconds: 3),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("AB"),
                    Consumer<ApplicationColor>(
                        builder: (context, applicationColor, _) => Switch(
                            value: applicationColor.isLightBlue,
                            onChanged: (value) {
                              applicationColor.isLightBlue = value;
                            })),
                    const Text("LB")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
