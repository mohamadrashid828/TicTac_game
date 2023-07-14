import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tik_tak_controller.dart';

class TikTakView extends GetView<TikTakController> {
  const TikTakView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TikTakView'),
          centerTitle: true,
        ),
        body: Obx(
          () => MediaQuery.of(context).orientation==Orientation.portrait?   portraite():landscape()
        ));
        
  }
  gridviwe(double hight,double width){
    return               SizedBox(
      height: Get.height/hight,
      width: Get.width/width,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 9,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 5.0,mainAxisExtent: 75,
          mainAxisSpacing: 5.5, crossAxisCount: 3, 
          ),
        itemBuilder: (context, index) => InkWell(
          radius: 15,
          onTap: (){
        controller.winer.value!=""?  null:  controller.onClickBox(index);
          },
          child: Container(
            alignment: Alignment.center,
          decoration: BoxDecoration(color:const Color.fromARGB(255, 1, 40, 70),borderRadius: BorderRadius.circular(15)),
            child:controller.X.contains(index)?const Text("X",style: TextStyle(fontSize: 40,color: Colors.blue),):controller.O.contains(index)?Text("O",style: TextStyle(fontSize: 40,color: const Color.fromARGB(255, 221, 22, 8))):Text(""),
          ),
        ),
      ),
    );
  }
  
  portraite() {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Turn off/on two plyars",
                      overflow: TextOverflow.visible,
                      style: TextStyle(fontSize: 20),
                    ),
                    Switch.adaptive(
                        value: controller.is_computer.value,
                        onChanged: (v) {
                      controller.is_computer.value= v;
                        })
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.playerx.value
                        ? "Its Turn ! X"
                        : "Its Turn ! O",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
  gridviwe(2.3,1.2),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      controller.winer.value
                         ,
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold,color: Colors.amber),
                    ),
                )
              ,SizedBox(
                width: Get.width,
                height: 45,
                child:
                FloatingActionButton.extended(onPressed: (){
                  controller.RepeatGame();
                
                }, label: Text("Repeat"),icon: Icon(Icons.replay),)
                )
              
              ],
            ),
          );
  }
  
  landscape() {
    return Row(
      children: [
        Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Turn off/on two plyars",
                         
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch.adaptive(
                            value: controller.is_computer.value,
                            onChanged: (v) {
                          controller.is_computer.value= v;
                            })
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.playerx.value
                            ? "Its Turn ! X"
                            : "Its Turn ! O",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          controller.winer.value
                             ,
                          style: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold,color: Colors.amber),
                        ),
                    )
                  ,SizedBox(
                    width: Get.width/2.5,
                    height: 45,
                    child:
                    FloatingActionButton.extended(onPressed: (){
                      controller.RepeatGame();
                    
                    }, label: Text("Repeat"),icon: Icon(Icons.replay),)
                    )
                  
                  ],
                ),
              ),
     gridviwe(1.5,2)
      ],
    );}
}
