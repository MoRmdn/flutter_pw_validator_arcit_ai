import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text("Flutter Pw Validator"),
            ),
            body: new AppHome()));
  }
}

class AppHome extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();

  ///Passing a key to access the validate function
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  @override
  Widget build(BuildContext context) {
    return new Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.5),
        child: Column(
          children: [
            new Flexible(flex: 5, child: new FlutterLogo(size: 200)),
            Flexible(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: new TextField(
                            controller: controller,
                            decoration: new InputDecoration(
                                hintText: "Password",
                                border: new OutlineInputBorder(
                                    borderSide: BorderSide()))),
                      ),
                      new SizedBox(
                        height: 5,
                      ),
                      new FlutterPwValidator(
                        title: Row(
                          children: [
                            new Text("Password must contain:"),
                            new SizedBox(width: 5),
                            new Icon(Icons.lock, size: 20)
                          ],
                        ),
                        key: validatorKey,
                        controller: controller,
                        minLength: 8,
                        uppercaseCharCount: 2,
                        lowercaseCharCount: 3,
                        numericCharCount: 3,
                        specialCharCount: 1,
                        normalCharCount: 3,
                        width: 400,
                        height: 210,
                        onSuccess: () {
                          print("MATCHED");
                          ScaffoldMessenger.of(context).showSnackBar(
                              new SnackBar(
                                  content: new Text("Password is matched")));
                        },
                        onFail: () {
                          print("NOT MATCHED");
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    ]);
  }
}
