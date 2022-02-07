/*
    Author: Dark2932
    Flie: Chest.zs
*/

#priority 988888
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.container.IContainer;
import crafttweaker.event.PlayerOpenContainerEvent;
import crafttweaker.event.PlayerCloseContainerEvent;
import crafttweaker.event.PlayerInteractBlockEvent;

function getItemID(item as IItemStack) as string {
    return ItemHelper.getItemID(item);
}

function isCreative(player as IPlayer) as bool {
    return PlayerHelper.isCreative(player);
}

function isDye(player as IPlayer) as bool {
    return ItemHelper.matchCurrent(player);
}

function isChest(container as IContainer) as bool {
    return EventHelper.getContainerCondition(container, "chest");
}

function ignore(player as IPlayer) as bool {
    return EventHelper.ignoreServer(player);
}

events.onPlayerOpenContainer(function(event as PlayerOpenContainerEvent) {
    val player = event.player;
    if (!ignore(player) && isCreative(player)) {
        val container = event.container;
        if (isChest(container) && isDye(player)) {
            player.sendMessage("§6§l====================");
            player.sendMessage("§c§l进入编辑模式!");
        }
    }
});

events.onPlayerCloseContainer(function(event as PlayerCloseContainerEvent) {
    val player = event.player;
    if (!ignore(player) && isCreative(player)) {
        val container = event.container;
        if (isChest(container) && isDye(player)) {
            /*
            val i1 = container.getStack(12);
            if (!isNull(i1)) {
                player.sendMessage("§b§l输出物品#1: §e" + getItemID(i1));
            } else {
                player.sendMessage("§b§l输出物品#1: §enull");
            }

            val i2 = container.getStack(16);
            if (!isNull(i2)) {
                player.sendMessage("§b§l输出物品#2: §e" + getItemID(i2));
            } else {
                player.sendMessage("§b§l输出物品#2: §enull");
            }
            */
            if (!isNull(container.getStack(26))) {
                player.sendMessage("§l是否导出: §e是");
                player.sendMessage("§a§l请拿着墨囊 §dShift+右键 §a§l箱子以导出配方!");

            } else {
                player.sendMessage("§l是否导出: §e否");
            }

        }
    }
});

val input as int[][int] = {
    1 : [0, 1, 2, 9, 10, 11, 18, 19, 20],
    2 : [4, 5, 6, 13, 14, 15, 22, 23, 24]
};

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    val player = event.player;
    val block = event.block;
    val data = block.data;
    val item = event.item;

    if (!ignore(player) && isCreative(player) && <minecraft:dye:0>.matches(item) && player.isSneaking && block.definition.id == "minecraft:chest" && data has "Items") {

        val Items = data.memberGet("Items").asList();
        if (!isNull(Items)) {

            for items in Items {

                val slot = items.Slot.asByte();
                for key in input {

                    for k in input[key] {

                        if ((slot == k)) {

                            ExportHelper.printer(items.id);
                            player.sendMessage("§a§l导出成功! 请在 §e'crafttweaker.log' §a§l最底部查看代码!");

                        }

                    }

                }

            }

        }

    }

});