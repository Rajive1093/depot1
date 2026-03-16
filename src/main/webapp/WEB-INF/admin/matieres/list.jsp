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
                <a href="${pageContext.request.contextPath}/admin/matieres/nouveau" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Nouvelle Matière
                </a>
            </div>

            <c:if test="${not empty message}">
                <div class="alert alert-success">
                    ${message}
                </div>
            </c:if>

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
                            <c:forEach var="m" items="${matieres}">
                                <tr>
                                    <td>${m.id}</td>
                                    <td><strong>${m.nom}</strong></td>
                                    <td>
                                        <div style="display: flex; gap: 8px;">
                                            <a href="${pageContext.request.contextPath}/admin/matieres/modifier/${m.id}" class="btn btn-secondary" title="Modifier">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/admin/matieres/supprimer/${m.id}" class="btn btn-secondary" style="color: #ef4444; border-color: rgba(239,68,68,0.3);" title="Supprimer" onclick="return confirm('Supprimer cette matière ?')">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </div>
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
