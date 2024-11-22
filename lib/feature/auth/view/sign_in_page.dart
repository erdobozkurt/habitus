// lib/feature/auth/pages/sign_in_page.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/core/constants/gap_constants.dart';
import 'package:habitus/core/constants/route_constants.dart';
import 'package:habitus/feature/auth/widgets/auth_page_layout.dart';
import 'package:habitus/feature/auth/widgets/form_content.dart';
import 'package:habitus/ui_kit/buttons/base/base_button.dart';
import 'package:habitus/ui_kit/buttons/variants/primary_button.dart';
import 'package:habitus/ui_kit/inputs/email_input.dart';
import 'package:habitus/ui_kit/inputs/password_input.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthPageLayout(form: _SignInForm());
  }
}

class _SignInForm extends StatefulWidget {
  const _SignInForm();

  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      try {
        // TODO: Implement sign in logic
        await Future<void>.delayed(const Duration(seconds: 2));
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormContent(
      title: 'Sign In',
      isLoading: _isLoading,
      onSubmit: (formKey) => _handleSignIn(),
      children: [
        EmailInput(controller: _emailController),
        GapConstants.h16,
        PasswordInput(controller: _passwordController),
        GapConstants.h16,
        _buildRememberMeRow(),
        GapConstants.h24,
        _buildSignInButton(),
        GapConstants.h16,
        _buildSignUpLink(),
      ],
    );
  }

  Widget _buildRememberMeRow() {
    return CheckboxListTile(
      value: _rememberMe,
      onChanged: (value) {
        if (value == null) return;
        setState(() => _rememberMe = value);
      },
      title: const Text('Remember me'),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: PrimaryButton(
        onPressed: () {},
        isLoading: _isLoading,
        size: ButtonSize.large,
        child: const Text('Sign In'),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return TextButton(
      onPressed: _isLoading ? null : () => context.push(RouteConstants.signUp),
      child: const Text("Don't have an account? Sign up"),
    );
  }
}
