# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    - User has_many teams, League has_many Teams, and Team has_many Players
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) 
    - Team belongs_to User, Team belongs_to Leauge, and Player belongs_to Team
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) 
    - User has_many Leagues through Teams, League has_many Users through Teams
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) 
    - User has_many Leagues through Teams, League has_many Users through Teams
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) 
    - Team is the join table and allows the user to submit the city, name and coach for the team. 
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - Included validations for User model, Player model, and Team model
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - Created a scope method for the team model that sorts the teams in alphabetical order. Creaed another scope method for the player model that sorts the players by their number in ascending order.
- [x] Include signup
    - User can signup
- [x] Include login
    - User can login
- [x] Include logout
    -User can logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - User can signup and login with Google
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - Nested resource show page for users/:id/teams/:id and teams/:id/players/:id
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - Nested resource new form for users/:id/teams/new and teams/:id/players/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - Included form display of validation errors for creating a new user, team and player. Also for editing a user, team or player

Confirm:
- [x] The application is pretty DRY
    - extrated things into methods if I found myself repeating things
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
    - Used helper methods in views when needed
- [x] Views use partials if appropriate
    - Used partials for creating a new user, as well as creating a new player and editing a player.