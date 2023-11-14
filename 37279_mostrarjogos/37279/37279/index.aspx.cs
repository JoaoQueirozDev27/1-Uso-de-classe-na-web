using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _37279
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Jogo jogo = new Jogo();
            GerenciadorJogos jogos = new GerenciadorJogos();

            /*Buscar um jogo
            jogo.BuscarDados(2);
            if (jogo.Nome != null)
                litTeste.Text = jogo.Nome;
            else
                litTeste.Text = "Não encontrado";
            */

            /*Lista todos os jogos*/
            List<Jogo> lista_jogos = jogos.Listar();
            for (int i = 0; i < lista_jogos.Count; i++)
            {
                jogo.CarregarGeneros(lista_jogos[i].Codigo);
                string generos =null;
                for(int j = 0;j < jogo.generos.Count; j++)
                {
                   generos += "-" + jogo.generos[j].Nome;
                }
                litTeste.Text += lista_jogos[i].Nome + $"-{lista_jogos[i].desenvolvedor.Nome}" + generos +"<br>";
            }

            /*Busca um desenvolvedor
            GerenciaDesenvolvedores gerenciaDesenvolvedores = new GerenciaDesenvolvedores();
            List<Desenvolvedor> listinha = gerenciaDesenvolvedores.Listar();
            for (int i = 0; i < listinha.Count; i++)
            {
                litTeste.Text += listinha[i].Nome + "<br>";
            }
            */
        }
    }
}