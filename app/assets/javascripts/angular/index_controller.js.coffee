
app = angular.module('findMyDogApp', ["ngResource",'mm.foundation','google-maps'])

# dashboards/index.js.coffee
# = require reports
# = require_tree .
# = require_self
# dashboards = angular.module 'dashboards', [ 'localytics' 'reports' 'dashboards.controllers' 'dashboards.directives' 'dashboards.services' 'dashboards.filters' ]

app.config ["$httpProvider", ($httpProvider) ->
  # Inject the CSRF token
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content
  # By default, angular sends "application/json, text/plain, */*" which rails
  # sees and focuses on the */* and sends html :-(
  $httpProvider.defaults.headers.common['Accept'] = "application/json"
]

app.factory "Pet", ($resource) -> $resource "/v1/pet/:id", id: "@id"
app.controller 'indexController', ($scope, $modal, Pet) ->

  $scope.pet = new Pet()
  #$scope.pets = Pet.query({name: 'Chana'})
  $scope.pets = Pet.query()
  $scope.modal = $modal

  $scope.map = {
    center: {
      latitude: 20.6144226,
      longitude: -100.4057373
    },
    zoom: 11
  };

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
    $scope.modal = $modal.open({ templateUrl: '/app/angular/lost_pet_dialog.html', scope: $scope} )

  # Create
  $scope.create = () ->
    $scope.pets.push Pet.save name: $scope.pet.name, comments: $scope.pet.comment, reported_as: $scope.pet.reported_as
    $scope.pet.save

  # Create
  $scope.createLostReport = () ->
    alert("Report")

  # Close modal
  $scope.closeModal = () ->
    $scope.modal.close()
