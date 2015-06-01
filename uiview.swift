import UIKit
import XCPlayground

let view = UIView(frame:CGRect(x: 0, y: 0, width: 320, height: 320))

XCPShowView("This is a VIEW", view)

let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

subView.backgroundColor = UIColor.blueColor()

view.addSubview(subView)

class Shape: UIView {
    var color:UIColor
    init(color:UIColor) {
        self.color = color
        super.init(frame:CGRectZero)
        self.backgroundColor = color
    }

    func getArea() -> Double {
        return 0
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Square: Shape {
    var width:Int
    init(width:Int, color:UIColor) {
        self.width = width
        super.init(color: color)
        self.frame.size = CGSize(width: width, height: width)
    }
    override func getArea() -> Double {
        return(Double(width*width))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Circle: Shape {
    var radius:Int
    init(radius:Int, color:UIColor) {
        self.radius = radius
        super.init(color:color)
        self.frame.size = CGSize(width: radius*2, height: radius*2)
        self.layer.cornerRadius = CGFloat(radius)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func getArea() -> Double {
        let π = M_PI
        let rSquared = Double(radius*radius)
        return (Double(π*rSquared))
    }
}

class Rectangle:Shape {
    var width:Int
    var height:Int
    init(width:Int, height:Int, color:UIColor) {
        self.height = height
        self.width = width
        super.init(color:color)
        self.frame.size = CGSize(width: width, height: height)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func getArea() -> Double {
        return Double(height*width)
    }
}

class RoundedRectangle:Rectangle {
    override init(width:Int, height:Int, color:UIColor) {
        super.init(width:width, height:height, color:color)
        self.layer.cornerRadius = CGFloat(5)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

var circle = Circle(radius: 50, color: UIColor.greenColor())
var square = Square(width: 100, color: UIColor.blackColor())
var rectangle = Rectangle(width: 75, height: 150, color: UIColor.yellowColor())
var roundRect = RoundedRectangle(width: 60, height: 100, color: UIColor.whiteColor())
circle.center = CGPoint(x:100, y:100)
square.center = CGPoint(x:200, y:200)
rectangle.center = CGPoint(x: 240, y: 160)
roundRect.center = CGPoint(x: 100, y: 200)

view.addSubview(circle)
view.addSubview(square)
view.addSubview(rectangle)
view.addSubview(roundRect)