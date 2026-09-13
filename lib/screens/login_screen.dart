import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'signup_screen.dart';
import 'root_shell.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 32, 28, 24),
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
                    boxShadow: [
                      BoxShadow(color: AppColors.green600.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10)),
                    ],
                  ),
                  child: const Icon(Icons.swap_horiz_rounded, color: Colors.white, size: 30),
                ),
              ),
              const SizedBox(height: 22),
              const Text('Welcome back',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.ink900)),
              const SizedBox(height: 6),
              const Text(
                "Log in to keep swapping what you don't need for what you do.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.ink500, height: 1.4),
              ),
              const SizedBox(height: 28),
              const TextField(decoration: InputDecoration(labelText: 'Email address', prefixIcon: Icon(Icons.mail_outline))),
              const SizedBox(height: 14),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline)),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?', style: TextStyle(color: AppColors.green700, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const RootShell())),
                child: const Text('Log In'),
              ),
              const SizedBox(height: 22),
              Row(children: const [
                Expanded(child: Divider(color: AppColors.line)),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text('OR', style: TextStyle(fontSize: 11, color: AppColors.ink500))),
                Expanded(child: Divider(color: AppColors.line)),
              ]),
              const SizedBox(height: 22),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata, size: 24, color: AppColors.ink700),
                label: const Text('Continue with Google', style: TextStyle(color: AppColors.ink700, fontWeight: FontWeight.w700)),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  side: const BorderSide(color: AppColors.line),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ", style: TextStyle(color: AppColors.ink500, fontSize: 13)),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen())),
                    child: const Text('Sign Up', style: TextStyle(color: AppColors.green700, fontWeight: FontWeight.w700, fontSize: 13)),
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
