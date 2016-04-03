var app = angular.module('app');

app.controller('reviwerController', function ($scope, questionFactory) {
    questionFactory.reset();
    $scope.questions = questionFactory.get();
});