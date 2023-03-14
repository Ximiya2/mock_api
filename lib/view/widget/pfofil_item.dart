import 'package:flutter/cupertino.dart';
import '../../model.dart';

Widget ProfilItem(BuildContext context, UserModel user,){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(user.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
      Text(user.phone, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
      Text(user.age.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
      Text(user.gender, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
      Text(user.passport, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
      ListView.builder(
          itemCount: user.familyMembers.length,
          itemBuilder: (context, index){
            return Text(user.familyMembers[index]);
          })
    ],
  );
}