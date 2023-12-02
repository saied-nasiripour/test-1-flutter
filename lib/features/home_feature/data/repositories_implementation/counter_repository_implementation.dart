import 'package:first_task/features/home_feature/data/data_sourse/local/local_data_source.dart';
import 'package:first_task/features/home_feature/data/model/counter_model.dart';
import 'package:first_task/features/home_feature/domain/repositories_abstract/counter_repository_abstract.dart';
import 'package:first_task/locator.dart';

class CounterRepositoryImplementation extends CounterRepositoryAbstract{


  // Gets an instance of the LocalDataSource class
  final LocalDataSource localDataSource;

  // Constructor
  CounterRepositoryImplementation(this.localDataSource);


  //final LocalDataSource localDataSource = locator<LocalDataSource>();

  // Stores a counter model in local local Storage
  @override
  Future<void> saveCounter(CounterModel counterModel) async {
    await localDataSource.saveIntegerValue(counterModel.value);
  }

  // Retrieves a counter model from Storage
  @override
  Future<CounterModel> getCounter() async {
    final value = await localDataSource.getIntegerValue();
    if (value == null) {
      return CounterModel(0);
    }
    return CounterModel(value!);
  }

  // Removes a model counter from local Storage
  @override
  Future<void> deleteCounter() async {
    await localDataSource.deleteIntegerValue();
  }
}