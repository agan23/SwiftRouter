//
//  FatherVc.swift
//  组件化测试
//
//  Created by Red App on 2019/1/11.
//  Copyright © 2019 CEC-CESEC. All rights reserved.
//

import UIKit

public typealias resultCommComponentBlock = ([String: AnyObject]?) -> Void
public typealias resultCallBackComponentBlock = (NSMutableDictionary?) -> Void

open class FatherVc: UIViewController {

    open var resultB: resultCommComponentBlock?
    open var resultCallBackB: resultCallBackComponentBlock?
    open var para: [ String: AnyObject]?
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
