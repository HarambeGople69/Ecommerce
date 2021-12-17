import 'package:shared_preferences/shared_preferences.dart';

class OnceOnboarding {
  done() async {
    print("Inside this ========================");
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt("done", 1);
  }

  googlelogin() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt("auth", 1);
  }

  googlelogout() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt("auth", 0);
  }
}
