import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker/core/constants.dart';
import 'package:weight_tracker/core/models/weight_details.dart';

class WeightService {
  static CollectionReference _wRef = FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .collection("weights");

  //add weight
  static Future<void> addWeight({WeightDetails weight}) async {
    return _wRef
        .add(weight.toJson())
        .then((value) => print("weight added"))
        .catchError((error) => print("failed to add weight: $error"));
  }

  //edit weight
  static Future<void> updateWeight({WeightDetails weight}) async {
    return _wRef
        .doc(weight.id)
        .update(weight.toJson())
        .then((value) => print("weight updated"))
        .catchError((error) => print("failed to update weight: $error"));
  }

  //delete weight
  static Future<void> deleteWeight({String id}) async {
    return _wRef
        .doc(id)
        .delete()
        .then((value) => print("weight deleted"))
        .catchError((error) => print("failed to delete weight: $error"));
  }
  
  //get weights
  static Stream<List<WeightDetails>> streamWeights() async* {
    yield* _wRef.snapshots().map((event) {
      List<WeightDetails> weights = event.docs.map((doc) {
        return WeightDetails.fromJson(doc.data())..id = doc.id;
      }).toList();
      weights.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
      return weights;
    });
  }
}
