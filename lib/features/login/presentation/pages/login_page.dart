import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/loader_widget.dart' show CustomeCircularProgressIndicator;
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import 'package:flutter_application_sample/core/di/injection_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final key = GlobalKey<FormState>(); 

 final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
  emailController.dispose();
  passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: BlocProvider(
          create: (_) => sl<LoginBloc>(),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    } else if (state is LoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login Successful!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // App Logo
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.lock_outline,
                                size: 64,
                                color: Colors.blueAccent,
                              ),
                            ),
                            const SizedBox(height: 32),
                        
                            // Title
                            Text(
                              'Welcome Back',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Login to continue',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 32),
                        
                            // Email Field
                            CustomTextField(
                              hintText: 'Email',
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [AutofillHints.email],
                              validator: Validators.email,
                              prefixIcon: Icons.email_outlined,
                            ),
                            const SizedBox(height: 16),
                        
                            // Password Field
                            CustomTextField(
                              hintText: 'Password',
                              controller: passwordController,
                              isPassword: true,
                              autofillHints: const [AutofillHints.password],
                              validator: Validators.password,
                              textInputAction: TextInputAction.done,
                              prefixIcon: Icons.lock_outline,
                            ),
                            const SizedBox(height: 32),
                        
                            // Login Button
                           Container(
                            margin: EdgeInsets.symmetric(horizontal: 80),
                            width: double.infinity,
                             child: CustomButton(
                                      text: AppStrings.loginButton,
                                      onPressed: () {
                                        if(key.currentState!.validate()){
                                           context.read<LoginBloc>().add(
                                              LoginButtonPressed(
                                                email: emailController.text.trim(),
                                                password: passwordController.text.trim(),
                                              ),
                                            );
                                        }
                                       
                                      },
                                    ),
                           ),
                        
                            const SizedBox(height: 16),
                            // Forgot Password
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                        
                            const SizedBox(height: 24),
                            // Divider with text
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(color: Colors.grey[400], thickness: 1),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(color: Colors.grey[400], thickness: 1),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                        
                            // Social Login Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _socialButton(Icons.facebook, Colors.blueAccent),
                                const SizedBox(width: 16),
                                _socialButton(Icons.g_mobiledata, Colors.redAccent),
                                const SizedBox(width: 16),
                                _socialButton(Icons.apple, Colors.black),
                              ],
                            ),
                        
                            const SizedBox(height: 32),
                            // Signup text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account? "),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if(state is LoginLoading)
                        CustomeCircularProgressIndicator()
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: color,
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
