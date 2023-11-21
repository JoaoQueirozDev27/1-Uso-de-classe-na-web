<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="_37279.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="css/estilo.css">   
<link rel="stylesheet" href="css/jogo_escolhido.css">
<title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
        <img src="images/logo_sem_fundo.png" class="logo" alt="">
        <input type="text" class="caixa_texto">
        <button class="entrar"><a href="">Entrar</a><img src="images/usuario_branco.png" alt=""></button>
    </header>
    <main>
       <section class="jogo_escolhido">
            <img src="images/codMW2.jpg" alt="">
            <section>
                <div>
                    <h1><asp:Literal ID="litNomeJogo" runat="server"></asp:Literal></h1>
                    <p><asp:Literal ID="litSinopse" runat="server"></asp:Literal></p>
                </div>
                <div class="outras_informacoes">
                    <p>Data de lançamento: <asp:Literal ID="litDataLancamento" runat="server"></asp:Literal></p>
                    <p>Tipo do jogo:<asp:Literal ID="litTipoJogo" runat="server"></asp:Literal></p>
                    <p>Gênero(s):<asp:Literal ID="litGenero" runat="server"></asp:Literal></p>
                    <p>Desenvolvedor(a):<asp:Literal ID="litDesenvolvedor" runat="server"></asp:Literal></p>
                </div>
            </section>
       </section>

       <section id="perfis_destacados">
            
            <h1>Perfis em destaque</h1>
           <asp:Literal ID="litJogadores" runat="server"></asp:Literal>
           <%--
            <div class="perfil">
                <img src="images/usuario_branco.png" alt="">
                <h2>Zezão</h2>
                <div class="estrelas">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos harum, optio iste facilis in consectetur architecto, dolorem eligendi odio.</p>
            </div>

           <div class="perfil">
                <img src="images/usuario_branco.png" alt="">
                <h2>Zezão</h2>
                <div class="estrelas">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos harum, optio iste facilis in consectetur architecto, dolorem eligendi odio.</p>
            </div>
            <div class="perfil">
                <img src="images/usuario_branco.png" alt="">
                <h2>Zezão</h2>
                <div class="estrelas">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos harum, optio iste facilis in consectetur architecto, dolorem eligendi.</p>
            </div>
            <div class="perfil">
                <img src="images/usuario_branco.png" alt="">
                <h2>Zezão</h2>
                <div class="estrelas">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos harum, optio iste facilis in consectetur architecto, dolorem eligendi.</p>
            </div>
            <div class="perfil">
                <img src="images/usuario_branco.png" alt="">
                <h2>Zezão</h2>
                <div class="estrelas">
                    <img src="images/estrela_cheia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                    <img src="images/estrela_vazia.png" alt="">
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos harum, optio iste facilis in consectetur architecto, dolorem eligendi.</p>
            </div>--%>
    </section>
    </main>
    </form>
</body>
</html>
