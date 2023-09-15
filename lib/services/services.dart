import 'package:planets/services/dummy_planet_service.dart';
import 'package:planets/services/planet_service.dart';

PlanetService getPlanetService() {
  return DummyPlanetService();
}