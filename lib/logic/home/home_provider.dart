import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/helpers/error/error_handler.dart';
import 'package:graduation_project/helpers/network_services.dart';
import 'package:graduation_project/injection_container.dart';

enum HomeStatus {
  initial,
  loading,
  failure,
  loggedOut
}

class HomeProvider extends ChangeNotifier {
  HomeStatus _status = HomeStatus.initial;
  HomeStatus get status => _status;

  late String? errorMessage;

  Future<void> logout() async {
    _status = HomeStatus.loading;
    notifyListeners();

    try {
      await injector<ApiService>().logout();
      _status = HomeStatus.loggedOut;
      notifyListeners();
    } catch (error) {
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      _status = HomeStatus.failure;
      notifyListeners();

      resetState();
    }
  }

  void resetState() {
    _status = HomeStatus.initial;
    errorMessage = null;
    notifyListeners();
  }

  // Chart methods

  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  final List<num> _chartNumbers = [];
  List<num> get chartNumbers => _chartNumbers;

  num _bpm = 0;
  num get bpm => _bpm;

  HomeProvider() {
    _getVibration();
    _getBPM();
  }

  void _getVibration() {
    _databaseReference.child('Drawing').child('Vibration').onValue.listen((event) {
      final num newVibration = event.snapshot.value as num;
      _addVibrationToList(newVibration);
    });
  }

  void _addVibrationToList(num number) {
    _chartNumbers.add(number);
    print(number);
    notifyListeners();
  }

  void _getBPM() {
    _databaseReference.child('Drawing').child('BPM').onValue.listen((event) {
      final num newBPM = event.snapshot.value as num;
      _setBPM(newBPM);
    });
  }

  void _setBPM(num bpm) {
    _bpm = bpm;
    notifyListeners();
  }
}
