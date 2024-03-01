import 'package:shared_preferences/shared_preferences.dart';

//this is the local storage saved data
class PersistentData {
  static final PersistentData _persistentData = PersistentData._();
  factory PersistentData() {
    return _persistentData;
  }
  PersistentData._();

  late SharedPreferences _appData;

  loadData() async {
    _appData = await SharedPreferences.getInstance();
  }

  //LoggedIn
  bool get loggedIn {
    return _appData.getBool('loggedIn') ?? false;
  }

  set loggedIn(bool value) {
    _appData.setBool("loggedIn", value);
  }

  //Username
  String get username {
    return _appData.getString('username') ?? "";
  }

  set username(String value) {
    _appData.setString("username", value);
  }

  //Email
  String get userEmail {
    return _appData.getString("userEmail") ?? "";
  }

  //User Phone
  String get userPhone {
    return _appData.getString('userPhone') ?? "";
  }

  set userPhone(String value) {
    _appData.setString("userPhone", value);
  }

  //User Address
  String get userAddress {
    return _appData.getString('userAddress') ?? "";
  }

  set userAddress(String value) {
    _appData.setString("userAddress", value);
  }

  set userEmail(String email) {
    _appData.setString("userEmail", email);
  }

  //Shop Description
  String get shopDescription {
    return _appData.getString("shopDescription") ?? "";
  }

  set shopDescription(String description) {
    _appData.setString("shopDescription", description);
  }

  List<String> get shopOpeningTime {
    return _appData.getStringList('shopOpeningTime') ?? [];
  }

  set shopOpeningTime(List<String> openingTime) {
    _appData.setStringList("shopOpeningTime", openingTime);
  }

  String get shopAddress {
    return _appData.getString("address") ?? "";
  }

  set shopAddress(String address) {
    _appData.setString("address", address);
  }

  String get shopPhoneNumber {
    return _appData.getString("phone") ?? "";
  }

  set shopPhoneNumber(String phone) {
    _appData.setString("phone", phone);
  }
}
