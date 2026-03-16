<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${action} Résolution</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <jsp:include page="../../layout/navbar.jsp" />
    
    <div class="main-content">
        <div class="container" style="max-width: 600px; margin: 0 auto;">
            <div class="page-header">
                <h1>${action} Résolution</h1>
            </div>
            
            <div class="card">
                <form action="${pageContext.request.contextPath}/admin/resolutions/save" method="post">
                    <input type="hidden" name="id" value="${resolution.id}">
                    
                    <div class="form-group">
                        <label for="nom">Nom de la Résolution (ex: plus petit, moyenne)</label>
                        <input type="text" id="nom" name="nom" value="${resolution.nom}" placeholder="Entrez la résolution" required>
                    </div>
                    
                    <div style="display: flex; gap: 16px; margin-top: 30px;">
                        <button type="submit" class="btn btn-primary" style="flex: 1;"><i class="fas fa-save"></i> Enregistrer</button>
                        <a href="${pageContext.request.contextPath}/admin/resolutions" class="btn btn-secondary" style="flex: 1;"><i class="fas fa-times"></i> Annuler</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
