# ZDMetroLabel
A spinning UILabel inspired in old train time tables

###USAGE
Simply import the ZDMetroLabel.swift class to your project.
Create a new ZDMetroLabel with an initial text in your UIViewController.
Change the label text to make it animate.

###CODE SAMPLE

```Swift
override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var label = ZDMetroLabel(frame: CGRect(x: 20, y: 100, width: 100, height: 30))
        label.text = "Some text"
        self.view.addSubview(label)
        label.text = "Another text"
  }
```


