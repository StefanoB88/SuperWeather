/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Current_observation : Codable {
	let wind : Wind?
	let atmosphere : Atmosphere?
	let astronomy : Astronomy?
	let condition : Condition?
	let pubDate : Int?

	enum CodingKeys: String, CodingKey {

		case wind = "wind"
		case atmosphere = "atmosphere"
		case astronomy = "astronomy"
		case condition = "condition"
		case pubDate = "pubDate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
		atmosphere = try values.decodeIfPresent(Atmosphere.self, forKey: .atmosphere)
		astronomy = try values.decodeIfPresent(Astronomy.self, forKey: .astronomy)
		condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
		pubDate = try values.decodeIfPresent(Int.self, forKey: .pubDate)
	}

}