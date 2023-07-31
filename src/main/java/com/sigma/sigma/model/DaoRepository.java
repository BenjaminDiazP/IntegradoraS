package com.sigma.sigma.model;

import java.util.List;

public interface DaoRepository<T> {

    List<T> findAll();

    T findOne(int id , String rol);

    boolean update(int id, String rol, T object);

    boolean delete(int id, String rol);
}
