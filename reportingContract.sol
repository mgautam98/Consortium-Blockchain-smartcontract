pragma solidity ^0.5.7;

contract ReportingContract { 
  // These will be the address of your validator0 and validator1 nodes
  address[] public validators = [0xD6a6a8E796822E8f5F0aA22ba8EfA7ec3f5bd060, 0x7352154F364E896F589824a5d0C1BaFC11feD7c4]; 
  mapping(address => uint) indices; 
  address public disliked; 

  constructor() public { 
    for (uint i = 0; i < validators.length; i++) { 
      indices[validators[i]] = i; 
    } 
  } 

  // Called on every block to update node validator list. 
  function getValidators() public view returns (address[] memory) { 
    return validators; 
  } 

  // Expand the list of validators. 
  function addValidator(address validator) public { 
    validators.push(validator); 
  } 

  // Remove a validator from the list. 
  function reportMalicious(address validator) public { 
    validators[indices[validator]] = validators[validators.length-1]; 
    delete indices[validator]; 
    delete validators[validators.length-1]; 
    validators.length--; 
  } 

  function reportBenign(address validator) public { 
    disliked = validator; 
  } 
}
