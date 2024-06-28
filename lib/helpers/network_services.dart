import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:retrofit/http.dart';

import '../Models/disease_diagnosis/disease_prediction_response.dart';
import '../Models/doctors/doctor_response.dart';
import '../Models/home/measurement_model.dart';
import '../Models/login/login_params.dart';
import '../Models/login/login_response_model.dart';
import '../Models/new_password/new_password_params.dart';
import '../Models/otp/otp_params.dart';
import '../Models/profile/profile_response.dart';
import '../Models/registration/registration_params.dart';
import '../Models/update_password/update_password_params.dart';

part 'network_services.g.dart';

@RestApi(baseUrl: "https://dear-whole-moth.ngrok-free.app/api/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("users/login")
  Future<LoginResponseModel> login(@Body() LoginParams params);

  @POST("users/register")
  Future<void> register(@Body() RegistrationParams params);

  @POST("users/generateOTP")
  Future<void> sendOtp(@Field("email") String param);

  @POST("users/verifyOTP")
  Future<void> verifyOtp(@Body() OtpParams params);

  @POST("users/resetPassword")
  Future<void> resetPassword(@Body() NewPasswordParams params);

  @PUT("users/updatePassword")
  Future<void> updatePassword(@Body() UpdatePasswordParams params);

  @GET("doctors/show")
  Future<DoctorsResponse> getDoctors();

  @GET("users/show/{id}")
  Future<ProfileResponseModel> getProfileData({@Path("id") required int id});

  @MultiPart()
  @POST("users/update/{id}")
  Future<void> updateProfile({
    @Path("id") required int id,
    @Part(name: "username") String? name,
    @Part(name: "email") String? email,
    @Part(name: "phoneNumber") String? phone,
    @Part(name: "birthdate") String? birthDate,
    @Part(name: "photo") File? avatar,
  });

  @MultiPart()
  @POST("query-model")
  Future<List<DiseasePredictionResponse>> predictDisease(
    @Part(name: "file") File image,
  );

  @POST("users/logout")
  Future<void> logout();
}

class FirebaseService {
  final FirebaseDatabase _database;

  const FirebaseService(this._database);

  Future<void> getGlovesReading() async{
    _database.ref().child('Drawing').onValue.listen((event) {
      print(">>>>>>> stream ::: ${event.snapshot}");
    });
  }
}
