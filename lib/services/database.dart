import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_test/models/user.dart';
import 'package:login_test/models/userss.dart';
class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  // collection reference

  final CollectionReference dataCollection = Firestore.instance.collection('userdata');
  // final CollectionReference foodCollection = Firestore.instance.collection('Food_data');


  Future updateUserData(String name, String gender, int age, int heightFeet, int heightInches, int weight, int inaweek, int confi) async {
    return await dataCollection.document(uid).setData({
      'name': name,
      'gender' : gender,
      'age' : age,
      'height_feet' : heightFeet,
      'height_inches' : heightInches,
      'weight' : weight,
      'inaweek' : inaweek,
      'confi' : confi,
    });
  }
  // user list from snapshot

  List<Userss> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Userss(
        name: doc.data['name'] ?? " ",
        gender: doc.data['gender'] ?? " ",
        age : doc.data['age'] ?? 0,
        height_feet : doc.data['height_feet'] ?? 0,
        height_inches: doc.data['height_inches'] ?? 0,
        weight : doc.data['weight'] ?? 0,
        inaweek: doc.data['inaweek'] ?? 0,
        confi : doc.data['confi'] ?? 1,
      );
    }).toList();
  }

  // List<Foodss> _foodListFromSnapshot(QuerySnapshot snapshot){
  //   return snapshot.documents.map((docc){
  //     return Foodss(
  //       foodname: docc.data['foodname'] ?? " ",
  //       serving: docc.data['serving'] ?? " ",
  //       calories : docc.data['calories'] ?? 0,
  //     );
  //   }).toList();
  // }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      gender: snapshot.data['gender'],
      age: snapshot.data['age'],
      weight: snapshot.data['weight'],
      height_feet: snapshot.data['height_feet'],
      height_inches: snapshot.data['height_inches'],
      inaweek: snapshot.data['inaweek'],
      confi: snapshot.data['confi'],
    );
  }

  // FoodData _foodDataFromSnapshot(DocumentSnapshot snapshot){
  //   return FoodData(
  //     uid: uid,
  //     foodname: snapshot.data['foodname'],
  //     serving: snapshot.data['serving'],
  //     calories: snapshot.data['calories'],
  //   );
  // }

  // get streams
  Stream<List<Userss>> get usersdata{
    return dataCollection.snapshots()
    .map(_userListFromSnapshot);
}
  // Stream<List<Foodss>> get fooddata{
  //   return dataCollection.snapshots()
  //       .map(_foodListFromSnapshot);
  // }

  Stream<UserData> get userData{
    return dataCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

  // Stream<FoodData> get FoodData{
  //   return foodCollection.document(uid).snapshots()
  //       .map(_foodDataFromSnapshot);
  // }
}