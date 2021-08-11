import 'package:flutter/material.dart';
import 'package:amaizi/tools/bloc_provider.dart';
import 'package:amaizi/api/api.dart';

class HomeBloc extends Bloc {

  List<String> users = [];

  Future callUsers() async {
    await api.getUsers().then((response) async {
      users = response.data;
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