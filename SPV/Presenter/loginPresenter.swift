//
//  loginPresenter.swift
//  SPV
//
//  Created by HappySanz Tech on 10/10/20.
//  Copyright © 2020 HappySanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct loginData {
    let mobile_otp: String
}

protocol LoginView : NSObjectProtocol {
    
    func startLoading()
    func finishLoading()
    func setLoginOtp(login_otp:String)
    func setEmptyLogin(errorMessage:String)
}


class LoginPresenter {
    
    private let loginService:LoginService
    weak private var loginView : LoginView?
    
    init(loginService:LoginService) {
        self.loginService = loginService
    }
    
    func attachView(view:LoginView) {
        loginView = view
    }
    
    func detachViewClientUrl() {
        loginView = nil
    }
    
    func getOtp(mobile_no:String) {
        self.loginView?.startLoading()
        loginService.callAPILogin(
            mobile_no: mobile_no, onSuccess: { (login) in
                self.loginView?.setLoginOtp(login_otp: login.mobile_otp!)
                self.loginView?.finishLoading()
        },
            onFailure: { (errorMessage) in
                self.loginView?.setEmptyLogin(errorMessage: errorMessage)
                self.loginView?.finishLoading()
        }
        )
    }
}
