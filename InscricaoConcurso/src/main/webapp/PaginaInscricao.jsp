<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inscrição do Concurso</title>
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">

	<div class="fixed-top">
		<nav aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    	<li class="breadcrumb-item active"><a href="Concurso.jsp">Início</a></li>
			    	<li class="breadcrumb-item active" aria-current="page">Inscrição</li>
			  </ol>
		</nav>
	</div>
    <div class="container">
        <div class="mx-auto p-4 border rounded bg-white" style="max-width: 600px;">
            <div class="alert alert-dark text-center">
                <h2>Inscrição do concurso</h2>
            </div>
            
            <div>
                <h4>Dados Pessoais</h4>
            </div>
            
            <form action="inscricaoServlet" method="post">
                <div class="mb-3">
                    <label for="nome" class="form-label">Nome</label>
                    <input type="text" class="form-control" name="nome" id="nome" required="required"> 
                </div>
                
                <div class="mb-3">
                    <label for="cpf" class="form-label">CPF</label>
                    <input type="text" class="form-control" name="cpf" id="cpf"   pattern="\d{11}" maxlength="11" required oninput="this.value = this.value.replace(/[^0-9]/g, '');"> 
                </div>
                
                <label for="sexo" class="form-label">Sexo</label><br>
                
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="sexo" id="sexo" value="Masculino" required>
                    <label class="form-check-label" for="sexo">Masculino</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="sexo" id="sexo" value="Feminino">
                    <label class="form-check-label" for="sexo">Feminino</label>
                </div>
                
                <br><br>        
                
                <label for="selectEscolaridade" class="form-label">Nível de Escolaridade:</label>
                <select id="selectEscolaridade" name="escolaridade" class="form-select" onchange="updateInput()" required>
                    <option value="">Selecione</option>
                    <option value="Ensino Fundamental">Ensino Fundamental</option>
                    <option value="Ensino Médio">Ensino Médio</option>
                    <option value="Ensino Superior Incompleto">Ensino Superior Incompleto</option>
                    <option value="Ensino Superior Completo">Ensino Superior Completo</option>
                </select>

                <label for="Escolaridade" class="form-label mt-3">Escolaridade Selecionada:</label>
                <input type="text" class="form-control" id="escolaridade" name="escolaridade" readonly>
           
                <script>
                    function updateInput() {
                        const selectValue = document.getElementById("selectEscolaridade").value;
                        document.getElementById("escolaridade").value = selectValue;
                    }
                </script>
                
                <br>
                
                <input type="submit" class="btn btn-primary w-100 mt-3" value="Confirmar inscrição">
            </form>
        </div>
    </div>
        
</body>
</html>