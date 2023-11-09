using MySql.Data.MySqlClient;
using System;



public static class DadosConexao {

	private static string _linhaConexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=Rede_Social_jogos_37279";

	public static string GetConexao()
	{
		return _linhaConexao;
	}
}


public class Banco
{
	MySqlConnection conexao = null;

    private string _linhaConexao;

	public string LinhaConexao
	{
		get {
			if (_linhaConexao == null)
			{
				throw new Exception("Linha de conexão não foi definida");
			}
			return _linhaConexao; 
		}
		set {
			if (String.IsNullOrEmpty(value))
			{
				throw new Exception("Linha de conexão inválida");
			}
			_linhaConexao = value; 
		}
	}

	public Banco()
	{ 
		LinhaConexao = DadosConexao.GetConexao();
	}

	//public Banco(string servidor, string usuario, string senha, string database)
	//{
	//	LinhaConexao = $"SERVER={servidor};UID={usuario};PASSWORD={senha};DATABASE={database}";
 //   }


	private void Conectar()
	{
		try
		{
			conexao = new MySqlConnection(LinhaConexao);
			conexao.Open();
		}
		catch
		{
			throw new Exception("Não foi possível conectar ao Servidor.");
		}
	}

	public void Desconectar()
	{
		try
		{
			if (conexao != null)
			{ 
				if (conexao.State == System.Data.ConnectionState.Open)
				{
					conexao.Close();
				}
			}
		}
		catch
		{
			throw new Exception("Não foi possível fechar a conexão com o Servidor");
		}
	}

	public void Executar(string comando)
	{
		Conectar();
		try
		{
			MySqlCommand cSQL = new MySqlCommand(comando, conexao);
			cSQL.ExecuteNonQuery();
		}
		catch
		{
			throw new Exception("Não foi possível executar o comando. Verifique e tente novamente.");
		}
		Desconectar();
	}

	public MySqlDataReader Consultar(string comando)
	{
		Conectar();
		try
		{
			MySqlCommand cSQL = new MySqlCommand(comando, conexao);
			return cSQL.ExecuteReader();
		}
		catch
		{
			throw new Exception("Não foi possível realizar a consulta"); 
		}
	}

}
