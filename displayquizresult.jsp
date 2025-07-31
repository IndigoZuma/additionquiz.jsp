<%
    int[] n1 = (int[])session.getAttribute("n1");
    int[] n2 = (int[])session.getAttribute("n2");
    int count = 0;
%>
<html>
<head><title>Addition Quiz Answer</title></head>
<body>
<h3>Quiz Results</h3>
<pre>
<%
    for (int i = 0; i < n1.length; i++) {
        String ansStr = request.getParameter("answer" + i);
        int correctAns = n1[i] + n2[i];
        int userAns = -1;
        boolean isCorrect = false;
        try {
            userAns = Integer.parseInt(ansStr.trim());
            if (userAns == correctAns) isCorrect = true;
        } catch (Exception e) { /* empty input is wrong */ }
        if (isCorrect) {
            count++;
            out.println(n1[i] + " + " + n2[i] + " = " + ansStr + " Correct");
        } else {
            out.println(n1[i] + " + " + n2[i] + " = " + ansStr + " Wrong");
        }
    }
    out.println("The total correct count is " + count);
%>
</pre>
</body>
</html>
