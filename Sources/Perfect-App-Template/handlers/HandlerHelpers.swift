//
//  HandlerHelpers.swift
//  Perfect-App-Template
//
//  Created by Jonathan Guthrie on 2017-04-01.
//
//

import PerfectHTTP
import StORM

extension Handlers {


	static func error(_ request: HTTPRequest, _ response: HTTPResponse, error: String, code: HTTPResponseStatus = .badRequest) {
		do {
			response.status = code
			try response.setBody(json: ["error": "\(error)"])
		} catch {
			print(error)
		}
		response.completed()
	}

	static func unimplemented(data: [String:Any]) throws -> RequestHandler {
		return {
			request, response in
			response.status = .notImplemented
			response.completed()
		}
	}


	// Common helper function to dump rows to JSON
	static func nestedDataDict(_ rows: [StORM]) -> [Any] {
		var d = [Any]()
		for i in rows {
			d.append(i.asDataDict())
		}
		return d
	}
	// Used for healthcheck functionality for monitors and load balancers.
	// Do not remove unless you have an alternate plan
	static func healthcheck(data: [String:Any]) throws -> RequestHandler {
		return {
			request, response in
			let _ = try? response.setBody(json: ["health": "ok"])
			response.completed()
		}
	}
}
