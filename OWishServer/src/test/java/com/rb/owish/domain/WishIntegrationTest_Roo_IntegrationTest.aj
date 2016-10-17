// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.rb.owish.domain;

import com.rb.owish.domain.Wish;
import com.rb.owish.domain.WishDataOnDemand;
import com.rb.owish.domain.WishIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect WishIntegrationTest_Roo_IntegrationTest {
    
    declare @type: WishIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: WishIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: WishIntegrationTest: @Transactional;
    
    @Autowired
    WishDataOnDemand WishIntegrationTest.dod;
    
    @Test
    public void WishIntegrationTest.testCountWishes() {
        Assert.assertNotNull("Data on demand for 'Wish' failed to initialize correctly", dod.getRandomWish());
        long count = Wish.countWishes();
        Assert.assertTrue("Counter for 'Wish' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void WishIntegrationTest.testFindWish() {
        Wish obj = dod.getRandomWish();
        Assert.assertNotNull("Data on demand for 'Wish' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Wish' failed to provide an identifier", id);
        obj = Wish.findWish(id);
        Assert.assertNotNull("Find method for 'Wish' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Wish' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void WishIntegrationTest.testFindAllWishes() {
        Assert.assertNotNull("Data on demand for 'Wish' failed to initialize correctly", dod.getRandomWish());
        long count = Wish.countWishes();
        Assert.assertTrue("Too expensive to perform a find all test for 'Wish', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Wish> result = Wish.findAllWishes();
        Assert.assertNotNull("Find all method for 'Wish' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Wish' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void WishIntegrationTest.testFindWishEntries() {
        Assert.assertNotNull("Data on demand for 'Wish' failed to initialize correctly", dod.getRandomWish());
        long count = Wish.countWishes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Wish> result = Wish.findWishEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Wish' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Wish' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void WishIntegrationTest.testFlush() {
        Wish obj = dod.getRandomWish();
        Assert.assertNotNull("Data on demand for 'Wish' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Wish' failed to provide an identifier", id);
        obj = Wish.findWish(id);
        Assert.assertNotNull("Find method for 'Wish' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyWish(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Wish' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void WishIntegrationTest.testMergeUpdate() {
        Wish obj = dod.getRandomWish();
        Assert.assertNotNull("Data on demand for 'Wish' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Wish' failed to provide an identifier", id);
        obj = Wish.findWish(id);
        boolean modified =  dod.modifyWish(obj);
        Integer currentVersion = obj.getVersion();
        Wish merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Wish' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void WishIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Wish' failed to initialize correctly", dod.getRandomWish());
        Wish obj = dod.getNewTransientWish(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Wish' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Wish' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Wish' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void WishIntegrationTest.testRemove() {
        Wish obj = dod.getRandomWish();
        Assert.assertNotNull("Data on demand for 'Wish' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Wish' failed to provide an identifier", id);
        obj = Wish.findWish(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Wish' with identifier '" + id + "'", Wish.findWish(id));
    }
    
}