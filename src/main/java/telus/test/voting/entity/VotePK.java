/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Admin
 */
@Embeddable
public class VotePK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "elector_id")
    private int electorId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "candidate_id")
    private int candidateId;

    public VotePK() {
    }

    public VotePK(int electorId, int candidateId) {
        this.electorId = electorId;
        this.candidateId = candidateId;
    }

    public int getElectorId() {
        return electorId;
    }

    public void setElectorId(int electorId) {
        this.electorId = electorId;
    }

    public int getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(int candidateId) {
        this.candidateId = candidateId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) electorId;
        hash += (int) candidateId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VotePK)) {
            return false;
        }
        VotePK other = (VotePK) object;
        if (this.electorId != other.electorId) {
            return false;
        }
        if (this.candidateId != other.candidateId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "telus.test.voting.entity.VotePK[ electorId=" + electorId + ", candidateId=" + candidateId + " ]";
    }

}
