import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/service/database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String decoumentId,
  }) async {
    var data = await firestore.collection(path).doc(decoumentId).get();
    return data.data() as Map<String, dynamic>;
  }
}
