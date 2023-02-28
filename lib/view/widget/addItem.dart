import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_api/model.dart';

import '../../service/user_service.dart';
import '../../service/utils_service.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String _gender = "male";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter Details"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter salary';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: "male",
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text("Male"),
                  SizedBox(width: 10),
                  Radio(
                    value: "female",
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text("Female"),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              UserModel newUser = UserModel(
                  name: _nameController.text,
                  phone: _phoneController.text,
                  age: int.parse(_ageController.text),
                  gender: _gender,
                  passport: 'AGUHIHDIUDFIH12346565',
                  familyMembers: [],
                  id: '1');

              _createUser(newUser);
              Navigator.pop(context);
            }
          },
          child: Text('SAVE'),
        ),
      ],
    );
  }

  void _createUser(UserModel newUser) async {
    bool result =
    await UserService.createUser(newUser);

    if(result){
      setState(() {});
      Utils.snackBarSucces('Create successfully', context);
    } else {
      Utils.snackBarError('Someting is wrong', context);
    }
  }
}
