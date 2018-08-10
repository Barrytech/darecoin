# How to write a game using NashHash

## 1. Every game inherits from `Game.sol`

Example:

```js

import "./Game.sol"

contract MyGame is Game {

}

```

## 2. Every game implements the function `checkGuess`

```js

import "./Game.sol"

contract MyGame is Game {

  function checkGuess(string guess) private {



  }

}
 ```

 Note that it appears that we call `stringToUint` from `GameHelper.sol` inside of this function. This "decrypts" the value stored in the contract back to the original number.

 ## 3. Every game implements the function `findWinners`

 ```js

import "./Game.sol"

contract MyGame is Game {

  function checkGuess(string guess) private {

  }

  function findWinners() private {

  }

}
 ```


# From `Game.sol`

```
/*
Dear all, games should inherit form this contract because this contract has the commit/reveal protocol
The specific game will have to only define two functions:

-- guessCheck(string guess): the function has to error out in if the guess is not compliant with the rules
-- findWinners(): the function determined the winners and distributes the payouts.

*/

/*
    The following two functions are the users gaming interface.
        -- Call commit to commit a hash of your guess for the game. Its a hash, since
        you probably dont want other players to see your guess
        -- Call reveal to reveal your guess. You will not participate in the
        round if you forget to reveal your guess, but your stake will still become
        someone's prize! Make sure you reveal.
*/
```

We have
- `function reveal(string guess, string random) public whenNotPaused`
- `function commit(bytes32 hashedCommit) public payable whenNotPaused`

So probably it works like this:

1. A user Alice chooses their input, say "Up", which is a string. They can play this input by calling `commit`. But `commit` doesn't take a string as input. Also, if we were to put "Up" as an input, it would be revealed to anyone observer Bob.

2. Instead, Alice _hashes_ the input, with a random salt. Meaning: `hashedCommit = keccak256(input+salt)` (`keccak256` is a hash function).

3. This means that Bob, the observer, can only see a `bytes32` hash, and not the original input.

4. Alice can later call `reveal("Up", salt)` to prove that she submitted "Up". How? In the smart contract, it is checked that `hashedCommit == keccak256("Up", salt)`.

5. When every player has revealed their inputs, the smart contract can decide who is the winner!

A natural question is: what does the salt do?
Answer: If there is only a finite number of inputs to the game, one can guess the hashed value, by pre-calculating all of them in advance, since `keccak256("Up")` always returns the same `bytes32`. Therefore, Alice "salts" her commit with a random string, and as long as she keeps this salt secret, noone can guess her input.
