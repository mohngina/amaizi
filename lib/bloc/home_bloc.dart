import 'package:amaizi/models/user.dart';
import 'package:flutter/material.dart';
import 'package:amaizi/tools/bloc_provider.dart';
import 'package:amaizi/api/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeBloc extends Bloc {

  List<User> users = [];
  bool _loading = false;


  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyChanges();
  }

  Future callUsers() async {
    users = [];
    int count = 1;
    loading = true;
    await api.getUsers().then((response) async {
      var usersResponse = response.data;
      usersResponse.forEach((user){
        if(count < 6){
          users.add(User.fromJson(user));
        }
        count = count + 1;
      });
      print(users);
      loading = false;
    }).catchError((error){
      loading = false;
      Fluttertoast.showToast(msg: "Can't fetch users");
    });

  }

  refresh(){
    callUsers();
  }

  @override
  void initState() async {
    super.initState();
    callUsers();
  }
}