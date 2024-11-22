import 'package:flutter/material.dart';
import 'package:habitus/core/constants/gap_constants.dart';
import 'package:habitus/feature/auth/widgets/auth_page_layout.dart';
import 'package:habitus/feature/auth/widgets/form_content.dart';
import 'package:habitus/ui_kit/buttons/base/base_button.dart';
import 'package:habitus/ui_kit/buttons/variants/primary_button.dart';
import 'package:habitus/ui_kit/inputs/email_input.dart';
import 'package:habitus/ui_kit/inputs/name_input.dart';
import 'package:habitus/ui_kit/inputs/password_input.dart';

// lib/feature/auth/pages/sign_up_page.dart

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthPageLayout(form: _SignUpForm());
  }
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
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      try {
        // TODO: Implement sign up logic
        await Future<void>.delayed(const Duration(seconds: 2));
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormContent(
      title: 'Create Account',
      isLoading: _isLoading,
      onSubmit: (formKey) => _handleSignUp(),
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
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            onPressed: () {},
            isLoading: _isLoading,
            size: ButtonSize.large,
            child: const Text('Sign Up'),
          ),
        ),
        GapConstants.h16,
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Already have an account? Sign in'),
        ),
      ],
    );
  }
}
