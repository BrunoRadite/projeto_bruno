import 'package:get/get.dart';
import '/services/auth_service.dart';
import '/widgets/Dashboard/pages/authentication/cadastro_usuario_comum.dart';

import '/widgets/Dashboard/controller/controllers_dash.dart';

import '/models/usuario.dart';
import '/utils/paleta_cores.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:data_table_2/data_table_2.dart';
import '/widgets/Dashboard/app_bar/custom_text.dart';

/// Example without datasource
class ClientsTableGestor extends StatefulWidget {
  const ClientsTableGestor();

  @override
  _ClientsTableGestorState createState() => _ClientsTableGestorState();
}

class _ClientsTableGestorState extends State<ClientsTableGestor> {
  var auth = Get.find<AuthService>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ControllerProjetoRepository>();
    final usuarios = Provider.of<List<Usuario>?>(context);

    // List<Usuario> usuariosDoGestor = <Usuario>[];

    // var users =
    //     usuarios!.where((element) => element.gestor == auth.usuario!.uid);

    // for (var user in users) {
    //   usuariosDoGestor.add(user);
    // }
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 6),
              color: PaletaCores.corLightGrey.withOpacity(.1),
              blurRadius: 12,
            ),
          ],
          border: Border.all(color: PaletaCores.corLightGrey, width: .5)),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: "Clientes",
                color: PaletaCores.corLightGrey,
                weight: FontWeight.bold,
              )
            ],
          ),
          DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: [
              DataColumn2(
                label: Text('Nome'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Email'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Tipo de conta'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text(''),
                size: ColumnSize.M,
              ),
            ],
            rows: List<DataRow>.generate(
              usuarios!.length,
              //usuariosDoGestor.length,
              (index) => DataRow(
                cells: [
                  DataCell(CustomText(
                      text: usuarios[index]
                          .nome)), //usuariosDoGestor[index].nome)),
                  DataCell(
                    CustomText(
                        text: usuarios[index]
                            .email), //usuariosDoGestor[index].email),
                  ),
                  DataCell(
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: PaletaCores.active, width: .5),
                            color: PaletaCores.corLight,
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: CustomText(
                          text: usuarios[index]
                              .tipoUsuario, //usuariosDoGestor[index].tipoUsuario,
                          color: PaletaCores.active.withOpacity(.7),
                          weight: FontWeight.bold,
                        )),
                  ),
                  DataCell(
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PopupMenuButton(
                            onSelected: (value) {
                              if (value == 1) {
                                controller.mudarAtivo(
                                    usuarios[index]
                                        .ativo, //usuariosDoGestor[index].ativo,
                                    usuarios[index]
                                        .idUsuario); //usuariosDoGestor[index].idUsuario);
                              } else if (value == 2) {
                                controller.mudarEdit(
                                    usuarios[index]
                                        .editor, //usuariosDoGestor[index].editor,
                                    usuarios[index]
                                        .idUsuario); //usuariosDoGestor[index].idUsuario);
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem(
                                  child: (usuarios[index]
                                          .ativo) //(usuariosDoGestor[index].ativo)
                                      ? Text('Suspender')
                                      : Text('Reativar'),
                                  value: 1),
                              PopupMenuItem(
                                  child: (usuarios[index]
                                          .editor) //(usuariosDoGestor[index].editor)
                                      ? Text('Bloquear Para Edi????o')
                                      : Text('Desbloquiar Para Edi????o'),
                                  value: 2),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CadastroPageUsuario(title: "Cadastrar Cliente")));
                },
                child: CustomText(
                  text: "Adicionar Usuario",
                  color: PaletaCores.active.withOpacity(.7),
                  weight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
