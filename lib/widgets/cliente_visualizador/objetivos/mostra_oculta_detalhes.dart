import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/paleta_cores.dart';
import '/widgets/Dashboard/controller/controllers_dash.dart';

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mandalaController = Get.find<ControllerProjetoRepository>();
    return Visibility(
      visible: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          child: Obx(
            () => GestureDetector(
              onTap: () => mandalaController.changeVisibilidade(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("${mandalaController.detalhes}",
                      style: TextStyle(color: PaletaCores.textColor)),
                  SizedBox(width: 10),
                  Icon(mandalaController.iconDetalhes.value)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
