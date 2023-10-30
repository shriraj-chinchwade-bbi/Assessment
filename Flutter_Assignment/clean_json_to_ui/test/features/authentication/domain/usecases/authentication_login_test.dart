import 'package:clean_json_to_ui/core/error/failures.dart';
import 'package:clean_json_to_ui/features/authentication/data/model/authentication_model.dart';

import 'package:clean_json_to_ui/features/authentication/domain/entities/authentication_entity.dart';
import 'package:clean_json_to_ui/features/authentication/domain/repositories/authentication_repositoy.dart';
import 'package:clean_json_to_ui/features/authentication/domain/usecases/authentication_login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// final testAuthenticationEntity = AuthenticationEntity(
//   email: 'test@example.com',
//   password: 'test_password',
//   name: 'Test User',
// );

// class MockAuthenticationRepository extends Mock
//     implements AuthenticationRepository {
//   bool loginIsSuccess = false;
//   late AuthenticationModel authenticationData;
//
//   MockAuthenticationRepository() {
//     authenticationData = AuthenticationModel(
//       email: 'noob@gmail.com',
//       password: 'password',
//       name: 'pranav',
//     );
//   }
//
//   @override
//   Future<Either<Failure, dynamic>> authenticationLogin() {
//     // ...
//
//     if (loginIsSuccess) {
//       return Future.value(Right(authenticationData));
//     } else {
//       return Future.value(Left(ServerFailure()));
//     }
//   }
// }
//
// // void main() {
// //   late AuthenticationLogin usecase;
// //   late MockAuthenticationRepository mockAuthenticationRepository;
// //
// //   setUp(() {
// //     mockAuthenticationRepository = MockAuthenticationRepository();
// //     usecase = AuthenticationLogin(mockAuthenticationRepository);
// //   });
// //
// //   test('should return a success result when the authentication is successful',
// //       () async {
// //     // Arrange: Stub the repository method.
// //     when(mockAuthenticationRepository.authenticationLogin())
// //         .thenAnswer((_) async => Right(testAuthenticationEntity));
// //     // Act
// //     final result = await usecase();
// //     // Assert
// //     expect(result, Right(testAuthenticationEntity));
// //   });
// //
// //   test('should return a failure result when the authentication is unsuccessful',
// //       () async {
// //     // Arrange: Stub the repository method.
// //     when(mockAuthenticationRepository.authenticationLogin())
// //         .thenAnswer((_) async => Left(ServerFailure()));
// //     // Act
// //     final result = await usecase();
// //     // Assert
// //     expect(result, Left(ServerFailure()));
// //   });
// // }
//
// // class MockAuthenticationDataRepository extends Mock
// //     implements AuthenticationRepository {}
//
// class MockAuthenticationDataRepository extends Mock
//     implements AuthenticationRepository {
//   bool loginIsSuccess = false;
//   late AuthenticationModel authenticationData;
//
//   MockAuthenticationDataRepository() {
//     authenticationData = AuthenticationModel(
//       email: 'noob@gmail.com',
//       password: 'password',
//       name: 'pranav',
//     );
//   }
//
//   @override
//   Future<Either<Failure, dynamic>> authenticationLogin() {
//     if (loginIsSuccess) {
//       // Return a Right() value if the login is successful.
//       return Future.value(Right(authenticationData));
//     } else {
//       // Return a Left() value if the login is unsuccessful.
//       return Future.value(Left(ServerFailure()));
//     }
//   }
// }
//
// void main() {
//   late AuthenticationLogin usecase;
//   late MockAuthenticationDataRepository mockRepository;
//
//   setUp(() {
//     mockRepository = MockAuthenticationDataRepository();
//     usecase = AuthenticationLogin(mockRepository);
//   });
//
//   test('should return authentication data when invoked', () async {
//     // Arrange
//     final authenticationData = AuthenticationModel(
//       email: 'shri@gmail.com',
//       password: 'password',
//       name: 'shriraj',
//     );
//
//     // Move the `when()` call inside of the `thenAnswer()` call.
//     when(mockRepository.authenticationLogin())
//         .thenAnswer((_) async => Right(authenticationData));
//
//     // Act
//     final result = await usecase.call();
//
//     // Assert
//     expect(result, Right(authenticationData));
//   });
//
//   test('should return a failure result when the authentication is unsuccessful',
//       () async {
//     // Arrange
//     when(mockRepository.authenticationLogin())
//         .thenAnswer((_) async => Left(ServerFailure()));
//
//     // Act
//     final result = await usecase.call();
//
//     // Assert
//     expect(result, Left(ServerFailure()));
//     verify(mockRepository.authenticationLogin());
//     verifyNoMoreInteractions(mockRepository);
//   });
// }

// Define a mock implementation of the AuthenticationRepository

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late AuthenticationLogin usecase;
  late MockAuthenticationRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthenticationRepository();
    usecase = AuthenticationLogin(mockRepository);
  });

  group('invoke', () {
    test('should return authentication data when invoked', () async {
      // Arrange
      var authenticationData = AuthenticationModel(
        // Add necessary data here
        email: 'test@gmail.com',
        password: 'test@123',
        name: null,
      );

      when(mockRepository.authenticationLogin())
          .thenAnswer((_) async => Right(authenticationData));

      // Act
      final result = await usecase.invoke();

      // Assert
      expect(result, Right(authenticationData));
      verify(mockRepository.authenticationLogin());
      verifyNoMoreInteractions(mockRepository);
    });
  });

  group('getLoginValueToUsecaseFile', () {
    test('should call authentication for login with provided credentials',
        () async {
      // Arrange
      const email = 'test@gmail.com';
      const password = 'test@123';

      // Act
      await usecase.getLoginValueToUsecaseFile(email, password);

      // Assert
      verify(mockRepository.callAuthenticationForLogin(email, password));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
