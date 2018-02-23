require('should')

describe('Sample tests',function(){
    it('it should return 30 then 10 and 20 passed to sum function',function (done) {
        var sum= 10 + 20;
        sum.should.equal(30)
        done()
    })
})