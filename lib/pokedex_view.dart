import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';

import 'bloc/pokemon_state.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is PokemonLoadingInProgress) {
          return const Center(child: CircularProgressIndicator(),);
        } else if (state is PokemonPageLoadSuccess) {
          return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: state.pokemonListings.length, itemBuilder: (context, index) {return Card(child: GridTile(child: Column(children: [Image.network(''), Text(state.pokemonListings[index].name)],),),);},);
        }
      }),
    )
  }
}
