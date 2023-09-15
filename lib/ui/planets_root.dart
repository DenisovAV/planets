import 'package:planets/domain/planet.dart';
import 'package:planets/navigator/delegate.dart';
import 'package:planets/navigator/parser.dart';
import 'package:flutter/material.dart';

class PlanetsRoot extends StatefulWidget {
  final List<Planet> planets;

  const PlanetsRoot({
    super.key,
    required this.planets,
  });

  @override
  PlanetsRootState createState() => PlanetsRootState();
}

class PlanetsRootState extends State<PlanetsRoot> {
  late PlanetRouterDelegate planetRouterDelegate;
  late PlanetInformationParser planetInformationParser;

  @override
  void initState() {
    super.initState();
    planetRouterDelegate = PlanetRouterDelegate(widget.planets);
    planetInformationParser = PlanetInformationParser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Planets Market (WebAssembly)',
      routerDelegate: planetRouterDelegate,
      routeInformationParser: planetInformationParser,
    );
  }
}
