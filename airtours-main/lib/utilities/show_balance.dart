
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../services_auth/auth_service.dart';

Future<String> showUserBalance() async {
  final userCollectionRef = FirebaseFirestore.instance.collection('user');
  String userId = AuthService.firebase().currentUser!.id;
  final userDocumentRef = userCollectionRef.doc(userId);
  final userDocumentSnap = await userDocumentRef.get();
  final userBalance = userDocumentSnap.data()!['balance'];
  return userBalance.toString();
}