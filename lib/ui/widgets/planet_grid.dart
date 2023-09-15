import 'package:planets/domain/planet.dart';
import 'package:planets/ui/widgets/focus_wrap.dart';
import 'package:planets/ui/widgets/planet_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlanetGrid extends StatelessWidget {
  PlanetGrid({
    super.key,
    required this.planets,
    required this.onTapPlanet,
  });

  final controller = ScrollController();
  final List<Planet> planets;
  final Function(Planet) onTapPlanet;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Scrollbar(
            child: getGreed(context),
          )
        : getGreed(context);
  }

  Widget getGreed(BuildContext context) => CustomScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(28),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width / 250).round(),
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => FocusWrap(
                  onTap: () => onTapPlanet(planets[index]),
                  child: PlanetCard(
                    planet: planets[index],
                    index: index,
                    onTap: () => onTapPlanet(planets[index]),
                  ),
                ),
                childCount: planets.length,
              ),
            ),
          )
        ],
      );
}
