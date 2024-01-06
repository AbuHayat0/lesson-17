import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controler/homeControler.dart';
import 'package:untitled1/widget/user.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ControlHome homeContrl = Get.put(ControlHome());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ControlHome>(
        builder: (_) => homeContrl.Loding
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ))
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  ResponseModel data = homeContrl.list[index];

                  return Card(
                    child: ListTile(
                      leading: Text(data.id.toString()),
                      title: Text(data.title.toString()),
                      subtitle: Text(data.body.toString()),
                    ),
                  );
                },
                itemCount: homeContrl.list.length,
              ),
      ),
    );
  }
}
