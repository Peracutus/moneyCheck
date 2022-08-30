//
//  MainDateSorting.swift
//  Money check
//
//  Created by Roman on 01.10.2021.
//

import UIKit
import RealmSwift

//impliment sorting by date in headers

extension MainVC {
    
    func dateForHeaders() {
        
        cellItem = realm.objects(CellItems.self).sorted(byKeyPath: "date")
        
        itemDates = cellItem!.reduce(into: [Date](), { results, currentItem in
            let date = currentItem.date!
            //Only add the date if it doesn't exist in the array yet
            if !results.contains(where: { addedDate->Bool in
                return addedDate >= date.startOfDay && addedDate <= date.endOfDay
            }) {
                results.append(date.startOfDay)
            }
        })
        
        //Filter each Item in realm based on their date property and assign the results to the dictionary
        groupedItems = itemDates.reduce(into: [Date:Results<CellItems>](), { results, date in
            results[date.startOfDay] = realm.objects(CellItems.self).filter("date >= %@ AND date <= %@", date.startOfDay, date.endOfDay)
        })
        tableView.reloadData()
    }
}

