// A class used to retrieve a counter entity

import 'package:first_task/features/home_feature/data/repositories_implementation/counter_repository_implementation.dart';
import 'package:first_task/features/home_feature/domain/entities/counter_entity.dart';
import 'package:first_task/features/home_feature/domain/repositories_abstract/counter_repository_abstract.dart';
import 'package:first_task/locator.dart';
class GetCounterUseCase {
  // Gets an instance of the `CounterRepositoryImplementation` class
  /*final CounterRepositoryImplementation counterRepository;

  GetCounterUseCase(this.counterRepository);*/
  final CounterRepositoryAbstract counterRepository = locator<CounterRepositoryAbstract>();

  // Retrieves a counter entity from local storage
  Future<CounterEntity> execute() async {
    final counterModel = await counterRepository.getCounter();
    return counterModel.toEntity();
  }
}