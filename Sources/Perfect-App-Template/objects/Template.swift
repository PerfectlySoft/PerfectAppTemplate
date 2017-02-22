//
//  Template.swift
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

//import StORM
//import SQLiteStORM
//
//public class Event: SQLiteStORM {
//	public var property		= ""
//	public var val			= ""
//
//	override public func to(_ this: StORMRow) {
//		property    = this.data["property"] as? String		?? ""
//		val			= this.data["val"] as? String			?? ""
//	}
//
//	func rows() -> [Event] {
//		var rows = [Event]()
//		for i in 0..<self.results.rows.count {
//			let row = Event()
//			row.to(self.results.rows[i])
//			rows.append(row)
//		}
//		return rows
//	}
//
//}
