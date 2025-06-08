import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/forget_password_view_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgetPasswordViewModel(),
      child: const _ForgetPasswordBody(),
    );
  }
}

class _ForgetPasswordBody extends StatelessWidget {
  const _ForgetPasswordBody();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ForgetPasswordViewModel>(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/forget_password.png',
                    height: 300,
                  ),
                ),
                const SizedBox(height: 13),
                Center(
                  child: Text(
                    'Forget Password',
                    style: textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    'Please enter your email address to receive a password reset link',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: viewModel.emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: viewModel.validateEmail,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: viewModel.submit,
                    child: Text(
                      'Send Reset Link',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (viewModel.successMessage != null) ...[
                  Text(
                    viewModel.successMessage!,
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Go to Login',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
                if (viewModel.errorMessage != null) ...[
                  Text(
                    viewModel.errorMessage!,
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
