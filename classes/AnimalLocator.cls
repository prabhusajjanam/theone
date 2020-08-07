public class AnimalLocator{
    /**
    * @description
    * @author Prabhu Sajjanam | 5/1/2019
    * Modified date is : 7/31/2020 - this is the new line as per this deployment
    * @param Integer idAsParam
    * @return String
    */
    public static String getAnimalNameById(Integer idAsParam){
        String retVal = null;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+idAsParam);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<string,object> mapOfAnimals = (map<string,object>) results.get('animal');

            retVal = string.valueof(mapOfAnimals.get('name'));
        }
        
        return retVal;
    }
}