import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/screens/authenticate/authenticate.dart';
import 'package:firebase_app/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate widget

    final user = context.watch<User?>();
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
