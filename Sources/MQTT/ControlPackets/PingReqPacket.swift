//
//  PingReqPacket.swift
//  MQTT
//
//  Created by Mukesh on 28/01/19.
//

import Foundation

struct PingReqPacket: MQTTPacketCodable {
    let fixedHeader: MQTTPacketFixedHeader
    
    init() {
        fixedHeader = MQTTPacketFixedHeader(packetType: .PINGREQ, flags: 0)
    }
    
    init?(decoder: [UInt8]) throws {
        if decoder.count == 0 {
            return nil
        }
        
        fixedHeader = MQTTPacketFixedHeader(networkByte: decoder[0])
        
        if fixedHeader.packetType != .PINGREQ {
            return nil
        }
        
        let variableHeaderLength = try VariableByteInteger(from: decoder, startIndex: 1)
        if variableHeaderLength.value + 1 != decoder.count - variableHeaderLength.bytes.count {
            throw PacketError.invalidPacket("Packet variable header size invalid")
        }
    }
    
    func encodedVariableHeader() throws -> [UInt8] {
        return []
    }
    
    func encodedPayload() throws -> [UInt8] {
        return []
    }
}
