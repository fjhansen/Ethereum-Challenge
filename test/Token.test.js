const Token = artifacts.require('./Token')

require('chai')
.use(require('chai-as-promised'))
.should()


contract('Token', (accounts) => {
    describe('deployment', () => {
        it('tracks the name', async () => {
            // Fetch token from blockchain
            const token = await Token.new(1595389544, 1595476244)
            // Read Token Name
            const name = await token.name()
            // Check if token name is 'TOKEN'
            name.should.equal("TOKEN")
        })
    })

    describe('time constraints', () => {
        it('has startTime', async () => {
            let token = await Token.deployed();
            
            const start = (await token.starttime()).toNumber();

            start.should.equal(1595389544)
        })

        it('has endTime', async () => {
            let token = await Token.deployed();

            const end = (await token.endtime()).toNumber()

            end.should.equal(1595476244)

        })
    })
})