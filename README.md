# Work Vision

## Project made with the aim of generating publication and visibility for works and services of workers in general.

Content Index
=================
- [About](#about)
- [How To Use](#how-to-use)
- [Technology](#technology)
- [Documentation](#documentation)
- [License](#license)

## <a name="about"></a>About
  Project developed in Ruby on Rails with the aim of generating visibility and increasing the number of work requests in general.

## <a name="how-to-use"></a>How To Use
  -  Clone the project
  -  Run the bundle install
      -  rails db:create
      -  rails db:migrate
      -  rails db:seed (optional)
      -  and be happy :grin: :heart:
      <br>
      - 💻 Or you can use `make` for this: 
         - Run `make db_setup` to create and migrate database
         - If you need reset database, run `make db_reset` 🔄
      <br>
  - Run the project
    - Run `make start`

  - ⚠️ If there are any errors, run:
    - Run `bin/dev` (or `bin/rails server`) to start the app in the foreground

  - Stop the project
    - run `make stop`

## <a name="technology"></a>Technology
  Using Ruby 4.0, Ruby On Rails 8.1, PostgreSQL and Bcrypt gem.
  Front-end assets are served by Propshaft and JavaScript is loaded with import maps
  (no Node.js/Yarn required). Navigation uses Turbo (Hotwire).

## <a name="documentation"></a>Documentation
 - #### [Schema Documentation](docs/schema_documentation.md)

## <a name="license"></a>License
  Authentication Login is released under the [MIT License](https://opensource.org/licenses/MIT).