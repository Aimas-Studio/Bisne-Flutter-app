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

  //
  //
  //
  //JSON WEB TOKEN
  //
  //

  String get jkt {
    return _appData.getString('jkt') ?? '';
  }

  set jkt(String jkt) {
    _appData.setString('jkt', jkt);
  }

  //
  //
  //
  //USER DATA
  //
  //
  //

  //LoggedIn
  bool get loggedIn {
    return _appData.getBool('loggedIn') ?? false;
  }

  set loggedIn(bool value) {
    _appData.setBool("loggedIn", value);
  }

  //idUser
  int get idUser {
    return _appData.getInt('idUser') ?? -1;
  }

  set idUser(int value) {
    _appData.setInt("idUser", value);
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

  //
  //
  //
  //SHOP DATA
  //
  //
  String get shopName {
    return _appData.getString('shopName') ?? "";
  }

  set shopName(String name) {
    _appData.setString('shopName', name);
  }

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

  String get shopImagePath {
    return _appData.getString("imagePath") ?? "";
  }

  set shopImagePath(String path) {
    _appData.setString("imagePath", path);
  }

  String get shopImageUrl {
    return _appData.getString("imageUrl") ?? "";
  }

  set shopImageUrl(String url) {
    _appData.setString("imageUrl", url);
  }
}
