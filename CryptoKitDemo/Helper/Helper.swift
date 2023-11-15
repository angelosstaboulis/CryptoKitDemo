//
//  Helper.swift
//  CryptoKitDemo
//
//  Created by Angelos Staboulis on 15/11/23.
//

import Foundation
import CryptoKit

class Helper{
    static let shared = Helper()
    private init(){}
    func encryptedData(data:Data,key:SymmetricKey)->Data{
        var seal:AES.GCM.SealedBox!
        do{
            seal = try AES.GCM.seal(data, using: key)
        }catch{
            debugPrint("something went wrong!!!!")
        }
            
        return seal.combined!
    }
    func decryptedData(dataText:Data!,key:SymmetricKey)->Data{
        var sealed:AES.GCM.SealedBox!
        var opened:Data!
        do{
            sealed = try AES.GCM.SealedBox(combined: dataText)
            opened = try AES.GCM.open(sealed, using: key)
        }catch{
            debugPrint("something went wrong!!!!")
        }
        return opened
    }
}
