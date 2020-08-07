public class deletelink {
    @future
    public static void deleteconentdocumentlink(id cdlEId)
    {
        contentdocumentlink cdl = [select id,linkedentityid,contentdocumentid,sharetype from contentdocumentlink where linkedentityid = :cdlEId];
        system.debug('cdl is '+cdl);
        delete cdl;
    }

}