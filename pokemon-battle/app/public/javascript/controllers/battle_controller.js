import { Controller } from "stimulus";

export default class extends Controller {
  // prettier-ignore
  static values = {gameId: Number,};
  // prettier-ignore
  static targets = ["loader","p1Main","p2Main","p1MainHp","p2MainHp","p1p1","p1p2","p1p3","p2p1","p2p2","p2p3","p1p1Hp","p1p2Hp","p1p3Hp","p2p1Hp","p2p2Hp","p2p3Hp",];

  connect() {
    this.p1ActiveId = 0;
    this.p2ActiveId = 0;

    this.game = fetch(`/games/${this.gameIdValue}`)
      .then((res) => res.json())
      .then(({ player1, player2 }) => {
        this.player1 = player1;
        this.player2 = player2;

        this.gameInit();
      });
  }

  countdown() {
    let count = 3;
    let timer;
    timer = setInterval(() => {
      this.loaderTarget.innerHtml = `<div class="countdown">${count}</div>`;
      count--;
      // if (count === 0) clearInterval(timer);
    }, 1000);
  }

  setActive() {
    this.activePokemon1 = this.player1.pokemons[this.p1ActiveId];
    this.activePokemon2 = this.player2.pokemons[this.p2ActiveId];
    this.p1MainTarget.src = this.activePokemon1.image;
    this.p2MainTarget.src = this.activePokemon2.image;
  }

  setTeams() {
    this.player1.pokemons.forEach((pokemon, index) => {
      // this[`p1p${index + 1}Target`].src = pokemon.image;
      pokemon.startingHp = pokemon.health;
    });

    this.player2.pokemons.forEach((pokemon, index) => {
      pokemon.startingHp = pokemon.health;
      // this[`p1p${index + 1}Target`].src = pokemon.image;
    });
  }

  gameInit() {
    this.setTeams();
    this.setActive();
    this.countdown();
    document.addEventListener("keyup", this.keyDispatcher.bind(this));
    this.loaderTarget.classList.add("loaded");
  }

  attack(target, dmg) {
    const dealt = Math.floor(Math.random() * (dmg - target.defence + 1));
    target.health -= dealt > 0 ? dealt : 10;
    target.health < 0 && (target.health = 0);
    this.updateHealth();
  }

  // prettier-ignore
  updateHealth() {
    const p1p1Hp = (this.player1.pokemons[0].health / this.player1.pokemons[0].startingHp) *100
    const p1p2Hp = (this.player1.pokemons[1].health / this.player1.pokemons[1].startingHp) *100
    const p1p3Hp = (this.player1.pokemons[2].health / this.player1.pokemons[2].startingHp) *100
    const p2p1Hp = (this.player2.pokemons[0].health / this.player2.pokemons[0].startingHp) *100
    const p2p2Hp = (this.player2.pokemons[1].health / this.player2.pokemons[1].startingHp) *100
    const p2p3Hp = (this.player2.pokemons[2].health / this.player2.pokemons[2].startingHp) *100
    const p1MainHp = (this.activePokemon1.health / this.activePokemon1.startingHp) * 100
    const p2MainHp = (this.activePokemon2.health / this.activePokemon2.startingHp) * 100

    this.p1p1HpTarget.style.width = `${p1p1Hp}%`
    p1p1Hp < 30 && this.p1p1HpTarget.classList.add('danger')
    p1p1Hp === 0 && this.p1p1Target.classList.add('dead')

    this.p1p2HpTarget.style.width = `${p1p2Hp}%`
    p1p2Hp < 30 && this.p1p2HpTarget.classList.add('danger')
    p1p2Hp === 0 && this.p1p2Target.classList.add('dead')

    this.p1p3HpTarget.style.width = `${p1p3Hp}%`
    p1p3Hp < 30 && this.p1p3HpTarget.classList.add('danger')
    p1p3Hp === 0 && this.p1p3Target.classList.add('dead')

    this.p2p1HpTarget.style.width = `${p2p1Hp}%`
    p2p1Hp < 30 && this.p2p1HpTarget.classList.add('danger')
    p2p1Hp === 0 && this.p2p1Target.classList.add('dead')

    this.p2p2HpTarget.style.width = `${p2p2Hp}%`
    p2p2Hp < 30 && this.p2p2HpTarget.classList.add('danger')
    p2p2Hp === 0 && this.p2p2Target.classList.add('dead')

    this.p2p3HpTarget.style.width = `${p2p3Hp}%`
    p2p3Hp < 30 && this.p2p3HpTarget.classList.add('danger')
    p2p3Hp === 0 && this.p2p3Target.classList.add('dead')

    this.p1MainHpTarget.style.width = `${p1MainHp}%`
    p1MainHp < 30 && this.p1MainHpTarget.classList.add('danger')
    p1MainHp === 0 && this.p1MainTarget.classList.add('dead')

    this.p2MainHpTarget.style.width = `${p2MainHp}%`
    p2MainHp < 30 && this.p2MainHpTarget.classList.add('danger')
    p2MainHp === 0 && this.p2MainTarget.classList.add('dead')

  }

  // prettier-ignore
  checkForWinner() {
    if ( this.player1.pokemons.every((pokemon) => {pokemon.health === 0;}) ) {
      alert(`${this.player1.name} has the fastest fingers ever`);
    }

    console.log(
      this.player2.pokemons.every((pokemon) => {
        pokemon.health === 0;
      })
    );

    if ( this.player2.pokemons.every((pokemon) => {pokemon.health == 0;}) ) {
      alert(`${this.player2.name} has the fastest fingers ever`);
    }
    console.log(this.player1.pokemons, this.player2.pokemons);
  }

  keyDispatcher(e) {
    switch (e.key) {
      case "q":
        if (this.activePokemon1.health)
          this.attack(this.activePokemon2, this.activePokemon1.damage);
        break;

      case "p":
        if (this.activePokemon2.health)
          this.attack(this.activePokemon1, this.activePokemon2.damage);
        break;

      case "1":
        this.p1ActiveId = 0;
        this.setActive();
        break;

      case "2":
        this.p1ActiveId = 1;
        this.setActive();
        break;

      case "3":
        this.p1ActiveId = 2;
        this.setActive();
        break;

      case "8":
        this.p2ActiveId = 0;
        this.setActive();
        break;

      case "9":
        this.p2ActiveId = 1;
        this.setActive();
        break;

      case "0":
        this.p2ActiveId = 2;
        this.setActive();
        break;
    }

    this.checkForWinner();
  }
}
