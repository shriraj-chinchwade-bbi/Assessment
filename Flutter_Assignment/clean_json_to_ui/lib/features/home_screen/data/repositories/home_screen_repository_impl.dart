import 'package:clean_json_to_ui/core/error/exception.dart';
import 'package:clean_json_to_ui/core/error/failures.dart';
import 'package:clean_json_to_ui/core/network/network_info.dart';
import 'package:clean_json_to_ui/features/home_screen/data/model/home_screen_guideline_model.dart'
    as modal;
import 'package:clean_json_to_ui/features/home_screen/domain/entities/home_screen_data.dart';
import 'package:clean_json_to_ui/core/util/utility.dart';
import 'package:clean_json_to_ui/features/home_screen/domain/repositories/home_screen_repository.dart';
import 'package:clean_json_to_ui/features/home_screen/domain/usecases/home_screen_offline_data.dart';
import 'package:clean_json_to_ui/features/home_screen/domain/usecases/home_screen_online_data.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_json_to_ui/features/home_screen/data/datasources/home_screen_local_data_source.dart';
import '../datasources/home_screen_local_data_source.dart';
import '../datasources/home_screen_remote_data_source.dart';
import '../model/home_screen_guideline_model.dart';

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  HomeScreenRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  late final HomeScreenRemoteDataSource remoteDataSource;
  late final HomeScreenLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<GuideLinesModal>>> homeScreenOfflineData(
      switchValue) async {
    // TODO: implement homeScreenOfflineData
    return _getData();
  }

  @override
  Future<Either<Failure, List<GuideLinesModal>>> homeScreenOnlineData(
      switchValue) async {
    // TODO: implement homeScreenOnlineData
    return _getData();
  }

  Future<Either<Failure, List<GuideLinesModal>>> _getData() async {
    if (switchValue == false) {
      try {
        final localData = await localDataSource.homeScreenLocalData();
        return Right(localData);
      } on CacheException {
        return Left(CacheFailure());
      }
    } else if (switchValue == true) {
      try {
        final remoteData = await remoteDataSource.homeScreenRemoteData();
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Right(listGuideLineModal);
  }
}

// Future<List<modal.GuideLinesModal>> readJson() async {
//   if (switchValue == false) {
//     await readJsonOffline();
//   }
//
//   if (switchValue == true) {
//     await readJsonOnline();
//   }
//
//   return (listGuideLineModal);
// }
