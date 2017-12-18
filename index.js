import React, { Component } from 'react';
import {
    NativeModules,
    NativeAppEventEmitter
} from 'react-native';
var AVAudioPlayerManager = NativeModules.AVAudioPlayerManager;
export default class AVPlayManager extends Component{
    static play(){
        AVAudioPlayerManager.playAudio();
    }
    render(){
        return(<AVPlayManager/>);
    }
}