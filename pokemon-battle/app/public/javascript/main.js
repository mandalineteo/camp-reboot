import { Application } from "stimulus";
import pokemonList from "./pokemons.js";
export { pokemonList };
window.Stimulus = Application.start();

import SelectPokemonController from "./controllers/select_pokemon_controller.js";
Stimulus.register("select-pokemon", SelectPokemonController);
