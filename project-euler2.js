//Project Euler problem 2:
//By considering the terms in the Fibonacci sequence whose
//values do not exceed four million, find the sum of the 
//even-valued terms.

function problemTwo(max) {
var sum=0;
var i=1;
var j=1;
var total=0;

    while (j < max) {
        if (sum%2 === 0) {
            total+=sum;
        }
        sum=i+j;
        i=j;
        j=sum;
    }
       console.log("Answer: " + total);
}

problemTwo(4000000);