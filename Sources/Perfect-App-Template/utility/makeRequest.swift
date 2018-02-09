//
//  makeRequest.swift
//  Perfect-App-Template
//
//  Created by Jonathan Guthrie on 2017-02-22.
//
//

import Foundation
import PerfectLib
import cURL
import PerfectCURL
import PerfectHTTP


extension Utility {


	/// The function that triggers the specific interaction with a remote server
	/// Parameters:
	/// - method: The HTTP Method enum, i.e. .get, .post
	/// - route: The route required
	/// - body: The JSON formatted sring to sent to the server
	/// - bearToken: a session token when authentication required.
	/// - completion: a callback when responded.
	static func makeRequest(
		_ method: HTTPMethod,
		_ url: String,
		body: String = "",
		encoding: String = "JSON",
		bearerToken: String = "",
		completion: @escaping ([String:Any], Error?) -> Void ) {

		let curlObject = CURL(url: url)
		curlObject.setOption(CURLOPT_HTTPHEADER, s: "Accept: application/json")
		curlObject.setOption(CURLOPT_HTTPHEADER, s: "Cache-Control: no-cache")
		curlObject.setOption(CURLOPT_USERAGENT, s: "PerfectAPI3.0")

		if !bearerToken.isEmpty {
			curlObject.setOption(CURLOPT_HTTPHEADER, s: "Authorization: Bearer \(bearerToken)")
		}

		switch method {
		case .post :
			let byteArray = [UInt8](body.utf8)
			curlObject.setOption(CURLOPT_POST, int: 1)
			curlObject.setOption(CURLOPT_POSTFIELDSIZE, int: byteArray.count)
			curlObject.setOption(CURLOPT_COPYPOSTFIELDS, v: UnsafeMutablePointer(mutating: byteArray))

			if encoding == "form" {
				curlObject.setOption(CURLOPT_HTTPHEADER, s: "Content-Type: application/x-www-form-urlencoded")
			} else {
				curlObject.setOption(CURLOPT_HTTPHEADER, s: "Content-Type: application/json")
			}

		default: //.get :
			curlObject.setOption(CURLOPT_HTTPGET, int: 1)
		}

		_ = curlObject.perform { (errCode, _, bodyData) in

			guard errCode == 0 else {
				completion([:], PerfectError.networkError(Int32(errCode), "network failure"))
				return
			}

			guard let string = String(validatingUTF8: bodyData) else {
				completion([:], PerfectError.systemError(0, "unexpected data returned"))
				return
			}

			do {
				guard let dic = try string.jsonDecode() as? [String: Any] else {
					completion([:], PerfectError.apiError("empty content"))
					return
				}
				completion(dic, nil)
			} catch {
				completion([:], error)
			}
		}
	}
}
