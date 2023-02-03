import 'package:cloud_firestore/cloud_firestore.dart';

import '/model/Task.dart';

CollectionReference getTaskCollection(){
  return FirebaseFirestore.instance.collection('task').
  withConverter<Task>(
      fromFirestore: ((snapshot,options)=> Task.fromJson(snapshot.data()!)) ,
      toFirestore:(task,options)=> task.toJson());
}

Future<void> addTaskToFireStore(Task task){
 var collection = getTaskCollection();
 var docRef= collection.doc();
 task.id= docRef.id;
return docRef.set(task);

}
Future<void> deleteTaskFromFireStore(Task task){
  return getTaskCollection().doc(task.id).delete();
}

Future<void> editIsDoneInFirebase(Task task){
  return getTaskCollection().doc(task.id).update({'isDone':!task.isDone});
}
Future<void> updateTaskInFirebase(Task task){
  return getTaskCollection().doc(task.id).update(task.toJson());
}