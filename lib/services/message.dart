import 'package:application_from_scratch_flutter_9antra_the_bridge/model/message.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;  
  late CollectionReference refMessage;

  Future sendMessage(String message) async {
    final newMessage = Message(
      userId: _firebaseAuth.currentUser!.uid,
      userName: _firebaseAuth.currentUser!.displayName ?? "N/A",
      roomId: ROOM_ID,
      message: message.trim(),
      messageType: MessageType.text,
      createdAt: DateTime.now(),
    );

    try {
      refMessage = db.collection(ROOM_COLLECTION);
      var res = await refMessage.add(newMessage.toJson());
      print(res);
      return {"status" : true, "message" : "success"};
    } on FirebaseAuthException catch (e) {
      return {"status" : false, "message" : e.message.toString()};
    }
  }

  Stream<QuerySnapshot> getMessageStream(int limit) {
    return db.collection(ROOM_COLLECTION)
        // .where('message', isEqualTo: "Hi")
        .orderBy('createdAt')
        // .limit(limit)
        .snapshots();
  }

}