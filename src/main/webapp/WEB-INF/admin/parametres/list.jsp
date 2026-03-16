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
                <a href="${pageContext.request.contextPath}/admin/parametres/nouveau" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Nouveau Paramètre
                </a>
            </div>

            <div class="card">
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Matière</th>
                                <th>Seuil (Différence)</th>
                                <th>Opérateur</th>
                                <th>Résolution</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${parametres}">
                                <tr>
                                    <td><strong>${p.matiere.nom}</strong></td>
                                    <td><span style="background: rgba(255,255,255,0.1); padding: 4px 10px; border-radius: 20px; font-size: 13px;">${p.seuil}</span></td>
                                    <td><span style="color: var(--accent-color);">${p.operateur.nom}</span></td>
                                    <td><span style="background: var(--success-gradient); color: white; padding: 4px 10px; border-radius: 4px; font-size: 12px; font-weight: bold;">${p.resolution.nom}</span></td>
                                    <td>
                                        <div style="display: flex; gap: 8px;">
                                            <a href="${pageContext.request.contextPath}/admin/parametres/modifier/${p.id}" class="btn btn-secondary" title="Modifier">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/admin/parametres/supprimer/${p.id}" class="btn btn-secondary" style="color: #ef4444; border-color: rgba(239,68,68,0.3);" title="Supprimer" onclick="return confirm('Confirmer la suppression ?')">
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
