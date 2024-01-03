
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var ViewTable: UIView!
    
    @IBOutlet weak var TableView: UITableView!
    
    var Data = [String]()
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        TableView.delegate = self
        TableView.dataSource = self
        TextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if let text = textField.text {
    filterData(text + string)
    }
    return true
    }

    func filterData(_ query: String?) {
    if let query = query?.trimmingCharacters(in: .whitespacesAndNewlines), !query.isEmpty {
    filteredData = Data.filter { $0.lowercased().contains(query.lowercased()) }
        } else {
    filteredData = Data
    }
    TableView.reloadData()
    }

    private func setupData() {
    Data.append("John")
    Data.append("Swathi")
    Data.append("Hii")
    Data.append("Bye")
    Data.append("Hello")

    filteredData = Data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
    cell.textLabel?.text = filteredData[indexPath.row]
    return cell
    }
    }
