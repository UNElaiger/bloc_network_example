import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/actionButtons.dart';
import '../widgets/userList.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UserBloc(userRepository: context.read<UserRepository>())
              ..add(UserLoadEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('User List'),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  }
}