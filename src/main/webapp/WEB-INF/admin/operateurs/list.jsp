<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${titre}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <jsp:include page="../../layout/navbar.jsp" />
    
    <div class="main-content">
        <div class="container">
            <div class="page-header">
                <h1>${titre}</h1>
                <a href="${pageContext.request.contextPath}/admin/operateurs/nouveau" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Nouveau Opérateur
                </a>
            </div>

            <div class="card">
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${operateurs}">
                                <tr>
                                    <td>${o.id}</td>
                                    <td><strong>${o.nom}</strong></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/operateurs/modifier/${o.id}" class="btn btn-secondary" title="Modifier">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
