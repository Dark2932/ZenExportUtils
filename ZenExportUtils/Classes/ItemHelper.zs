/*
    Author: Dark2932
    Flie: ItemHelper.zs
*/

#priority 999998
#loader crafttweaker reloadableevents
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

zenClass ItemHelper {

    zenConstructor(arg as string) {
        this.id = arg;
    }

    val id as string;

    function getItemID(item as IItemStack) as string {
        val id = item.definition.id;
        val meta = item.metadata;
        return (meta == 0) ? id : (id ~ ":" ~ meta);
    }

    function matchDye(item as IItemStack) as bool {
        return (this.getItemID(item) == this.getItemID(<minecraft:dye:0>));
    }

    function matchCurrent(player as IPlayer) as bool {
        val item = PlayerHelper.getCurrent(player);
        return (!isNull(item) && this.matchDye(item));
    }

}

global ItemHelper as ItemHelper = ItemHelper("Instanced");