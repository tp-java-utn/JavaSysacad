import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;
import Data.DataComision;
import Data.DataEstadoAcademico;
import Data.DataInscripcion;
import Data.DataMateria;
import Entidades.Alumno;
import Entidades.Comision;
import Entidades.Comision.turnos;
import Helpers.Formatter;
import Entidades.EstadoAcademico;
import Entidades.Materia;


public class tests {


	

	public static void main(String[] args) {
		
		
//		Alumno A = new Alumno();
//		A.setLegajo("43904");
//		DataEstadoAcademico DEA = new DataEstadoAcademico();
//    	ArrayList<EstadoAcademico> EstadosAcademicos = A.getEstadosAcedemicos(DEA.getAll());
//    	DataMateria DM = new DataMateria();
//    	ArrayList<Materia> Materias = DM.getAll();
//    	DataComision DC = new DataComision();
//    	ArrayList<Comision> Comisiones = DC.getAll();
//    	
//    	for(Materia M:Materias)
//    	{
//	    	for(Comision CS:Comisiones)
//	    	{
//	    		if(CS.getIdMateria()==M.getIdMateria())
//	    		{
//	    			
//	    		}
//	    	}
//    	}
    	
    	
//    	for(int i=1;i<3;i++)
//    	{
//    		int maxAlumnos = getRandomNumberInRange(25,35);
//    		int docente = getRandomNumberInRange(1,4);
//    		int Materia = getRandomNumberInRange(1,7);
//        	DC.addComision(106, Materia, docente, 0, maxAlumnos, turnos.Noche);
//    	}

//    	for(int i=1;i<35;i++)
//    	{
//        	DC.delete(101,i);
//    	}
//    	if(A.getLegajo()==null) {System.out.println("asd");}

		Formatter F = new Formatter();
		System.out.println(F.upFirstWord("federico ruiz"));
		System.out.println(F.upAllWords("federico ruiz"));
		System.out.println(F.downAllWords("federico ruiz"));
		System.out.println(F.downAllWords("FEDERICO RUIZ"));
		System.out.println(F.downAllWords("fedASDASico rRUIS"));
	}





}
