import 'package:cloud_firestore/cloud_firestore.dart';

class UploadedBy {
  final uid;

  UploadedBy({this.uid});
  CollectionReference uid_phone =
      FirebaseFirestore.instance.collection('uid_phone');
  Future user_phone(String phone) async {
    return await uid_phone.doc(uid).set({'phone': phone});
  }
}
