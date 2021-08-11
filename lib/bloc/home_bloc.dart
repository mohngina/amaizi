import 'package:amaizi/models/user.dart';
import 'package:flutter/material.dart';
import 'package:amaizi/tools/bloc_provider.dart';
import 'package:amaizi/api/api.dart';

class HomeBloc extends Bloc {

  List<User> users = [];

  Future callUsers() async {
    users = [];
    await api.getUsers().then((response) async {
      var usersResponse = response.data;
      usersResponse.forEach((user){
        users.add(User.fromJson(user));
      });
      print(users);
      notifyChanges();
    });

  }

  @override
  void initState() async {
    super.initState();
    await callUsers();
  }
}