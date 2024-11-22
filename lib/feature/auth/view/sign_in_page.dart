// lib/feature/auth/pages/sign_in_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/core/constants/gap_constants.dart';
import 'package:habitus/core/constants/route_constants.dart';
import 'package:habitus/feature/auth/widgets/auth_page_layout.dart';
import 'package:habitus/feature/auth/widgets/form_content.dart';
import 'package:habitus/ui_kit/buttons/variants/primary_button.dart';
import 'package:habitus/ui_kit/inputs/email_input.dart';
import 'package:habitus/ui_kit/inputs/password_input.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) =>
      const AuthPageLayout(form: _SignInForm());
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

  var _rememberMe = false;
  var _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authenticateUser(
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

  Future<void> _authenticateUser({
    required String email,
    required String password,
  }) async {
    // TODO(erdobozkurt): Implement actual auth
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign in failed: $message')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormContent(
      title: 'Sign In',
      formKey: _formKey,
      children: [
        EmailInput(controller: _emailController),
        GapConstants.h16,
        PasswordInput(controller: _passwordController),
        GapConstants.h16,
        _RememberMeCheckbox(
          value: _rememberMe,
          onChanged: (value) => setState(() => _rememberMe = value ?? false),
        ),
        GapConstants.h24,
        _SignInButton(
          onPressed: _handleSignIn,
          isLoading: _isLoading,
        ),
        GapConstants.h16,
        _SignUpLink(
          enabled: !_isLoading,
          onPressed: () => context.push(RouteConstants.signUp),
        ),
      ],
    );
  }
}

class _RememberMeCheckbox extends StatelessWidget {
  const _RememberMeCheckbox({
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      title: const Text('Remember me'),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
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
        child: const Text('Sign In'),
      ),
    );
  }
}

class _SignUpLink extends StatelessWidget {
  const _SignUpLink({
    required this.onPressed,
    required this.enabled,
  });

  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      child: const Text("Don't have an account? Sign up"),
    );
  }
}
