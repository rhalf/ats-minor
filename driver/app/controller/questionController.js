var app = angular.module('app');

app.controller('questionController', function ($scope, questionFactory, examineeFactory) {

    
    $scope.itemCount = 20 + 1;

    $scope.start = function () {

        questionFactory.reset();

        $scope.examinee = {};
        $scope.examinee = examineeFactory.getExaminee();

        $scope.question = {};
        $scope.question = questionFactory.getQuestion();

    };


    $scope.next = function () {

        var object = {
            "question": 0,
            "reference": 0,
            "isCorrect": false
        };

        if ($scope.item.answer != $scope.question.answer) {
            object.question = $scope.question.index;
            object.reference = $scope.question.number;
            object.isCorrect = false;
        } else {
            object.question = $scope.question.index;
            object.reference = $scope.question.number;
            object.isCorrect = true;
        }

        $scope.examinee.answer.push(object);

        $scope.item.answer = -1;
        $scope.question = {};
        $scope.question = questionFactory.getQuestion();

        if ($scope.question.index == ($scope.itemCount)) {

            var index = 0;

            for (index = 0; index < $scope.examinee.answer.length; index++) {
                var item = $scope.examinee.answer[index];
                if (item.isCorrect == true) {
                    $scope.examinee.score += 1;
                }
                
            }

            var result = ($scope.examinee.score / ($scope.itemCount - 1)) * 100;

            if (result < 90) {
                $scope.examinee.result = 'FAILED';
            } else {
                $scope.examinee.result = 'PASSED';
            }

            console.log($scope.examinee);
        }
    };

    $scope.reset = function () {
        questionFactory.reset();
        $scope.question = {};
        $examinee = {};
        $scope.item = {};
        $scope.item.answer = -1;
    }


    $scope.reset();

    
});