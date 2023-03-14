import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_api/view/widget/pfofil_item.dart';
import '../model.dart';

class ProfilPage extends StatefulWidget {
   ProfilPage({this.item,Key? key}) : super(key: key);
   UserModel? item;
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pforil'),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ProfilItem(context, widget.item!),
      ),
    );
  }
}
