public class FactoryAccount  {
	public static Account getAccountByName(string nameAcc){
		return new Account(Name = nameAcc);
	}
}