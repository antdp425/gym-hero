Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
   - uses gem 'rails'

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
   - Gym has_many:
      - Members
      - Gym Classes
      - Scheduled Classes

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
   - The following belongs_to Gym
      - Member
      - Gym Classes
      - Scheduled Classes

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
   - Gym Classes has_many Members, through Scheduled Classes
   - Members has_many Gym Classes, through Scheduled Classes

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
   - Gym Classes has_many Members, through Scheduled Classes
   - Members has_many Gym Classes, through Scheduled Classes

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
   - Scheduled Classes allows for Gym to add time

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
   - Gym, Member, GymClass, ScheduledClass all have some type of validation included

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
   - at time of submission:
   * I made this an instance method, as my app didn't really make sense to have it as a class method, hope thats ok
      - ScheduledClass -> gym.scheduled_classes.today -> http://localhost:3000/today (you can also access this from dashboard page in case the url changes)
      - GymClass -> class.scheduled_classes.upcoming_classes -> http://localhost:3000/gym_classes/:gym_class_id/scheduled_classes

- [x] Include signup (how e.g. Devise)
   - Created myself + bcrypt
- [x] Include login (how e.g. Devise)
   - Created myself + bcrypt
- [x] Include logout (how e.g. Devise)
   - Created myself + bcrytp

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
   - Omniauth/Github

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
   - http://localhost:3000/gym_classes/:gym_class_id/scheduled_classes

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
   - http://localhost:3000/gym_classes/:gym_class_id/scheduled_classes/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
   - all forms are wrapped with fields_with_errors

Confirm:
- [] The application is pretty DRY
- [] Limited logic in controllers
- [] Views use helper methods if appropriate
- [] Views use partials if appropriate