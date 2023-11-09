using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

public class Jogo
{
    public int Codigo { get; set; }
    public string Nome { get; set; }
    public string Sinopse { get; set; }
    public DateTime DataLancamento { get; set; }
    public Desenvolvedor desenvolvedor { get; set; }

    public void BuscarDados(int codigo)
    {
        Banco banco = new Banco();
        Desenvolvedor desenvolvedor = new Desenvolvedor();
        string comando = $"Select nm_jogo from jogo where cd_jogo = {codigo}";
        MySqlDataReader dados = banco.Consultar(comando);
        if (dados.Read())
        {
            this.Codigo = codigo;
            this.Nome = dados.GetString("nm_jogo");
        }
        if(dados != null)
            if (dados.IsClosed) 
                dados.Close();
        banco.Desconectar();                
    }
}