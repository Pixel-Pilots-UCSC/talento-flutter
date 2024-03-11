import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:talento/bloc/boolean_bloc.dart';

import '../bloc/signup_bloc.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final BooleanBloc _passwordVisible = BooleanBloc();
  final BooleanBloc _confirmPasswordVisible = BooleanBloc();
  final SignupBloc _signupBloc = SignupBloc();

  _signupUser() {
    _signupBloc.signup(
        nameController.text, emailController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    _passwordVisible.set(false);
    _confirmPasswordVisible.set(false);
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: SingleChildScrollView(
        child: Container(
          //Welcome Text, Email and Password Fields, Remember Me and Forgot Password Links, Login Button
          //with StreamBuilder for Remember Me and Password Visibility
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width * 0.9 < 350
              ? MediaQuery.of(context).size.width * 0.9
              : 350,
          child: Column(
            children: <Widget>[
              const Image(
                image: AssetImage('assets/icons/logo.png'),
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 4),
              //Sign In Text
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3EB489)),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Unlock Your Career Potential',
                          style: TextStyle(
                              fontFamily: GoogleFonts.pacifico().fontFamily,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF61677D)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Container(
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              StreamBuilder<bool>(
                stream: _passwordVisible.state,
                initialData: false,
                builder: (context, snapshot) {
                  return TextField(
                    controller: passwordController,
                    obscureText: !snapshot.data!,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(snapshot.data!
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: _passwordVisible.toggle,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              StreamBuilder<bool>(
                stream: _confirmPasswordVisible.state,
                initialData: false,
                builder: (context, snapshot) {
                  return TextField(
                    controller: passwordController,
                    obscureText: !snapshot.data!,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(snapshot.data!
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: _passwordVisible.toggle,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * 0.9 < 350
                    ? MediaQuery.of(context).size.width * 0.9
                    : 350,
                child: ElevatedButton(
                  onPressed: () {
                    _signupUser();
                  },
                  child: const Text('Signup'),
                ),
              ),
              // Don't have an account? Sign Up
              // const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Already have an account?'),
                  SizedBox(width: 6),
                  TextButton(onPressed: null, child: Text('Sign In')),
                ],
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
