import '../../data/repo/home_repo.dart';
import '../entities/home_entity.dart';

class GetHomeData {
  final HomeRepository repository;

  GetHomeData(this.repository);

  Future<Map<String, List<HomeEntity>>> call() async {
    final data = await repository.fetchHomeData();
    return {
      'bestSelling': data['bestSelling']!.map((model) => HomeEntity(id: model.id, name: model.name, price: model.price, image: model.image)).toList(),
      'newArrival': data['newArrival']!.map((model) => HomeEntity(id: model.id, name: model.name, price: model.price, image: model.image)).toList(),
      'recommendedForYou': data['recommendedForYou']!.map((model) => HomeEntity(id: model.id, name: model.name, price: model.price, image: model.image)).toList(),
    };
  }
}
