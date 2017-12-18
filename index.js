import React, { Component } from 'react';
import {
    NativeModules,
    NativeAppEventEmitter
} from 'react-native';
var AVPlayer = NativeModules.AVPlayer;
export default class AVPlayManager extends Component{
    static play(){
        AVPlayer.playAudio();
    }
    render(){
        return(<AVPlayManager/>);
    }
}