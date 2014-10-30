//Project Euler problem 2:
//By considering the terms in the Fibonacci sequence whose
//values do not exceed four million, find the sum of the 
//even-valued terms.

function problemTwo(input) {
var sum=0;
var i=1;
var j=1;
var total=0;

//validating input
    if (input < 2 || isNaN(input)) {
        console.log("Please enter a number greater than 1");
    }
    else {
        while (sum < input) {
            if (sum % 2 === 0) {
                total+=sum;
            }
            sum=i+j;
            i=j;
            j=sum;
        }
       console.log("Answer: " + total);
    }
}

//Gotta QA!
problemTwo(4000000);
problemTwo(25);
problemTwo(0);
problemTwo(2);
problemTwo(-1);
problemTwo("Lara is awesome");
problemTwo(35);
problemTwo(34);