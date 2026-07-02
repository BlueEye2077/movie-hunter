import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/networking/requests_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../data/models/create_new_session_model.dart';
import '../../logic/cubit/auth_cubit.dart';
import '../widgets/login_app_bar.dart';
import '../widgets/login_button.dart';
import '../widgets/login_form.dart';
import '../widgets/welcome_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginAppBar(),
              SizedBox(height: 32.h),
              const WelcomeText(),
              SizedBox(height: 48.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child:
                    BlocConsumer<
                      AuthCubit,
                      RequestsState<CreateNewSessionModel>
                    >(
                      listener: (context, state) {
                        state.whenOrNull(
                          success: (data) => Navigator.pushReplacementNamed(
                            context,
                            Routes.mainScreen,
                          ),
                          error: (networkExceptions) {
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(NetworkExceptions.getErrorMessage(networkExceptions))),
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryBlueAccent,
                            ),
                          ),
                          orElse: () => LoginButton(
                            onPressed: () => context.read<AuthCubit>().login(
                              _emailController.text,
                              _passwordController.text,
                            ),
                          ),
                        );
                      },
                    ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
