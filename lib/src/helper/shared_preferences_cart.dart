import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCart {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  final String _sCabangPrefs = null;


  /// ------------------------------------------------------------
  /// Method that returns the user decision on sorting order
  /// ------------------------------------------------------------
  Future<String> getCabangPrefs() async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();

	return prefs.getString(_sCabangPrefs) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision on sorting order
  /// ----------------------------------------------------------
  Future<bool> setCabangPrefs(String value) async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();

	return prefs.setString(_sCabangPrefs, value);
  }
}