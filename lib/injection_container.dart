import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

import 'helpers/dio_factory.dart';
import 'helpers/network_services.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async{
  // Dio
  final dio = DioFactory.getDio();

  // Api Client
  injector.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Firebase Service
  final database = FirebaseDatabase.instance;
  injector.registerLazySingleton<FirebaseService>(() => FirebaseService(database));
}
