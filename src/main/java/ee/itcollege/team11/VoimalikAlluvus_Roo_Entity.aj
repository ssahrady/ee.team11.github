// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.team11;

import ee.itcollege.team11.VoimalikAlluvus;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VoimalikAlluvus_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager VoimalikAlluvus.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer VoimalikAlluvus.version;
    
    public Integer VoimalikAlluvus.getVersion() {
        return this.version;
    }
    
    public void VoimalikAlluvus.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void VoimalikAlluvus.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void VoimalikAlluvus.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            VoimalikAlluvus attached = VoimalikAlluvus.findVoimalikAlluvus(this.voimalikAlluvusId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void VoimalikAlluvus.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void VoimalikAlluvus.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public VoimalikAlluvus VoimalikAlluvus.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        VoimalikAlluvus merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager VoimalikAlluvus.entityManager() {
        EntityManager em = new VoimalikAlluvus().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long VoimalikAlluvus.countVoimalikAlluvuses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM VoimalikAlluvus o", Long.class).getSingleResult();
    }
    
    public static List<VoimalikAlluvus> VoimalikAlluvus.findAllVoimalikAlluvuses() {
        return entityManager().createQuery("SELECT o FROM VoimalikAlluvus o", VoimalikAlluvus.class).getResultList();
    }
    
    public static VoimalikAlluvus VoimalikAlluvus.findVoimalikAlluvus(Long voimalikAlluvusId) {
        if (voimalikAlluvusId == null) return null;
        return entityManager().find(VoimalikAlluvus.class, voimalikAlluvusId);
    }
    
    public static List<VoimalikAlluvus> VoimalikAlluvus.findVoimalikAlluvusEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM VoimalikAlluvus o", VoimalikAlluvus.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
