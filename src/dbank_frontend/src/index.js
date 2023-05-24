import { dbank_backend } from "../../declarations/dbank_backend";

window.addEventListener('load', async function() {
  update();
});

document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault(); // Prevent the form from submitting and page refresh

  const topUpAmount = parseFloat(document.getElementById("input-amount").value);
  const withdrawalAmount = parseFloat(document.getElementById("withdrawal-amount").value);
  const button=event.target.querySelector("#submit-btn");
  button.setAttribute("disabled",true);
  // puting in blockchain
  const checkTopup=document.getElementById("input-amount").value.length;
  if(checkTopup!=0)
  {
 await  dbank_backend.topUp(topUpAmount);
  }
 const checkWithdraw=document.getElementById("withdrawal-amount").value.length;
 if(checkWithdraw!=0)
 {
  await dbank_backend.withdraw(withdrawalAmount);
 }
 await dbank_backend.compound();
   update();
  button.removeAttribute("disabled");
  
  // Perform any necessary operations with the input values, such as calling API functions

  // // Clear the input fields
  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";
});
async function update()
{
  const currentAmount = await dbank_backend.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
};

