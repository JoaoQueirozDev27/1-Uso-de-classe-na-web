using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _37279.Classes;
using MySql.Data.MySqlClient;

public class Jogo
{
    public int Codigo { get; set; }
    public string Nome { get; set; }
    public string Sinopse { get; set; }
    public TipoJogo TipoJogo { get; set; }
    public DateTime DataLancamento { get; set; }
    public Desenvolvedor Desenvolvedor { get; set; }
    public List<Genero> generos { get; set; }

    GerenciadorGeneros GerenciadorGeneros = new GerenciadorGeneros();
    public void BuscarDados(int codigo)
    {
        Banco banco = new Banco();
        
        string comando = $"Select * from jogo where cd_jogo = {codigo}";
        MySqlDataReader dados = banco.Consultar(comando);
        if (dados.Read())
        {
            Desenvolvedor desenvolvedor = new Desenvolvedor();
            TipoJogo TipoJogo = new TipoJogo();
            int codigo_desenvolvedor = dados.GetInt16("cd_desenvolvedor");
            int codigo_tipoJogo = dados.GetInt16("cd_tipo_jogo");
            
            this.Codigo = codigo;
            this.Nome = dados.GetString("nm_jogo");
            this.Sinopse = dados.GetString("ds_sinopse_jogo");
            this.DataLancamento = dados.GetDateTime("dt_lancamento_jogo");
            TipoJogo.BuscarDados(codigo_tipoJogo);
            this.TipoJogo = TipoJogo;
            desenvolvedor.BuscarDados(codigo_desenvolvedor);
            this.Desenvolvedor = desenvolvedor;
        }
        if(dados != null)
            if (dados.IsClosed) 
                dados.Close();
        banco.Desconectar();                
    }

    public void CarregarGeneros(int codigo)
    {
        generos = GerenciadorGeneros.BuscarGeneros(codigo);
    }

    public string ListToString()
    {
        string generos = null;
        for (int j = 0; j < this.generos.Count; j++)
        {
            generos += "-" + this.generos[j].Nome;
        }
        return generos;
    }
}