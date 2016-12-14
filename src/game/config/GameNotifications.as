package game.config {
    public class GameNotifications {

        //command
        public static const PREPARE_NEW_GAME_PARAMS:String = "prepare_new_game_params";
        public static const START_GAME:String = "start_game";
        public static const UPDATE_USER_BALANCE:String = "update_user_balance";
        public static const DIAMOND_BOUGHT:String = "diamond_bought";

        //game notification
        public static const USER_BALANCE_UPDATED:String = "user_balance_updated";
        public static const AUTO_UPDATE_USER_BALANCE:String = "auto_update_user_balance";

        //items state notification
        public static const ITEM_TO_ENABLE_STATE:String = "item_to_enable_state";
        public static const ITEM_TO_DISABLE_STATE:String = "item_to_disable_state";
        public static const ITEM_TO_UNLOCK_STATE:String = "item_to_unlock_state";
        public static const ITEM_TO_LOCK_STATE:String = "item_to_lock_state";

        //diamond seller
        public static const ENABLE_DIAMOND_SELLER:String = "enable_diamond_seller";
        public static const DISABLE_DIAMOND_SELLER:String = "disable_diamond_seller";

        //items notification
        public static const ITEM_CLICKED:String = "item_clicked";

        //refresh time notification
        public static const REFRESH_ITEM_START:String = "refresh_item_start";
        public static const REFRESH_ITEM_FINISHED:String = "refresh_item_finished";

        //update manager menu
        public static const OPEN_UPDATE_MANAGER_MENU:String = "open_update_manager_menu";

    }
}
