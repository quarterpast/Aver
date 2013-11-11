{AssertionError} = require \assert
require \colors

r = (s,n)--> (.join '') [s for til n]
level = 0
exports.describe = exports.should = (label, fn)->
	log = -> console.log (r " " level) + it
	error = -> console.error (r " " level) + it
	try
		log label+':'
		level++
		fn!
		level--
		log "#{\✓ .green} #{label.white}"
	catch
		s = switch
		| e instanceof AssertionError => \✖
		| otherwise => \‼
		level--
		error "#{s.red} #{label.white} #{e.to-string!grey}"
		throw e
