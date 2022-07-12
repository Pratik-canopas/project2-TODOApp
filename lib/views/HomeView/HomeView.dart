import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project2/views/HomeView/HomeViewController.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewController homeViewController = Get.put(HomeViewController());
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TODO APP"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: homeViewController.items.length,
          itemBuilder: (context, index) {
            return Dismissible(
                key: Key(homeViewController.items.value[index].todo),
                onDismissed: (direction){
                  homeViewController.removeTODO(todo:homeViewController.items.value[index]);
                },
                background: Container(color: Colors.deepOrange,),
                child: Obx(()
            => ListTile(
                  leading: Text(homeViewController.items.value[index].time),
                  title: Text(homeViewController.items.value[index].todo),
                )
            ));

          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery
                .of(context)
                .size
                .width * 0.8, 60),
          ),
          onPressed: () {
            homeViewController.changeTime(changedTime:
                "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute} ${TimeOfDay.now().period.name}");
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("New TODO"),
                    content: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    TimeOfDay time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now()) ??
                                        TimeOfDay.now();
                                    homeViewController.changeTime(
                                        changedTime:
                                        "${time.hour} : ${time.minute} ${time
                                            .period.name}");
                                  },
                                  child: const Text("Change Time")),
                              Obx(() => Text(homeViewController.time.value)),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: todoController,
                            decoration: const InputDecoration(
                              label: Text("TODO"),
                              border: OutlineInputBorder(),
                            ),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                              homeViewController.changedTODO(
                                  changedTodo: todoController.text);
                              homeViewController.addTODO();
                              Get.back();
                              todoController.clear();
                          },
                          child: const Text("ADD")),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Cancel")),
                    ],
                  );
                });
          },
          child: const Text("Add TODO"),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
