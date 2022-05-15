package com.electrogrid.httpServlet;

import com.electrogrid.model.Bill;
import com.electrogrid.services.BillService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/bill/*")
public class billServlet extends HttpServlet {

    BillService billService = new BillService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        String pathInfo = req.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        String part1 = pathParts[1];
        resp.getWriter().write(billService.findCustomerBillsById(part1));
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Bill bill = new Bill(Integer.parseInt(req.getParameter("billId")), getDateFromString(req.getParameter("date")), new BigDecimal(req.getParameter("previousBalance")), new BigDecimal(req.getParameter("chargeForPeriod")), new BigDecimal(req.getParameter("currentBalance")), Integer.parseInt(req.getParameter("units")));
        String output = billService.updateBill(bill);
        resp.getWriter().write(output);

    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }

    private Date getDateFromString(String dateString) {
        try {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = df.parse(dateString);
            return date;
        } catch (ParseException ignored) {}
        return null;
    }
}
