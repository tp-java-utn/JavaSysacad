import java.util.ArrayList;

import Data.DataEstadoAcademico;
import Data.DataMateria;
import Entidades.Alumno;
import Entidades.EstadoAcademico;
import Entidades.Materia;

public class tests {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Alumno A = new Alumno();
		A.setLegajo("43904");
		DataEstadoAcademico DEA = new DataEstadoAcademico();
    	ArrayList<EstadoAcademico> EstadosAcademicos = A.getEstadosAcedemicos(DEA.getAll());
    	DataMateria DM = new DataMateria();
    	ArrayList<Materia> Materias = DM.getAll();
    	for(Materia M:Materias)
    	{
	    	for(EstadoAcademico EAS:EstadosAcademicos)
	    	{
	    		if(EAS.getIdMateria()==M.getIdMateria())
	    			{System.out.println(EAS.getAsistencia());}
	    	}
    	}
    	
    	Alumno A2 = new Alumno();
    	A2.setLegajo("43904");
    	A2.startEstadoAcademico();
	}

}
