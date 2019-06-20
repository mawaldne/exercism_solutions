const DNA_TO_RNA = { 'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U' };

module.exports = class DnaTranscriber {
  toRna(dna) {
    return dna.split("").map(c => {
      if (!Object.keys(DNA_TO_RNA).includes(c)) {
        throw new Error("Invalid input");
      

      return DNA_TO_RNA[c];
    }).join("");
  };
};
