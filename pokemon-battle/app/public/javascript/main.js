import { Application } from "stimulus";
window.Stimulus = Application.start();

import SelectPokemonController from "./controllers/select_pokemon_controller.js";
Stimulus.register("select-pokemon", SelectPokemonController);

import BattleController from "./controllers/battle_controller.js";
Stimulus.register("battle", BattleController);
