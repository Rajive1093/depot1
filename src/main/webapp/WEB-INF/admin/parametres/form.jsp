<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${action} Paramètre</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <jsp:include page="../../layout/navbar.jsp" />
    
    <div class="main-content">
        <div class="container" style="max-width: 600px; margin: 0 auto;">
            <div class="page-header">
                <h1>${action} Paramètre</h1>
            </div>
            
            <div class="card">
                <form action="${pageContext.request.contextPath}/admin/parametres/save" method="post">
                    <input type="hidden" name="id" value="${parametre.id}">
                    
                    <div class="form-group">
                        <label for="id_matiere">Matière</label>
                        <select id="id_matiere" name="matiere.id" required>
                            <c:forEach var="m" items="${matieres}">
                                <option value="${m.id}" ${m.id == parametre.matiere.id ? 'selected' : ''}>${m.nom}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="seuil">Seuil (Différence maximale)</label>
                        <input type="number" step="0.5" id="seuil" name="seuil" value="${parametre.seuil}" placeholder="Ex: 2.0" required>
                    </div>

                    <div class="form-group">
                        <label for="id_operateur">Opérateur</label>
                        <select id="id_operateur" name="operateur.id" required>
                            <c:forEach var="op" items="${operateurs}">
                                <option value="${op.id}" ${op.id == parametre.operateur.id ? 'selected' : ''}>${op.nom}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="id_resolution">Résolution (si condition vraie)</label>
                        <select id="id_resolution" name="resolution.id" required>
                            <c:forEach var="res" items="${resolutions}">
                                <option value="${res.id}" ${res.id == parametre.resolution.id ? 'selected' : ''}>${res.nom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div style="display: flex; gap: 16px; margin-top: 30px;">
                        <button type="submit" class="btn btn-primary" style="flex: 1;"><i class="fas fa-save"></i> Enregistrer</button>
                        <a href="${pageContext.request.contextPath}/admin/parametres" class="btn btn-secondary" style="flex: 1;"><i class="fas fa-times"></i> Annuler</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
