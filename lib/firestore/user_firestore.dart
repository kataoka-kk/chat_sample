import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestore {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static final _userCollection = _firebaseFirestoreInstance.collection('user');

  static Future<String?> createUser() async {
    try {
      final newDoc = await _userCollection.add({
        'name': '名無し',
        'image_path':
            'data:image/png;base64,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',
      });

      print('アカウント作成完了');

      return newDoc.id;
    } catch (e) {
      print('アカウント作成失敗 ===== $e');
      return null;
    }
  }

  static Future<List<QueryDocumentSnapshot>?> fetchUsers() async {
    try {
      final snapshot = await _userCollection.get();
      for (var doc in snapshot.docs) {
        print('ドキュメントID： ${doc.id} ----- 名前： ${doc.data()['name']}');
      }
      return snapshot.docs;
    } catch (e) {
      print('ユーザー情報の取得失敗 ===== $e');
      return null;
    }
  }
}
