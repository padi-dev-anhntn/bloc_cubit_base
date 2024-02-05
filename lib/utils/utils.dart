class Utils {
  /// Checks if string is email.
  static bool isEmail(String input) {
    // Regular expression pattern to match email addresses
    // This pattern allows for most common email address formats
    const String emailRegex =
        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    // Create a regular expression object
    final RegExp regex = RegExp(emailRegex);
    // Check if the input matches the email pattern
    return regex.hasMatch(input);
  }

  /// Checks if string is password.
  /// r'^
  ///   (?=.*[A-Z])       // should contain at least one upper case
  ///   (?=.*[a-z])       // should contain at least one lower case
  ///   (?=.*?[0-9])      // should contain at least one digit
  ///   (?=.*?[!@#\$&*~]) // should contain at least one Special character
  ///   .{8,}             // Must be at least 8 characters in length
  /// $
  static bool isPassword(String input) {
    const passwordRegex =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    return RegExp(passwordRegex).hasMatch(input);
  }

}
