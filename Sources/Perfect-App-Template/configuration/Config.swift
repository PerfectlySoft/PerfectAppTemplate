//
//  Config.swift
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
import JSONConfig

struct AppCredentials {
	var clientid = ""
	var clientsecret = ""
}

func config() {
	#if os(Linux)
		let fname = "./config/ApplicationConfigurationLinux.json"
	#else
		let fname = "./config/ApplicationConfiguration.json"
	#endif

	if let configData = JSONConfig(name: fname) {
		if let dict = configData.getValues() {

			// Required Values
			HTTPport = dict["httpport"] as! Int

			// Optional Values
//			if let i = dict["keyname"] { let x = i as! String }


			// For ORM
//			PostgresConnector.host        = dict["postgreshost"] as! String
//			PostgresConnector.username    = dict["postgresuser"] as! String
//			PostgresConnector.password    = dict["postgrespwd"] as! String
//			PostgresConnector.database    = dict["postgresdbname"] as! String
//			PostgresConnector.port        = dict["postgresport"] as! Int

			// For Sessions
//			PostgresSessionConnector.host = PostgresConnector.host
//			PostgresSessionConnector.port = PostgresConnector.port
//			PostgresSessionConnector.username = PostgresConnector.username
//			PostgresSessionConnector.password = PostgresConnector.password
//			PostgresSessionConnector.database = PostgresConnector.database
//			PostgresSessionConnector.table = "sessions"

			// Outbound email config
//			SMTPConfig.mailserver         = dict["mailserver"] as! String
//			SMTPConfig.mailuser			  = dict["mailuser"] as! String
//			SMTPConfig.mailpass			  = dict["mailpass"] as! String
//			SMTPConfig.mailfromaddress    = dict["mailfromaddress"] as! String
//			SMTPConfig.mailfromname       = dict["mailfromname"] as! String
		}
	} else {
		print("Unable to get Configuration")
	}

}
