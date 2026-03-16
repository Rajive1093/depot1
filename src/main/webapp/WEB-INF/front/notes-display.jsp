<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${titre}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <jsp:include page="../layout/navbar.jsp" />
    
    <div class="main-content">
        <div class="container">
            <div class="page-header" style="border-bottom: none;">
                <h1 style="font-size: 32px; background: var(--primary-gradient); -webkit-background-clip: text; color: transparent;">
                    <i class="fas fa-graduation-cap" style="color: var(--primary-color); margin-right: 12px;"></i> ${titre}
                </h1>
            </div>
            <p style="color: var(--text-secondary); margin-bottom: 30px; font-size: 16px;">
                Voici le récapitulatif des notes finales calculées par le système.
            </p>
            
            <div class="card" style="padding: 0; overflow: hidden;">
                <div class="table-container" style="margin: 0;">
                    <table style="margin: 0;">
                        <thead style="background: rgba(0,0,0,0.2);">
                            <tr>
                                <th style="padding: 16px 20px;">Candidat</th>
                                <c:forEach var="matiere" items="${matieres}">
                                    <th style="padding: 16px 20px; text-align: center;">${matiere.nom}</th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="candidat" items="${candidats}">
                                <tr>
                                    <td>
                                        <div class="candidat-name">
                                            <div class="candidat-avatar">
                                                ${candidat.nom.substring(0, 1)}
                                            </div>
                                            <div>
                                                <strong style="font-size: 15px;">${candidat.nom} ${candidat.prenom}</strong>
                                                <span class="candidat-matricule">Matricule: ${candidat.matricule}</span>
                                            </div>
                                        </div>
                                    </td>
                                    <c:forEach var="matiere" items="${matieres}">
                                        <td style="text-align: center; font-family: 'SF Mono', Consolas, monospace; font-size: 14px;">
                                            <span style="background: rgba(255,255,255,0.05); padding: 4px 12px; border-radius: 20px; display: inline-block;">
                                                <fmt:formatNumber value="${results[candidat.id][matiere.id]}" maxFractionDigits="2" />
                                            </span>
                                        </td>
                                    </c:forEach>
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
