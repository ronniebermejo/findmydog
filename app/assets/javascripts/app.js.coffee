# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module('findMyDogApp', ["ngResource"])


app.config ["$httpProvider", ($httpProvider) ->
  # Inject the CSRF token
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content
  # By default, angular sends "application/json, text/plain, */*" which rails
  # sees and focuses on the */* and sends html :-(
  $httpProvider.defaults.headers.common['Accept'] = "application/json"
]

app.factory "Pet", ($resource) -> $resource "./api/pet/:id", id: "@id"

app.controller 'findMyDogController', ($scope, Pet) ->

  $scope.pet = new Pet()
  $scope.pets = Pet.query()

  # Delete a post
  $scope.delete = ($index) ->
    # Yay, UX!
    if confirm("Are you sure you want to delete this post?")
      # Remove from the server
      $scope.pets[$index].$delete()
      # Remove from the local array
      $scope.pets.splice($index, 1)

  # Show post
  $scope.show = ($index) ->
    # Remove from the server
    alert $scope.pets[$index].name

  # Create
  $scope.create = () ->
    $scope.pets.push Pet.save name: $scope.pet.name, comments: $scope.pet.comments
    $scope.post = new Post()

