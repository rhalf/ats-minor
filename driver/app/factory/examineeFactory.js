var app = angular.module('app');

app.factory('examineeFactory', function () {
    var examinee = {};

    examinee.name = 'anonymous';
    examinee.score = 0;
    examinee.result = 'FAILED';
    examinee.dateTime = '2016-01-01 00:00:00';

    examinee.answer = [];

   

    return  {
        getExaminee : function () {
            return angular.copy(examinee);
        }
    }
});