# PassDataBetweenVCs-Swift

### Features

This project demonstrates 3 different ways of passing data between view controllers:
1. custom initializer: 

    In [SecondCustomViewController](PassDataBetweenVCs/SecondCustomViewController.swift), a custom initializer with its own parameters is created. Certain information must be passed into the initializer to construct the controller.

2. completion handler:

    [TextEntryViewController](PassDataBetweenVCs/TextEntryViewController.swift) shows a text box where user can input some text, once the Done button is clicked. The user input will be sent back to [SecondViewController](PassDataBetweenVCs/Tab%20Controllers/SecondViewController.swift) and the input text will be displayed on SecondViewController.

3. notification post:

    [ThirdViewController](PassDataBetweenVCs/Tab%20Controllers/ThirdViewController.swift) has a button, when it's clicked, a Notification post will be sent to both ViewController and SecondViewController. The notification observers in those 2 controllers will receive the post and update their UI correspondingly.

### Best Practices

* **custom initializer** is the most popular/common approach if certain information is required by a controller
* **completion handler** is often used when you have asynchronous tasks (i.e. user needs to do some work on another controller and you need to get the results back).
* **notification** should be only used in the case where a message needs to be passed to **multiple** observers, not just one.

### Reference
 [iOS Academy](https://www.youtube.com/watch?v=UVIQ7fkw_N8)
