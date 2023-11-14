import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final vehiclenameController = TextEditingController();
  final vehiclenoController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
  
  
  Future addUserDetails(

      String name, String vehiclename, String vehicleno, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Name': name,
      'VehicleName': vehiclename,
      'VehicleNo': vehicleno,
      'Email': email,

    });
  }
Future signUp() async {
  
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    addUserDetails(
        nameController.text.trim(),
        vehiclenameController.text.trim(),
        vehiclenoController.text.trim(),
        emailController.text.trim(),
        );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.car_rental,
            size: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Welcome to Smart Parking System',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MyTextField(
              controller: nameController, hintText: 'Name', obscureText: false),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: vehiclenameController,
              hintText: 'Vehicle Name',
              obscureText: false),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: vehiclenoController,
              hintText: 'Vehicle Number',
              obscureText: false),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: passwordController,
              hintText: 'Create Password',
              obscureText: true),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            onTap: signUp,
            buttontext: 'Sign Up',
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already a member ? ',
                style: TextStyle(color: Colors.grey[700], fontSize: 18),
              ),
              GestureDetector(
                onTap: widget.showLoginPage,
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )
            ],
          )
        ],
      ))),
    );
  }
}
