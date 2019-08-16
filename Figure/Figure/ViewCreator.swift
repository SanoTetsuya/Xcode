//
//  ViewCreator.swift
//  Figure
//
//  Created by CATK on 2017/08/22.
//  Copyright © 2017年 CATK. All rights reserved.
//

import UIKit


// 以下の5つを持つclass ViewCreatorを作れ
//	・customViewという名前のUIViewコンポーネント(インスタンス)
//	・ビューの大きさと中心位置を引数に取り、customViewに設定する関数(メソッド)setFrame
//	・ビューの背景色を引数に取り、設定する関数(メソッド)setColor
//	・ビューの角丸の半径を引数に取り、設定する関数(メソッド)setCorner
//	・ビューを戻り値として返す関数(メソッド)getCustomView

// ↓↓↓↓↓ 回答ここから ↓↓↓↓↓
class ViewCreaotr {
    let customView = UIView()
    
    func setFrame(size: CGSize, center: CGPoint){
        customView.frame.size = size
        customView.center = center
    }
    
    func setColor(color: UIColor){
        customView.backgroundColor = color
    }
    
    func setCorner(radius: CGFloat){
        customView.layer.cornerRadius = radius
    }

    func getCustiomView() ->UIView {
        return customView
    }
}


// ↑↑↑↑↑ ここまで ↑↑↑↑↑

//迷ったらアドバイスの動画を見よう！
