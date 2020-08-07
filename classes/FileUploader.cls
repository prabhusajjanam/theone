public class FileUploader
{
    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<Lead> leadstoupload;
   // List<Lead> leadsuploaded;
    /***This function reads the CSV file and inserts records into the Lead object. ***/
    public Pagereference ReadFile()
    {
        try{
                //Convert the uploaded file which is in BLOB format into a string
                nameFile =blobToString( contentFile,'ISO-8859-1');
               
                //Now sepatate every row of the excel file
                filelines = nameFile.split('\n');
               
                //Iterate through every line and create a Account record for each row
                leadstoupload= new List<lead>();
                for (Integer i=1;i<filelines.size();i++)
                {
                    String[] inputvalues = new String[]{};
                    inputvalues = filelines[i].split(',');
                   
                    lead l = new lead();
                    l.FirstName = inputvalues[0];
                    l.LastName= inputvalues[1];      
                    l.LeadSource= inputvalues[2];
                    l.Company= inputvalues[3];
                    l.Email = inputvalues[4];
                    l.phone = inputvalues[5];
                    l.Website = inputvalues[6];
                    l.Status = 'Open - Not Contacted';
                    leadstoupload.add(l);
                }
         }
         catch(Exception e){
                 ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured reading the CSV file'+e.getMessage());
                ApexPages.addMessage(errormsg);
         }      
        //Finally, insert the collected records
        try{
            Database.SaveResult[] srList = database.insert(leadstoupload,false);
           
           for (Database.SaveResult sr : srList) {
               if (!sr.isSuccess()) {
              
                   for(Database.Error err : sr.getErrors()) {
                   }

               }

           }

           
           
           
        }
        catch (Exception e)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured inserting the records'+e.getMessage());
            ApexPages.addMessage(errormsg);
        }   
        return null;
    }
  
   /**** This function sends back to the visualforce page the list of lead records that were inserted ****/
    public List<lead> getuploadedLeads()
    {
        list<lead> leadscreated;
        if(leadstoupload!=null){
             leadscreated= new list<lead>();
            for(lead l : leadstoupload){
                if(l.id!=null){
                    leadscreated.add(l);
                }
            }
        }
        return leadscreated;
     
           
    } 
     public List<lead> getNotuploadedLeads()
    {
        list<lead> leadsNotcreated;
        if(leadstoupload!=null){
             leadsNotcreated= new list<lead>();
            for(lead l : leadstoupload){
                if(l.id==null){
                    leadsNotcreated.add(l);
                }
            }
        }
        return leadsNotcreated;
     
           
    } 
        /**
         This function convers the input CSV file in BLOB format into a string
        @param input    Blob data representing correct string in @inCharset encoding
        @param inCharset    encoding of the Blob data (for example 'ISO 8859-1')
     */
    public static String blobToString(Blob input, String inCharset){
        String hex = EncodingUtil.convertToHex(input);
        System.assertEquals(0, hex.length() & 1);
        final Integer bytesCount = hex.length() >> 1;
        String[] bytes = new String[bytesCount];
        for(Integer i = 0; i < bytesCount; ++i)
            bytes[i] =  hex.mid(i << 1, 2);
        return EncodingUtil.urlDecode('%' + String.join(bytes, '%'), inCharset);
    }        
}