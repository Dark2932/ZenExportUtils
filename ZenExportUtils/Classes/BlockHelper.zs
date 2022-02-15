/*
    Author: Dark2932
    Flie: BlockHelper.zs
*/

#priority 1000000
#loader crafttweaker reloadableevents
import crafttweaker.block.IBlock;

zenClass BlockHelper {

    zenConstructor(arg as string) {
        this.id = arg;
    }

    val id as string;

    function getBlockID(block as IBlock, isDetailed as bool) as string {
        val id = block.definition.id;
        val meta = block.meta;            
        return isDetailed ? (id ~ ":" ~ meta) : id;
    }

}

global BlockHelper as BlockHelper = BlockHelper("Instanced");