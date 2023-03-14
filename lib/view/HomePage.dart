import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_api/service/user_service.dart';
import 'package:mock_api/view/profil_page.dart';
import 'package:mock_api/view/widget/addItem.dart';
import 'package:mock_api/view/widget/editItem.dart';
import 'package:mock_api/view/widget/user_item.dart';
import '../service/utils_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users'),
        actions: [
          IconButton(onPressed: () async {
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MyDialog();
                });
            setState(() {});
              }, icon: Icon(Icons.add)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
            future: UserService.getUsers(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return InkWell(
                        child: userItem(
                          context,
                          snapshot.data![index],
                          delete: (){
                            _deleteUser(snapshot.data![index].id);
                          },
                          edit: () async {
                            // nameCtr.text = snapshot.data![index].name;
                            // ageCtr.text = snapshot.data![index].age.toString();
                            // phoneCtr.text = snapshot.data![index].phone;
                            // UserModel newUser = UserModel(
                            //     name: nameCtr.text,
                            //     phone: phoneCtr.text,
                            //     age: int.parse(ageCtr.text),
                            //     gender: _gender,
                            //     passport: 'asjdfj',
                            //     familyMembers: [],
                            //     id: '1');
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return EditDialog(item: snapshot.data![index],);
                                });
                            setState(() {});
                          }
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilPage(item: snapshot.data![index],)));
                        },
                      );
                    });
              } if(snapshot.hasError) {
                return const Center(
                  child: Text('No data'),);
              } return Center(child: CircularProgressIndicator(),);
            }),
      ),
    );
  }

  void _deleteUser(String id) async {
    bool result =
        await UserService.deleteUser(id);

    if(result){
      setState(() {});
      Utils.snackBarSucces('Update successfully', context);
    } else {
      Utils.snackBarError('Someting is wrong', context);
    }
  }
  // void _editUser(UserModel newUser) async {
  //   bool result =
  //   await UserService.editUser(newUser);
  //
  //   if(result){
  //     setState(() {});
  //     Utils.snackBarSucces('Update successfully', context);
  //   } else {
  //     Utils.snackBarError('Someting is wrong', context);
  //   }
  // }
}
//
// TextEditingController nameCtr = TextEditingController();
// TextEditingController phoneCtr = TextEditingController();
// TextEditingController ageCtr = TextEditingController();
//
// String _gender = "male";
// //
// // Future<void> _dialogBuilder(
// //     BuildContext context, void Function() set, void Function() edit) {
// //   return showDialog<void>(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         title: const Text('Edit'),
// //         content: Column(
// //           children: [
// //             TextFormField(
// //               controller: nameCtr,
// //               decoration: InputDecoration(
// //                   hintText: 'name',
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   )),
// //             ),
// //             SizedBox(
// //               height: 15,
// //             ),
// //             TextFormField(
// //               controller: ageCtr,
// //               decoration: InputDecoration(
// //                   hintText: 'age',
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   )),
// //             ),
// //             SizedBox(
// //               height: 15,
// //             ),
// //             TextFormField(
// //               controller: phoneCtr,
// //               decoration: InputDecoration(
// //                   hintText: 'phone number',
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   )),
// //             ),
// //             SizedBox(
// //               height: 15,
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 Radio(
// //                   value: "male",
// //                   groupValue: _gender,
// //                   onChanged: (String? value) {
// //                     _gender = value!;
// //                     set();
// //                   },
// //                 ),
// //                 const Text("Male"),
// //                 const SizedBox(width: 10),
// //                 Radio(
// //                   value: "female",
// //                   groupValue: _gender,
// //                   onChanged: (String? value) {
// //                     _gender = value!;
// //                     set();
// //                   },
// //                 ),
// //                 const Text("Female"),
// //               ],
// //             ),
// //           ],
// //         ),
// //         actions: <Widget>[
// //           TextButton(
// //             style: TextButton.styleFrom(
// //               textStyle: Theme.of(context).textTheme.labelLarge,
// //             ),
// //             child: const Text('Disable'),
// //             onPressed: () {
// //               Navigator.of(context).pop();
// //             },
// //           ),
// //           TextButton(
// //             style: TextButton.styleFrom(
// //               textStyle: Theme.of(context).textTheme.labelLarge,
// //             ),
// //             child: const Text('Update'),
// //             onPressed: () {
// //               edit();
// //               Navigator.pop(context);
// //             },
// //           ),
// //         ],
// //       );
// //     },
// //   );
// // }




