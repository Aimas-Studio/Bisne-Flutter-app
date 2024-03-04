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
    return _appData.getInt('idUser') ?? 1;
  }

  set idUser(int value) {
    _appData.setInt("idUser", value);
  }

  //USER HAS A PROFILE PHOTO

  bool get userHasImage {
    return _appData.getBool('userHasImage') ?? false;
  }

  set userHasImage(bool userHasImage) {
    _appData.setBool('userHasImage', userHasImage);
  }

  //USERNAME
  String get userName {
    return _appData.getString('username') ?? "";
  }

  set userName(String value) {
    _appData.setString("username", value);
  }

  //EMAIL
  String get userEmail {
    return _appData.getString("userEmail") ?? "";
  }

  set userEmail(String email) {
    _appData.setString("userEmail", email);
  }

  //PHONE
  String get userPhone {
    return _appData.getString('userPhone') ?? "";
  }

  set userPhone(String value) {
    _appData.setString("userPhone", value);
  }

  //USER LOCATION
  String get userAddress {
    return _appData.getString('userAddress') ?? "";
  }

  set userAddress(String value) {
    _appData.setString("userAddress", value);
  }

  //USER IMAGE URL
  String get userImageUrl {
    return _appData.getString('userImageUrl') ?? "";
  }

  set userImageUrl(String value) {
    _appData.setString('userImageUrl', value);
  }

  String get userImagePath {
    return _appData.getString('userImagePath') ?? "";
  }

  set userImagePath(String value) {
    _appData.setString('userImagePath', value);
  }

  //
  //
  //
  //SHOP DATA
  //
  //

  bool get shopExists {
    return _appData.getBool('shopExists') ?? false;
  }

  set shopExists(bool value) {
    _appData.setBool('shopExists', value);
  }

  //SHOP NAME
  String get shopName {
    return _appData.getString('shopName') ?? "";
  }

  set shopName(String name) {
    _appData.setString('shopName', name);
  }

  //SHOP DESCRIPTION

  String get shopDescription {
    return _appData.getString("shopDescription") ?? "";
  }

  set shopDescription(String description) {
    _appData.setString("shopDescription", description);
  }

  //SHOP OPENING TIME

  String get shopOpeningTime {
    return _appData.getString('shopOpeningTime') ?? '';
  }

  set shopOpeningTime(String openingTime) {
    _appData.setString("shopOpeningTime", openingTime);
  }

  //SHOP ADDRESS

  String get shopAddress {
    return _appData.getString("address") ?? "";
  }

  set shopAddress(String address) {
    _appData.setString("address", address);
  }

  //SHOP PHONE

  String get shopPhoneNumber {
    return _appData.getString("phone") ?? "";
  }

  set shopPhoneNumber(String phone) {
    _appData.setString("phone", phone);
  }

  //SHOP IMAGE PATH

  String get shopImagePath {
    return _appData.getString("imagePath") ?? "";
  }

  set shopImagePath(String path) {
    _appData.setString("imagePath", path);
  }

  //SHOP IMAGE URL

  String get shopImageUrl {
    return _appData.getString("imageUrl") ?? "";
  }

  set shopImageUrl(String url) {
    _appData.setString("imageUrl", url);
  }
}
