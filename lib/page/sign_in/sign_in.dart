import 'package:fetching_data/page/sign_in/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late SignInController controller;

  @override
  void initState() {
    controller = SignInController(context, () => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: _body(),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, size: 100),
        const Icon(Icons.local_cafe, size: 100),
        Text('Cafe Recommender',
            style: GoogleFonts.bebasNeue(
              fontWeight: FontWeight.bold,
              fontSize: 52,
            )),
        const SizedBox(height: 10),
        const Text('welcome back,you\'ve been missed!',
            style: TextStyle(
              fontSize: 20,
            )),
        const SizedBox(height: 50),
        _emailTextField(),
        const SizedBox(height: 10),
        _passwordTextField(),
        const SizedBox(height: 10),
        _signInButton(),
        const SizedBox(height: 25),
        _registerButton(),
      ],
    );
  }

  Widget _emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Email',
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            controller: controller.passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: () => controller.signIn(),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.deepPurple, borderRadius: BorderRadius.circular(12)),
          child: const Center(
            child: Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Not a member?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 12),
        Container(
          child: TextButton(
            onPressed: () => controller.onRegisterButtonClicked(),
            style: TextButton.styleFrom(),
            child: const Text(
              'Register now',
            ),
          ),
        )
      ],
    );
  }
}
