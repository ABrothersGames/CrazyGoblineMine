/**
 * Created by SalamandeR on 02.02.2017.
 */
package utils {
import flash.events.EventDispatcher;
import flash.events.TimerEvent;
import flash.utils.Timer;

import game.config.GameEvents;

public class GameTimer extends Timer{
        private var _endTime:Number;
        private var _time:Number;
        private var timer:Timer;
        private var _delay:Number = 1000;
        private var _repeat:Number = 0;
        private var currentTime:Number;
        public function GameTimer(time:Number, settings:Object = null) {
            _time = _repeat = time;
            initTimer();
            super(_delay,_repeat);
        }
        private function initTimer():void{
            //_repeat = _time;
            /*timer = new Timer(_delay,_repeat);
            timer.addEventListener(TimerEvent.TIMER, timerHandler);
            timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);*/
            addEventListener(TimerEvent.TIMER, timerHandler);
            addEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
        }
        private function timerHandler(e:TimerEvent):void{
            _time--;
            var timeText:String = getConvertedTime(_time);
            dispatchEvent(new EventWithData(GameEvents.TIMER_TICK,{time:timeText}))
        }
        private function getConvertedTime(timeLeft:Number):String{
            var minutes:String = String(Math.floor(timeLeft/60));
            if(minutes.length<2) minutes = '0'+ minutes;
            var seconds:String = String(timeLeft%60);
            if(seconds.length<2) seconds = '0'+ seconds;
            return minutes+":"+seconds;
        }
        private function timerCompleteHandler(e:TimerEvent):void {
            stopTimer();
            /*timer.removeEventListener(TimerEvent.TIMER, timerHandler);
            timer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);*/
            dispatchEvent(new EventWithData(GameEvents.TIMER_COMPLETE));
            removeEventListener(TimerEvent.TIMER, timerHandler);
            removeEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
        }
        public function startTimer():void{
            start();
        }
        public function stopTimer():void{
            stop();
        }
    }
}
