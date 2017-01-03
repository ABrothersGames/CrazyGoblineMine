package game.controller.command.common {
    import game.model.proxy.DiamondSellerProxy;
    import game.model.proxy.items.ItemsProxy;
    import game.model.proxy.UserBalanceProxy;
    import game.units.model.proxy.DefenderUnitsProxy;
    import game.units.model.proxy.EnemyUnitsProxy;
    import game.units.model.proxy.UnitsProxy;

    import org.puremvc.as3.patterns.command.SimpleCommand;

    public class SimpleGameCommand extends SimpleCommand {

        public function get itemsProxy():ItemsProxy {

            return facade.retrieveProxy(ItemsProxy.NAME) as ItemsProxy;
        }

        public function get userBalanceProxy():UserBalanceProxy {

            return facade.retrieveProxy(UserBalanceProxy.NAME) as UserBalanceProxy;
        }

        public function get diamondSellerProxy():DiamondSellerProxy {

            return facade.retrieveProxy(DiamondSellerProxy.NAME) as DiamondSellerProxy;
        }

        public function get defenderUnitsProxy():DefenderUnitsProxy {

            return facade.retrieveProxy(DefenderUnitsProxy.NAME) as DefenderUnitsProxy;
        }

        public function get enemyUnitsProxy():EnemyUnitsProxy {

            return facade.retrieveProxy(EnemyUnitsProxy.NAME) as EnemyUnitsProxy;
        }

    }
}
