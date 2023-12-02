import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {

  // A key used to store and retrieve a value
  static const String COUNTER_KEY = 'counter';

  // Gets an instance of SharedPreferences
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences _prefs;
  LocalDataSource(this._prefs);


  // Stores a numeric value in local Storage
  Future<void> saveIntegerValue(int value) async {
    //final prefs = await _prefs;
    _prefs.setInt(COUNTER_KEY, value);
  }

  // Retrieves a numeric value from local Storage
  Future<int?> getIntegerValue() async {
    //final prefs = await _prefs;
    //return _prefs.getInt(COUNTER_KEY);
    if (!_prefs.containsKey(COUNTER_KEY)) {
      // Value doesn't exist, return null
      return null;
    }
    return _prefs.getInt(COUNTER_KEY); // Returns the integer value or null
  }

  // Removes a numeric value from local Storage
  Future<void> deleteIntegerValue() async {
    //final prefs = await _prefs;
    _prefs.remove(COUNTER_KEY);
  }
}
