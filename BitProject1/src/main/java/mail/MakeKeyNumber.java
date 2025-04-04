package mail;

public class MakeKeyNumber {
	public int MakeKeyNumber(){
		int key = (int) Math.floor(Math.random()*10000);
		return key;
	}

}
