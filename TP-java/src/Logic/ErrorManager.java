package Logic;

public class ErrorManager {

	String error;
	Integer min,max;
	
	public ErrorManager(String error)
	{
		this.error = error;
	}
	
	public ErrorManager(String error,Integer min, Integer max)
	{
		this.error = error;
		this.min = min;
		this.max = max;
	}

	public String error() {
		return error+ " debe poseer entre "+ min+"-"+max+" caracteres.";
	}
	
	public String specificError()
	{
		return error;
	}
}
