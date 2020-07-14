Specifications for the Rails Assessment
Specs:

 Using Ruby on Rails for the project
 -Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    user has_many journals, plant has many waters, water has many plants
 -Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    journal belongs to a user, plant, and water. Plant adn Water belong ot a user. 
 -Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    Plants have many waters through journals ansd vice versa. 
 -Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    Plants have many waters through journals ansd vice versa. 
 -The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    Journals have user submittable fields 
 -Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    validations for plant name existing, water plan weeks value range, difficulty range. 
 -Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Plant scope method for most difficult plants
 -Include signup
 -Include login
 -Include logout
 -Include third party signup/login (how e.g. Devise/OmniAuth)
    Signup, Login, Logout, and third party signup/signin are all available. 
 -Include nested resource show or index (URL e.g. users/2/recipes)
    Journal is nested under User
 -Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
 -Include form display of validation errors (form URL e.g. /recipes/new)
    Validation errors appear as a flash alert

Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate