<%@ page import="java.util.Random" %>
<%
    // Set up 8 random questions in session (only once per session)
    int n = 8;
    int[] n1 = (int[])session.getAttribute("n1");
    int[] n2 = (int[])session.getAttribute("n2");
    if (n1 == null || n2 == null) {
        n1 = new int[n];
        n2 = new int[n];
        Random rand = new Random();
        for (int i = 0; i < n; i++) {
            n1[i] = 20 + rand.nextInt(10); // 20-29
            n2[i] = 5 + rand.nextInt(10);  // 5-14
        }
        session.setAttribute("n1", n1);
        session.setAttribute("n2", n2);
    }
%>
<html>
<head><title>Addition Quiz</title></head>
<body>
    <h3>Addition Quiz</h3>
    <form action="displayQuizResult.jsp" method="post">
    <table>
    <%
        for (int i = 0; i < n1.length; i++) {
    %>
    <tr>
        <td><%= n1[i] %> + <%= n2[i] %> =</td>
        <td><input type="text" name="answer<%=i%>" size="5"></td>
    </tr>
    <%
        }
    %>
    </table>
    <p><input type="submit" value="Submit"></p>
    <p>Click the browser's Refresh button to get a new quiz</p>
    </form>
</body>
</html>
