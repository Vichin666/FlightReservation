//using System;
//using iTextSharp.text.pdf;
//using System.IO;
//using iTextSharp.text;
//using System.Diagnostics;

//namespace Flight_Reservation
//{
//    public partial class receipt : System.Web.UI.Page
//    { 
//        protected void GenerateInvoicePDF(object sender, EventArgs e)
//        {
//            //Dummy data for Invoice (Bill).
//            con = new SqlConnection();
//            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
//            cmd = new SqlCommand();
//            string companyName = "ASPSnippets";
//            int orderNo = 2303;
//            DataTable dt = new DataTable();
//            string constring = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
//            using (SqlConnection con = new SqlConnection(constring))
//            {
//                using (SqlCommand cmd = new SqlCommand("SELECT ProductId,Product,Price,Quantity,Total FROM Products", con))
//                {
//                    using (SqlDataAdapter sda = new SqlDataAdapter())
//                    {
//                        con.Open();
//                        cmd.CommandType = CommandType.Text;
//                        sda.SelectCommand = cmd;
//                        sda.Fill(dt);
//                        con.Close();
//                    }
//                }
//            }

//            using (StringWriter sw = new StringWriter())
//            {
//                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
//                {
//                    StringBuilder sb = new StringBuilder();

//                    //Generate Invoice (Bill) Header.
//                    sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
//                    sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b>Order Sheet</b></td></tr>");
//                    sb.Append("<tr><td colspan = '2'></td></tr>");
//                    sb.Append("<tr><td><b>Order No: </b>");
//                    sb.Append(orderNo);
//                    sb.Append("</td><td align = 'right'><b>Date: </b>");
//                    sb.Append(DateTime.Now);
//                    sb.Append(" </td></tr>");
//                    sb.Append("<tr><td colspan = '2'><b>Company Name: </b>");
//                    sb.Append(companyName);
//                    sb.Append("</td></tr>");
//                    sb.Append("</table>");
//                    sb.Append("<br />");

//                    //Generate Invoice (Bill) Items Grid.
//                    sb.Append("<table border = '1'>");
//                    sb.Append("<tr>");
//                    foreach (DataColumn column in dt.Columns)
//                    {
//                        sb.Append("<th style = 'background-color: #D20B0C;color:#ffffff'>");
//                        sb.Append(column.ColumnName);
//                        sb.Append("</th>");
//                    }
//                    sb.Append("</tr>");
//                    foreach (DataRow row in dt.Rows)
//                    {
//                        sb.Append("<tr>");
//                        foreach (DataColumn column in dt.Columns)
//                        {
//                            sb.Append("<td>");
//                            sb.Append(row[column]);
//                            sb.Append("</td>");
//                        }
//                        sb.Append("</tr>");
//                    }
//                    sb.Append("<tr><td align = 'right' colspan = '");
//                    sb.Append(dt.Columns.Count - 1);
//                    sb.Append("'>Total</td>");
//                    sb.Append("<td>");
//                    sb.Append(dt.Compute("sum(Total)", ""));
//                    sb.Append("</td>");
//                    sb.Append("</tr></table>");

//                    //Export HTML String as PDF.
//                    StringReader sr = new StringReader(sb.ToString());
//                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
//                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
//                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
//                    pdfDoc.Open();
//                    htmlparser.Parse(sr);
//                    pdfDoc.Close();
//                    Response.ContentType = "application/pdf";
//                    Response.AddHeader("content-disposition", "attachment;filename=Invoice_" + orderNo + ".pdf");
//                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
//                    Response.Write(pdfDoc);
//                    Response.End();
//                }
//            }
//        }
//    }
//}