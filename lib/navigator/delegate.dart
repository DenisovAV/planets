import 'dart:async';

import 'package:planets/domain/planet.dart';
import 'package:planets/navigator/parser.dart';
import 'package:planets/ui/planet_screen.dart';
import 'package:planets/ui/widgets/planet_details.dart';
import 'package:flutter/material.dart';

class PlanetRouterDelegate extends RouterDelegate<PlanetRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PlanetRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Planet? _selectedPlanet;
  List<Planet> planets;

  PlanetRouterDelegate(this.planets) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  PlanetRoutePath get currentConfiguration {
    return _selectedPlanet == null
        ? PlanetRoutePath.home()
        : PlanetRoutePath.details(_selectedPlanet!.name);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('PlanetsListPage'),
          child: PlanetScreen(
            onTapped: _handlePlanetTapped,
            planets: planets,
          ),
        ),
        if (_selectedPlanet != null) PlanetDetailsPage(planet: _selectedPlanet!)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedPlanet = null;
        notifyListeners();

        return true;
      },
    );
  }

  void _handlePlanetTapped(Planet planet) {
    _selectedPlanet = planet;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(PlanetRoutePath configuration) async {
    if (configuration.isDetailsPage) {
      _selectedPlanet = planets.firstWhere((element) => element.name.toLowerCase() == configuration.name);
    } else {
      _selectedPlanet = null;
    }
  }
}

class PlanetDetailsPage extends Page {
  final Planet planet;

  PlanetDetailsPage({
    required this.planet,
  }) : super(key: ValueKey(planet));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return PlanetDetails(planet: planet);
      },
    );
  }
}
