import 'package:amaizi/bloc/home_bloc.dart';
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 100),
          itemBuilder: (BuildContext context, index) {
            return Container(
              child: Column(
                children: [
                  Text(''),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
