import 'package:planets/domain/planet.dart';
import 'package:flutter/material.dart';

class PlanetDetails extends StatelessWidget {
  final Planet planet;
  const PlanetDetails({
    required this.planet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 256.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: planet.name,
                child: Image.asset(
                  planet.image,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  planet.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  planet.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
