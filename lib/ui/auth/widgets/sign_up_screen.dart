// lib/feature/auth/pages/sign_up_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/router/route_constants.dart';
import 'package:habitus/ui/auth/widgets/auth_page_layout.dart';
import 'package:habitus/ui/auth/widgets/form_content.dart';
import 'package:habitus/ui/core/themes/constants/gap_constants.dart';
import 'package:habitus/ui/core/ui/buttons/variants/primary_button.dart';
import 'package:habitus/ui/core/ui/inputs/email_input.dart';
import 'package:habitus/ui/core/ui/inputs/name_input.dart';
import 'package:habitus/ui/core/ui/inputs/password_input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) =>
      const AuthPageLayout(form: _SignUpForm());
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm();

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _createAccount(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (!mounted) return;
      context.go(RouteConstants.home);
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    // TODO(erdobozkurt): Implement actual account creation
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign up failed: $message')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormContent(
      title: 'Create Account',
      formKey: _formKey,
      children: [
        NameInput(controller: _nameController),
        GapConstants.h16,
        EmailInput(controller: _emailController),
        GapConstants.h16,
        PasswordInput(
          controller: _passwordController,
        ),
        GapConstants.h16,
        PasswordInput(
          controller: _confirmPasswordController,
          label: 'Confirm Password',
        ),
        GapConstants.h24,
        _SignUpButton(
          onPressed: _handleSignUp,
          isLoading: _isLoading,
        ),
        GapConstants.h16,
        _SignInLink(
          enabled: !_isLoading,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    required this.onPressed,
    required this.isLoading,
  });

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PrimaryButton(
        onPressed: isLoading ? null : onPressed,
        isLoading: isLoading,
        child: const Text('Sign Up'),
      ),
    );
  }
}

class _SignInLink extends StatelessWidget {
  const _SignInLink({
    required this.onPressed,
    required this.enabled,
  });

  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      child: const Text('Already have an account? Sign in'),
    );
  }
}
