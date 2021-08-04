import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:eft_app_comercial/Widgets/customSearchDropButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardSolitude extends StatefulWidget {
  CardSolitude({Key key}) : super(key: key);
  @override
  _CardSolitudeState createState() => _CardSolitudeState();
}

class _CardSolitudeState extends State<CardSolitude> {
  //Variables
  var stationCustomSearchDropButton = CustomSearchDropButton(
      name: "Seleccione la estación",
      defaultValue: "Estación",
      search: true,
      items: Marketing.allStationList);
  var typeCustomSearchDropButton = CustomSearchDropButton(
      name: "Tipo de alta",
      defaultValue: "Seleccióne el tipo de alta",
      search: false,
      items: registerType);
  var nameCustomTextField =
      CustomTextField(title: "Nombre del Cliente", lines: 1);
  var phoneTextField = CustomTextField(title: "Teléfono del Cliente", lines: 1);
  var emailCustomTextField =
      CustomTextField(title: "Correo Electrónico", lines: 1);
  var noteCustomTextField =
      CustomTextField(title: "Nota / Comentario", lines: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud de Tarjeta',
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
            child:
                ListView(physics: BouncingScrollPhysics(), children: <Widget>[
              stationCustomSearchDropButton,
              SizedBox(height: getVerticalPercent(context, 2)),
              typeCustomSearchDropButton,
              SizedBox(height: getVerticalPercent(context, 2)),
              nameCustomTextField,
              SizedBox(height: getVerticalPercent(context, 2)),
              phoneTextField,
              SizedBox(height: getVerticalPercent(context, 2)),
              emailCustomTextField,
              SizedBox(height: getVerticalPercent(context, 2)),
              noteCustomTextField,
              SizedBox(height: getVerticalPercent(context, 2)),
              ElevatedButton(
                  onPressed: () {
                    if (stationCustomSearchDropButton.selectedItem == null) {
                      showDialogText(context, "Campo no valido",
                          "Seleccione una estación.");
                      return;
                    }
                    if (typeCustomSearchDropButton.selectedItem == null) {
                      showDialogText(context, "Campo no valido",
                          "Seleccione un tipo de activación.");
                      return;
                    }
                    if (nameCustomTextField.controller.text.length < 10) {
                      showDialogText(context, "Campo no valido",
                          "El nombre del cliente es demasiado corto.");
                      return;
                    }
                    if (phoneTextField.controller.text.length < 9) {
                      showDialogText(context, "Campo no valido",
                          "El telefono es demasiado corto.");
                      return;
                    }
                    if (emailCustomTextField.controller.text.length < 10) {
                      showDialogText(context, "Campo no valido",
                          "El correo es demasiado corto.");
                      return;
                    }
                    if (noteCustomTextField.controller.text.length < 10) {
                      showDialogText(context, "Campo no valido",
                          "El comentario es demasiado corto.");
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
