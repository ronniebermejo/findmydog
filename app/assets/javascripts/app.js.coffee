# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module('findMyDogApp', ["ngResource",'mm.foundation'])


app.config ["$httpProvider", ($httpProvider) ->
  # Inject the CSRF token
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content
  # By default, angular sends "application/json, text/plain, */*" which rails
  # sees and focuses on the */* and sends html :-(
  $httpProvider.defaults.headers.common['Accept'] = "application/json"
]

app.factory "Pet", ($resource) -> $resource "/api/pet/:id", id: "@id"

app.controller 'findMyDogController', ($scope, $modal, Pet) ->

  $scope.pet = new Pet()
  $scope.pets = Pet.query()
  $scope.modal1 = $modal

  # Delete a post
  $scope.delete = ($index) ->
    if confirm("Are you sure you want to delete this post?")
      # Remove from the server
      $scope.pets[$index].$delete()
      # Remove from the local array
      $scope.pets.splice($index, 1)

  # Show post
  $scope.show = ($index) ->
    $scope.pet =   $scope.pets[$index]
    $modal.open({ templateUrl: 'myModalContent.html', scope: $scope, controller: 'modal'})

  # Create
  $scope.create = () ->
    $scope.pets.push Pet.save name: $scope.pet.name, comments: $scope.pet.comment, reported_as: $scope.pet.reported_as
    $scope.pet.save

  # Create
  $scope.createLostReport = () ->
    alert("Report")

  # Close modal
  $scope.closeModal = () ->
    alert("close")


app.controller 'modal', ($scope, $modal) ->
  $scope.closeModal = () ->
    $modal.close





