package {

    import core.AppFacade;
    import core.configs.DeviceConfiguration;
    import core.controller.command.StartUpCommand;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageAspectRatio;
    import flash.display.StageScaleMode;
    import flash.events.Event;

    public class MineCrazyGoblinAndroid extends Sprite {

        [SWF(width="1280", height="720", frameRate="25", backgroundColor="#FFFFFF")]
        public function MineCrazyGoblinAndroid() {

            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void {

            this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            stage.setAspectRatio(StageAspectRatio.LANDSCAPE);

            //�������, ������� ��� ����� � ����������� �� ��������� �������� �������� ��������, �� ���� ���
            DeviceConfiguration.width = stage.stageHeight;
            DeviceConfiguration.height = stage.stageWidth;


            AppFacade.getInstance().startup(StartUpCommand, this);
        }
    }
}
