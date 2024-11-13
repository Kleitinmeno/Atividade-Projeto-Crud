<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Candidato" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Informações do candidato</title>
    <script>
        function toggleEditMode() {
            var infoSection = document.getElementById("infoSection");
            var editSection = document.getElementById("editSection");
            var editButton = document.getElementById("editButton");

            if (editSection.style.display === "none") {
                editSection.style.display = "block";
                infoSection.style.display = "none";
                editButton.textContent = "Cancelar Edição";
            } else {
                editSection.style.display = "none";
                infoSection.style.display = "block";
                editButton.textContent = "Editar Informações";
            }
        }
    </script>
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">

	<div class="fixed-top">
		<nav aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    	<li class="breadcrumb-item active"><a href="Concurso.jsp">Início</a></li>
			    	<li class="breadcrumb-item active" aria-current="page">Informações</li>
			  </ol>
		</nav>
	</div>
	
    <div class="container">
        <div class="mx-auto p-4 border rounded bg-white" style="max-width: 600px;">
        
            <div class="alert alert-dark text-center">
                <h2>Informações do candidato</h2>
            </div>    

            <% Candidato candidato = (Candidato) request.getAttribute("candidato"); %>
                     
            <div id="infoSection" style="display: block;">
                <% if (candidato != null) { %>
                    <p><strong>Nome:</strong> <%= candidato.getNome() %></p>
                    <p><strong>CPF:</strong> <%= candidato.getCpf() %></p>
                    <p><strong>Sexo:</strong> <%= candidato.getSexo() %></p>
                    <p><strong>Escolaridade:</strong> <%= candidato.getEscolaridade() %></p>
                <% } else { %>
                    <p>Candidato não encontrado.</p>
                <% } %>
                <button id="editButton" class="btn btn-primary mt-3" onclick="toggleEditMode()">Editar dados</button>
            </div>

            <div id="editSection" style="display: none;">
                <form action="AtualizarServlet" method="post">
                    <input type="hidden" name="cpf" value="<%= candidato.getCpf() %>">
                    
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome:</label>
                        <input type="text" id="nome" name="nome" class="form-control" value="<%= candidato.getNome() %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="sexo" class="form-label">Sexo:</label>
                        <select id="sexo" name="sexo" class="form-select">
                            <option value="Masculino" <%= "Masculino".equals(candidato.getSexo()) ? "selected" : "" %>>Masculino</option>
                            <option value="Feminino" <%= "Feminino".equals(candidato.getSexo()) ? "selected" : "" %>>Feminino</option>
                            <!-- Adicione outras opções, se necessário -->
                        </select>
                    </div>
                                                          
                    <div class="mb3">
	                    <label for="selectEscolaridade" class="form-label">Nível de Escolaridade:</label>
	              		  <select id="selectEscolaridade" name="escolaridade" class="form-select" required>
	                   		 <option value="">Selecione</option>
	                    	 <option value="Ensino Fundamental" <%="Ensino Fundamental".equals(candidato.getEscolaridade()) ? "selected" : "" %>>Ensino Fundamental</option>
	                 		 <option value="Ensino Médio"  <%="Ensino Médio".equals(candidato.getEscolaridade()) ? "selected" : "" %>>Ensino Médio</option>
	                         <option value="Ensino Superior Incompleto"  <%="Ensino Superior Incompleto".equals(candidato.getEscolaridade()) ? "selected" : "" %>>Ensino Superior Incompleto</option>
	                         <option value="Ensino Superior Completo"  <%="Ensino Superior Complto".equals(candidato.getEscolaridade()) ? "selected" : "" %>>Ensino Superior Completo</option>
	                    </select>
                   </div>
                               
                    <button type="submit" class="btn btn-success mt-3">Salvar Alterações</button>
                    <button type="button" class="btn btn-secondary mt-3" onclick="toggleEditMode()">Cancelar</button>
                </form>
                
                <form action="ExcluirCandidato" method="post">
                	<input type="hidden" name ="cpf" value="<%=candidato.getCpf() %>">
                	<button type="submit" class="btn btn-danger">Excluir Inscrição</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
