chai = require 'chai'

should = chai.should()

# function declarations

# Main

describe 'testing that true', ->
	it 'should be equal to true', ->
		true.should.be.equal(true)