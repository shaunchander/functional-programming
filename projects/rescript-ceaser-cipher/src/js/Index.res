// Types

type event = {preventDefault: unit => unit}

type domNode = {addEventListener: (string, event => unit) => unit, value: string}

type document = {querySelector: (. string) => domNode}

type mode = Encrypt | Decrypt

// External variables

@val external document: document = "document"

// Nodes
let formNode = document.querySelector(. "#form")
let messageNode = document.querySelector(. "#message")
let shiftNode = document.querySelector(. "#shift")
let encryptNode = document.querySelector(. "#encrypt")
let decryptNode = document.querySelector(. "#decrypt")

// Toplevel variables
let alphabet = [
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

let message = ""
let shift = ""

// Helper method that either encrypts or decrypts messages depending on the passed-in mode.
let ceaserCipherInterpretor = (~text: string, ~shift: int, ~mode: mode) => {
  // Define a temporary variable to hold our message as it is converted.
  let intermediateMessage = ""

  // Break up our text into an array.
  let textAsArray = Js.String.split(text, "")

  // Iterate our text array and either encrypt or decrypt depending on the mode.
  switch mode {
  | Encrypt => {
      let encryptedTextArray = Belt.Array.map(textAsArray, letterInArray => {
        let indexOfLetterInAlphabet = Belt.Array.getIndexBy(alphabet, letterInAlphabet =>
          // Grab the index of the letter in the alphabet
          letterInAlphabet === Js.String.toUpperCase(letterInArray)
        )
      })
    }
  }
}
