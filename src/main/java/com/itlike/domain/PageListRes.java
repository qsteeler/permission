package com.itlike.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Setter@Getter@ToString
public class PageListRes {
    private Long total;
    private List<?> rows = new ArrayList<>();
}
