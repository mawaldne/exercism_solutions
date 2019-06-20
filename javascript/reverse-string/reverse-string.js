const reverseString = function (s) {
  let reversed = "";
  for(let i = s.length; i >= 0; i--) {
    reversed += s.charAt(i);
  }
  return reversed;
};

module.exports = reverseString;
