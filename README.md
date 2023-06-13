# 📚 Blork's Used Spaceship Emporium

A spaceship rental system that allows you to book a ship for a set amount of days of your choosing. Rental charge is then calculated by said amount of days and basic rate of the ship to rent out per day. You can then see which ships you have booked and for what time period. Also can see any of your ships rented out.

_DROP SCREENSHOT HERE_
<br>
App home: https://blorks-used-spaceships.herokuapp.com


## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
Inspired by Airbnb

## Team Members
- [Daniel Scharf](https://github.com/DanielBScharf)
- [Stefano Zerega](https://github.com/flaynautomata)
- [Tsubasa Toda](https://github.com/Tsubasa-Toda)
- [X'Zaiver Wolfinbarger](https://github.com/Wolfinbarger)


## License
This project is licensed under the MIT License
