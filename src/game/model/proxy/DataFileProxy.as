package game.model.proxy {

import core.configs.GeneralNotifCommandConfig;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.net.FileFilter;
import flash.net.FileReference;
import flash.utils.ByteArray;

import game.config.GameNotifications;

import org.puremvc.as3.patterns.proxy.Proxy;

    public class DataFileProxy extends org.puremvc.as3.patterns.proxy.Proxy{

        public static const NAME:String = 'DataFileProxy';
        private var fileReference:FileReference;
        private var fileDirectory:File;
        private var objInDirectory:Array;
        private var fileName:String = "save";

        public function DataFileProxy() {
            super(NAME);
            checkFileDirectory();

        }
        private function checkFileDirectory():void{
            fileDirectory = File.applicationStorageDirectory;
            var allFilesInDir:Array = fileDirectory.getDirectoryListing();
            if(allFilesInDir.length > 0){
                objInDirectory = [];
            }
            for(var i:int=0; i<allFilesInDir.length; i++){
                var urlString:String = allFilesInDir[i].url;
                var savingName:String = urlString.substring(urlString.lastIndexOf('/') + 1, urlString.length);
                objInDirectory.push(savingName);
            }
        }
        public function saveGameDataToFile(data:Object,saveSlot:int=0,saveName:String = null):void{
            /*fileReference = new FileReference();
            fileReference.addEventListener(Event.SELECT, onSaveFileSelected);
            fileReference.addEventListener(Event.CANCEL, onSaveCancel);
            fileReference.addEventListener(IOErrorEvent.IO_ERROR, onIOError);*/

            var textFormat:String = saveSlot + '_' + saveName;
            for(var param:* in data){
                textFormat += '{'+String(param) + ':' + data[param] + '/}';
            }
            var byteArray:ByteArray = new ByteArray();
           // byteArray.writeUTFBytes(textFormat);


            fileDirectory = fileDirectory.resolvePath(fileName);
            var stream:FileStream = new FileStream();
            stream.open(fileDirectory, FileMode.WRITE);
            stream.writeUTFBytes(textFormat);
            stream.close();

            stream.addEventListener(Event.COMPLETE, onSaveComplete);
            stream.addEventListener(ProgressEvent.PROGRESS, onSaveProgress);
            stream.addEventListener(Event.CLOSE, onSaveCancel);
            //fileReference.save(byteArray,'FileName');
        }

        public function onSaveFileSelected(event:Event):void
        {
            /*fileReference.addEventListener(ProgressEvent.PROGRESS, onSaveProgress);
            fileReference.addEventListener(Event.COMPLETE, onSaveComplete);
            fileReference.addEventListener(Event.CANCEL, onSaveCancel);*/
        }

        public function onSaveProgress(event:ProgressEvent):void
        {
            trace("Saved " + event.bytesLoaded + " of " + event.bytesTotal + " bytes.");
        }

        public function onSaveComplete(event:Event):void
        {
            trace("File saved.");
            /*fileReference.removeEventListener(Event.SELECT, onSaveFileSelected);
            fileReference.removeEventListener(ProgressEvent.PROGRESS, onSaveProgress);
            fileReference.removeEventListener(Event.COMPLETE, onSaveComplete);
            fileReference.removeEventListener(Event.CANCEL, onSaveCancel);*/
            (event.target as FileStream).removeEventListener(Event.COMPLETE, onSaveComplete);
            (event.target as FileStream).removeEventListener(ProgressEvent.PROGRESS, onSaveProgress);
            (event.target as FileStream).removeEventListener(Event.CLOSE, onSaveCancel);
            sendNotification(GameNotifications.SUCCESSFUL_SAVE);
        }

        public function onSaveCancel(event:Event):void
        {
            trace("Canceled saving process!");
        }

        public function onIOError(event:IOErrorEvent):void
        {
            trace("IO Error!");
        }

        public function loadGameDataFromFile(slotID:int,slotName:String):void{


            /*fileReference = new FileReference();
            fileReference.addEventListener(Event.SELECT, onFileSelected);
            fileReference.addEventListener(Event.CANCEL, onCancel);
            fileReference.addEventListener(Event.COMPLETE, onComplete);

            var browsBinaryFilter:FileFilter = new FileFilter('Binary File', "*");
            var browsJSONFilter:FileFilter = new FileFilter('JSON File', "*.json");
            var browsXMLFilter:FileFilter = new FileFilter('XML File', "*.xml");
            fileReference.browse([browsBinaryFilter, browsJSONFilter, browsXMLFilter]);*/

        }
        public function onComplete(event:Event):void
        {
            trace("File load!");
            fileReference.removeEventListener(Event.SELECT, onFileSelected);
            fileReference.removeEventListener(ProgressEvent.PROGRESS, onProgress);
            fileReference.removeEventListener(Event.COMPLETE, onComplete);
            fileReference.removeEventListener(Event.CANCEL, onCancel);

            var textFormat:String ='';
            var byteArray:ByteArray = event.target.data as ByteArray;
            textFormat = byteArray.readUTFBytes(byteArray.length)
            var h:* = new Sprite();
        }
        public function onProgress(event:ProgressEvent):void
        {
            trace("Loaded " + event.bytesLoaded + " of " + event.bytesTotal + " bytes.");
        }
        public function onFileSelected(event:Event):void
        {
            fileReference.addEventListener(ProgressEvent.PROGRESS, onProgress);
            fileReference.load();
        }
        public function onCancel(event:Event):void
        {
            trace("Cancel save or load file!");
        }
        public function get filesNames():Array{
            return objInDirectory as Array;
        }
    }
}
