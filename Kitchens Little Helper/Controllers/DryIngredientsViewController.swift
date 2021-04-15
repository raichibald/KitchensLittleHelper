//
//  DryIngredientsViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 16/03/2021.
//

import UIKit
import AnimatableReload

class DryIngredientsViewController: UIViewController {
    
    var dataOne = ["oz", "lbs"]
    var dataTwo = ["g", "kg"]
    
    var quantTextField = UITextField()
    var switchButton = SwitchButton()
    var convertButton = ConvertButton()
    
    private let unitCellWidth: CGFloat = 85
    private let unitCellHeight: CGFloat = 108
    
    private var switchUnits = false

    
    var leftInset: CGFloat = 0.0
    var rightInset: CGFloat = 0.0
    //var count = 3
    
    var selectedIndexOne = Int()
    var selectedIndexTwo = Int()
    
    var selectedIndexPathOne = IndexPath(item: 0, section: 0)
    var selectedIndexPathTwo = IndexPath(item: 0, section: 0)
    
    weak var conversionDelegate: ConversionDelegate?
    
    var converterManager = ConverterManager()
    
    var unitOneText: String?
    var unitTwoText: String?
    
    var initialUnitLabel: String?
    
    //Setting UICollectionView to a function that returns itself
    fileprivate let unitCollectionViewOne: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Registering normal collection view cell
        cv.register(UnitCollectionViewCell.self, forCellWithReuseIdentifier: "unitCell")
        
