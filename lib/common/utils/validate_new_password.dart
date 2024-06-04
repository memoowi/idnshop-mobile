class ValidateNewPassword {
  static String? validate({required String? value, required int minLength}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a new password';
    }

    // Minimum length requirement (adjust as needed)
    if (value.length < minLength) {
      return 'Password must be at least 8 characters long';
    }

    // Check for uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for digit
    if (!value.contains(RegExp(r'\d'))) {
      return 'Password must contain at least one digit';
    }

    // Check for special character (custom definition)
    if (!value.contains(RegExp(r'[!@#$%^&*()-_=+[{\]};:\",<.>/?|\\]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }
}
