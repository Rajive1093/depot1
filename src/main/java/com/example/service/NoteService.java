package com.example.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.NoteDAO;
import com.example.dao.ParametreDAO;
import com.example.model.Candidat;
import com.example.model.Matiere;
import com.example.model.Note;
import com.example.model.Parametre;

@Service
public class NoteService {

    @Autowired
    private NoteDAO noteDAO;

    @Autowired
    private ParametreDAO parametreDAO;

    public Double calculerNoteFinale(Candidat candidat, Matiere matiere) {

        List<Note> notes = noteDAO.findByCandidatAndMatiere(candidat, matiere);

        if (notes.isEmpty()) {
            return 0.0;
        }

        List<Double> valeurs = notes.stream()
                .map(Note::getNote)
                .collect(Collectors.toList());

        List<Parametre> params = parametreDAO.findByMatiere(matiere);

        if (params.isEmpty()) {
            return 0.0;
        }

        for (Parametre param : params) {

            String symboleOperateur = param.getOperateur().getNom();
            Double seuil = param.getSeuil();

            boolean conditionMet = false;

            double sommeDiff = 0.0;
            for (int i = 0; i < valeurs.size(); i++) {
                for (int j = i + 1; j < valeurs.size(); j++) {
                    sommeDiff += Math.abs(valeurs.get(i) - valeurs.get(j));
                }
            }

            switch (symboleOperateur) {
                case "<":
                    conditionMet = sommeDiff < seuil;
                    break;

                case ">":
                    conditionMet = sommeDiff > seuil;
                    break;

                case "<=":
                    conditionMet = sommeDiff <= seuil;
                    break;

                case ">=":
                    conditionMet = sommeDiff >= seuil;
                    break;
            }

            if (conditionMet) {

                String nomResolution = param.getResolution().getNom().toLowerCase();

                if (nomResolution.contains("plus petit")) {
                    return valeurs.stream().min(Double::compare).orElse(0.0);

                } else if (nomResolution.contains("plus grand")) {
                    return valeurs.stream().max(Double::compare).orElse(0.0);

                } else if (nomResolution.contains("moyenne")) {
                    return calculMoyenne(valeurs);
                }
            }
        }
        return 0.0;
    }

    private Double calculMoyenne(List<Double> valeurs) {
        return valeurs.stream()
                .mapToDouble(Double::doubleValue)
                .average()
                .orElse(0.0);
    }
}