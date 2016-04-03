var app = angular.module('app');

app.controller('appController', function ($scope) {
});


app.config(function ($routeProvider, $locationProvider) {
    $routeProvider
    .when('/', {
        templateUrl: 'app/template/form/main.html'
    })
    .otherwise({
        redirectTo: '/'
    });

});

app.directive('homeDirective', function (questionFactory) {
    return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'app/template/form/home.html',
        link: function (scope, elem, attrs) {
        }
    }
});

app.directive('reviewerDirective', function (questionFactory) {
    return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'app/template/form/reviewer.html',
        link: function (scope, elem, attrs) {
        }
    }
});

app.directive('questionDirective', function (questionFactory) {
    return {
        restrict: 'AE',
        scope: {},
        templateUrl: 'app/template/form/question.html',
        link: function (scope, elem, attrs) {
        //    scope.start = function () {
        //        scope.id = 0;
        //        scope.quizOver = false;
        //        scope.inProgress = true;
        //        scope.getQuestion();
        //    };

        //    scope.reset = function () {
        //        scope.inProgress = false;
        //        scope.score = 0;
        //    }

        //    scope.getQuestion = function () {
        //        var q = quizFactory.getQuestion(scope.id);
        //        if (q) {
        //            scope.question = q.question;
        //            scope.options = q.options;
        //            scope.answer = q.answer;
        //            scope.answerMode = true;
        //        } else {
        //            scope.quizOver = true;
        //        }
        //    };

        //    scope.checkAnswer = function () {
        //        if (!$('input[name=answer]:checked').length) return;

        //        var ans = $('input[name=answer]:checked').val();

        //        if (ans == scope.options[scope.answer]) {
        //            scope.score++;
        //            scope.correctAns = true;
        //        } else {
        //            scope.correctAns = false;
        //        }

        //        scope.answerMode = false;
        //    };

        //    scope.nextQuestion = function () {
        //        scope.id++;
        //        scope.getQuestion();
        //    }

        //    scope.reset();
        }
    }
});