package com.mediflow.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class Hibernate {
    private static SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            return new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory(){
        return sessionFactory;
    }

//    public static <T> List<T> all(Class<T> clazz){
//        Session session = Hibernate.getSessionFactory().openSession();
//        Transaction tx = null;
//        List<T> doctors = null;
//        try {
//            tx = session.beginTransaction();
//            Query<T> query = session.createQuery("FROM " + clazz.getSimpleName(), clazz);
//            doctors = query.list();
//            tx.commit();
//        } catch (Exception e) {
//            if(tx != null) tx.rollback();
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return doctors;
//    }
//
//
//    public static <T> void create(T entity){
//        Session session = sessionFactory.openSession();
//        Transaction tx = null;
//        try {
//            tx = session.beginTransaction();
//            session.persist(entity);
//            tx.commit();
//        } catch (Exception e) {
//            if(tx != null) tx.rollback();
//            System.out.println("error during create: " + e.getMessage());
//        } finally {
//            session.close();
//        }
//    }
//
//    public static <T> void update(T entity){
//        Session session = sessionFactory.openSession();
//        Transaction tx = null;
//        try {
//            tx = session.beginTransaction();
//            session.merge(entity);
//            tx.commit();
//        } catch (Exception e) {
//            if(tx != null) tx.rollback();
//            System.out.println("error during update: " + e.getMessage());
//        } finally {
//            session.close();
//        }
//    }
//
//    public static <T> T get(Class<T> aClass, int id){
//        Session session = sessionFactory.openSession();
//        Transaction tx = null;
//        T object = null;
//        try {
//            tx = session.beginTransaction();
//            object = session.get(aClass, id);
//            tx.commit();
//        } catch (Exception e){
//            if(tx != null) tx.rollback();
//            System.out.println("error during fetching the db: " + e.getMessage());
//        } finally {
//            session.close();
//        }
//        return object;
//    }
//
//    public static <T> void delete(Class<T> aClass, int id){
//        Session session = sessionFactory.openSession();
//        Transaction tx = null;
//        try {
//            tx = session.beginTransaction();
//            T object = session.get(aClass, id);
//            session.remove(object);
//            tx.commit();
//        } catch (Exception e) {
//            if(tx != null) tx.rollback();
//            System.out.println("error during delete: " + e.getMessage());
//        } finally {
//            session.close();
//        }
//    }

    public static void shutdown() {
        // Close caches and connection pools
        sessionFactory.close();
    }
}
