package Model;

public class Candidato {
	
	protected String Nome;
	protected String Cpf;
	protected String Sexo;
	protected String Escolaridade;
	
	public Candidato(String nome, String cpf, String sexo, String escolaridade) {
		this.Nome = nome;
		this.Cpf = cpf;
		this.Sexo = sexo;
		this.Escolaridade = escolaridade;
	}
	public Candidato() {
		
	}
	
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		this.Nome = nome;
	}
	public String getCpf() {
		return Cpf;
	}
	public void setCpf(String cpf) {
		this.Cpf = cpf;
	}
	public String getSexo() {
		return Sexo;
	}
	public void setSexo(String sexo) {
		this.Sexo = sexo;
	}
	public String getEscolaridade() {
		return Escolaridade;
	}
	public void setEscolaridade(String escolaridade) {
		this.Escolaridade = escolaridade;
	}
	
	

}
