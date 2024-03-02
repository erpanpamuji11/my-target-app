
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_terget_app/features/business/domain/entities/business.dart';
import 'package:my_terget_app/features/business/domain/usecases/get_business.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late GetBusiness usecase;
  late MockBusinessRepository repository;

  setUp(() {
    repository = MockBusinessRepository();
    usecase = GetBusiness(repository);
  });

  final tBusinessList = [
    Business(
      "business on top",
      "margin strategy",
      "2500000",
      DateTime.now(),
      DateTime.now(),
      DateTime.now(),
      "done",
    ),
    Business(
      "business special on user",
      "equal strategy",
      "2500000",
      DateTime.now(),
      DateTime.now(),
      DateTime.now(),
      "to do",
    ),
  ];

  test("should get todo list from repository", () async {
    //arrage
    when(repository.getBusiness()).thenAnswer(
      (_) async => Right(tBusinessList),
    );

    //act
    final result = await usecase.getBusiness();

    //assert
    expect(result, Right(tBusinessList));
    verify(repository.getBusiness());
    verifyNoMoreInteractions(repository);
  });
}
