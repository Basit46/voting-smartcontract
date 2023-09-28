# Voting System Smart Contract

This project implements a basic smart contract for a voting system on the Swisstronik testnet. The contract ensures that only registered members can vote, and it allows the contract owner to manage the registration of new voters.

## Contract Address

Contract Address: [0x4c0F8b24B5703138A2a456F037a12211ACB8276c]

## Project Requirements

To meet the Developer Challenge requirements, the following features were implemented:

1. **Private State Variables:** All state variables in the contract have been marked as private to restrict direct access.

2. **Voting System Smart Contract:** The smart contract provides the core functionality of a voting system, allowing users to cast their votes for different candidates.

3. **Owner Voter Registration:** The contract owner has the exclusive ability to register new voters, ensuring that only authorized individuals can participate in the voting process.

4. **Access Control Modifier:** An access control modifier (`onlyOwner`) has been implemented to restrict certain functions to the contract owner. This modifier ensures that only the owner can add new voters.

5. **Voter Interaction Control:** A modifier (`onlyRegisteredVoter`) has been created to restrict access to voting-related functions. This ensures that only registered voters can interact with the contract to cast their votes.

6. **Casting Votes:** Registered voters can use the contract's functions to cast their votes for their preferred candidates.

7. **Vote Count Retrieval:** A function has been provided to retrieve the current vote count for each candidate.

## Getting Started

To interact with the voting system smart contract, you can use a tool like Remix IDE or Truffle with a compatible wallet, connected to the Swisstronik testnet. You will need the contract address mentioned above to interact with it.

## Usage

1. **Owner Registration of Voters:** The contract owner can register new voters by calling the `addVoter` function, passing the address of the voter to be registered as an argument.

2. **Registered Voter Interaction:** Registered voters can cast their votes by calling the `voteCandidate` function and specifying the candidate index they want to vote for.

3. **Retrieve Vote Counts:** To check the current vote counts for each candidate, use the `getVoteCount` function with the candidate's index as an argument.

4. **Decide Winner:** The contract owner can call the `decideWinner` function to determine the winner of the election based on the vote counts.
