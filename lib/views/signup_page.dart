import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:talento/bloc/boolean_bloc.dart';

import '../bloc/signup_bloc.dart';
import '../models/response.dart';
import '../util/loader_util.dart';
import '../util/toast_util.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController nameController =
      TextEditingController(text: "Isurika");
  final TextEditingController emailController =
      TextEditingController(text: "isu@mathara.com");
  final TextEditingController passwordController =
      TextEditingController(text: "123456");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: "123456");
  final BooleanBloc _passwordVisible = BooleanBloc();
  final BooleanBloc _confirmPasswordVisible = BooleanBloc();
  final SignupBloc _signupBloc = SignupBloc();
  bool _initialized = false;

  _signupUser(BuildContext context) {
    //check email is valid
    if (nameController.text.isEmpty) {
      ToastUtil().showErrorToast(context, 'Error', 'Name cannot be empty');
      return;
    }
    if (emailController.text.isEmpty) {
      ToastUtil().showErrorToast(context, 'Error', 'Email cannot be empty');
      return;
    }
    if (passwordController.text.isEmpty) {
      ToastUtil().showErrorToast(context, 'Error', 'Password cannot be empty');
      return;
    }
    if (confirmPasswordController.text.isEmpty) {
      ToastUtil()
          .showErrorToast(context, 'Error', 'Confirm Password cannot be empty');
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      ToastUtil().showErrorToast(context, 'Error', 'Passwords do not match');
      return;
    }
    _signupBloc.signup(nameController.text, emailController.text,
        passwordController.text, confirmPasswordController.text);
  }

  @override
  Widget build(BuildContext context) {
    _passwordVisible.set(false);
    _confirmPasswordVisible.set(false);
    if (!_initialized) {
      _signupBloc.state.listen((event) {
        if (event.status == Status.COMPLETED) {
          ToastUtil().showSuccessToast(context, 'Success', 'Login Successful');
          Navigator.pushNamed(context, '/job-applicant');
          LoaderUtil.hideLoader();
        } else if (event.status == Status.ERROR) {
          LoaderUtil.hideLoader();
          Future.delayed(
              const Duration(milliseconds: 5),
              () => {
                    ToastUtil().showErrorToast(context, 'Error', event.message),
                  });
        } else if (event.status == Status.LOADING) {
          LoaderUtil.showLoader(context, message: 'Trying to Access..');
        }
      });
      _initialized = true;
    }
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
                    controller: confirmPasswordController,
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
                    _signupUser(context);
                  },
                  child: const Text('Signup'),
                ),
              ),
              // Don't have an account? Sign Up
              // const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  SizedBox(width: 6),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/');
                  }, child: Text('Sign In')),
                ],
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
