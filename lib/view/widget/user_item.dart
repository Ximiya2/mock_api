import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model.dart';

Widget userItem(BuildContext context, UserModel user,{required void Function() delete,required void Function() edit, }){
  return SizedBox(
    height: 80,
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 5,),
            Text(user.phone,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
              ),),
            Divider(thickness: 2,)
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: delete,
                icon: Icon(Icons.delete)),
            IconButton(
                onPressed: edit,
                icon: Icon(Icons.edit)),
          ],
        ),
      ],
    ),
  );
}