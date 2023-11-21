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

            try
            {
                int codigo = int.Parse(Request["c"]);

                jogo.BuscarDados(codigo);
                jogo.CarregarGeneros(codigo);

                litNomeJogo.Text = jogo.Nome;
                litSinopse.Text = jogo.Sinopse;
                litTipoJogo.Text = jogo.TipoJogo.Nome;
                litGenero.Text = jogo.ListToString();
                litDesenvolvedor.Text = jogo.Desenvolvedor.Nome;
                litDataLancamento.Text = jogo.DataLancamento.ToShortDateString();

                litJogadores.Text += @" <div class='perfil'>
                                            <div class='imagem_perfil' style=""background-image:url('images/{email}.jpg'); background-size:cover;""></div>
                                            <h2>{nome_usuario}</h2>
                                            <div class='progress-container'>
                                                <div class='progress-bar'>
                                                     <div class='progress' id='progress' style='width:0'></div>
                                                </div>
                                                <img class='estrelas' src='images/estrelas.png'>
                                            </div>
                                            <p>{descricao_usuario}</p>
                                        </div>";
            }
            catch
            {               
            }
            
          
        }
    }
}