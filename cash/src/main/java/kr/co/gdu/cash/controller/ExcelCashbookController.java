package kr.co.gdu.cash.controller;

import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.method.annotation.AbstractWebArgumentResolverAdapter;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.vo.*;
@Controller
public class ExcelCashbookController {

	@GetMapping(path="/admin/cashbookListExcel", produces="application/vnd.ms-excel")
	public String cashbookListExcel() {
		
		return "cashbook";
	}
}
	
	@Component("cashbook")
	@Scope("prototype") //컴포넌트 타입에 
	class CashbookListExcel extends AbstractXlsView{
		
		@Autowired CashbookService cashbookService;
		@Override
		protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			response.setHeader("Content-Disposition", "attachment; filename=\"cashbook.xls\"");
			List<Cashbook> cashbookList = cashbookService.getCashbookList();
			Sheet sheet = workbook.createSheet("shheet1");
			
			
			Row row = sheet.createRow(0);
			row.createCell(0).setCellValue("cashbookId");
			row.createCell(1).setCellValue("cashbookKind");
			row.createCell(2).setCellValue("categoryName");
			row.createCell(3).setCellValue("cashbookPrice");
			row.createCell(4).setCellValue("cashbookContent");
			row.createCell(5).setCellValue("cashbookDate");
			row.createCell(6).setCellValue("createDate");
			row.createCell(7).setCellValue("updateDate");
			
			int rowNum=1;
			for(Cashbook c : cashbookList) {
				Row row1 = sheet.createRow(rowNum);
				row1.createCell(0).setCellValue(c.getCashbookId());
				row1.createCell(1).setCellValue(c.getCashbookKind());
				row1.createCell(2).setCellValue(c.getCategoryName());
				row1.createCell(3).setCellValue(c.getCashbookPrice());
				row1.createCell(4).setCellValue(c.getCashbookContent());
				row1.createCell(5).setCellValue(c.getCashbookDate());
				row1.createCell(6).setCellValue(c.getCreateDate());
				row1.createCell(7).setCellValue(c.getUpdateDate());
			}
		}
		
	}