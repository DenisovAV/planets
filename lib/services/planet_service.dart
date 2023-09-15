import 'package:planets/domain/planet.dart';

abstract class PlanetService {
  Future<List<Planet>> getPlanets();
}


