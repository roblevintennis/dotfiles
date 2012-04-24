var evil_global = 'hi there';

function foo() {
    return 'this is foo';
}
function bar() {

    return 'this is bar'
}
(function() {
    var fubar = function() {
        return 'hey, this is fubar';
    }
    this.selfCalling = fubar;
}());