        return cv
    }()
    
    fileprivate let unitCollectionViewTwo: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Registering normal collection view cell
        cv.register(UnitCollectionViewCell.self, forCellWithReuseIdentifier: "unitCellTwo")
        
        return cv
    }()
    

    override func viewWillAppear(_ animated: Bool) {
        //print("////////////")
//        let selectedIndexPathOne = IndexPath(item: 0, section: 0)
//        let selectedIndexPathTwo = IndexPath(item: 0, section: 0)
//        unitCollectionViewOne.selectItem(at: selectedIndexPathOne, animated: false, scrollPosition: .left)
//        unitCollectionViewTwo.selectItem(at: selectedIndexPathTwo, animated: false, scrollPosition: .left)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unitCollectionViewOne.dataSource = self
        unitCollectionViewOne.delegate = self
        
        unitCollectionViewTwo.dataSource = self
        unitCollectionViewTwo.delegate = self
        
        dismissKeyboardWhenTappedOutside()
        
        quantTextField.delegate = self
        quantTextField.addDoneButtonToKeyboard(myAction: #selector(quantTextField.resignFirstResponder))
        
        configureQuantTextField()
        configureUnitCollectionView()
        configureConvertButton()
        
        unitCollectionViewOne.selectItem(at: selectedIndexPathOne, animated: false, scrollPosition: .left)
        unitCollectionViewTwo.selectItem(at: selectedIndexPathTwo, animated: false, scrollPosition: .left)
        
        
        

 
    }

    func configureUnitCollectionView() {
        view.addSubview(unitCollectionViewOne)
        
        
        
        
        configureSwitchButton()
        view.addSubview(unitCollectionViewTwo)
        
        unitCollectionViewOne.backgroundColor = UIColor(named: "darkWhite")
        unitCollectionViewTwo.backgroundColor = UIColor(named: "darkWhite")
        

        setUnitCollectionViewOneConstraints()
        //setSwitchButtonConstraints()
        setUnitCollectionViewTwoConstraints()
        
        
    }


    func setUnitCollectionViewOneConstraints() {
        unitCollectionViewOne.topAnchor.constraint(equalTo: quantTextField.bottomAnchor, constant: 20).isActive = true
        unitCollectionViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        unitCollectionViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        unitCollectionViewOne.heightAnchor.constraint(equalToConstant: unitCellHeight).isActive = true
 
    }
    
    func setUnitCollectionViewTwoConstraints() {
        unitCollectionViewTwo.topAnchor.constraint(equalTo: switchButton.bottomAnchor, constant: 10).isActive = true
        unitCollectionViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        unitCollectionViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        unitCollectionViewTwo.heightAnchor.constraint(equalToConstant: unitCellHeight).isActive = true
    }


    func configureQuantTextField() {
        view.addSubview(quantTextField)
//        quantTextField.placeholder = "10"
        quantTextField.keyboardType = .decimalPad
        
        quantTextField.text = "10"
        quantTextField.font = UIFont.boldSystemFont(ofSize: 80)
        quantTextField.textAlignment = .center
        quantTextField.adjustsFontSizeToFitWidth = true
        quantTextField.layer.borderWidth = 3
        quantTextField.layer.borderColor = UIColor(named: "warmRed")?.cgColor
        quantTextField.layer.cornerRadius = 27

        setQuantTextFieldConstraints()

    }

    func setQuantTextFieldConstraints() {
        quantTextField.translatesAutoresizingMaskIntoConstraints = false
        quantTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        quantTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        quantTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        quantTextField.heightAnchor.constraint(equalToConstant: 85).isActive = true

    }
    
    func configureSwitchButton() {
        view.addSubview(switchButton)
        switchButton.addTarget(self, action: #selector(switchButtonTapped), for: .touchUpInside)
        setSwitchButtonConstraints()
    }
    
    func configureConvertButton() {
        convertButton.setTitle("CONVERT", for: .normal)
        view.addSubview(convertButton)
        
        //Target
        convertButton.addTarget(self, action: #selector(convertButtonReleased), for: .touchUpInside)
        
        convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchDown)
        convertButton.addTarget(self, action: #selector(convertButtonCancelled), for: .touchDragExit)
        
        //Constraints
        setConvertButtonConstraints()
    }
    
    @objc func convertButtonReleased(_ sender: UIButton) {
        if let quantText = quantTextField.text, let unitOne = unitOneText, let unitTwo = unitTwoText {

            let currentValue = (quantText.replacingOccurrences(of: ",", with: ".") as NSString).doubleValue
            print(currentValue)
            converterManager.convertUnits(value: currentValue, unitOne: unitOne, unitTwo: unitTwo)
            
            //For debugging
            print("currentValue \(Double(currentValue))")
            print(unitOne)
            print(unitTwo)
        }
        
        
        performSegue(withIdentifier: "goToResults", sender: self)
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                sender.setTitleColor(UIColor(named: "warmRed"), for: .normal)
                sender.backgroundColor = UIColor(named: "darkWhite")
            }
        }
    }
    
    @objc func convertButtonTapped(_ sender: UIButton) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                sender.setTitleColor(UIColor(named: "darkWhite"), for: .normal)
                sender.backgroundColor = UIColor(named: "warmRed")
            }
        }
    }
    
    @objc func convertButtonCancelled(_ sender: UIButton) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                
                
                sender.setTitleColor(UIColor(named: "warmRed"), for: .normal)
                sender.backgroundColor = UIColor(named: "darkWhite")
            }
            
        }
    }
    
    func setConvertButtonConstraints() {
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        convertButton.topAnchor.constraint(equalTo: unitCollectionViewTwo.bottomAnchor, constant: 30).isActive = true
        convertButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        convertButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        convertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func switchButtonTapped() {
        switchUnits = !switchUnits
        
        DispatchQueue.main.async {
            if self.switchUnits {
                UIView.animate(withDuration: 0.5) {
                    self.switchButton.imageView?.transform = CGAffineTransform(rotationAngle: -0.999 * CGFloat.pi)
                }
                
                
                AnimatableReload.reload(collectionView: self.unitCollectionViewOne, animationDirection: "left")
                AnimatableReload.reload(collectionView: self.unitCollectionViewTwo, animationDirection: "right")
                
                //selecting previously selected cells on switch
                self.unitCollectionViewOne.selectItem(at: self.selectedIndexPathTwo, animated: true, scrollPosition: .left)
                self.unitCollectionViewTwo.selectItem(at: self.selectedIndexPathOne, animated: true, scrollPosition: .left)
                
                
                
            } else {
                UIView.animate(withDuration: 0.5) {
                    self.switchButton.imageView?.transform = .identity
                }
                
                AnimatableReload.reload(collectionView: self.unitCollectionViewOne, animationDirection: "right")
                AnimatableReload.reload(collectionView: self.unitCollectionViewTwo, animationDirection: "left")
                
                
                self.unitCollectionViewOne.selectItem(at: self.selectedIndexPathOne, animated: true, scrollPosition: .left)
                self.unitCollectionViewTwo.selectItem(at: self.selectedIndexPathTwo, animated: true, scrollPosition: .left)
                
            }
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            let resultViewController = segue.destination as! ResultViewController
            //print(quantTextField.text)
            
            resultViewController.resultValue = converterManager.getConversionValue()
            resultViewController.fromValue = converterManager.getFromValue()
            resultViewController.fromUnit = converterManager.getUnitNameOf(converterManager.getFromUnit())
            resultViewController.resultUnit = converterManager.getUnitNameOf(converterManager.getToUnit())
            
            
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        switchButton.clipsToBounds = true
        switchButton.layer.cornerRadius = switchButton.frame.size.width / 2
    }
    

    func setSwitchButtonConstraints() {
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.topAnchor.constraint(equalTo: unitCollectionViewOne.bottomAnchor, constant: 10).isActive = true
        switchButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        switchButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        switchButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }


}

extension DryIngredientsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: unitCellWidth, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == unitCollectionViewOne {
            if !switchUnits {
                return dataOne.count
            } else {
                return dataTwo.count
            }
            
        } else {
            if switchUnits {
                return dataOne.count
            } else {
                return dataTwo.count
            }
        }
        
    }
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == unitCollectionViewOne {
            let unitCell = collectionView.dequeueReusableCell(withReuseIdentifier: "unitCell", for: indexPath) as! UnitCollectionViewCell
            
            
            
            if !switchUnits {
                unitCell.bigLabel.text = dataOne[indexPath.row]
                
                //Initial label
                unitOneText = dataOne[selectedIndexPathOne.row]
            } else {
                unitCell.bigLabel.text = dataTwo[indexPath.row]
                
                //Initial label
                unitOneText = dataTwo[selectedIndexPathOne.row]
                
            }
            
            
            return unitCell
        } else {
            let unitCell = collectionView.dequeueReusableCell(withReuseIdentifier: "unitCellTwo", for: indexPath) as! UnitCollectionViewCell
            
            if switchUnits {
                unitCell.bigLabel.text = dataOne[indexPath.row]
                
                //Initial label
                unitTwoText = dataOne[selectedIndexPathTwo.row]
                print(selectedIndexPathTwo)
            } else {
                unitCell.bigLabel.text = dataTwo[indexPath.row]
                
                //Initial label
                unitTwoText = dataTwo[selectedIndexPathTwo.row]
                print(unitTwoText)
            }

            return unitCell
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print("=========== \(indexPath)")
        guard let unitQuant = quantTextField.text else { return }
        
        if collectionView == unitCollectionViewOne {
            selectedIndexPathOne = indexPath
            
            if !switchUnits {
                unitOneText = dataOne[indexPath.row]
                //print(dataOne[indexPath.row])
            } else {
                //print(dataTwo[indexPath.row])
                unitOneText = dataTwo[indexPath.row]
                
            }
            //print("///// \(unitQuant)")
            
        } else if collectionView == unitCollectionViewTwo {
            //print(",,,,,,,,,,,,,,,")
            selectedIndexPathTwo = indexPath
            
            
            if switchUnits {
                unitTwoText = dataOne[indexPath.row]
                //print(dataOne[indexPath.row])
            } else {
                unitTwoText = dataTwo[indexPath.row]
                //print(dataTwo[indexPath.row])
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell: UnitCollectionViewCell = collectionView.cellForItem(at: indexPath) as! UnitCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       
        if collectionView == unitCollectionViewOne {
            if !switchUnits {
                return centerItemsInCollectionView(cellWidth: Double(unitCellWidth), numberOfItems: Double(dataOne.count), spaceBetweenCell: 10, collectionView: unitCollectionViewOne)
            } else {
                return centerItemsInCollectionView(cellWidth: Double(unitCellWidth), numberOfItems: Double(dataTwo.count), spaceBetweenCell: 10, collectionView: unitCollectionViewOne)
            }
            
        } else {
            
            if switchUnits {
                return centerItemsInCollectionView(cellWidth: Double(unitCellWidth), numberOfItems: Double(dataOne.count), spaceBetweenCell: 10, collectionView: unitCollectionViewTwo)
            } else {
                return centerItemsInCollectionView(cellWidth: Double(unitCellWidth), numberOfItems: Double(dataTwo.count), spaceBetweenCell: 10, collectionView: unitCollectionViewTwo)
            }
            
        }
        
        
    }
    
    func centerItemsInCollectionView(cellWidth: Double, numberOfItems: Double, spaceBetweenCell: Double, collectionView: UICollectionView) -> UIEdgeInsets {
            let totalWidth = cellWidth * numberOfItems
            let totalSpacingWidth = spaceBetweenCell * (numberOfItems - 1)
            let leftInset = (collectionView.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset
            if leftInset < 0 {
                collectionView.isScrollEnabled = true
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            }
            collectionView.isScrollEnabled = false
            return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        }
}

extension DryIngredientsViewController: UITextFieldDelegate {

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let comma = textField.text?.components(separatedBy: ",").count {
            if comma > 1 && string == "," {

                return false
            }
            
        }
        
        return true
    }
    
}
