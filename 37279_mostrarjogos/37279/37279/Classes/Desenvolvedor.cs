using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Desenvolvedor
{
    public int Codigo { get; set; }
    public string Nome { get; set; }

    public void BuscarDados(int codigo)
    {
        Banco banco = new Banco();
        string comando = $@"Select nm_desenvolvedor from desenvolvedor 
                                where cd_desenvolvedor = {codigo}";
        MySqlDataReader dados = banco.Consultar(comando);
        if (dados.Read())
        {
            this.Codigo = codigo;
            this.Nome = dados.GetString(0);
        }
        if (dados != null)
            if (!dados.IsClosed)
                dados.Close();
        banco.Desconectar();
    }

}