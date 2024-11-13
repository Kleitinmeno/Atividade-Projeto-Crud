<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inscrição realizada</title>
<script>
    function mostrarCampoCPF() {
        // Verifica se o campo já existe para não criar outro ao clicar de novo
        if (!document.getElementById("cpfForm")) {
            // Cria um novo elemento de formulário
            var form = document.createElement("form");
            form.id = "cpf";
            form.className = "mt-3";
            form.method = "get";
            form.action = "inscricaoServlet"; 

            // Adiciona um rótulo para o campo CPF
            var label = document.createElement("label");
            label.setAttribute("for", "cpfInput");
            label.textContent = "CPF do Candidato:";
            label.className = "form-label";

            // Cria o campo de entrada para CPF
            var input = document.createElement("input");
            input.type = "text";
            input.id = "cpf";
            input.name = "cpf";  // Define o nome do parâmetro que será enviado para a servlet
            input.className = "form-control";
            input.placeholder = "Digite o CPF";
            input.pattern = "\\d{11}";
            input.maxLength = "11";
            
            input.oninput = function() {
                this.value = this.value.replace(/[^0-9]/g, ''); // Remove caracteres que não são números
            };

            // Cria o botão de envio
            var submitButton = document.createElement("button");
            submitButton.type = "submit";
            submitButton.className = "btn btn-success w-100 mt-3";
            submitButton.textContent = "Enviar CPF";

            // Adiciona os elementos ao formulário
            form.appendChild(label);
            form.appendChild(input);
            form.appendChild(submitButton);

            // Adiciona o formulário dentro do container
            document.getElementById("formContainer").appendChild(form);
        }
    }
</script>
</head>
<body>
	<div class="container">
	         <div class="mx-auto p-4 border rounded bg-white" style="max-width: 600px;">
	         
	         	  <!-- Mensagem de sucesso -->
				  <div class="alert alert-dark text-center">
				 	 <h4 class="alert-heading">Parabéns</h4>
				  </div>
				  <p>Parabéns, a sua inscrição no concurso foi realizada com sucesso.</p>
				  
				  <hr>
				  
				  <button type="button" class="btn btn-primary w-100 mt-3" onclick="window.location.href='PaginaInscricao.jsp'">Cadastrar outro candidato</button>
				  <button type="button" class="btn btn-primary w-100 mt-3" onclick="mostrarCampoCPF()">Verificar dados de Inscrição</button>
				  <div id="formContainer"></div>
			</div>
			
	</div>
</body>
</html>