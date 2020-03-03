

import UIKit


protocol MakeYourPizzaViewControllerDelegate: AnyObject {
    func makePizza(pizza: Pizza)
}

class MakeYourPizzaViewController: UIViewController {
    @IBOutlet weak var nameOfPizza: UITextField!
    @IBOutlet weak var sizeOfPizza: UISegmentedControl!
    @IBOutlet weak var testo: UISwitch!
    
    var sizePizza: [SizeOfThePizza] =  [.small,.medium,.big]
    
    weak var delegate: MakeYourPizzaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizeOfPizza.removeAllSegments()
        for (i,pizza) in sizePizza.enumerated() {
            sizeOfPizza.insertSegment(withTitle: pizza.description(), at: i, animated: true)
        }
        
        
        
    }
    
    
    @IBAction func deliciousButtonDidClick(_ sender: UIButton) {
        var name = nameOfPizza.text
        if name == "" {
            name = "no name"
        }
        
        let isThick = testo.isOn
        
        let pizzaSize: SizeOfThePizza
        switch sizeOfPizza.selectedSegmentIndex {
        case 0:
            pizzaSize = .small
        case 1:
            pizzaSize = .medium
        case 2:
            pizzaSize = .big
        default:
            pizzaSize = .small
        }
        
        let pizzaDone = Pizza(name: name!, size: pizzaSize, isThick: isThick)
        delegate?.makePizza(pizza: pizzaDone)
        navigationController?.popViewController(animated: true)
        
    }
}



