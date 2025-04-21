import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // ฟังก์ชันการเข้าสู่ระบบด้วยอีเมล
  Future<void> _loginWithEmail(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    try {
      // เข้าสู่ระบบด้วย Firebase Authentication
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login successful')));

      // ไปที่หน้า HomePage หลังจากเข้าสู่ระบบสำเร็จ
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  // ฟังก์ชันเข้าสู่ระบบด้วย Google
  Future<void> _loginWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // เข้าสู่ระบบด้วย Firebase Authentication
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          credential,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Google login successful')),
        );
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Google login failed: $e')));
    }
  }

  // ฟังก์ชันเข้าสู่ระบบด้วย Facebook
  Future<void> _loginWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final credential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );

        // เข้าสู่ระบบด้วย Firebase Authentication
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          credential,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Facebook login successful')),
        );
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Facebook login failed')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Facebook login error: $e')));
    }
  }

  // ฟังก์ชันการรีเซ็ตรหัสผ่าน
  Future<void> _resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            Image.asset('assets/images/logo.png', height: 80),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                text: "Welcome to ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "EcoGlam!",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Google Button
            _socialButton(
              "Continue with Google",
              "assets/images/email.png",
              Colors.black,
              _loginWithGoogle,
            ),
            const SizedBox(height: 12),
            // Facebook Button
            _socialButton(
              "Continue with Facebook",
              "assets/images/face.png",

              Colors.black,
              _loginWithFacebook,
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("Or"),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),
            const SizedBox(height: 12),
            _inputField("Email", controller: emailController),
            const SizedBox(height: 16),
            _inputField(
              "Password",
              obscure: true,
              controller: passwordController,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _resetPassword(emailController.text.trim());
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _loginWithEmail(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEAC78C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text("Login", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    String hint, {
    bool obscure = false,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  Widget _socialButton(
    String text,
    String imagePath,
    Color textColor,
    Function onPressed,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          height: 24,
          width: 24,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, color: Colors.red);
          },
        ),
        title: Text(text, style: TextStyle(color: textColor)),
        onTap: () => onPressed(context),
      ),
    );
  }
}
