import 'package:flutter/material.dart';
import '/widgets/Dashboard/pages/metas/meta.dart';
import '/widgets/Dashboard/app_bar/custom_text.dart';
import '../../controller/controllers_dash.dart';
import '/widgets/Dashboard/pages/metas/metasPageDash.dart';
import '/widgets/Dashboard/responsividade/reposinvidade_dash.dart';
import 'package:get/get.dart';

class MetasPageDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                  text: menuControllerDash.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(children: [MetasTable()]),
        ),
      ],
    );
  }
}