//
//  audio.swift
//  Komodo
//
//  Created by Vishal Puppala on 11/16/22.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation
import CoreData

class AudioRecorder: ObservableObject {
    var recorder=AVAudioRecorder()
    let session_var = AVAudioSession.sharedInstance()

    func record(){
        let settings1 = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        var url_var=getAudioPath()
        print(url_var)
        
        do{
            recorder=try AVAudioRecorder(url: url_var, settings: settings1)
            try session_var.setCategory(.record, mode:.default)
            try session_var.setActive(true)
            
            try recorder.record()
                    }
        catch{print("error is\(error).")};
        
    }
    func stopRecording(){
        do{
            try recorder.stop()
            try session_var.setActive(false)
        }
        catch{print("error is\(error).")}
        getAudioPath()
        //let path=FileManager.default.urls(for: .documentDirectory, in:.userDomainMask)
        //home directory + /Documents/
        //var x=path[0].appendingPathComponent("recording")
        //var z=try? String(contentsOf: x)
    }
    
        func getAudioPath() -> URL {
            let path=FileManager.default.urls(for: .documentDirectory, in:.userDomainMask)
            print(path)
            //home directory + /Documents/
            var x=path[0].appendingPathComponent("recording.m4a")
            var z=try? Data(contentsOf: x)
            if z != nil{
                print(z!)
            }

            return x //path[0] in case there are multiple urls---we just want the first one
        }

    }


