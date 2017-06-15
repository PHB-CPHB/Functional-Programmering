let count = 0;

module.exports ={
    getCounter : function () {
        count++;
        return count;
    },

    setCounter  : function (number) {
        this.count = number;
    }
}
