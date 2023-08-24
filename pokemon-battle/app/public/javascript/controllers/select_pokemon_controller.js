import { Controller } from "stimulus";
import pokemonList from "../pokemons.js";

export default class extends Controller {
  connect() {
    this.loadOptions();
  }

  loadOptions() {
    const url = "https://pokeapi.co/api/v2/generation/1";
    // fetch(url)
    //   .then((res) => res.json())
    //   .then(({ pokemon_species }) => this.updateOptions(pokemon_species));
    this.updateOptions(pokemonList);
  }

  updateOptions(pokemons) {
    pokemons.forEach((pokemon) =>
      this.element.insertAdjacentHTML("beforeend", this.createOption(pokemon))
    );
  }

  createOption({ name }) {
    return `<option value="${name}">${name}</option>`;
  }
}
