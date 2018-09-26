  

import UIKit

class PetData {
	var name = ""
	var kind = ""
	var picture: Data?
	var dob = Date()
	
	private let names = ["Molly", "Sugar", "Lady Gaga", "Lilly", "Mocha", "Teddy", "Frankie", "Boomer", "Dexter", "Rex", "Princess", "Sebastian", "Lola", "Garfield", "Thor", "Sydney", "Lucy", "Simba", "Moose", "Yoda", "Salem", "Felix", "Sammy", "Athena", "Gracie", "Maddie", "Princess", "Tiger", "Zeus", "Bruno", "Puppy", "Pepper", "Scout", "Mittens", "Lucky", "Blue", "Bud", "Layla", "Baby", "Ruby", "Bear", "Heidi", "Chester", "Patches", "Fiona", "Ziggy", "Boo", "Phoebe", "BatMan", "Minnie"]
	private let kinds = ["Dog", "Cat", "Hamster", "Horse", "Chimpanzee", "Chameleon", "Llama", "Rabbit", "Deer", "Tiger", "Owl", "Badger", "Bat", "Pig", "Lizard"]
	
	init() {
		// Random name
		var index = Int(arc4random_uniform(UInt32(names.count)))
		name = names[index]
		// Random kind
		index = Int(arc4random_uniform(UInt32(kinds.count)))
		kind = kinds[index]
		// Random DOB
		dob = Date().random(unit: Calendar.Component.year, from: -1, upto: -20)!
	}
}
