module.exports = class Year {
  constructor(year) {
    this.year = year;
  }

  isLeap() {
    if (this.year % 4 != 0) {
      return false;
    }
    if (this.year % 100 == 0 && this.year % 400 != 0) {
      return false;
    }
    return true;
  };
};
