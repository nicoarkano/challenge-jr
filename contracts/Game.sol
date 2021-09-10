//SPDX-License-Identifier: MIT

pragma solidity > 0.6.0;
contract Game {
        //state variables of the game 
        uint8 constant ROCK = 0;
        uint8 constant PAPER = 1;
        uint8 constant SCISSORS = 2;

        //mapping the addresses in the game 

        mapping(address => uint8) public choices;


        function play(uint8 choice) external {
         
          //Check te movement is valid if not execute revert

        require(choice == ROCK || choice == PAPER || choice == SCISSORS);
          
          //Set the choices for init (hasn't play)
        
        require(choices[msg.sender] == 0);
          //set the choice for the player address
        choices[msg.sender] = choice;


        }

        function evaluate (address alice, address bob) 
        external 
        view 
        returns (address)
        {
             // if the choices are the same, the game is a draw, therefore returning 0x0000000000000000000000000000000000000000 as the winner
        if (choices[alice] == choices[bob]) {
            return address(0);
        }

        // paper beats rock bob/alice
        if (choices[alice] == ROCK && choices[bob] == PAPER) {
            return bob;
            // paper still beats rock (played in opposite alice/bob)
        } else if (choices[bob] == ROCK && choices[alice] == PAPER) {
            return alice;
        } else if (choices[alice] == SCISSORS && choices[bob] == PAPER) {
            return alice;
        } else if (choices[bob] == SCISSORS && choices[alice] == PAPER) {
            return bob;
        } else if (choices[alice] == ROCK && choices[bob] == SCISSORS) {
            return alice;
        } else if (choices[bob] == ROCK && choices[alice] == SCISSORS) {
            return bob;
        }
    }
}

