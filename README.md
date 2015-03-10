# ZDMetroLabel
A spinning UILabel inspired in old train time tables

###Usage
Simply import the ZDMetroLabel.swift class to your project.
Create a new ZDMetroLabel with an initial text in your UIViewController.
Change the label text to make it animate.

###Code Sample

```Swift
override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var label = ZDMetroLabel(frame: CGRect(x: 20, y: 100, width: 100, height: 30))
        label.text = "Some text"
        self.view.addSubview(label)
        label.text = "Another text"
  }
```
Now you can also modify the direction of the animation(DOWN/LEFT/UP/RIGHT) simply by adding this line of code: 

```Swift
label.direction = .DOWN //the direction you prefer
```
As it's a subclass of UILabel you can customize it as always with borders, corner radius and colors.

###License

[MIT License](https://github.com/nicky1525/ZDMetroLabel/blob/master/LICENSE)
