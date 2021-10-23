import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/screens/dash_visual_page.dart';
import '/screens/projeto_pagina_principal.dart';
import '/utils/paleta_cores.dart';
import '/widgets/Dashboard/app_bar/custom_text.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  _HomeWebState createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  @override
  Widget build(BuildContext context) {
    //TODO: verificar o provider.of por get find
    // final objetivos = Provider.of<List<Usuario>?>(context);
    List<String> objetivos = [
      'Diretoria',
      'Comercial',
      'TI',
    ];
    //Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Projetos"),
      ),
      body: (objetivos != null)
          ? ListView.builder(
              itemCount: objetivos.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(objetivos[index]),
                    onTap: () {
                      Get.offAll(ProjetoPage());
                    },
                  ))
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: Row(
        children: [
          SizedBox(
            width: 12,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: PaletaCores.active, width: .5),
                color: PaletaCores.corLight,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PaletaCores.corLight,
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
              ),
              onPressed: () {},
              child: CustomText(
                text: "Listar Projetos",
                color: PaletaCores.active.withOpacity(.7),
                weight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: PaletaCores.active, width: .5),
                color: PaletaCores.corLight,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PaletaCores.corLight,
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DashVisual()));
              },
              child: CustomText(
                text: "Dashboard Visual",
                color: PaletaCores.active.withOpacity(.7),
                weight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: PaletaCores.active, width: .5),
                color: PaletaCores.corLight,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PaletaCores.corLight,
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
              ),
              onPressed: () {},
              child: CustomText(
                text: "Criar Novo Projeto",
                color: PaletaCores.active.withOpacity(.7),
                weight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
