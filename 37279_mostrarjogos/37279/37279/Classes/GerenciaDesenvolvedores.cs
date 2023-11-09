using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class GerenciaDesenvolvedores
{
    List<Desenvolvedor> Lista = null;

    public List<Desenvolvedor> Listar()
    { 
        Lista = new List<Desenvolvedor>();
        Banco banco = new Banco();
        string comando = $@"Select cd_desenvolvedor, nm_desenvolvedor
                            from desenvolvedor order by nm_desenvolvedor";
        MySqlDataReader dados = banco.Consultar(comando);
        while (dados.Read())
        { 
            Desenvolvedor desenvolvedor = new Desenvolvedor();
            desenvolvedor.Codigo = dados.GetInt32("cd_desenvolvedor");
            desenvolvedor.Nome = dados.GetString("nm_desenvolvedor");

            Lista.Add(desenvolvedor);
        }
        if (dados != null)
            if (!dados.IsClosed)
                dados.Close();
        banco.Desconectar();
        return Lista;
    }
    
}
