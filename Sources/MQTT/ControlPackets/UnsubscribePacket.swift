//
//  UnsubscribePacket.swift
//  MQTT
//
//  Created by Mukesh on 28/01/19.
//

import Foundation

struct UnsubscribePacket {
    let header: Header
    let payload: [String]
    
    struct Header {
        let identifier: UInt16
        let properties: Property?
        
        struct Property {
            let userProperty: [String: String] = [:]
        }
    }
}