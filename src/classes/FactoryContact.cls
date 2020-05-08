public class FactoryContact  {
	public static Contact getContactByName(string nameCont){
		return new Contact( LastName = nameCont );
	}
}