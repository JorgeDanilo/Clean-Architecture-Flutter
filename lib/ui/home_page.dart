import 'package:clean_architecture/core/app_state.dart';
import 'package:clean_architecture/core/widget_state.dart';
import 'package:clean_architecture/domain/model/user.dart';
import 'package:clean_architecture/ui/home_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends WidgetState<HomePage, HomeBloc> {
  final List<User> _users = List();

  @override
  void initState() {
    bloc.getUsers();
    bloc.streamController.stream.listen((data) {
      if (data is Failure) print("Error ${data.message}");
      if (data is OnGetUsers) {
        setState(() {
          _users.clear();
          _users.addAll(data.users);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: _listOfUsers());
  }

  Widget _listOfUsers() {
    return StreamBuilder(
        stream: bloc.streamController.stream,
        builder: (context, AsyncSnapshot<AppState> snapshot) {
          if (snapshot.hasData && snapshot.data is Loading)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          if (snapshot.hasData && snapshot.data is Success) {
            var users = (snapshot.data as Success).data;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].firstName),
                    subtitle: Text(users[index].lastName),
                    leading: Image.network(users[index].avatar),
                    trailing: Icon(Icons.more_vert),
                  );
                });
          }
          return Container();
        });
  }
}
