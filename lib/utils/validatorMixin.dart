String validateEmail(String value) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (value.isEmpty)
    return 'Email is mandatory!';
  else if (!emailValid) return 'Please enter a valid email!';
  return null;
}

String validatePassword(String value) {
  if (value.length < 4) return 'Password is mandatory!';
  return null;
}
