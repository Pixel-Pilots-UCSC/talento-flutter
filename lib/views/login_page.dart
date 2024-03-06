

import 'package:flutter/material.dart';
import 'package:talento/bloc/boolean_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final BooleanBloc _rememberMe = BooleanBloc();
  final BooleanBloc _passwordVisible = BooleanBloc();

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
            child: Column(
              children: <Widget>[
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
                const SizedBox(height: 8),
                StreamBuilder<bool>(
                  stream: _passwordVisible.state,
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
                  children: <Widget>[
                    StreamBuilder<bool>(
                      stream: _rememberMe.state,
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
                const SizedBox(height: 16),
                const Text('Forgot Password?'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    print('Email: ${emailController.text}');
                    print('Password: ${passwordController.text}');
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          
          ),
        )
      ),
    );
  }
}
