import 'package:flutter/material.dart';
import 'package:prectice0702/ui/global.dart';
import 'package:prectice0702/widgets/wave_widget.dart';
import 'package:provider/provider.dart';

import '../viewmodels/home_model.dart';
import '../widgets/button_widget.dart';
import '../widgets/textfiled_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(height: size.height - 200, color: Global.mediumPurple),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 : 0.0,
              child: WavWidget(
                size: size,
                yOffset: size.height / 3.0,
                color: Global.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Global.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextFieldWidget(
                    hintText: 'Email',
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                    onChanged: (value) {
                      model.isValidEmail(value);
                    },
                    suffixIconData: model.isValid ? Icons.check : null,
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFieldWidget(
                        hintText: 'Password',
                        obscureText: model.isVisible ? false : true,
                        prefixIconData: Icons.mail_outline,
                        onChanged: (value) {},
                        suffixIconData: model.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Forgot password?',
                        style: TextStyle(color: Global.mediumPurple),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ButtonWidget(title: 'Login', hasBorder: false),
                  SizedBox(height: 20),
                  ButtonWidget(title: 'Sign Up', hasBorder: true),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
