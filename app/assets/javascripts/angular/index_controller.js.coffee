app = angular.module('findMyDogApp',
  ["ngResource",
   'mm.foundation',
   'wu.masonry',
   'google-maps']
)

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
  $scope.filter = ''
  #$scope.pets = Pet.query({name: 'Chana'})
  $scope.pets = Pet.query()
  $scope.modal = $modal

  #Map configuration
  $scope.blue_style = [{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]}]
  $scope.gray_style= [
    {
      "featureType": "administrative",
      "elementType": "all",
      "stylers": [
        {
          "visibility": "on"
        },
        {
          "saturation": -100
        },
        {
          "lightness": 20
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "all",
      "stylers": [
        {
          "visibility": "on"
        },
        {
          "saturation": -100
        },
        {
          "lightness": 40
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "all",
      "stylers": [
        {
          "visibility": "on"
        },
        {
          "saturation": -10
        },
        {
          "lightness": 30
        }
      ]
    },
    {
      "featureType": "landscape.man_made",
      "elementType": "all",
      "stylers": [
        {
          "visibility": "simplified"
        },
        {
          "saturation": -60
        },
        {
          "lightness": 10
        }
      ]
    },
    {
      "featureType": "landscape.natural",
      "elementType": "all",
      "stylers": [
        {
          "visibility": "simplified"
        },
        {
          "saturation": -60
        },
        {
          "lightness": 60
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "all",
      "stylers": [
        {
          "visibility": "off"
        },
        {
          "saturation": -100
        },
        {
          "lightness": 60
        }
      ]
    },
    {
      "featureType": "transit",
      "elementType": "all",
      "stylers": [
        {
          "visibility": "off"
        },
        {
          "saturation": -100
        },
        {
          "lightness": 60
        }
      ]
    }
  ]
  $scope.options = {scrollwheel: false, styles: $scope.gray_style}


  $scope.geolocationAvailable = navigator.geolocation ? true : false;

  $scope.map = {
    center: {
      #Queretaro
      latitude: 20.6144226,
      longitude: -100.4057373
    },
    zoom: 13,
    icon: "https://s3-us-west-2.amazonaws.com/findmydog/mini-marker.png",
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


  $scope.findMe = () ->

    if ($scope.geolocationAvailable)
      navigator.geolocation.getCurrentPosition($scope.applyLocation())
      $scope.$apply()

  $scope.applyLocation = (position) ->
    $scope.center = {
      latitude: position.coords.latitude,
      longitude: position.coords.longitude
    };

