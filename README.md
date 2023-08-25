# Camp Reboot

To get this challenge into your own folder, run the following command in your terminal

```
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
cd ~/code/$GITHUB_USERNAME/
git clone git@github.com:AshIgnYeo/camp-reboot.git .
cd camp-reboot
rm -rf .git
git init
gh repo create --public --source=.
git add . && git commit -m 'Cloned challenge repo'
git push origin main
```

this will clone the challenge repo to your computer and add it to your own github.

---

### End Goal

We're going to create an app that allows 2 people to select a team of 3 pokemons and battle each other! It will utilise everything that we have learnt so far. Ruby, the MVC framework, Sinatra, JavaScript and, yes, **Stimulus**!

⚠️ To Get the instructions of all the individual challenges, go to the GitHub page of that challenge and read the instructions there. You can start with the first one [here](https://github.com/AshIgnYeo/camp-reboot/tree/main/01-ruby-and-active-record)

Good luck and have fun!

---

### Disclaimer

This was all done in one night. There will be mistakes. But don't hesitate to call a teacher to help you resolve them.
