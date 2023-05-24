
// // to output some thing on console we need debug
// import Debug "mo:base/Debug";
// import Nat "mo:base/Nat";
// import Time "mo:base/Time";
// import Float "mo:base/Float";

// // Debug.print(text);

// actor dbank
// {
//  // var currentValue=300;
// //   currentValue:=500;
// stable var startTime=Time.now();// it return time in nano second from 1901 jan
// Debug.print(debug_show(startTime));
// // *********** ORTHOGONAL PERSISTENCE********
//  var currentValue:Float=500;
//   //Debug.print("Predator");
//   // how to output the number value
//   Debug.print(debug_show(currentValue));
//   // here let work as constant here
//   let constant=25569696969696969;
//  // constant:=2556; not possible.
//  Debug.print(debug_show(constant));
//  // lets  learn how to call a fuction and create it.
//  public func topUp(amount:Float) : () {
//   currentValue+=amount;
//   Debug.print(debug_show(currentValue));
//  };
//  // calling the function
// //  topUp();

// //function to withdraw money
// public func withDraw(money : Float) : () {
// //
// // handling data underflow or overflow
// let tempValue:Float=(currentValue-money);
// if(tempValue>=0)
// {
//   currentValue-=money;
//   Debug.print(debug_show(currentValue));
// }
// else{
//   Debug.print("Hey ,your enterd amount exceed your acount limit,sorry");
// }
//   // to run this:dfx canister call dbank_backend withDraw 25
  
// };
// // ######### HOW to write a function who return some value
// public query func checkBalance():async Float {
//   return currentValue;
  
// };

// // ****** Working with Time*******
// public func compound()  {
//   let currentTime=Time.now();
//   let elspsedTimeNS=-startTime+currentTime;
//   let elapsedTime=elspsedTimeNS/10000000000;
//   // compound interest A=P(1+r/n)^nt
//   currentValue:=currentValue*((1.01)**Float.fromInt(elapsedTime));
//   startTime:=currentTime;
  
// };



  
// };

// // calling public function from terminal
// // dfx canister call dbank_bckend topUp
// // ? how to get canister id (dfx canister id__Candid_UI)
// // after runing dfx deploy every data again initialise.
import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor dbank {
  stable var startTime = Time.now();
  startTime:=Time.now();

   stable var currentValue : Float = 500.0;
   currentValue:=500.0;

  public func topUp(amount: Float) : () {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(money: Float) : () {
    let tempValue = currentValue - money;
    //Debug.print(debug_show( money));
    if (tempValue >= 0.0) {
      currentValue -= money;
      Debug.print(debug_show(currentValue));
    } else  {
      Debug.print("Hey, the entered amount exceeds your account limit. Sorry!");
    }
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() : () {
    let currentTime = Time.now();
    let elapsedTimeNS = currentTime - startTime;
    let elapsedTime = Float.fromInt(elapsedTimeNS) / 1_000_000_000.0;
    currentValue:=currentValue*((1.01)**(elapsedTime));
    startTime := currentTime;
    Debug.print(debug_show(currentValue));
  };
};
// our learning
/*

// to output some thing on console we need debug
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

// Debug.print(text);

actor dbank
{
 // var currentValue=300;
//   currentValue:=500;
stable var startTime=Time.now();// it return time in nano second from 1901 jan
Debug.print(debug_show(startTime));
// *********** ORTHOGONAL PERSISTENCE********
 var currentValue:Float=500;
  //Debug.print("Predator");
  // how to output the number value
  Debug.print(debug_show(currentValue));
  // here let work as constant here
  let constant=25569696969696969;
 // constant:=2556; not possible.
 Debug.print(debug_show(constant));
 // lets  learn how to call a fuction and create it.
 public func topUp(amount:Float) : () {
  currentValue+=amount;
  Debug.print(debug_show(currentValue));
 };
 // calling the function
//  topUp();

//function to withdraw money
public func withDraw(money : Float) : () {
//
// handling data underflow or overflow
let tempValue:Float=(currentValue-money);
if(tempValue>=0)
{
  currentValue-=money;
  Debug.print(debug_show(currentValue));
}
else{
  Debug.print("Hey ,your enterd amount exceed your acount limit,sorry");
}
  // to run this:dfx canister call dbank_backend withDraw 25
  
};
// ######### HOW to write a function who return some value
public query func checkBalance():async Float {
  return currentValue;
  
};

// ****** Working with Time*******
public func compound()  {
  let currentTime=Time.now();
  let elspsedTimeNS=-startTime+currentTime;
  let elapsedTime=elspsedTimeNS/10000000000;
  // compound interest A=P(1+r/n)^nt
  currentValue:=currentValue*((1.01)**Float.fromInt(elapsedTime));
  startTime:=currentTime;
  
};



  
};

// calling public function from terminal
// dfx canister call dbank_bckend topUp
// ? how to get canister id (dfx canister id__Candid_UI)
// after runing dfx deploy every data again initialise.
*/
