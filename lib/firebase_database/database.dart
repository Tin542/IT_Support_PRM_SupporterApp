
import 'package:firebase_database/firebase_database.dart';

//Users
DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");

//Request
DatabaseReference reqRef = FirebaseDatabase.instance.reference().child("requests");
