// A class used to delete a counter entity

import 'package:first_task/features/home_feature/domain/repositories_abstract/counter_repository_abstract.dart';
import 'package:first_task/locator.dart';

class DeleteCounterUseCase {
  // Gets an instance of the `CounterRepositoryImplementation` class
  /*final CounterRepositoryImplementation counterRepository;
  DeleteCounterUseCase(this.counterRepository);*/
  final CounterRepositoryAbstract counterRepository = locator<CounterRepositoryAbstract>();

  // Removes a counter entity from local storage
  Future<void> execute() async {
    await counterRepository.deleteCounter();
  }
}