import 'package:amaizi/bloc/home_bloc.dart';
import 'package:amaizi/models/user.dart';
import 'package:amaizi/tools/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
            bloc.refresh();
          },
        ),
        title: Text(
          'Users',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: BlocProvider(
        bloc: bloc,
        child: StreamBuilder<Object>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              child:
                  bloc.loading ?
              Center(
                child: SpinKitFadingCircle(
                  color: Colors.red,
                  size: 100.0,
                ),
              ):
              ListView.builder(
                shrinkWrap: true,
                itemCount: bloc.users.length,
                padding: EdgeInsets.only(top: 100),
                itemBuilder: (BuildContext context, index) {
                  User user = bloc.users[index];
                  return Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Name: ${user?.name ?? ''}'),
                        ),
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
