# Front End

Great job working on your Ruby and Active Records 🎉

It's time to start building towards the Pokemon battle arena! 🥊

## Setup

Let's first pull over everything that you have done and open up the challenge page. Take the time to read what each line is doing. It's important to not blindly copy and paste but to **understand** what we're doing.

```
# go to the root of the folder
cd ~/code/$GITHUB_USERNAME/camp-reboot

# check for any updates
git pull origin master          # main if your branch is main

# go to second challenge folder
cd ~/code/$GITHUB_USERNAME/camp-reboot/02-front-end

# copy from the previous folder the models to our app directory
cp -r ../01-ruby-and-active-record/app/models app/

# also get everything in the db folder
cp -r ../01-ruby-and-active-record/db db

install any additional gems
bundle install

save our current progress
git add . && git commit -m "updated challenge 2 with previous work"
```

### [Sinatra](https://sinatrarb.com/)

As a reminder, [Sinatra](https://sinatrarb.com/) is a MVC framework that is essentially a mini Rails, the main framework that we will eventually be using.

Sinatra will allow us to view our files based on routes that we declare in our `app/app.rb` file, which acts as our controller. Remember the flow goes

```
1. user hits a route
2. we look for that route in app.rb
3. run code for that particular route
4. finish off by rendering a template using erb:, or redirecting elsewhere if we're not loading a view
```

to run our app, in our terminal we run

```
ruby app/app.rb
```

then we can visit our local development app at [localhost:4567](http://localhost:4567)

### Instructions

Your task involves developing a user flow that includes two distinct screens.

## Welcome Screen

The first screen is designed to welcome our two players, setting the stage for the battles ahead from the root page [localhost:4567/](http://localhost:4567)

Here is a guide on how the page could look.

<img width="1440" alt="welcome page" src="https://github.com/AshIgnYeo/camp-reboot/assets/65697575/4c559bbd-aa50-44f8-8ff1-862f3d13d0b0">


You could also use a background image behind the text box as a full page banner to make it more immersive, found in `images/arena.png`

The button on the page should link to the next page at [localhost:4567/games/new](http://localhost:4567/games/new), which follows the [RESTful naming conventions](https://en.wikipedia.org/wiki/Representational_state_transfer)

Feel free to copy the text below or come up with your own witty content. 😉

```
                    -----------------------------------
                    |                                 |
                    |   Welcome to the Arena          |
                    |                                 |
                    |   Two players shall battle      |
                    |   to prove which is the better  |
                    |   pokemon trainer. Or rather    |
                    |   who has the fastest fingers.  |
                    |   Are you ready???              |
                    |                                 |
                    |   -------------------------     |
                    |   |    Choose Pokemon     |     |
                    |   -------------------------     |
                    |                                 |
                    -----------------------------------
```

## New Game
The second screen at `games/new` is where the players will make their choices and form their teams. After the welcome screen, each player will see a form like this:

![image](https://github.com/AshIgnYeo/camp-reboot/assets/65697575/9b86530e-efb4-47b8-bfec-5e7fd7196fb6)


demo content for the page:

```
                                         NEW GAME

        ------------------------------------------------------------------------
        |           Welcome to the ultimate Pokemon Battle Arena! 🎉🎉          |
        |          Get ready to prove your skills as a Pokemon trainer. 🏆      |
        |         Choose your Pokemon wisely and let the battle begin! 🥊🔥     |
        ------------------------------------------------------------------------

        -----------------------------------   -----------------------------------
        |                                 |   |                                 |
        |   Player 1 Name: _________      |   |   Player 2 Name: _________      |
        |                                 |   |                                 |
        |   Choose your Pokemon:          |   |   Choose your Pokemon:          |
        |   1) ▼_________                 |   |   1) ▼_________                 |
        |   2) ▼_________                 |   |   2) ▼_________                 |
        |   3) ▼_________                 |   |   3) ▼_________                 |
        |                                 |   |                                 |
        -----------------------------------   -----------------------------------

                                -------------------------
                                |       Battle!         |
                                -------------------------
```

Each player will select:

a) A unique Player name to identify themselves.

b) Their first Pokemon, from a dropdown of choices.

c) Their second Pokemon, from a dropdown of choices.

d) Their third Pokemon, from a dropdown of choices.

Overhere we can utilise the [bootstrap forms](https://getbootstrap.com/docs/5.0/forms/overview/) and also the [grid system](https://getbootstrap.com/docs/5.0/layout/grid/) to help quickly frame up our content.

After both players have made their selections, one of the players will have to click the "Battle!" button. This will lead to the form creation page at `POST localhost:4567/games`, which we have not built yet!

## Important notes:

- For this challenge, there is no need to add any logic to the form yet. The aim is to have a front end that looks good. 😎 We will apply the logic in the following exercise!
- The "Battle!" button should submit the form to `POST localhost:4567/games`. we will build this in the next exercise too!

---

Happy with your front-end? Awesome! Let's commit our code. And move on to the next challenge. 🔥
