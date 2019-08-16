//
//  ViewController.swift
//  Figure
//
//  Created by CATK on 2017/08/22.
//  Copyright © 2017年 CATK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}


	@IBAction func tap(_ sender: UITapGestureRecognizer) {
		//customViewを生成するclass ViewCreatorをインスタンス化
		//↓↓↓↓↓ 回答ここから ↓↓↓↓↓
        let viewCreator = ViewCreaotr()
		//↑↑↑↑↑ ここまで ↑↑↑↑↑

		//大きさと位置を用意
		let randomL = Int(arc4random()) % 100 + 1
		let	size = CGSize(width: randomL, height: randomL)
		let center: CGPoint = sender.location(in: self.view)

		//customViewの大きさと中心の位置を設定
		//↓↓↓↓↓ 回答ここから ↓↓↓↓↓
        viewCreator.setFrame(size: size, center: center)
		//↑↑↑↑↑ ここまで ↑↑↑↑↑


		//色を用意
		let randomC = Int(arc4random()) % 3
		var color: UIColor!
		if randomC == 0 {
			color = UIColor.red
		} else if randomC == 1 {
			color = UIColor.blue
		} else {
			color = UIColor.green
		}

		//customViewの色を設定
		//↓↓↓↓↓ 回答ここから ↓↓↓↓↓
        viewCreator.setColor(color: color)
		//↑↑↑↑↑ ここまで ↑↑↑↑↑


		//角丸の半径を用意
		let radius = CGFloat(Int(arc4random()) % (randomL / 2))

		//customViewの角丸の半径を設定
		//↓↓↓↓↓ 回答ここから ↓↓↓↓↓
        viewCreator.setCorner(radius: radius)
        //↑↑↑↑↑ ここまで ↑↑↑↑↑


		//親ViewにcustomViewを追加
		//↓↓↓↓↓ 回答ここから ↓↓↓↓↓
        self.view.addSubview( viewCreator.getCustiomView() )
		//↑↑↑↑↑ ここまで ↑↑↑↑↑
	}

}

