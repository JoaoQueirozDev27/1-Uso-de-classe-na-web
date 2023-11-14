using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _37279.Classes
{
    public class GerenciadorGeneros
    {
        List<Genero> generos= new List<Genero>();
        public List<Genero> Listar()
        {
            generos= new List<Genero>();
            Banco banco = new Banco();
            string comando = $@"Select cd_genero, nm_genero
                            from genero order by nm_genero";
            MySqlDataReader dados = banco.Consultar(comando);
            while (dados.Read())
            {
                Genero genero = new Genero();
                genero.Codigo = dados.GetInt32("cd_genero");
                genero.Nome = dados.GetString("nm_genero");

                generos.Add(genero);
            }
            if (dados != null)
                if (!dados.IsClosed)
                    dados.Close();
            banco.Desconectar();
            return generos;
        }
        public List<Genero> BuscarGeneros(int codigo) 
        {
            generos = new List<Genero>();
            Banco banco = new Banco();
            string comando = $@"select ge.cd_genero,ge.nm_genero from jogo jo join jogo_genero jg on (jo.cd_jogo = jg.cd_jogo) join genero ge on (jg.cd_genero = ge.cd_genero)where jo.cd_jogo= {codigo};";
            MySqlDataReader dados = banco.Consultar(comando);
            while (dados.Read())
            {
                Genero genero = new Genero();
                genero.Codigo = dados.GetInt32("cd_genero");
                genero.Nome = dados.GetString("nm_genero");
                generos.Add(genero);
            }
            if (dados != null)
                if (!dados.IsClosed)
                    dados.Close();
            banco.Desconectar();
            return generos;
        }
    }
}