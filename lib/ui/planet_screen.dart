import 'package:planets/domain/planet.dart';
import 'package:planets/ui/widgets/planet_grid.dart';
import 'package:flutter/material.dart';

class PlanetScreen extends StatefulWidget {
  final ValueChanged<Planet> onTapped;
  final List<Planet> planets;
  const PlanetScreen({
    super.key,
    required this.onTapped,
    required this.planets,
  });

  @override
  PlanetScreenState createState() => PlanetScreenState();
}

class PlanetScreenState extends State<PlanetScreen> {
  Widget _buildTitle() {
    return const Center(
      child: Text(
        'Planets Market (WebAssembly)',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPlanetGrid() {
    return Expanded(
      child: PlanetGrid(planets: widget.planets, onTapPlanet: (planet) => widget.onTapped(planet)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTitle(),
            _buildPlanetGrid(),
          ],
        ),
      ),
    );
  }
}
