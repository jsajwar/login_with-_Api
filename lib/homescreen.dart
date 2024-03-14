// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  void login(String email, password) async {
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': 'eve.holt@reqres.in', 'password': 'cityslicka'});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print("account create successfully");
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login With API '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(hintText: 'Enter Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passcontroller,
              decoration: const InputDecoration(hintText: 'Enter Password'),
            ),
            const SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: () {
                login(emailcontroller.text.toString(),
                    passcontroller.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
