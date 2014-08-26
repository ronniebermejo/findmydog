angular.module('findMyDogApp').controller 'lostReportController', ($scope) ->

  $scope.progressall = (e, data) ->
    progress = parseInt(data.loaded / data.total * 100, 10);
    progressBar.css('width', progress + '%')

  $scope.showMap = () ->
    alert("Show Map")


  $scope.createLostReport = () ->
    console.log(upload_url)
    console.log(name)
    console.log(animal)
    console.log(pet_sex)



