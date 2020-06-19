//
//  STRouterTool.swift
//  组件化测试
//
//  Created by Red App on 2019/1/9.
//  Copyright © 2019 CEC-CESEC. All rights reserved.
//

import UIKit

public class STRouterTool: NSObject {
    
    
    
    
    public class func getVcWithCFBunbleName(cFBundleExecutableName: String?, vcName: String, param: [String: AnyObject]?, callBackBlock:  resultCallBackComponentBlock?) -> FatherVc? {
        
        guard let cf = cFBundleExecutableName else {
            return nil
        }
        
        // 0 .将字符串转换为类
        // 0.1默认情况下命名空间就是项目的名称, 但是命名空间名称是可以修改的
        guard let cls:AnyClass = NSClassFromString(cf + "." + vcName) else {
            return nil
        }
        
        // 0.2通过类创建对象
        // 0.2.1将AnyClass转换为指定的类型
        let vcCls = cls as! FatherVc.Type
        // 0.2.2通过class创建对象
        
        
        let vc = vcCls.init()
        vc.para = param
        vc.resultCallBackB = callBackBlock
        
        return vc
    }
    
    public class func getVc(vcName: String, param: [String: AnyObject]?, callBackBlock:  resultCallBackComponentBlock?) -> FatherVc? {
        // -1.动态获取命名空间
        guard let dict = Bundle.main.infoDictionary else {
            return nil
            
        }
        guard let cFBundleExecutable = dict["CFBundleExecutable"] else {
            return nil
        }
        let ns = cFBundleExecutable as! String
        
        // 0 .将字符串转换为类
        // 0.1默认情况下命名空间就是项目的名称, 但是命名空间名称是可以修改的
        guard let cls:AnyClass = NSClassFromString(ns + "." + vcName) else {
            return nil
        }
        // 0.2通过类创建对象
        // 0.2.1将AnyClass转换为指定的类型
        let vcCls = cls as! FatherVc.Type
        // 0.2.2通过class创建对象
        
        
        let vc = vcCls.init()
        vc.para = param
        vc.resultCallBackB = callBackBlock
        
        return vc
    }
    
    
//    public class func getVc(vcName: String, param: [String: AnyObject]?, callBackBlock: @escaping (resultCallBackComponentBlock?) -> ()) -> FatherVc? {
//        // -1.动态获取命名空间
//        guard let dict = Bundle.main.infoDictionary else {
//            return nil
//
//        }
//        guard let cFBundleExecutable = dict["CFBundleExecutable"] else {
//            return nil
//        }
//        let ns = cFBundleExecutable as! String
//
//        // 0 .将字符串转换为类
//        // 0.1默认情况下命名空间就是项目的名称, 但是命名空间名称是可以修改的
//        guard let cls:AnyClass = NSClassFromString(ns + "." + vcName) else {
//            return nil
//        }
//        // 0.2通过类创建对象
//        // 0.2.1将AnyClass转换为指定的类型
//        let vcCls = cls as! FatherVc.Type
//        // 0.2.2通过class创建对象
//
//
//        let vc = vcCls.init()
//        vc.para = param
//
//        return vc
//    }
    
    public class func setVc(vcName: String) -> FatherVc? {
        // -1.动态获取命名空间
        guard let dict = Bundle.main.infoDictionary else {
            return nil
            
        }
        guard let cFBundleExecutable = dict["CFBundleExecutable"] else {
            return nil
        }
        let ns = cFBundleExecutable as! String
        
        // 0 .将字符串转换为类
        // 0.1默认情况下命名空间就是项目的名称, 但是命名空间名称是可以修改的
        guard let cls:AnyClass = NSClassFromString(ns + "." + vcName) else {
            return nil
        }
        // 0.2通过类创建对象
        // 0.2.1将AnyClass转换为指定的类型
        let vcCls = cls as! FatherVc.Type
        // 0.2.2通过class创建对象
        
        let vc = vcCls.init()
        
        return vc
    }
    
    public class func gotoVc(sVc: UIViewController, destVcStr: String,  para: [String: AnyObject]?, callBack: @escaping (NSMutableDictionary?) -> Void) {
        guard let c = setVc(vcName: destVcStr) else {
            return
        }

        c.resultCallBackB = { (info) in
            callBack(info)
        }

        sVc.navigationController?.pushViewController(c, animated: true)
    }
}
