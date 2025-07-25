import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/models/moviedetail_model.dart';
import 'package:movie/models/serch_model.dart';
import 'package:movie/utils/network_util.dart';


final dio = DioSetup().dio;

class MovieApis {
  //search movie
  static Future<Either<String, SearchModel>> getSerchMovies(
    String search,
  ) async {
    try {
      final response = await dio.post(
        "$base_url/?s=$search&apikey=35882e11",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data["Response"] == "True") {
          final data = SearchModel.fromJson(response.data);
          return Right(data);
        } else {
          return Left(response.data["Error"]);
        }
      } else {
        // final data = jsonDecode(response.data);
        return Left(response.data["error"]);
      }
    } on DioException catch (e) {
      // if (e.response != null) {
      //   final json = jsonDecode(e.response!.toString());
      //   return Left(json!["error"]);
      // } else {
        return const Left("Oops! something went wrong");
      // }
    } catch (e) {
      return const Left("Oops! something went wrong");
    }
  }

  //complete movie details
    static Future<Either<String, MovieDetail>> getCompleteMovieDetails(
    String id,
  ) async {
    try {
      final response = await dio.post(
        "$base_url/?i=$id&apikey=35882e11",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data["Response"] == "True") {
          final data = MovieDetail.fromJson(response.data);
          return Right(data);
        } else {
          return Left(response.data["Error"]);
        }
      } else {
        // final data = jsonDecode(response.data);
        return Left(response.data["error"]);
      }
    } on DioException catch (e) {
      // if (e.response != null) {
      //   final json = jsonDecode(e.response!.toString());
      //   return Left(json!["error"]);
      // } else {
        return const Left("Oops! something went wrong");
      // }
    } catch (e) {
      return const Left("Oops! something went wrong");
    }
  }
}
