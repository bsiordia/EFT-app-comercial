// @dart=2.9


import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Utils.dart';

final _keyvalidate = GlobalKey<FormState>();

class LoginForm extends StatefulWidget {
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final user = TextEditingController();
  final password = TextEditingController();

   bool _isObscure;

  @override
  void dispose() {
    user.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState()
  {
    _isObscure = true;
  }



  void fetchPost({String user, String password}) async {
    print("$ip/client?username=$user&password=$password");
    var response = await http
        .get(Uri.parse("$ip/client?username=$user&password=$password"));
    if (response.statusCode == 200) {
      // ignore: await_only_futures
      await setLogedUser(
          int.parse(user),
          json.decode(response.body)["station"],
          json.decode(response.body)["name"],
          json.decode(response.body)["namestation"]);
      changePageDrop(
          Home(
              user: int.parse(user),
              station: json.decode(response.body)["station"],
              name: json.decode(response.body)["name"],
              nameStation: json.decode(response.body)["namestation"]),
          context);
    } else
      print('invalido');
  }

  void loginMethod() async {
    if (user.text.length > 0) {
      if (password.text.length > 0) {
        fetchPost(user: user.text, password: password.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: getScreenWith(context)*90,
      height: getScreenHeight(context)*.90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Usuario",style: TextStyle(color: Colors.cyan, fontSize: 18,fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: user,
              autofocus: true,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.verified_user_rounded,
                ),
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                hintText: 'Usuario',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Contraseña",style: TextStyle(color: Colors.cyan, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: password,
              autofocus: true,
              textAlign: TextAlign.start,
              obscureText: _isObscure,
              decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  hintText: 'Contraseña',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIconColor:
                  _isObscure ? Colors.black : Colors.grey[600],
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                          _isObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _isObscure
                              ? Colors.blue
                              : Colors.grey[600]))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 60,
            width: getScreenWith(context)*.70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.cyan,
                  Colors.cyanAccent,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextButton(
              onPressed: loginMethod,
              child: const Text(
                "Iniciar sesion",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
