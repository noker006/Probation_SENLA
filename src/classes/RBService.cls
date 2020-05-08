public class RBService  {
    public static void getRateByCodeAndDate(String code,Date dateCurs){
        HttpRequest request =new HttpRequest();
        request.setBody('http://www.nbrb.by/API/ExRates/Rates/'+code+'?ParamMode=2?onDate='+dateCurs);
        request.setMethod('GET');
        request.setTimeout(60000);
        HttpResponse response= new Http().send(request);
        Rate rate= (Rate)JSON.deserialize(response.getBody(), Rate.class);
		System.debug(response.getBody());
    } 
    
    public  class Rate{
        //	public int Cur_ID; 
        //public string Date;
        public string Cur_Scale;
        public string Cur_Abbreviation; 
        public string Cur_Name; 
        public double Cur_OfficialRate;
    }
    
    public static void getWeatherForecast(decimal latYandex,decimal lonYandex){
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://api.weather.yandex.ru/v1/forecast?lat='+latYandex+'&lon='+lonYandex+'&[lang=be_BY]&limit=1&hours=false&extra=false&X-Yandex-API-Key=67cba0fe-e15c-4ee3-9298-dab22cfbad9d');
        request.setMethod('GET');
        //request.setHeader('X-Yandex-API-Key:', '67cba0fe-e15c-4ee3-9298-dab22cfbad9d');
        //request.setHeader('Content-Type', 'application/json');
		HttpResponse response= new Http().send(request);
        Fact YandexFact=(Fact)JSON.deserialize(response.getBody(), Fact.class);
        System.debug(YandexFact);
    }
    
    public  class Fact{
    public decimal temp;
    public integer feels_like;
    public string icon;
    public string condition;
    public double wind_speed;
    public double wind_gust;
    public string wind_dir;
    public double pressure_mm;
    public double pressure_pa;
    public double humidity;
    public string daytime;
    public boolean polar;
    public string season;
    public double prec_type;
    public double prec_strength;
    public double cloudness;
    public double obs_time;
    }
    


}