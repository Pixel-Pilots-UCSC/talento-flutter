import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talento/bloc/boolean_bloc.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final BooleanBloc _rememberMe = BooleanBloc();
  final BooleanBloc _passwordVisible = BooleanBloc();
  final LoginBloc _loginBloc = LoginBloc();

  _loginUser() {
    _loginBloc.login(emailController.text, passwordController.text);
  }


  @override
  Widget build(BuildContext context) {
    _rememberMe.set(false);
    _passwordVisible.set(false);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            //Welcome Text, Email and Password Fields, Remember Me and Forgot Password Links, Login Button
            //with StreamBuilder for Remember Me and Password Visibility
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width * 0.9 < 350 ? MediaQuery.of(context).size.width * 0.9 : 350,
            child: Column(
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/icons/logo.png'),
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 16),
                //Sign In Text
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3EB489)
                            ),
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
                              color: Color(0xFF61677D)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Sign in with Google Button and Facebook Button
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.background == Colors.black ? Colors.black : Color(0xFFF5F9FE),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image(image: AssetImage('assets/icons/facebook_icon.png'), width: 24, height: 24,),
                            SizedBox(width: 8),
                            Text('Facebook', style: TextStyle(color: Theme.of(context).colorScheme.onBackground),),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.background == Colors.black ? Colors.black : Color(0xFFF5F9FE),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image(image: AssetImage('assets/icons/google_icon.png'), width: 24, height: 24,),
                            SizedBox(width: 8),
                            Text('Google', style: TextStyle(color: Theme.of(context).colorScheme.onBackground),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // --- OR ---
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: Divider(
                          color: Color(0xFFE0E5EC),
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                      ),
                      Text('OR'),
                      Expanded(
                        child: Divider(
                          color: Color(0xFFE0E5EC),
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
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
                  initialData:false,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: passwordController,
                      obscureText: !snapshot.data!,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(snapshot.data! ? Icons.visibility : Icons.visibility_off),
                          onPressed: _passwordVisible.toggle,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        StreamBuilder<bool>(
                          stream: _rememberMe.state,
                          initialData:false,
                          builder: (context, snapshot) {
                            return Checkbox(
                              value: snapshot.data,
                              onChanged: (value) => _rememberMe.set(value!),
                            );
                          },
                        ),
                        const Text('Remember Me'),
                      ],
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9 < 350 ? MediaQuery.of(context).size.width * 0.9 : 350,
                  child: ElevatedButton(
                    onPressed: () {
                      _loginUser();
                    },
                    child: const Text('Login'),
                  ),
                ),
                // Don't have an account? Sign Up
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Don\'t have an account?'),
                    SizedBox(width: 8),
                    TextButton(onPressed: null, child: Text('Sign Up')),
                  ],
                ),
              ],
            ),
          
          ),
        )
      ),
    );
  }
}
