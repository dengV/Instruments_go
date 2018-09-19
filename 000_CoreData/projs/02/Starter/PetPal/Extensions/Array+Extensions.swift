 

import Foundation

extension Array {
	func random() -> Element? {
		if self.isEmpty {
			return nil
		}
		let index = self.count.random()
		return self[index]
	}
}
