package game.model.proxy {

   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.FileReference;
   import flash.utils.ByteArray;

   import game.config.GameNotifications;

   import org.puremvc.as3.patterns.proxy.Proxy;

   public class DataFileProxy extends org.puremvc.as3.patterns.proxy.Proxy{

      public static const NAME:String = 'DataFileProxy';
      private var fileReference:FileReference;
      private var fileDirectory:File;
      private var objInDirectory:Array;
      private var dataFromFile:Array;
      private var fileName:String = "save";

      public function DataFileProxy() {
         super(NAME);
         checkFileDirectory();
      }

      private function checkFileDirectory():void{
         fileDirectory = File.applicationStorageDirectory;
         var allFilesInDir:Array = fileDirectory.getDirectoryListing();

         if(allFilesInDir.length == 0){
            return;
         }

         objInDirectory = [];

         for(var i:int=0; i<allFilesInDir.length; i++){
            var urlString:String = allFilesInDir[i].url;
            var savingName:String = urlString.substring(urlString.lastIndexOf('/') + 1, urlString.length);
            objInDirectory.push(savingName);
         }

         getDataFromFile();
      }

      public function saveGameDataToFile(data:Object,saveSlot:int=0,saveName:String = null):void{

         var fileDirectory = fileDirectory.resolvePath(fileName);

         if(!dataFromFile){
            dataFromFile = [];
         }

         var dataString:String;
         dataString = "id:" + saveSlot + 'name:' + saveName;

         for(var param:* in data){
            dataString += ('{'+String(param) + ':' + data[param] + '}');
         }

         dataFromFile[saveSlot] = dataString;

         var stream:FileStream = new FileStream();
         stream.open(fileDirectory, FileMode.WRITE);
         stream.writeUTFBytes(concatDataString);
         stream.close();

         stream.addEventListener(Event.COMPLETE, onSaveComplete);
         stream.addEventListener(ProgressEvent.PROGRESS, onSaveProgress);
         stream.addEventListener(Event.CLOSE, onSaveCancel);
      }

      public function onSaveProgress(event:ProgressEvent):void
      {
         trace("Saved " + event.bytesLoaded + " of " + event.bytesTotal + " bytes.");
      }

      public function onSaveComplete(event:Event):void
      {
         trace("File saved.");
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

         if(dataFromFile && dataFromFile[slotID]) {
            var loadingSlot:String = dataFromFile[slotID];
            var paramsArray:Array = loadingSlot.split(/{/);
            var loadingSlotObject:Object = {}
            for (var i:int = 1; i < paramsArray.length; i++) {
               var param:String = paramsArray[i].toString();
               loadingSlotObject[param.slice(0, param.indexOf(':'))] = param.substring(param.indexOf(":") + 1, param.indexOf("}"));
            }
            sendNotification(GameNotifications.PREPARE_NEW_GAME_PARAMS, loadingSlotObject)
         }
      }

      public function onReadComplete(event:Event):void
      {
         trace("File load!");
         fileReference.removeEventListener(Event.COMPLETE, onReadComplete);
         fileReference.removeEventListener(ProgressEvent.PROGRESS, onProgress);
         fileReference.removeEventListener(Event.CLOSE, onCancel);

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
         return dataFromFile as Array;
      }

      private function getDataFromFile():void{

         fileDirectory = fileDirectory.resolvePath(fileName);

         var stream:FileStream = new FileStream();
         stream.open(fileDirectory, FileMode.READ);

         var dataString:String = stream.readUTFBytes(stream.bytesAvailable);
         dataFromFile = dataString.split(/id\:/);

         stream.close();
      }

      public function get concatDataString():String{

          var string:String;

         for(var i:int = 1; i < dataFromFile.length; i++){
            string += dataFromFile[i];
         }
         return string;
      }
   }
}


