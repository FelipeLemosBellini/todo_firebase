
import 'package:module_todo/model/profile_response_model/profile_response_model.dart';

const String imageUrl =
    "https://mpng.subpng.com/20180710/xui/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3adae62.4180922415312688197114.jpg";

class TodoListViewModel {

  List todoList = [];

  final List<ProfileResponseModel> profiles = [
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Pablo Stefan'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Felipe Bellini'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Pablo Stefan'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Felipe Bellini'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Pablo Stefan'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Felipe Bellini'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Pablo Stefan'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Felipe Bellini'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Pablo Stefan'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Felipe Bellini'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Pablo Stefan'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Felipe Bellini'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Pablo Stefan'),
    ProfileResponseModel(imageUrl: imageUrl, userName: 'Felipe Bellini')
  ];
}
