import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class newAppBar extends StatelessWidget implements PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "lib/assets/imgs/logo.jpeg",
              width: 70,
              alignment: Alignment.center,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () async {
                  SharedPreferences _sharePreference =
                      await SharedPreferences.getInstance();

                  String? token = _sharePreference.getString('token');

                  if (token != null) {
                    _sharePreference.remove('token');
                    Get.offAllNamed('/');
                    print('Token removido com sucesso.');
                  } else {
                    print('Nenhum token encontrado para remover.');
                  }
                },
              ),
            )
            // Icon(

            //   OnTap: () async {
            //     SharedPreferences _sharePreference =
            //         await SharedPreferences.getInstance();

            //     String? token = _sharePreference.getString('token');

            //     if (token != null) {
            //       _sharePreference.remove('token');
            //       Get.offAllNamed('/');
            //       print('Token removido com sucesso.');
            //     } else {
            //       print('Nenhum token encontrado para remover.');
            //     }
            //   },
            //   child: Text("logout"),
            // )
          ],
        ),
        backgroundColor: Color.fromRGBO(72, 141, 146, 1.0),
      ),
    );
    ;
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
