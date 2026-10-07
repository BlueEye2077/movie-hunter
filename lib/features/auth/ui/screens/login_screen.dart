import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/networking/network_exceptions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/cubit/auth_cubit.dart';
import '../widgets/dont_have_account_text.dart';
import '../widgets/login_button.dart';
import '../widgets/login_form.dart';
import '../widgets/welcome_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: GestureDetector(
          // Tells the GestureDetector to interact with the whole screen
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.h),
                SvgPicture.asset('assets/svgs/app_logo.svg', height: 80.h),
                SizedBox(height: 24.h),
                const WelcomeText(),
                SizedBox(height: 48.h),
                Padding(
                  padding: AppSpacing.screenPadding,
                  child: LoginForm(
                    formKey: _formKey,
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    onLoginSubmitted: () => _validateThenDoLogin(context),
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: AppSpacing.screenPadding,
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: (session) => Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.mainScreen,
                          // Tells Flutter: "Do not keep any previous route. Wipe them all out."
                          (route) => false,
                        ),
                        error: (networkExceptions) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                NetworkExceptions.getErrorMessage(
                                  networkExceptions,
                                ),
                              ),
                            ),
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
                          onPressed: () => _validateThenDoLogin(context),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24.h),
                const DontHaveAccountText(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().login(
        _usernameController.text,
        _passwordController.text,
      );
    }
  }
}
