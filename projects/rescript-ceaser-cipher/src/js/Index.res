// Types

type event = {preventDefault: (. unit) => unit}

type domNode = {
  addEventListener: (. string, event => unit) => unit,
  value: string,
  mutable textContent: string,
}

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
let displayNode = document.querySelector(. "#display")

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

// Helper to get the index of the letter in our alphabet
let getIndexOfLetter = letter => {
  Js.Array2.indexOf(alphabet, letter)
}

// Helper return an adjusted index if needed.
let getAdjustedIndex = (index, mode) => {
  switch mode {
  | Encrypt =>
    if index > 25 {
      index - 25
    } else {
      index
    }
  | Decrypt =>
    if index < 0 {
      index + 25
    } else {
      index
    }
  }
}

// Helper method that either encrypts or decrypts messages depending on the passed-in mode.
let ceaserCipherInterpretor = (~text, ~shift, ~mode) => {
  // Break up our text into an array.
  let textAsArray = Js.String2.split(Js.String2.toUpperCase(text), "")

  // Assign shift to be a number
  let shiftAsInt = %raw(`parseInt(shift)`)

  // Iterate our text array and either encrypt or decrypt depending on the mode.
  switch mode {
  | Encrypt => {
      let encryptedTextArray = Js.Array2.map(textAsArray, letterInArray => {
        // Grab the index of the letter in the alphabet.
        let indexOfLetter = getIndexOfLetter(letterInArray)

        // Return the encrypted letter in place of the actual letter or a space.
        switch indexOfLetter {
        | -1 => " "
        | _ => Belt.Array.getUnsafe(alphabet, getAdjustedIndex(indexOfLetter + shiftAsInt, Encrypt))
        }
      })

      // Return the now encrypted string
      Js.Array2.joinWith(encryptedTextArray, "")
    }
  | Decrypt => {
      let decryptedTextArray = Js.Array2.map(textAsArray, letterInArray => {
        // Grab the index of the letter in the alphabet.
        let indexOfLetter = getIndexOfLetter(letterInArray)

        // Return the encrypted letter in place of the actual letter or a space.
        switch indexOfLetter {
        | -1 => " "
        | _ => Belt.Array.getUnsafe(alphabet, getAdjustedIndex(indexOfLetter - shiftAsInt, Decrypt))
        }
      })

      // Return the now encrypted string
      Js.Array2.joinWith(decryptedTextArray, "")
    }
  }
}

// Listen for submissions on our form so we can prevent the default event.
formNode.addEventListener(."submit", e => {
  e.preventDefault(.)
})

// Listen for a submission from our "encrypt" button
encryptNode.addEventListener(."click", _ => {
  let message = messageNode.value
  let shift = shiftNode.value

  // Check that "message" and "shift" are defined.
  if Js.String2.length(message) <= 0 || Js.String2.length(shift) <= 0 {
    // We're going to cheat here and use an alert with the raw tag.
    %raw(`alert("You must enter a message or a shift value!")`)
  } else {
    // We have valid input.

    // Get the encrypted message.
    let encryptedMessage = ceaserCipherInterpretor(~text=message, ~shift, ~mode=Encrypt)

    // Set the encrypted message into the display node for user feedback.
    displayNode.textContent = encryptedMessage
  }
})

// Listen for a submission from our "decrypt" button
decryptNode.addEventListener(."click", _ => {
  let message = messageNode.value
  let shift = shiftNode.value

  // Check that "message" and "shift" are defined.
  if Js.String2.length(message) <= 0 || Js.String2.length(shift) <= 0 {
    // We're going to cheat here and use an alert with the raw tag.
    %raw(`alert("You must enter a message or a shift value!")`)
  } else {
    // We have valid input.

    // Get the encrypted message.
    let decryptedMessage = ceaserCipherInterpretor(~text=message, ~shift, ~mode=Decrypt)

    // Set the encrypted message into the display node for user feedback.
    displayNode.textContent = decryptedMessage
  }
})
