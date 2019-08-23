package kr.green.tottenham.service;

import kr.green.tottenham.pagination.Criteria;
import kr.green.tottenham.pagination.PageMaker;

public interface PageMakerService {

	PageMaker getPageMaker(int displayPageNum, Criteria cri, int totalCount);

}
