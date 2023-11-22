using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Usuario
{
    public string Email { get; set; }
    public string Nome { get; set; }
    public string Apelido { get; set; }
    public string Descricao { get; set; }
    public string Senha { get; set; }
    public double Avaliacao { get; set; }


    public void BuscarDados(string email)
    {
        Banco banco = new Banco();
        string comando = $@"Select * from usuario 
                            where nm_email = {email}";
        MySqlDataReader dados = banco.Consultar(comando);
        if (dados.Read())
        {
            this.Apelido = dados.GetString("nm_apelido");
            this.Descricao = dados.GetString("ds_usuario");
        }
        if (dados != null)
            if (!dados.IsClosed)
                dados.Close();
        banco.Desconectar();
    }
}