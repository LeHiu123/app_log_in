class Vadilation {
  static bool isVaildUser(String tk) {
    return tk != null && tk.length > 6 && tk.contains('@');
  }

  static bool isVailPass(String mk) {
    return mk != null && mk.length > 6;
  }
}
