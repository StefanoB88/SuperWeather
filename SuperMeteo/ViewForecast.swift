//
//  ViewForecast.swift
//  SuperMeteo
//
//  Created by Stefano Brandi on 27/07/21.
//

import UIKit

class ViewForecast: UIViewController {
    
    @IBOutlet var img1: UIImageView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var lblTempo: UILabel!
    @IBOutlet weak var lblTemperatura: UILabel!
    @IBOutlet weak var tabBarButton2: UITabBarItem!
    
    var flagFirst = false
    
    @IBAction func segmentedControl(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex {
        
        case 0:
            self.flagFirst = true
            self.indicator.isHidden = false
            callSegmented()
            
        case 1:
            self.flagFirst = true
            self.indicator.isHidden = false
            callSegmented()
            
        case 2:
            self.flagFirst = true
            self.indicator.isHidden = false
            callSegmented()
            
        case 3:
            self.flagFirst = true
            self.indicator.isHidden = false
            callSegmented()
            
        case 4:
            self.flagFirst = true
            self.indicator.isHidden = false
            callSegmented()
            
        case 5:
            self.flagFirst = true
            self.indicator.isHidden = false
            callSegmented()
            
        case 6:
            self.flagFirst = true
            self.indicator.isHidden = false
            callSegmented()
            
        default:
            break
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.flagFirst = false
    }
    
    func convertToCelsius(fahrenheit: Int) -> Int {
        return Int(5.0 / 9.0 * (Double(fahrenheit) - 32.0))
    }
    
    func callSegmented() {
        
        Datamanager.shared.callMeteo(view: self, citta: "Acerra", completion: { _ in
            
            let meteo = Datamanager.shared.getMeteo
            
            
            DispatchQueue.main.sync {
                
                if meteo.location?.city != nil {
                    
                    switch meteo.forecasts![self.segmentedControl.selectedSegmentIndex].text {
                    
                    case "Scattered Showers":
                        self.img1.image = #imageLiteral(resourceName: "pioggia")
                        
                    case "Mostly Cloudy":
                        self.img1.image = #imageLiteral(resourceName: "nuvoloso")
                        
                    case "Partly Cloudy":
                        self.img1.image = #imageLiteral(resourceName: "nuvoloso")
                        
                    case "Sunny":
                        self.img1.image = #imageLiteral(resourceName: "soleggiato")
                        
                    case "Thunderstorms":
                        self.img1.image = #imageLiteral(resourceName: "temporale")
                        
                    case "Clear":
                        self.img1.image = #imageLiteral(resourceName: "soleggiato")
                        
                    case "Scattered Thunderstorms":
                        self.img1.image = #imageLiteral(resourceName: "temporale")
                        
                    case "Rain":
                        self.img1.image = #imageLiteral(resourceName: "pioggia")
                        
                    default:
                        break
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    if self.flagFirst == false {
                        
                        switch meteo.forecasts![0].day {
                        
                        case "Mon":
                            self.segmentedControl.selectedSegmentIndex = 0
                            
                        case "Tue":
                            self.segmentedControl.selectedSegmentIndex = 1
                            
                        case "Wed":
                            self.segmentedControl.selectedSegmentIndex = 2
                            
                        case "Thu":
                            self.segmentedControl.selectedSegmentIndex = 3
                            
                        case "Fri":
                            self.segmentedControl.selectedSegmentIndex = 4
                            
                        case "Sat":
                            self.segmentedControl.selectedSegmentIndex = 5
                            
                        case "Sun":
                            self.segmentedControl.selectedSegmentIndex = 6
                            
                        default:
                            break
                        }
                    }
                    
                    self.indicator.isHidden = true
                    
                    self.lblTempo.text = meteo.forecasts![self.segmentedControl.selectedSegmentIndex].text
                    
                    // fahrenheit to celsius convert
                    let temp = self.convertToCelsius(fahrenheit: (meteo.forecasts![self.segmentedControl.selectedSegmentIndex].low!))
                    let temp2 = self.convertToCelsius(fahrenheit: (meteo.forecasts![self.segmentedControl.selectedSegmentIndex].high!))
                    
                    self.lblTemperatura.text = "Max: " + "\(temp2)" + "°" + " / " + "Min: " + "\(temp)" + "°"
                    
                    
                } else {
                    print("Errore")
                }
                
            }
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = false
        
        callSegmented()
        
        
    }
    
    
}
