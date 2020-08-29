import 'package:flutter/material.dart';
import 'package:futsal/modals/user.dart';
import 'package:futsal/services/auth.dart';
import 'package:futsal/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Wrapper(),
      ),
    );
  }
}
