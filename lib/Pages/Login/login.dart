// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/home.dart';
import 'package:eft_app_comercial/Widgets/Login/header.dart';
import 'package:eft_app_comercial/Widgets/Login/loginform.dart';
import 'package:eft_app_comercial/Widgets/Login/logo.dart';
import 'package:flutter/material.dart';

import '../../Utils.dart';

class Login extends StatelessWidget {

  static int user, station;
  static String name, nameStation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.Fondo,
        width: getScreenWith(context),
        height: getScreenHeight(context),
        child: FutureBuilder(
            future: getLogedUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              if (user == null)
                return ListView(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Header(),
                        Logo(),
                      ],
                      // ignore: deprecated_member_use
                    ),
                    LoginForm(),
                  ],
                );
              return Home(
                  user: user,
                  station: station,
                  name: name,
                  nameStation: nameStation);
            }),
      ),
    );
  }
}
