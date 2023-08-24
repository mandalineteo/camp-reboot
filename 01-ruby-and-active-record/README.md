# Ruby and ActiveRecord

to start the challenge, run the following code in your terminal

```
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
cd ~/code/$GITHUB_USERNAME/camp-reboot/01-ruby-and-activerecord
bundle install
RACK_ENV=test rake
```

### Instructions

As there wasn't enough time for a full set up, the tests are going to be run differently. To run the test suite, type `RACK_ENV=test rake` in your terminal. If you forget, don't worry I've made the terminal scream at you. The rake will drop and spin up it's own test database and run the migrations you wrote. Don't worry about all the output that you will see in the terminal.

For this challenge, we are going to have a recap on our `ruby` and `OOP` basics along with `ActiveRecord` to start. Remember them? Probably not.

To play the game we need `Pokemon`, and to identify who each pokemon belongs to, we need them to belong to a `Player`. To Track all the games, both players will belong to a `Game`. So we have this structure:

```
                                Game
                      ____________|_______________
                      |                          |
                    Player                    Player
        ______________|______               _____|______________
        |         |         |              |         |         |
      Pokemon   Pokemon   Pokemon        Pokemon   Pokemon   Pokemon
```

Which translates to a `Game` has many `Players`, and a `Player` has many `Pokemons`.

---

# Our Database

Let's create our db migration files in `db/migrate` to match the following diagram

Some helper methods for you, but please **read the note below before starting to use them!**

```
rake db:create                             # creates the databases for you
rake db:create_migration [NAME=method]     # creates a migration file for you
rake db:migrate                            # run your migration files in the development environment
rake db:drop:dev                           # drop the development database
```

⚠️ to use the `rake db:create_migration` helper, you have to specify the name of the method you will run. e.g. to create posts, you would run `rake db:create_migration NAME=create_posts`. This will help you create the timestamps and method name accordingly. But you will still need to create your activerecord method. [Read more here](https://guides.rubyonrails.org/active_record_migrations.html).

---

# Our Models

We will create our models in the `app/models/` folder. We don't have to change anything else for this challenge

### Game

This one is simple, we don't need any properties. We just need the `id`, and that's automatically generated for us. We just need to tag our associations appropriately.

### Player

Also a relatively simple one. We just need to get our associations right and have a column in our database for a name.

### Pokemon

It wouldn't stay easy for long would it? Our pokemon needs to initialise with a few properties. `name`, `health`, `damage`, `defence`, `speed`, and also an `image` which will be stored as a string.

---

All good? Great! Let's move on! 🚀
