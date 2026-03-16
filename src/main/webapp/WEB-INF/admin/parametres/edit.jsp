<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${titre}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <jsp:include page="../../layout/navbar.jsp" />

    <div class="main-content">
        <div class="container" style="max-width: 800px; margin: 0 auto;">
            
            <div class="page-header" style="justify-content: center; border-bottom: none; margin-bottom: 10px;">
                <h2 style="text-align:center; font-size: 28px; background: var(--primary-gradient); -webkit-background-clip: text; color: transparent;">
                    <i class="fas fa-sliders-h" style="color: var(--primary-color);"></i> Configuration Globale
                </h2>
            </div>
            <p style="text-align: center; color: var(--text-secondary); margin-bottom: 40px;">
                Gérez les paramètres globaux de l'application Note Metier.
            </p>

            <c:if test="${not empty message}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i> ${message}
                </div>
            </c:if>

            <div class="card" style="margin-bottom: 40px;">
                <form action="${pageContext.request.contextPath}/admin/parametres" method="post">
                    
                    <div class="form-group">
                        <label>Temps d'attente par défaut (min)</label>
                        <input type="number" name="tempsAttente" value="${tempsAttente}" step="1" required>
                        <small style="color: var(--text-secondary); display:block; margin-top:8px;">
                            <i class="fas fa-info-circle"></i> Appliqué si la voiture n'a pas de configuration spécifique.
                        </small>
                    </div>

                    <div class="form-group" style="margin-top: 24px;">
                        <label>Vitesse Moyenne par défaut (km/h)</label>
                        <input type="number" name="vitesseMoyenne" value="${vitesseMoyenne}" step="0.1" required>
                        <small style="color: var(--text-secondary); display:block; margin-top:8px;">
                            <i class="fas fa-info-circle"></i> Utilisée pour l'estimation des trajets complexes.
                        </small>
                    </div>

                    <div style="margin-top: 36px;">
                        <button type="submit" class="btn btn-primary" style="width:100%; justify-content:center; padding: 14px; font-size: 16px;">
                            <i class="fas fa-sync-alt"></i> Mettre à jour les paramètres
                        </button>
                    </div>
                </form>
            </div>

            <div style="margin-top: 60px;">
                <h3 style="margin-bottom:24px; display: flex; align-items: center; gap: 10px;">
                    <i class="fas fa-database" style="color: var(--accent-color);"></i> Registre des Clés
                </h3>
                <div class="card" style="padding: 0; overflow: hidden;">
                    <div class="table-container" style="margin: 0;">
                        <table style="margin: 0;">
                            <thead style="background: rgba(0,0,0,0.2);">
                                <tr>
                                    <th style="padding: 16px 20px;">Paramètre (Clé Système)</th>
                                    <th style="padding: 16px 20px;">Valeur Actuelle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${parametres}">
                                    <tr>
                                        <td style="font-family: 'SF Mono', Consolas, monospace; font-size:13px; color: var(--accent-color);">
                                            ${p.cle}
                                        </td>
                                        <td><strong>${p.valeur}</strong></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>