<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- This acts as the sidebar now -->
<nav class="sidebar">
    <div class="sidebar-brand">
        ETU3573
    </div>
    <div class="sidebar-nav">
        <!-- Main Application Link -->
        <a href="${pageContext.request.contextPath}/notes" class="nav-link">
            <i class="fas fa-graduation-cap"></i> 
            <span>Notes Finales</span>
        </a>
        
        <div style="margin: 20px 0 10px 18px; font-size: 11px; text-transform: uppercase; letter-spacing: 1px; color: var(--text-secondary); font-weight: 600;">
            Administration
        </div>
        
        <!-- Admin Links -->
        <a href="${pageContext.request.contextPath}/admin/matieres" class="nav-link">
            <i class="fas fa-book"></i> 
            <span>Matières</span>
        </a>
        <a href="${pageContext.request.contextPath}/admin/parametres" class="nav-link">
            <i class="fas fa-sliders-h"></i> 
            <span>Paramètres</span>
        </a>
        <a href="${pageContext.request.contextPath}/admin/resolutions" class="nav-link">
            <i class="fas fa-cogs"></i> 
            <span>Résolutions</span>
        </a>
        <a href="${pageContext.request.contextPath}/admin/operateurs" class="nav-link">
            <i class="fas fa-equals"></i> 
            <span>Opérateurs</span>
        </a>
    </div>
</nav>

<!-- Magic script to set active class based on current URL -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const currentPath = window.location.pathname;
        const navLinks = document.querySelectorAll('.sidebar-nav .nav-link');
        
        navLinks.forEach(link => {
            const href = link.getAttribute('href');
            if (currentPath.includes(href) && href !== "${pageContext.request.contextPath}/") {
                link.classList.add('active');
            }
        });
        
        // Exceptional case for notes display, as it might just be /notes or /
        if (currentPath === "${pageContext.request.contextPath}/" || currentPath === "${pageContext.request.contextPath}") {
             // If home page is notes
             const notesLink = document.querySelector('a[href="${pageContext.request.contextPath}/notes"]');
             if(notesLink) notesLink.classList.add('active');
        }
    });
</script>