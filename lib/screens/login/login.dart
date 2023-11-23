import 'package:finance_search/screens/common/utilities.dart';
import 'package:flutter/material.dart';

import '../../validator/email_validator.dart';
import '../../validator/password_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showCustomDialog(context, 'Login success!', DialogType.info);
    } else {
      showCustomDialog(context, 'Login failed!', DialogType.warning);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  hintText: "Enter your email",
                  iconData: Icons.person,
                  controller: _emailController,
                  validator: EmailValidator.validate,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  hintText: "Enter your password",
                  iconData: Icons.key,
                  controller: _passwordController,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: _showPassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                  obscureText: _showPassword,
                  validator: PasswordValidator.validate,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: _login, child: const Text('Login')),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.center_focus_weak_outlined)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    TextButton(
                      onPressed: () {
                        print("object");
                      },
                      child: const Text('Register',
                          style: TextStyle(color: Colors.red, fontSize: 16)),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Get smart OTP'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData iconData,
    Function(String)? onChanged,
    Widget? suffixIcon,
    bool obscureText = false,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(width: 5),
          Icon(iconData),
          const SizedBox(width: 5),
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
            ),
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            validator: validator,
          )),
          if (suffixIcon != null) suffixIcon,
          const SizedBox(width: 5)
        ],
      ),
    );
  }
}
