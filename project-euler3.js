//Project Euler problem 3:
//Finds the largest prime factor of a number 
//greater than 1 provided by user.

function problemThree(input) {

//validating input
    if (input < 2 || isNaN(input)) {
        console.log("Please enter a number greater than 1");
    }
    else {

//Iteratively divides the input by the denominator if it divides 
//evenly; increments up the denominator if not.

        for (var denominator = 2; denominator <= input;) { 
            while (input >= 2) {
		        if (input % denominator === 0) {
			        input/=denominator;
		        }
		        else {
			        denominator++;
		        }
	        }
        }
    console.log(denominator);
    }
}

//Gotta QA!!
problemThree(8);
problemThree(0);
problemThree(-1);
problemThree(2);
problemThree(1);
problemThree(997);
problemThree(600851475143);
problemThree(15);
problemThree("Lara is awesome");
problemThree(12);