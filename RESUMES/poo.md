####Encapsulamento

Exemplo bom:

~~~java
public class Funcionario {
private String nome;
private String cpf;

private double salario;
public void reajustarSalario(double aumento) {
       double percentualReajuste = (aumento /  salario) * 100;
       if(percentualReajuste >40) {
	throw new IllegalArgumentException("O salario nao pode ter um reajuste maior que 40%")
   }
  }
}
~~~


 - Encapsulando o atributo da classe funcionária, o salário está protegido. 



Exemplo ruim:
~~~java
public class Funcionario {
private String nome; 
private String cpf;
private double salario;

public void setSalario (double salario) {
   		   this.salario = salario;
     }
  }
~~~



 - Sem regra ou validaçao, o salario apesar de privado pode ser mexido a partir do método set. 




####Acoplamento
Uma classe não pode ter uma dependência muito forte de outra 

Exemplo bom:
~~~java
 Funcionario funcionario = carregaDoBancoDeDados();
 double reajustes = funcionario.getValorTotalRecebidoEmReajustes();
~~~



- Nao sei como foi feito na classe a lógica assim eu apenas chamo o método, caso eu mude a lógica eu a minha classe não vai sofrer 



Exemplo ruim:
~~~java
 Funcionario funcionario = carregaDoBancoDeDados();

double valorTotalReajuste = 0;
List<Reajuste> reajustes = funcionario.getReajustes();
for (Reajuste r : reajustes) {
valorTotalReajustes += r.getValor();
}
~~~



#####O cálculo é feito incrementando um reajuste, assim existe a quebra do encapsulamento, caso precise mudar dentro da classe funcionário isso vai impactar na classe atual. 






####Classes abstratas:
Uma classe serve como um modelo para outras classes que dela herdem, não podendo ser instanciada por si só. Para ter um objeto de uma classe abstrata precisa que se crie uma classe mais especializada herdando dela e então instaurando a partir dessa nova classe.
~~~java
abstract class Conta {
	private double saldo; 
	public void setSaldo(double saldo) { 
		this.saldo = saldo; 	
} 
	public double getSaldo() { 	
	return saldo; 	
} 
	public abstract void imprimeExtrato(); 
}
~~~




#####Aqui, usa-se o @Override, uma annotation que significa que estamos sobrescrevendo o método da superclasse: 

~~~java
public class ContaPoupanca extends Conta { 
@Override 	
public void imprimeExtrato() {
     System.out.println("### Extrato da Conta ###");
     SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/aaaa HH:mm:ss");
     Date date = new Date(); 		
     System.out.println("Saldo: "+this.getSaldo());
     System.out.println("Data: "+sdf.format(date));		        		     
      }
    }
~~~




- Assim, significa que, a classe abstrata "Conta"os métodos que são abstratos tem um comportamento diferente, por isso não possuem um corpo, na subclasse que estão herdando precisam desse método mas não de forma genérica, eles precisam ter algumas particularidades de cada subclasse. 




####Interface:
Interface é um padrão definido através de contratos ou especificações. Um contrato define um conjunto de métodos. A interface é abstrata, ou seja os seus métodos são definidos como abstract e as variáveis são sempre static final.


~~~java
interface Conta{ 
	void depositar(double valor); 
	void sacar(double valor); 
	double getSaldo();
 }
~~~

~~~java
public class ContaCorrente implements Conta { 
	private double saldo; 
	private double taxaOperacao = 0.45;

@Override 	
public void deposita(double valor) { 		this.saldo += valor - taxaOperacao; 	} 	
@Override 	
public double getSaldo() { 	
	return this.saldo; 	
} 
	@Override 
	public void sacar(double valor) { 
		this.saldo -= valor + taxaOperacao; 
	} 
}
~~~