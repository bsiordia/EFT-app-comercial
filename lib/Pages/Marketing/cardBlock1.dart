import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/itemCounter.dart';
import 'package:eft_app_comercial/Widgets/userInfo.dart';
import 'package:flutter/material.dart';

class CardBlock1 extends StatefulWidget {
  CardBlock1({Key key}) : super(key: key);

  @override
  _CardBlock1State createState() => _CardBlock1State();
}

class _CardBlock1State extends State<CardBlock1> {
  //Variables
  var customDropButton = CustomDropButton(
      title: "Seleccione la estación",
      list: stationList,
      initialValue: "Estación");
  var itemCounter = ItemCounter(item: "Bloque de tarjetas");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud',
                size: 30,
                color: whiteNeutral,
                weight: FontWeight.bold),
            backgroundColor: grayNeutral),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: getHorizontalPercent(context, 10),
                right: getHorizontalPercent(context, 10),
                bottom: getVerticalMargin(context),
                top: getVerticalMargin(context)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserInfo(
                      user: HomeBlocInheritedWidget.of(context).homebloc.name,
                      station: HomeBlocInheritedWidget.of(context)
                          .homebloc
                          .nameStation),
                  customDropButton,
                  Container(
                    width: getHorizontalPercent(context, 80),
                    child: itemCounter,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (itemCounter.counter == 0) {
                          showDialogText(context, "Cantidad no valida",
                              "La cantidad de solicitar debe ser mayor que 0.");
                          return;
                        }
                        if (customDropButton.value == null) {
                          showDialogText(context, "Campo no valido",
                              "Seleccione una estación.");
                          return;
                        }
                        backToOrigin(context);
                        showDialogText(context, "Nota",
                            "Operacion completada. Pendiente de revisión y aprovación.");
                      },
                      child: CustomText(data: "Enviar", size: 18))
                ])));
  }
}
