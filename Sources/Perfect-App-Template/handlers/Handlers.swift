//
//  Handlers.swift
//  Perfect-App-Template
//
//  Created by Jonathan Guthrie on 2017-02-20.
//	Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectHTTP
import StORM

class Handlers {


	// Basic "main" handler - simply outputs "Hello, world!"
	static func main(data: [String:Any]) throws -> RequestHandler {
		return {
			request, response in
			response.setHeader(.contentType, value: "text/html")
				.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
				.completed()
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
