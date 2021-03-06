/**
* Copyright 2015 IBM Corp.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import UIKit
import IBMMobileFirstPlatformFoundation

class LoginViewController: UIViewController {
    
    

    var challengeHandler : ChallengeHandler?

    @IBOutlet weak var errorMsg: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Custom Authentication"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func login(sender: AnyObject) {
        self.challengeHandler?.submitLoginForm("/my_custom_auth_request_url",
            requestParameters: ["username" : self.username.text!, "password" : self.password.text!],
            requestHeaders: nil, requestTimeoutInMilliSeconds: 0, requestMethod: "POST")
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        if self.isMovingFromParentViewController(){
            //Back button pressed
            self.challengeHandler?.submitFailure(nil)
        }
    }

}
