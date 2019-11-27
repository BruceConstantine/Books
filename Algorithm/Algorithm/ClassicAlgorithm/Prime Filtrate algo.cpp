///////////////// EE6411 Assignment1 /////////////////////
//*Author:  Zhikang Tian                                //
//*ID    : 16060288                                     //
////////////////////////////////////////////////////////// 
#include <iostream> 
#include <vector>
using namespace std;


// coz the user's input limit should pass back to main() thus it needs to defined here.
enum limitStatus { LIMIT_TOOSMALL,LIMIT_TOOLARGE, LIMIT_OK };

limitStatus sieveOfEratosthenes(int limit);


int main(int argc, char ** argv)
{
 
  int  limit  = 0;   // upper bound for user input
  char repeat = 'y'; // whether user want to play again   
 
  //1. Greeting welcome
  cout << "Welcome to use the SieveOfEratosthenes algo to find all primes of your input.\nAuthor: Zhikang Tian\nID: 16060288\n" <<endl;

  //If yes is chose, run again, otherwise terminate the application
  while (repeat == 'y') {

      //2. catch user input of up limit: n & error handling
      cout << "Input your number (2~200): ";
      cin  >> limit;
      if(cin.fail()){ // check if input stream is failure
          cout << "User Input Error: Not a number!" << endl;
          cin.clear();  // clean input stream buffer
          cin.ignore(); // clean '\0' & block input stream until some char into cin  
      }
      //3. correct input 
      else{
	  //call routine sieveOfEratosthenes
      	  limitStatus result = sieveOfEratosthenes(limit); 
      	  if (result == LIMIT_OK) {
      		//Do nothing
      	  } else {
       		cout << "Can't be executed, as input number should range from 2 to 200."<<endl;
      	  }   
      	  cout << "Do you want play again?(input 'y' for continue): ";
      	  cin >> repeat;
      }
  }
  return EXIT_SUCCESS;
}


limitStatus sieveOfEratosthenes(int limit){
  //check input boundary
    if(limit > 200){
     	return LIMIT_TOOLARGE;
    } else if (limit < 2) {
     	return LIMIT_TOOSMALL;
    } else {
    	//4. CORRECT INPUT NUMBER, THE FOLLOWING IS PRIME FILTRATE ALGORITHM:
      	vector<int> vec(limit+1); // creeat a vector template container with sizeof "limit". (it actually can dynamiclly increase its size at heap, so it can in case of the stake overflowed compared with using array, and can deal with bigger number if the upper boundary is not merely 200.)
 	
	    // vec[1] = 1; // 1 is not prime. 
        // Index stands for the number tobe determined whether is a prime, which should corresponding to iterator 'it'.
        for (int index = 2; index<=limit; index++) {
	    // to strike out all multiples of index.
	        for (int i = 2; i*index <= limit; i++) {
			    vec[i*index] = 1;  // set 0 as 1, stands for stricked.
    	    }    
	    } 
        cout<< "the result are: "<<endl;
        for (int result = 2; result <= limit; result++){
	        if ( vec[result] == 0)
	 	        cout << result << endl; 	
        }
        cout<<endl; 
        return LIMIT_OK;
    }
}  