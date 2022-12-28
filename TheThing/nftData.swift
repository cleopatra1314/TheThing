//
//  nftData.swift
//  TheThing
//
//  Created by 黃郁雯 on 2022/11/9.
//

import Foundation

//建立型別以及NFT資訊array
typealias nftData = (name: String, tockenStandard: String, image: String, like: Bool, owner: String, creator: String, price: Double, numberOfBuy: Int)
var nftDataArray: [nftData] = [("n1", "ERC1155", "room11", true, "o1", "c1", 0.8, 3), ("n2", "ERC1155", "room10",true, "o2", "c2", 3.0, 4), ("n3", "ERC1155", "room09",false, "o3", "c3", 2.8, 2)]
