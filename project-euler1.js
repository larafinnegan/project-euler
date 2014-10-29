//returns the sum of all multiples of 3 and 5 between 1 and
//a specified limit.

function problemOne(limit) {
    var sum = 0;
    if (limit>1000 || limit<1 || isNaN(limit)) {
		console.log("That's not a number between 1 and 1000!");
	}
    else {
        for (var i = limit; i > 0; i--) {
			  if (i % 3 === 0 || i % 5 === 0) {
			     sum += i;
			  }   
        }
        console.log(sum);
    }
}

//Gotta QA!
    problemOne(0.3);
	problemOne(-1);
	problemOne(0);
	problemOne(1);
	problemOne(2);
	problemOne(3);
	problemOne(1000);
	problemOne(500);
	problemOne(20);
	problemOne("lara is awesome");
	