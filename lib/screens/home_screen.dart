import 'package:amaizi/bloc/home_bloc.dart';
import 'package:amaizi/models/user.dart';
import 'package:amaizi/tools/bloc_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final HomeBloc bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.refresh,color: Colors.white,),
          onPressed: (){
           //Refresh

          },
        ),
        title: Text(
          'Users',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        //   color: Colors.black,
        // ),
      ),
      body: BlocProvider(
        bloc: bloc,
        child: StreamBuilder<Object>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                padding: EdgeInsets.only(top: 100),
                itemBuilder: (BuildContext context, index) {
                  User user = bloc.users[index];
                  return Container(
                    child: Column(
                      children: [
                        Text('Name: ${user?.name ?? ''}'),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        ),
      ),
    );
  }
}
