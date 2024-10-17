class PasswordRegex {
  static const symbol = r"(?=.*?[#?!@$%^&*-])";
  static const number = r"(?=.*?[0-9])";
  static const upperCase = r"(?=.*?[A-Z])";
  static const lowerCase = r"(?=.*?[a-z])";
  static const minLength = r".{8,}";
}
