import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/main.dart';

class TodoUsreRepo {
  final firebaseAuth = FirebaseAuth.instance.currentUser;

  static int getDoneTasks() {
    return appUser.doneTasks ?? 0;
  }

  static addDoneTask() async {
    appUser.doneTasks = appUser.doneTasks ?? 0 + 1;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(appUser.id ?? " ", appUser.doneTasks ?? 0);
  }

  static int getLeftTasks() {
    return box!.length;
  }

  changeName(var newName) async {
    appUserReady.value = false;
    await firebaseAuth?.updateDisplayName(newName);
    appUser.name = newName;
    appUserReady.value = true;
  }

  changeImage(var newImage) async {
    await firebaseAuth?.updatePhotoURL(newImage);
    appUser.image = newImage;
    appUserReady.value = true;
  }

  changePassword(var newPassword) async {
    await firebaseAuth?.updatePassword(newPassword);
  }
}
