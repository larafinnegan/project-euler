$(document).ready(function() {

$('#one').click(function() {
	var limit = parseInt($('#questionOne').val(),10);
    var sum = 0;
    if (limit > 1000 || limit < 1 || isNaN(limit)) {
		confirm("That's not a number between 1 and 1000!");
	}
	else {
		for (var i = limit; i > 0; i--) {
			if (i % 3 === 0 || i % 5 === 0) {
			    sum += i;
			}   
        }
	$('#answerOne').remove();
	$('#first').append('<p id="answerOne">' + sum + '</p>');
	}    
});

$('#two').click(function() {
var sum=0;
var i=1;
var j=1;
var total=0;
var limit=parseInt($('#questionTwo').val(),10);

if (limit < 2 || isNaN(limit) || limit > 4000000) {
        confirm("Please enter a number greater than 1 and less than 4,000,000");
    }
    else {
        while (sum < limit) {
            if (sum % 2 === 0) {
                total+=sum;
            }
            sum=i+j;
            i=j;
            j=sum;
        }
		$('#answerTwo').remove();
		$('#second').append('<p id="answerTwo">' + total + '</p>');
    }
});

$('#three').click(function() {
	var limit=parseInt($('#questionThree').val(),10);
    if (limit < 2 || isNaN(limit) || limit > 600851475143) {
        confirm("Please enter a number greater than 1 and less than 4,000,000");
    }
    else {
        for (var denominator = 2; limit >= denominator; denominator++) { 
            while (limit % denominator === 0) {
    		        limit /= denominator;
		  }
	   }
		$('#answerThree').remove();
        $('#third').append('<p id="answerThree">' + (denominator-1) +'</p>');
    }
});
}); 
