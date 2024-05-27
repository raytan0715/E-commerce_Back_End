<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>

    <!-- Footer 頁尾部分 -->
<section id="FooterArea" class="Footer border-top container" style="width: 100%;color: #796146;">
    <footer class="py-5">
      <div class="row" style="display: flex; align-items: center;">
        <div class="col">
          <h5 style="font-size: 22px;font-weight: 1000;margin-bottom: 20px;padding-left: 180px;">聯絡資訊</h5>
          <ul style="font-size: 17px;font-weight: 500;padding-left: 200px;">
            <li style="margin-bottom: 10px;">客服專線：(03)26599</li>
            <li style="margin-bottom: 10px;">客服時間：09:00-18:00</li>
            <li style="margin-bottom: 10px;">信箱 : foodie@gmail.com</li>
            <li>地址：320桃園市中壢區中北路200號<br>(中原大學資訊管理學系)</li>
          </ul>
        </div>
        <div class="col">
          <div class="MapArea">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3617.266894455652!2d121.24097727482966!3d24.957032541387473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346822143c046009%3A0x63e3ef21e3beebac!2z6LOH6KiK566h55CG5a2457O7!5e0!3m2!1szh-TW!2stw!4v1715502788841!5m2!1szh-TW!2stw" width="500" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
        </div>
      </div>
    </footer>
    <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
      <p>&copy; 2024 Company, Inc. All rights reserved.</p>
      <%
        ServletContext context = getServletContext();
        Integer counter = (Integer) context.getAttribute("counter");
        if (counter == null) {
            counter = 60;
        }
        counter++;
        context.setAttribute("counter", counter);
      %>
      <p> 網頁瀏覽人數：<%= counter %>人</p>
    </div>
  </section>
  