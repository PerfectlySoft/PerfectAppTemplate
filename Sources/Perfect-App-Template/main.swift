//
//  main.swift
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

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectRequestLogger
import PerfectLogger


var HTTPport = 8181
config()
Utility.initializeObjects()

let httplogger = RequestLogger()
RequestLogFile.location = "./webLog.log"

// Configure Server
var confData: [String:[[String:Any]]] = [
	"servers": [
		[
			"name":"localhost",
			"port":HTTPport,
			"routes":[],
			"filters":[]
		]
	]
]

// Load Filters
confData["servers"]?[0]["filters"] = filters()

// Load Routes
confData["servers"]?[0]["routes"] = mainRoutes()

do {
	// Launch the servers based on the configuration data.
	try HTTPServer.launch(configurationData: confData)
} catch {
	 // fatal error launching one of the servers
	fatalError("\(error)")
}

