// A class used to store a counter entity
import 'package:first_task/features/home_feature/data/repositories_implementation/counter_repository_implementation.dart';
import 'package:first_task/features/home_feature/domain/entities/counter_entity.dart';
import 'package:first_task/features/home_feature/domain/repositories_abstract/counter_repository_abstract.dart';
import 'package:first_task/locator.dart';

class SaveCounterUseCase {
  // Gets an instance of the `CounterRepositoryImplementation` class
  /*final CounterRepositoryImplementation counterRepository;

  SaveCounterUseCase(this.counterRepository);*/
  final CounterRepositoryAbstract counterRepository = locator<CounterRepositoryAbstract>();

  // Stores a counter entity in local Storage
  Future<void> execute(CounterEntity counterEntity) async {
    await counterRepository.saveCounter(counterEntity.toModel());
  }
}