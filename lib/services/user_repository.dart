import 'package:bloc_network_example/models/user.dart';
import 'package:bloc_network_example/services/user_api_provider.dart';

class UserRepository{
 UserProvider _usersPeovider = UserProvider();
 Future<List<User>>getAllUsers() => _usersPeovider.getUsers();
}