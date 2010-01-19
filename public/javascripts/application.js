Event.observe($("nugget_body"), 'keyup', function() {
    $("char-count").innerHTML = this.value.length + " characters so far"
});