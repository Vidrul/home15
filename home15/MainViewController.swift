

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var colorArray: Array<UIColor> = [ .red, .green,.orange, .blue, .black, .yellow ]
    let colorName: Array<String> = [ "red", "green","orange", "blue", "black","yellow" ]
    var arrayInt: Array<Int> = [1,1]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Fibonachi"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        var a = 1
        var b = 1
        for _ in 0..<29{
            let  fib = a + b
            a = b
            b = fib
            arrayInt.append(b)
            let colorIndex = Int.random(in: 0..<colorArray.count)
            let element = colorArray[colorIndex]
            colorArray.append(element)
        }
        
        
        
    }
    
    
    
}



extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayInt.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
             cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        //        cell.textLabel?.text = colorName[indexPath.row]
        cell!.textLabel?.textColor = colorArray[indexPath.row]
        cell!.textLabel?.text = String(arrayInt[indexPath.row])
        return cell!
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

