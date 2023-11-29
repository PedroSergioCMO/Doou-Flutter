import 'package:flutter/material.dart';

class newAppBar extends StatelessWidget implements PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "lib/assets/imgs/logo.jpeg",
          width: 70,
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
