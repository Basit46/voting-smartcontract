// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting{
    address private owner;

    constructor(){
        owner = msg.sender;

        //Add two candidates: Candidate A and Candidate B
        candidates.push(Candidate("Candidate A", 0));
        candidates.push(Candidate("Candidate B", 0));
    }

    //Struct for each candidate
    struct Candidate{
        string candidateName;
        uint voteCount;
    }
    
    //Struct for each Voter
    struct Voter{
        address voterAddress;
        bool isRegistered;
        bool hasVoted;
        uint8 votedFor;
    }

    //Array of Candidates
    Candidate[] private candidates;

    //Mapping of Voters
    mapping(address => Voter) public voters;

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier onlyRegisteredVoter() {
        require(voters[msg.sender].isRegistered, "Only registered voters can call this function");
        _;
    }

    //Function to add a voter
    function addVoter(address _voterAddress) public onlyOwner {
        voters[_voterAddress].voterAddress = _voterAddress;
        voters[_voterAddress].isRegistered = false;
        voters[_voterAddress].hasVoted = false;
    }

    //Function to a register a voter
    function registerVoter(address _voterAddress) public onlyOwner {
        require(!voters[_voterAddress].isRegistered, "Voted Already Registered");

        voters[_voterAddress].isRegistered = true;
    }

    //Function to vote a candidate
    function voteCandidate(uint8 _candidateIndex) public onlyRegisteredVoter {
        //Check if voter has already voted and if candidate exist
        require(!voters[msg.sender].hasVoted, "You have already voted mate");
        require(_candidateIndex < candidates.length, "Candidate index doesn't exist");

        //Increment candidate count by 1
        candidates[_candidateIndex].voteCount ++;

        //Set the voter "hasVoted" to true
        voters[msg.sender].hasVoted = true;

        //Set the voter "votedFor" to the Id of the candidate the user voted for
        voters[msg.sender].votedFor = _candidateIndex;
    }

    //Get the vote count for a candidate
    function getVoteCount(uint8 _candidateIndex) public view returns (uint256) {
        require(_candidateIndex < candidates.length, "Candidate index doesn't exist");

        return candidates[_candidateIndex].voteCount;
    }

    // Function to decide the winner
    function decideWinner() public onlyOwner view returns (string memory) {
        uint256 maxVoteCount = 0;
        uint winnerIndex;

        //Get index of winner
        for (uint8 i = 0; i < candidates.length; i++) {
            uint256 candidateVoteCount = getVoteCount(i);

            if (candidateVoteCount > maxVoteCount) {
                maxVoteCount = candidateVoteCount;
                winnerIndex = i;
            }
        }

        //Return the name of the winner
        string memory winnerName = candidates[winnerIndex].candidateName;
        return winnerName;
    }

}