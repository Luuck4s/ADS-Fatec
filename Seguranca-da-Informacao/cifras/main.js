function ATBASH(phrase = "", encrypt = true) {
  const ALPHABET = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
  ];
  const REVERSE_ALPHABET = [
    "z",
    "y",
    "x",
    "w",
    "v",
    "u",
    "t",
    "s",
    "r",
    "q",
    "p",
    "o",
    "n",
    "m",
    "l",
    "k",
    "j",
    "i",
    "h",
    "g",
    "f",
    "e",
    "d",
    "c",
    "b",
    "a",
  ];

  let splitedPhrase = phrase.split(" ");
  let newPhrase = [];

  splitedPhrase.map((element) => {
    if (element.length > 1) {
      let splitedElement = element.split("");
      let arrayPhrase = [];

      splitedElement.map((char) => {
        let letter;
        let letterPosition;

        if (encrypt) {
          letter = char.toLowerCase();
          letterPosition = ALPHABET.findIndex((l) => l == letter);

          arrayPhrase.push(REVERSE_ALPHABET[letterPosition]);
        } else {
          letter = char.toLowerCase();
          letterPosition = REVERSE_ALPHABET.findIndex((l) => l == letter);

          arrayPhrase.push(ALPHABET[letterPosition]);
        }
      });

      let phraseEncripted = arrayPhrase.join("");
      newPhrase.push(phraseEncripted);
    } else {
      let letter;
      let letterPosition;

      if (encrypt) {
        letter = element.toLowerCase();
        letterPosition = ALPHABET.findIndex((l) => l == letter);

        newPhrase.push(REVERSE_ALPHABET[letterPosition]);
      } else {
        letter = char.toLowerCase();
        letterPosition = REVERSE_ALPHABET.findIndex((l) => l == letter);

        newPhrase.push(ALPHABET[letterPosition]);
      }
    }
  });

  return newPhrase.join(" ");
}

function ALBAM(phrase = "") {
  const ALPHABET_1 = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
  ];
  const ALPHABET_2 = [
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
  ];

  let splitedPhrase = phrase.split(" ");
  let newPhraseEncripted = [];

  splitedPhrase.map((element) => {
    if (element.length > 1) {
      let splitedElement = element.split("");
      let arrayPhrase = [];

      splitedElement.map((char) => {
        let letter;
        let letterPosition;


        letter = char.toLowerCase();

        letterPosition = ALPHABET_1.findIndex((l) => l == letter);

        if (letterPosition !== -1) {
          arrayPhrase.push(ALPHABET_2[letterPosition]);
        } else {
          letterPosition = ALPHABET_2.findIndex((l) => l == letter);
          arrayPhrase.push(ALPHABET_1[letterPosition]);
        }
      });

      let phraseEncripted = arrayPhrase.join("");
      newPhraseEncripted.push(phraseEncripted);
    } else {
      let letter = element.toLowerCase();
      let letterPosition = ALPHABET_1.findIndex((l) => l == letter);

      if (letterPosition !== -1) {
        newPhraseEncripted.push(ALPHABET_2[letterPosition]);
      } else {
        letterPosition = ALPHABET_2.findIndex((l) => l == letter);
        newPhraseEncripted.push(ALPHABET_1[letterPosition]);
      }
    }
  });

  return newPhraseEncripted.join(" ");
}


function ATBAH(phrase = ""){
  const ALPHABET_1 = [
    "a",
    "b",
    "c",
    "d",
    "j",
    "k",
    "l",
    "m",
    "e",
    "s",
    "t",
    "u",
    "v",
  ];
  const ALPHABET_2 = [
    "i",
    "h",
    "g",
    "f",
    "r",
    "q",
    "p",
    "o",
    "n",
    "z",
    "y",
    "x",
    "w",
  ];

  let splitedPhrase = phrase.split(" ");
  let newPhraseEncripted = [];

  splitedPhrase.map((element) => {
    if (element.length > 1) {
      let splitedElement = element.split("");
      let arrayPhrase = [];

      splitedElement.map((char) => {
        let letter;
        let letterPosition;


        letter = char.toLowerCase();

        letterPosition = ALPHABET_1.findIndex((l) => l == letter);

        if (letterPosition !== -1) {
          arrayPhrase.push(ALPHABET_2[letterPosition]);
        } else {
          letterPosition = ALPHABET_2.findIndex((l) => l == letter);
          arrayPhrase.push(ALPHABET_1[letterPosition]);
        }
      });

      let phraseEncripted = arrayPhrase.join("");
      newPhraseEncripted.push(phraseEncripted);
    } else {
      let letter = element.toLowerCase();
      let letterPosition = ALPHABET_1.findIndex((l) => l == letter);

      if (letterPosition !== -1) {
        newPhraseEncripted.push(ALPHABET_2[letterPosition]);
      } else {
        letterPosition = ALPHABET_2.findIndex((l) => l == letter);
        newPhraseEncripted.push(ALPHABET_1[letterPosition]);
      }
    }
  });

  return newPhraseEncripted.join(" ");
}



// Examples

console.log(ALBAM("ANALISE DESENVOLVIMENTO SISTEMAS"))
console.log(ATBASH(ALBAM("ANALISE DESENVOLVIMENTO SISTEMAS")))
console.log(ATBAH(ALBAM(ATBASH("OAHA BAHZDANA OMYEA", false))));

