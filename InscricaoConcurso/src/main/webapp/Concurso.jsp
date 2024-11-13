<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Concurso</title>
<script>
    function mostrarCampoCPF() {
       
        if (!document.getElementById("cpfForm")) {

            var form = document.createElement("form");
            form.id = "cpf";
            form.className = "mt-3";
            form.method = "post";
            form.action = "VerificaCPFServlet"; 

            
            var label = document.createElement("label");
            label.setAttribute("for", "cpfInput");
            label.textContent = "CPF do Candidato:";
            label.className = "form-label";

          
            var input = document.createElement("input");
            input.type = "text";
            input.id = "cpf";
            input.name = "cpf";  
            input.className = "form-control";
            input.placeholder = "Digite o CPF";
            input.pattern = "\\d{11}";
            input.maxLength = "11";
            
            input.oninput = function() {
                this.value = this.value.replace(/[^0-9]/g, '');
            };

         
            var submitButton = document.createElement("button");
            submitButton.type = "submit";
            submitButton.className = "btn btn-success w-100 mt-3";
            submitButton.textContent = "Enviar CPF";

           
            form.appendChild(label);
            form.appendChild(input);
            form.appendChild(submitButton);

           
            document.getElementById("formContainer").appendChild(form);
        }
    }
</script>
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">

    <div class="container">
         <div class="mx-auto p-4 border rounded bg-white" style="max-width: 600px;">
         
             <div class="alert alert-dark text-center">
                <h2>Inscrição do concurso</h2>
             </div>
            
             <div class="mb-3">
             
                 <button type="button" class="btn btn-primary w-100 mt-3"  onclick="window.location.href='PaginaInscricao.jsp'">Realizar Inscrição</button><br>
                 
                 <button type="button" class="btn btn-primary w-100 mt-3" onclick="mostrarCampoCPF()">Buscar candidato já registrado</button>
             </div>
            
             <div id="formContainer"></div>
             
         </div>
    </div>
</body>
</html>

