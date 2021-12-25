// Variable declarations
let uncipheredMessage = "string"
let alphabetArray = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
]

// Takes a letter from the original text ane converts it to a cipher.
let convertLetterToCipher = (~letter: string, ~shift: int): string => {
  // Find the index of the letter in the array
  let indexOfLetter = Js.Array2.indexOf(alphabetArray, letter)

  //   Add shift to the index, if we exceed the array length then use modulo to circle back.
  let indexOfCipher = mod(indexOfLetter + shift, Js.Array2.length(alphabetArray))

  alphabetArray[indexOfCipher]
}

let convertCipherToLetter = (~letter: string, ~shift: int): string => {
  // Find th eindex of the cipher letter in the array
  let indexOfLetter = Js.Array2.indexOf(alphabetArray, letter)

  // Substract shift from the index, if we exceed the array length then use modulo to circle back.
  let indexOfLetter = mod(indexOfLetter - shift, Js.Array2.length(alphabetArray))

  alphabetArray[indexOfLetter]
}
