import 'package:firebase_auth/firebase_auth.dart';

void signOut() async {
  await FirebaseAuth.instance.signOut();
}
