import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';
import '../services/user_repository.dart';

class UserCubit extends Cubit<UserState>{
  final UserRepository userRepository;
  UserCubit(this.userRepository) : super(UserEmptyState());

  Future<void>fetchUser() async {
    try {
      emit(UserLoadingState());
      final List<User> _loadedUserList = await userRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: _loadedUserList));
    } catch(_){
      emit(UserErrorState());
    }
  }

Future<void>clearUsers() async {
  emit(UserEmptyState());
}
}