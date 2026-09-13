import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'root_shell.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool agreed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 24, 28, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [AppColors.green500, AppColors.green700],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                  child: const Icon(Icons.swap_horiz_rounded, color: Colors.white, size: 30),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Create your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.ink900)),
              const SizedBox(height: 6),
              const Text('Join the community and start swapping today.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: AppColors.ink500)),
              const SizedBox(height: 24),
              const TextField(decoration: InputDecoration(labelText: 'Full name', prefixIcon: Icon(Icons.person_outline))),
              const SizedBox(height: 14),
              const TextField(decoration: InputDecoration(labelText: 'Email address', prefixIcon: Icon(Icons.mail_outline))),
              const SizedBox(height: 14),
              const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline))),
              const SizedBox(height: 14),
              const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Confirm password', prefixIcon: Icon(Icons.lock_outline))),
              const SizedBox(height: 6),
              CheckboxListTile(
                value: agreed,
                onChanged: (v) => setState(() => agreed = v ?? false),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
                activeColor: AppColors.green600,
                title: const Text('I agree to the Terms of Service and Privacy Policy',
                    style: TextStyle(fontSize: 12.5, color: AppColors.ink500)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const RootShell())),
                child: const Text('Create Account'),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ', style: TextStyle(color: AppColors.ink500, fontSize: 13)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text('Log In', style: TextStyle(color: AppColors.green700, fontWeight: FontWeight.w700, fontSize: 13)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
