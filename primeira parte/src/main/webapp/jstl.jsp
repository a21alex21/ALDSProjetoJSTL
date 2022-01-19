<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Página JSTL</title>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
 <h1>Ex Produtos</h1>

        <hr>

           PRODUTOS

        <table border="1">
        <div class="row">
                    <!-- BUTTON DO MODAL -->
                    <div class="col-6">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">
                            Cadastrar Novo Cartão
                        </button>
                    </div>
                    <!-- BUTTON DO EXCLUIR CARTÃO -->
                    <div class="col-6">
                        <button class=" btn btn-excluir " type="submit">Excluir Cartão</button>
                    </div>

                </div>

            

            <c:forEach var="listaProdutos" items="${ResultadoProdutos.rows}">

                <tr>

                  
                    <td><c:out value="${listaProdutos.CODPRD}"/></td>

                    <td><c:out value="${listaProdutos.NOME}"/></td>

          
                   <td><fmt:formatDate pattern="dd/MM/yyyy" value="${listaProdutos.DATA_ULTIMA_COMPRA}"/></td>

                   <td><c:out value="${listaProdutos.PRECO_CUSTO}"/></td>

                   <td><c:out value="${listaProdutos.PRECO_VENDA}"/></td>

                                      
                    <c:set var="totalPrecoCusto" value="${totalPrecoCusto+listaProdutos.PRECO_CUSTO}"/>

                    <c:set var="totalPrecoVenda" value="${totalPrecoVenda+listaProdutos.PRECO_VENDA}"/>

                    <c:set var="valorMargem" value="${listaProdutos.PRECO_VENDA-listaProdutos.PRECO_CUSTO}"/>

                   

                    <td><c:out value="${valorMargem}"/></td>

                    <c:choose>

                        <c:when test="${valorMargem<=0}">

                            <td>Baixa</td>       

                        </c:when>

                        <c:when test="${valorMargem<=0}">

                            <td>Media</td>       

                        </c:when>

                        <c:otherwise>

                            <td>Alta</td>

                        </c:otherwise>

                    </c:choose>

                </tr>

            </c:forEach>

            <tfoot>

                <th colspan="3">

                Total:

                </th>

                <th>

            
                    <fmt:formatNumber value="${totalPrecoCusto}" pattern="#,#00.00#"/>

                </th>

                <th>

                    <fmt:formatNumber value="${totalPrecoVenda}" pattern="#,#00.00#"/>

                </th>

            </tfoot>

        </table>

    </body>

</html>                   
 	
 		
 


</body>
</html>