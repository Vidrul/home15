import UIKit

class PizzaViewController: UIViewController {
    
    @IBOutlet weak var tableViewPizza: UITableView!
    @IBOutlet weak var addNewPizza: UIBarButtonItem!
    
    var arrayPizza:[Pizza] = [Pizza]()
    //    lazy var namesArray: [Pizza] = arrayPizza
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pizza"
        tableViewPizza.dataSource = self
    }
    
    
    @IBAction func addPizza(_ sender: UIBarButtonItem) {
        let makeYourPizzaViewController = MakeYourPizzaViewController.viewControllerWithStoryboard()
        if let makeYourPizzaViewController = makeYourPizzaViewController {
            makeYourPizzaViewController.delegate = self
            navigationController?.pushViewController(makeYourPizzaViewController, animated: true)
            
        }
    }
    
}


extension PizzaViewController: MakeYourPizzaViewControllerDelegate,UITableViewDataSource {
    func makePizza(pizza: Pizza) {
        arrayPizza.append(pizza)
        tableViewPizza.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPizza.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableViewPizza.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        
        
        let element = arrayPizza[indexPath.row]
        if element.isThick {
            cell?.textLabel?.text = "\(element.name),with size \(element.size.description()), with thick pastry"
        } else {
            cell?.textLabel?.text = "\(element.name),with size \(element.size.description())"
        }
        return cell!
    }
    
}


