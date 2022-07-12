import 'package:get/get.dart';
import 'package:project2/models/todoModels.dart';

class HomeViewController extends GetxController{
  RxList<TODO> items = <TODO>[].obs;

  RxString time = "".obs;
  RxString todo = "".obs;

  changeTime({required String changedTime}){
    time.value = changedTime;
  }
  changedTODO({required String changedTodo}){
    todo.value = changedTodo;
  }
  removeTODO({required TODO todo}){
    items.value.remove(todo);
  }

  addTODO(){
    items.add(TODO(time: time.value, todo: todo.value));
  }
}