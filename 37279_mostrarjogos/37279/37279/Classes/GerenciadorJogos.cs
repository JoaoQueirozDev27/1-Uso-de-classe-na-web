using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

public class GerenciadorJogos
{
    
    Banco banco = new Banco();
    public List<Jogo> Listar()
    {
        List<Jogo> Jogos = new List<Jogo>();
        string comando = "Select cd_jogo,nm_jogo,ds_sinopse_jogo,aa_lancamento_jogo,cd_desenvolvedor from jogo order by nm_jogo";
        MySqlDataReader dados = banco.Consultar(comando);
        while (dados.Read())
        {
            Jogo jogo = new Jogo();
            Desenvolvedor desenvolvedor = new Desenvolvedor();
            jogo.Codigo = dados.GetInt32("cd_jogo");
            jogo.Nome = dados.GetString("nm_jogo");
            jogo.Sinopse = dados.GetString("ds_sinopse_jogo");
            int codigo_desenvolvedor = dados.GetInt32("cd_desenvolvedor");
            desenvolvedor.BuscarDados(codigo_desenvolvedor);
            jogo.Desenvolvedor = desenvolvedor;
            Jogos.Add(jogo);
        }

        if(dados != null)
            if(dados.IsClosed)
                dados.Close();
        banco.Desconectar(); 
        return Jogos; 
    }
}
