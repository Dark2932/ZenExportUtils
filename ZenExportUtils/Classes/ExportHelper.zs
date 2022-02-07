/*
    Author: Dark2932
    Flie: ExportHelper.zs
*/

#priority 999999
#loader crafttweaker reloadableevents

zenClass ExportHelper {

    zenConstructor(arg as string) {
        this.id = arg;
    }

    val id as string;
    val ID as string = "[ZenExportUtils]";

    function printer(msg as string) {
        Logger.info(ID ~ msg);
    }

}

global ExportHelper as ExportHelper = ExportHelper("Instanced");