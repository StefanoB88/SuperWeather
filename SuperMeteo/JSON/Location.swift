/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Location : Codable {
	let city : String?
	let region : String?
	let woeid : Int?
	let country : String?
	let lat : Double?
	let long : Double?
	let timezone_id : String?

	enum CodingKeys: String, CodingKey {

		case city = "city"
		case region = "region"
		case woeid = "woeid"
		case country = "country"
		case lat = "lat"
		case long = "long"
		case timezone_id = "timezone_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		region = try values.decodeIfPresent(String.self, forKey: .region)
		woeid = try values.decodeIfPresent(Int.self, forKey: .woeid)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		long = try values.decodeIfPresent(Double.self, forKey: .long)
		timezone_id = try values.decodeIfPresent(String.self, forKey: .timezone_id)
	}

}