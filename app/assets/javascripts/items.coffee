app = angular.module("Item", ["ngResource"])

app.factory "Item", ["$resource", ($resource) ->
  $resource("/items/:id.json", {id: "@id"})
]

app.controller 'ItemCtrl', ['$scope', 'Item', ($scope, Item) ->
  $scope.items = Item.query()

  $scope.addInterview = ->
    interview = Interview.save($scope.newInterview)
    $scope.interviews.push(interview)
    $scope.newInterview = {}

  $scope.removeItem = (int) ->
    int.$remove()
    $scope.items.splice($scope.items.indexOf(int), 1)
]
