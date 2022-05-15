package com.electrogrid.httpServlet;

import com.electrogrid.model.Payment;
import com.electrogrid.services.PaymentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

@WebServlet("/payment")
public class paymentServlet extends HttpServlet {

    PaymentService paymentService = new PaymentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Payment payment = new Payment(req.getParameter("method"),req.getParameter("refId"), new BigDecimal(req.getParameter("amount")), new Date());
        String output = paymentService.createPayment(req.getParameter("billId"),payment);
        resp.getWriter().write(output);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map paras = getParasMap(req);

        String output = paymentService.deletePayment(Integer.parseInt(paras.get("payId").toString()));

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

    // Convert request parameters to a Map
    private static Map getParasMap(HttpServletRequest request)
    {
        Map<String, String> map = new HashMap<String, String>();
        try
        {
            Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
            String queryString = scanner.hasNext() ?
                    scanner.useDelimiter("\\A").next() : "";
            scanner.close();
            String[] params = queryString.split("&");
            for (String param : params)
            {
                String[] p = param.split("=");
                map.put(p[0], p[1]);
            }
        }
        catch (Exception e)
        {
        }
        return map;
    }
}
