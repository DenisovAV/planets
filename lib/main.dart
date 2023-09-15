import 'package:planets/ui/planets_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'init/init_strategy.dart' if (dart.library.html) 'init/init_strategy.web.dart';

import 'business/planet_bloc.dart';

void main() {
  initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanetBloc>(
      create: (_) => PlanetBloc()..add(PlanetEvent.initializing),
      child: BlocBuilder<PlanetBloc, PlanetState>(
        builder: (context, state) {
          if (state is PlanetLoadedState) {
            return PlanetsRoot(
              planets: state.planets,
            );
          } else {
            return const Center(
              key: ValueKey('loading'),
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
