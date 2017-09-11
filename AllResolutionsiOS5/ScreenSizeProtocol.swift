//
//  ScreenSizeProtocol.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/11.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit
/**
 ScreenSizeProtocol Class
 - Attention: 注意書き
 - Author: 作成者が一人の場合
 - Authors: 作成者が複数人の場合
 - Bug: バグの詳細
 - Copyright: 著作権の所在
 - Date: 日付(作成日, 更新日など)
 - Experiment: 実験内容
 - Important: 重要事項
 - Invariant: 不変事項
 - Note: その他、必要事項
 - Precondition: 事前条件
 - Postcondition: 事後条件
 - Remark: 備考
 - Requires: 要求事項
 - SeeAlso: 参照事項
 - Since: いつから実装されているか
 - Version: バージョン
 - Warning: 警告
 */

protocol ScreenSizeProtocol {
    func getStoryBoardBySizeType(SizeNickName: String) -> UIViewController
}
