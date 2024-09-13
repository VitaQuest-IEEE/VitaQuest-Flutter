class ValidationErrorTexts {
  ValidationErrorTexts._();
  //* Ex of validations messages.
  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    }
    if (email.length < 5 ||
        !RegExp(r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,}$')
            .hasMatch(email)) {
      return 'Please enter a valid email';
    }

    if (email.contains(' ')) {
      return 'Do not use space';
    }
    return null;
  }

  static String? firstNameValidation(String? firstName) {
    if (firstName == null || firstName.isEmpty || firstName.trim().isEmpty) {
      return 'Please enter your first name';
    }
    if (firstName.contains(RegExp(r'[^\w\s]+')) || firstName.contains('_')) {
      return 'Please enter a valid first name';
    }
    if (firstName.contains(' ')) {
      return 'Do not use space';
    }
    if (firstName.contains(RegExp(r'-?\d+'))) {
      return 'Do not use numbers';
    }
    if (firstName.length < 2) {
      return 'At least 2 characters';
    }
    return null;
  }

  static String? otpValidation(
    String? field,
  ) {
    if (field == null || field.isEmpty) {
      return 'Please enter your code';
    }
    if (field.length < 4) {
      return 'The code must be 4 digits';
    }
    return null;
  }

  static String? lastNameValidation(String? lastName) {
    if (lastName == null || lastName.isEmpty || lastName.trim().isEmpty) {
      return 'Please enter your last name';
    }
    if (lastName.contains(RegExp(r'[^\w\s]+')) || lastName.contains('_')) {
      return 'Please enter a valid last name';
    }
    if (lastName.contains(' ')) {
      return 'Do not use space';
    }
    if (lastName.contains(RegExp(r'-?\d+'))) {
      return 'Do not use numbers';
    }
    if (lastName.length < 2) {
      return 'At least 2 characters';
    }
    return null;
  }

  static String? signUpPasswordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!password.contains(RegExp(r'[!@#$%^&*\-+=_(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (password.contains(' ')) {
      return 'Do not use space';
    }
    return null;
  }

  static String? loginPasswordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (password.contains(' ')) {
      return 'Do not use space';
    }
    return null;
  }

  static String? confirmPasswordValidation(
    String? passwordConfirmation,
    String? password,
  ) {
    if (passwordConfirmation == null || passwordConfirmation.isEmpty) {
      return 'Please re-enter your password';
    }
    if (password != passwordConfirmation) {
      return 'Passwords do not match';
    }
    if (passwordConfirmation.contains(' ')) {
      return 'Do not use space';
    }
    return null;
  }
}
