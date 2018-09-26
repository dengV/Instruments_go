

import UIKit

class FriendData {
    
    
	var name = ""
	var address = ""
	var dob = Date()
	var eyeColor: UIColor?
    
	var picture: Data?
	
	private let firstNames = ["Amaya", "Noe", "Julius", "Carolina", "Aria", "Meghan", "Braylon", "Celia", "Alijah", "Mathew", "Diego", "Arely", "Stacy", "Mareli", "Brendan", "Harrison", "Olive", "Litzy", "Deven", "Lilliana", "Liam", "Kenley", "Hana", "Devin", "Ali", "Judah", "Carlee", "Fletcher", "Maleah", "Jayla", "Beckham", "Leonidas", "Kyra", "Finnegan", "Genevieve", "Vivian", "Kristin", "Janet", "Alison", "Howard", "Frank", "Ignacio", "Elizabeth", "Zion", "Journey", "Vaughn", "Mateo", "Bridger", "Jaxson", "Mikayla"]
    
    
	private let lastNames = ["Bridges", "Winters", "Clements", "Roberts", "Gordon", "Yoder", "Romero", "Acevedo", "Becker", "Calderon", "Wu", "Cervantes", "Meza", "Stephens", "Hogan", "Robles", "Stokes", "Mckee", "Navarro", "Bradley", "Clayton", "Martin", "Harrell", "Hess", "Hamilton", "Cortez", "Nash", "Wright", "Sawyer", "Thornton", "Avila", "Gill", "Calhoun", "Warner", "Morales", "Bender", "Petty", "Cunningham", "Glenn", "Padilla", "Grant", "Hooper", "Marshall", "Barber", "Poole", "Carrillo", "Richardson", "Johnson", "Esparza", "Vang"]
    
    
	private let eyeColors = [UIColor.black, UIColor.blue, UIColor.brown, UIColor.green, UIColor.gray]
    
    
	private let streets = ["Railroad Avenue", "Cobblestone Court", "Briarwood Drive", "6th Avenue", "Adams Avenue", "Cedar Street", "Oxford Road", "Arch Street", "Route 30", "Magnolia Avenue", "West Avenue", "Route 11", "Lantern Lane", "Circle Drive", "Spruce Avenue", "Ridge Street", "4th Avenue", "Winding Way", "Strawberry Lane", "Broadway", "Howard Street", "Redwood Drive", "Pearl Street", "Adams Street", "Mulberry Court", "Forest Avenue", "Woodland Road", "Morris Street", "Mechanic Street", "East Avenue"]

    
    
	init() {
		// Random name
		let isLower = arc4random_uniform(10) < 5
		var index = Int(arc4random_uniform(UInt32(firstNames.count)))
		let first = (isLower ? firstNames[index].lowercased() : firstNames[index])
		index = Int(arc4random_uniform(UInt32(lastNames.count)))
		let last = (isLower ? lastNames[index].lowercased() : lastNames[index])
		name = first + " " + last
        
        
		// Random Address
		index = Int(arc4random_uniform(UInt32(streets.count)))
		let num = Int(arc4random_uniform(100))
		address = "\(num) " + streets[index]
        
        
		// Random DOb
		dob = Date().random(unit: Calendar.Component.year, from: -10, upto: -90)!
        
        
		// Random Eye Color
		index = Int(arc4random_uniform(UInt32(eyeColors.count)))
		eyeColor = eyeColors[index]
	}
}
