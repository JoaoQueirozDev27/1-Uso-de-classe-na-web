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
            GerenciadorUsuarios GerenciadorUsuarios = new GerenciadorUsuarios();
            try
            {
                int codigo = 0;
                if (Request["c"] == null)
                    codigo = 1;
                else
                    codigo = int.Parse(Request["c"]);

                jogo.BuscarDados(codigo);
                jogo.CarregarGeneros(codigo);

                litNomeJogo.Text = jogo.Nome;
                litSinopse.Text = jogo.Sinopse;
                litTipoJogo.Text = jogo.TipoJogo.Nome;
                litGenero.Text = jogo.ListToString();
                litDesenvolvedor.Text = jogo.Desenvolvedor.Nome;
                litDataLancamento.Text = jogo.DataLancamento.ToShortDateString();
                List<Usuario> usuarios = new List<Usuario>();
                usuarios = GerenciadorUsuarios.ListaUsuariosJogo(codigo);

                for(int i = 0; i < usuarios.Count; i++)
                {
                    string Email = usuarios[i].Email;
                    string Apelido = usuarios[i].Apelido;
                    string Descricao = usuarios[i].Descricao;
                    double Avaliacao = usuarios[i].Avaliacao;
                    Avaliacao = (Avaliacao / 5) * 100;


                    litJogadores.Text += $@" <div class='perfil'>
                                            <div class='imagem_perfil' style=""background-image:url('images/usuario.png'); background-size:cover;""></div>
                                            <h2>{Apelido}</h2>
                                            <div class='progress-container'>
                                                <div class='progress-bar'>
                                                     <div class='progress' id='progress' style='width:{Avaliacao.ToString("#,##")}%'></div>
                                                </div>
                                                <img class='estrelas' src='images/estrelas.png'>
                                            </div>
                                            <p class='descricao'>{Descricao}</p>
                                        </div>";
                }
                
            }
            catch
            {               
            }
            
          
        }
    }
}