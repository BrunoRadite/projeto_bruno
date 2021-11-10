import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/paleta_cores.dart';
import '/widgets/Dashboard/controller/controllers_dash.dart';

class ManipulaExtensoes extends StatelessWidget {
  const ManipulaExtensoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mandalaController = Get.find<ControllerProjetoRepository>();
    return Obx(
      () => Visibility(
        visible: mandalaController.visivel.value,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Extensões      ",
                    style: TextStyle(color: PaletaCores.textColor)),
                SizedBox(width: 20),
                Container(
                  width: 250,
                  child:
                      // child: Row(
                      //   children: [
                      TextField(
                    style: TextStyle(color: PaletaCores.textColor),
                    textAlign: TextAlign.justify,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        icon: Icon(Icons.extension, size: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    maxLength: 450,
                    keyboardType: TextInputType.text,
                  ),
                  /**/
                  //   ],
                  // ),
                ),
                IconButton(
                    splashRadius: 15,
                    onPressed: mandalaController.adicionarExtensao,
                    icon: Icon(Icons.add, size: 20)),
                IconButton(
                    splashRadius: 15,
                    onPressed: mandalaController.buscarExtensao,
                    icon: Icon(Icons.search, size: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
