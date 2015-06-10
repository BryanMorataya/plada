<!DOCTYPE html >
<!--#include file="includes/funciones.asp"-->
<!--#include file="includes/clsTreeView.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 9
  '  resula = qacc(session("username"),estapagina)
'	if resula <> 1 then 
'		Response.Redirect "noacceso.asp"
'    end if
%>
<%
Response.Flush
%>
<%
Dim Conn 
Dim RS   
Dim SQL  
Dim DSN  
dim bus
dim mes
dim year
DSN = session("conec")
Set RS = Server.CreateObject("ADODB.Recordset")
Set Conn = Server.CreateObject("ADODB.Connection")
bus = Request.QueryString("bus")
mes = Request.QueryString("mes")
anio = Request.QueryString("year")
	        Conn.Open DSN
			SQL="select concat(icheqd.idpregunta, '_', day(icheq.fecha)) as td, day(icheq.fecha) as dia, month(icheq.fecha) as mes, year(icheq.fecha) as anio, icheq.unidad, icheqd.idpregunta, icheqd.valor, icheqd.descripcion from ichequeos as icheq, ichequeosd as icheqd where icheq.ncorre=icheqd.ncorre and icheq.unidad='"& bus &"' and month(icheq.fecha)='"& mes &"' and year(icheq.fecha)='"& anio &"' group by td;"
            RS.Open SQL,Conn,3,1
%>

<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Reporte de Bus 360</title>
<link rel="stylesheet" type="text/css" href="includes/android.css">
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="includes/descripcion.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="jquery/jquery.gallerax-0.2.js"></script>
<link href="includes/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="jquery/jquery.min.js"></script>
<script src="jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="jQuery/glDatePicker.min.js"></script>
<script type="text/javascript" src="jQuery/glDatePicker.js"></script>
<style type="text/css">
@import "gallery.css";
    .style1{
        width: 196px;
    }
    .style2{
        width: 164px;
    }
    .tabla{
        border-collapse: collapse;
    }
    .tabla tr{
        
    }
    .tabla tr td{
        padding-left:3px;
        padding-right:3px;
       /*background-color:#424242;
        background-image:url(images/grd_head.png);*/
        background-repeat:repeat-x;
        border:1px solid #000;
        font-size:0.700em;
        /*olor:#fff;*/
        font-weight:bold;
        text-align:center;
    }
	div#TreeView1 a{color:blue;font-family:verdana;font-size:10pt;}
	div#TreeView1 a:link{text-decoration:none;}
	div#TreeView1 a:hover{text-decoration:underline;}
	div#TreeView1 a:visited{text-decoration:none;}
	td{
    height:19px;
    width:16px;
    }
</style>
<style type="text/css">
		.tooltip {
			border-bottom: 1px dotted #000000; color: #000000; outline: none;
			cursor: help; text-decoration: none;
			position: relative;
			border:none;
		}
		.tooltip .ver {
			margin-left: -999em;
			position: absolute;
		}
		.tooltip:hover .ver {
			border-radius: 5px 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; 
			box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1); -webkit-box-shadow: 5px 5px rgba(0, 0, 0, 0.1); -moz-box-shadow: 5px 5px rgba(0, 0, 0, 0.1);
			font-family: Calibri, Tahoma, Geneva, sans-serif;
			position: absolute; left: 1em; top: 2em; z-index: 99;
			margin-left: 15px; width: 200px;
			margin-top:-5px;
		}
		.tooltip .ver1 {
			margin-left: -999em;
			position: absolute;
		}
		.tooltip:hover .ver1 {
			border-radius: 5px 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; 
			box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1); -webkit-box-shadow: 5px 5px rgba(0, 0, 0, 0.1); -moz-box-shadow: 5px 5px rgba(0, 0, 0, 0.1);
			font-family: Calibri, Tahoma, Geneva, sans-serif;
			position: absolute; left: 1em; top: 2em; z-index: 99;
			margin-left: -240px; width: 200px;
			margin-top:-10px;
		}
		.tooltip:hover .img {
			border: 0; margin: -10px 0 0 -55px;
			float: left; position: absolute;
			
		}
		.tooltip:hover em {
			font-family: Candara, Tahoma, Geneva, sans-serif; font-size: 1.2em; font-weight: bold;
			display: block; padding: 0.2em 0 0.6em 0;
		}
		.classic { padding: 0.8em 1em; }
		.custom { padding: 0.5em 0.8em 0.8em 2em; }
		* html a:hover { background: transparent; }
		.classic {background: #FFFFAA; border: 1px solid #FFAD33; }
		.critical { background: #FFCCAA; border: 1px solid #FF3334;	}
		.help { background: #9FDAEE; border: 1px solid #2BB0D7;	}
		.info { background: #9FDAEE; border: 1px solid #2BB0D7;	}
		.warning { background: #FFFFAA; border: 1px solid #FFAD33; }
		</style>
</head>
<body>
            <div id="accordion" style="display:none;">
	            <h3>
                    <a href="#">Frente</a>
                </h3>
	            <div>
		            <p>
		                <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="p1">
                                <td>Parabrisas</td>
                                <td id="p1_1"></td>
                                <td id="p1_2"></td>
                                <td id="p1_3"></td>
                                <td id="p1_4"></td>
                                <td id="p1_5"></td>
                                <td id="p1_6"></td>
                                <td id="p1_7"></td>
                                <td id="p1_8"></td>
                                <td id="p1_9"></td>
                                <td id="p1_10"></td>
                                <td id="p1_11"></td>
                                <td id="p1_12"></td>
                                <td id="p1_13"></td>
                                <td id="p1_14"></td>
                                <td id="p1_15"></td>
                                <td id="p1_16"></td>
                                <td id="p1_17"></td>
                                <td id="p1_18"></td>
                                <td id="p1_19"></td>
                                <td id="p1_20"></td>
                                <td id="p1_21"></td>
                                <td id="p1_22"></td>
                                <td id="p1_23"></td>
                                <td id="p1_24"></td>
                                <td id="p1_25"></td>
                                <td id="p1_26"></td>
                                <td id="p1_27"></td>
                                <td id="p1_28"></td>
                                <td id="p1_29"></td>
                                <td id="p1_30"></td>
                                <td id="p1_31"></td>
                            </tr>
                            <tr id="p2">
                                <td>Limpiardores</td>
                                <td id="p2_1"></td>
                                <td id="p2_2"></td>
                                <td id="p2_3"></td>
                                <td id="p2_4"></td>
                                <td id="p2_5"></td>
                                <td id="p2_6"></td>
                                <td id="p2_7"></td>
                                <td id="p2_8"></td>
                                <td id="p2_9"></td>

                                <td id="p2_10"></td>
                                <td id="p2_11"></td>
                                <td id="p2_12"></td>
                                <td id="p2_13"></td>
                                <td id="p2_14"></td>
                                <td id="p2_15"></td>
                                <td id="p2_16"></td>
                                <td id="p2_17"></td>
                                <td id="p2_18"></td>
                                <td id="p2_19"></td>
                                <td id="p2_20"></td>
                                <td id="p2_21"></td>
                                <td id="p2_22"></td>
                                <td id="p2_23"></td>
                                <td id="p2_24"></td>
                                <td id="p2_25"></td>
                                <td id="p2_26"></td>
                                <td id="p2_27"></td>
                                <td id="p2_28"></td>
                                <td id="p2_29"></td>
                                <td id="p2_30"></td>
                                <td id="p2_31"></td>
                            </tr>
                            <tr id="p3">
                                <td>Cuernos</td>
                                <td id="p3_1"></td>
                                <td id="p3_2"></td>
                                <td id="p3_3"></td>
                                <td id="p3_4"></td>
                                <td id="p3_5"></td>
                                <td id="p3_6"></td>
                                <td id="p3_7"></td>
                                <td id="p3_8"></td>
                                <td id="p3_9"></td>
                                <td id="p3_10"></td>
                                <td id="p3_11"></td>
                                <td id="p3_12"></td>
                                <td id="p3_13"></td>
                                <td id="p3_14"></td>
                                <td id="p3_15"></td>
                                <td id="p3_16"></td>
                                <td id="p3_17"></td>
                                <td id="p3_18"></td>
                                <td id="p3_19"></td>
                                <td id="p3_20"></td>
                                <td id="p3_21"></td>
                                <td id="p3_22"></td>
                                <td id="p3_23"></td>
                                <td id="p3_24"></td>
                                <td id="p3_25"></td>
                                <td id="p3_26"></td>
                                <td id="p3_27"></td>
                                <td id="p3_28"></td>
                                <td id="p3_29"></td>
                                <td id="p3_30"></td>
                                <td id="p3_31"></td>
                            </tr>
                            <tr id="p4">
                                <td>Luces</td>
                                <td id="p4_1"></td>
                                <td id="p4_2"></td>
                                <td id="p4_3"></td>
                                <td id="p4_4"></td>
                                <td id="p4_5"></td>
                                <td id="p4_6"></td>
                                <td id="p4_7"></td>
                                <td id="p4_8"></td>
                                <td id="p4_9"></td>
                                <td id="p4_10"></td>
                                <td id="p4_11"></td>
                                <td id="p4_12"></td>
                                <td id="p4_13"></td>
                                <td id="p4_14"></td>
                                <td id="p4_15"></td>
                                <td id="p4_16"></td>
                                <td id="p4_17"></td>
                                <td id="p4_18"></td>
                                <td id="p4_19"></td>
                                <td id="p4_20"></td>
                                <td id="p4_21"></td>
                                <td id="p4_22"></td>
                                <td id="p4_23"></td>
                                <td id="p4_24"></td>
                                <td id="p4_25"></td>
                                <td id="p4_26"></td>
                                <td id="p4_27"></td>
                                <td id="p4_28"></td>
                                <td id="p4_29"></td>
                                <td id="p4_30"></td>
                                <td id="p4_31"></td>
                            </tr>
                            <tr id="p5">
                                <td>Espejos Laterales</td>
                                <td id="p5_1"></td>
                                <td id="p5_2"></td>
                                <td id="p5_3"></td>
                                <td id="p5_4"></td>
                                <td id="p5_5"></td>
                                <td id="p5_6"></td>
                                <td id="p5_7"></td>
                                <td id="p5_8"></td>
                                <td id="p5_9"></td>
                                <td id="p5_10"></td>
                                <td id="p5_11"></td>
                                <td id="p5_12"></td>
                                <td id="p5_13"></td>
                                <td id="p5_14"></td>
                                <td id="p5_15"></td>
                                <td id="p5_16"></td>
                                <td id="p5_17"></td>
                                <td id="p5_18"></td>
                                <td id="p5_19"></td>
                                <td id="p5_20"></td>
                                <td id="p5_21"></td>
                                <td id="p5_22"></td>
                                <td id="p5_23"></td>
                                <td id="p5_24"></td>
                                <td id="p5_25"></td>
                                <td id="p5_26"></td>
                                <td id="p5_27"></td>
                                <td id="p5_28"></td>
                                <td id="p5_29"></td>
                                <td id="p5_30"></td>
                                <td id="p5_31"></td>
                            </tr>
                            <tr id="p6">
                                <td>Calcomania (no de bus)</td>
                                <td id="p6_1"></td>
                                <td id="p6_2"></td>
                                <td id="p6_3"></td>
                                <td id="p6_4"></td>
                                <td id="p6_5"></td>
                                <td id="p6_6"></td>
                                <td id="p6_7"></td>
                                <td id="p6_8"></td>
                                <td id="p6_9"></td>
                                <td id="p6_10"></td>
                                <td id="p6_11"></td>
                                <td id="p6_12"></td>
                                <td id="p6_13"></td>
                                <td id="p6_14"></td>
                                <td id="p6_15"></td>
                                <td id="p6_16"></td>
                                <td id="p6_17"></td>
                                <td id="p6_18"></td>
                                <td id="p6_19"></td>
                                <td id="p6_20"></td>
                                <td id="p6_21"></td>
                                <td id="p6_22"></td>
                                <td id="p6_23"></td>
                                <td id="p6_24"></td>
                                <td id="p6_25"></td>
                                <td id="p6_26"></td>
                                <td id="p6_27"></td>
                                <td id="p6_28"></td>
                                <td id="p6_29"></td>
                                <td id="p6_30"></td>
                                <td id="p6_31"></td>
                            </tr>
                        </table>
		            </p>
	            </div>
	            <h3><a href="#">Lado Derecho</a></h3>
	            <div>
		            <p>
		                <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="ld1">
                                <td>Ventanillas</td>
                                <td id="ld1_1"></td>
                                <td id="ld1_2"></td>
                                <td id="ld1_3"></td>
                                <td id="ld1_4"></td>
                                <td id="ld1_5"></td>
                                <td id="ld1_6"></td>
                                <td id="ld1_7"></td>
                                <td id="ld1_8"></td>
                                <td id="ld1_9"></td>
                                <td id="ld1_10"></td>
                                <td id="ld1_11"></td>
                                <td id="ld1_12"></td>
                                <td id="ld1_13"></td>
                                <td id="ld1_14"></td>
                                <td id="ld1_15"></td>
                                <td id="ld1_16"></td>
                                <td id="ld1_17"></td>
                                <td id="ld1_18"></td>
                                <td id="ld1_19"></td>
                                <td id="ld1_20"></td>
                                <td id="ld1_21"></td>
                                <td id="ld1_22"></td>
                                <td id="ld1_23"></td>
                                <td id="ld1_24"></td>
                                <td id="ld1_25"></td>
                                <td id="ld1_26"></td>
                                <td id="ld1_27"></td>
                                <td id="ld1_28"></td>
                                <td id="ld1_29"></td>
                                <td id="ld1_30"></td>
                                <td id="ld1_31"></td>
                            </tr>
                            <tr id="ld2">
                                <td>Puerta de Servicio</td>
                                <td id="ld2_1" ></td>
                                <td id="ld2_2" ></td>
                                <td id="ld2_3" ></td>
                                <td id="ld2_4" ></td>
                                <td id="ld2_5" ></td>
                                <td id="ld2_6" ></td>
                                <td id="ld2_7" ></td>
                                <td id="ld2_8" ></td>
                                <td id="ld2_9" ></td>
                                <td id="ld2_10"></td>
                                <td id="ld2_11"></td>
                                <td id="ld2_12"></td>
                                <td id="ld2_13"></td>
                                <td id="ld2_14"></td>
                                <td id="ld2_15"></td>
                                <td id="ld2_16"></td>
                                <td id="ld2_17"></td>
                                <td id="ld2_18"></td>
                                <td id="ld2_19"></td>
                                <td id="ld2_20"></td>
                                <td id="ld2_21"></td>
                                <td id="ld2_22"></td>
                                <td id="ld2_23"></td>
                                <td id="ld2_24"></td>
                                <td id="ld2_25"></td>
                                <td id="ld2_26"></td>
                                <td id="ld2_27"></td>
                                <td id="ld2_28"></td>
                                <td id="ld2_29"></td>
                                <td id="ld2_30"></td>
                                <td id="ld2_31"></td>
                            </tr>
                            <tr id="ld3">
                                <td>Baules</td>
                                <td id="ld3_1" ></td>
                                <td id="ld3_2" ></td>
                                <td id="ld3_3" ></td>
                                <td id="ld3_4" ></td>
                                <td id="ld3_5" ></td>
                                <td id="ld3_6" ></td>
                                <td id="ld3_7" ></td>
                                <td id="ld3_8" ></td>
                                <td id="ld3_9" ></td>
                                <td id="ld3_10"></td>
                                <td id="ld3_11"></td>
                                <td id="ld3_12"></td>
                                <td id="ld3_13"></td>
                                <td id="ld3_14"></td>
                                <td id="ld3_15"></td>
                                <td id="ld3_16"></td>
                                <td id="ld3_17"></td>
                                <td id="ld3_18"></td>
                                <td id="ld3_19"></td>
                                <td id="ld3_20"></td>
                                <td id="ld3_21"></td>
                                <td id="ld3_22"></td>
                                <td id="ld3_23"></td>
                                <td id="ld3_24"></td>
                                <td id="ld3_25"></td>
                                <td id="ld3_26"></td>
                                <td id="ld3_27"></td>
                                <td id="ld3_28"></td>
                                <td id="ld3_29"></td>
                                <td id="ld3_30"></td>
                                <td id="ld3_31"></td>
                            </tr>
                            <tr id="ld4">
                                <td>Compuarta Lateral Motor</td>
                                <td id="ld4_1" ></td>
                                <td id="ld4_2" ></td>
                                <td id="ld4_3" ></td>
                                <td id="ld4_4" ></td>
                                <td id="ld4_5" ></td>
                                <td id="ld4_6" ></td>
                                <td id="ld4_7" ></td>
                                <td id="ld4_8" ></td>
                                <td id="ld4_9" ></td>
                                <td id="ld4_10"></td>
                                <td id="ld4_11"></td>
                                <td id="ld4_12"></td>
                                <td id="ld4_13"></td>
                                <td id="ld4_14"></td>
                                <td id="ld4_15"></td>
                                <td id="ld4_16"></td>
                                <td id="ld4_17"></td>
                                <td id="ld4_18"></td>
                                <td id="ld4_19"></td>
                                <td id="ld4_20"></td>
                                <td id="ld4_21"></td>
                                <td id="ld4_22"></td>
                                <td id="ld4_23"></td>
                                <td id="ld4_24"></td>
                                <td id="ld4_25"></td>
                                <td id="ld4_26"></td>
                                <td id="ld4_27"></td>
                                <td id="ld4_28"></td>
                                <td id="ld4_29"></td>
                                <td id="ld4_30"></td>
                                <td id="ld4_31"></td>
                            </tr>
                            <tr id="ld5">
                                <td>Compuarta Lateral de Bateria</td>
                                <td id="ld5_1" ></td>
                                <td id="ld5_2" ></td>
                                <td id="ld5_3" ></td>
                                <td id="ld5_4" ></td>
                                <td id="ld5_5" ></td>
                                <td id="ld5_6" ></td>
                                <td id="ld5_7" ></td>
                                <td id="ld5_8" ></td>
                                <td id="ld5_9" ></td>
                                <td id="ld5_10"></td>
                                <td id="ld5_11"></td>
                                <td id="ld5_12"></td>
                                <td id="ld5_13"></td>
                                <td id="ld5_14"></td>
                                <td id="ld5_15"></td>
                                <td id="ld5_16"></td>
                                <td id="ld5_17"></td>
                                <td id="ld5_18"></td>
                                <td id="ld5_19"></td>
                                <td id="ld5_20"></td>
                                <td id="ld5_21"></td>
                                <td id="ld5_22"></td>
                                <td id="ld5_23"></td>
                                <td id="ld5_24"></td>
                                <td id="ld5_25"></td>
                                <td id="ld5_26"></td>
                                <td id="ld5_27"></td>
                                <td id="ld5_28"></td>
                                <td id="ld5_29"></td>
                                <td id="ld5_30"></td>
                                <td id="ld5_31"></td>
                            </tr>
                        </table>
		            </p>
	            </div>
	            <h3><a href="#">Lado Izquierdo</a></h3>
	            <div>
		            <p>
                        <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="li1">
                                <td>Ventanillas</td>
                                <td id="li1_1"></td>
                                <td id="li1_2"></td>
                                <td id="li1_3"></td>
                                <td id="li1_4"></td>
                                <td id="li1_5"></td>
                                <td id="li1_6"></td>
                                <td id="li1_7"></td>
                                <td id="li1_8"></td>
                                <td id="li1_9"></td>
                                <td id="li1_10"></td>
                                <td id="li1_11"></td>
                                <td id="li1_12"></td>
                                <td id="li1_13"></td>
                                <td id="li1_14"></td>
                                <td id="li1_15"></td>
                                <td id="li1_16"></td>
                                <td id="li1_17"></td>
                                <td id="li1_18"></td>
                                <td id="li1_19"></td>
                                <td id="li1_20"></td>
                                <td id="li1_21"></td>
                                <td id="li1_22"></td>
                                <td id="li1_23"></td>
                                <td id="li1_24"></td>
                                <td id="li1_25"></td>
                                <td id="li1_26"></td>
                                <td id="li1_27"></td>
                                <td id="li1_28"></td>
                                <td id="li1_29"></td>
                                <td id="li1_30"></td>
                                <td id="li1_31"></td>
                            </tr>
                            <tr id="li2">
                                <td>Puerta de Servicio</td>
                                <td id="li2_1"></td>
                                <td id="li2_2"></td>
                                <td id="li2_3"></td>
                                <td id="li2_4"></td>
                                <td id="li2_5"></td>
                                <td id="li2_6"></td>
                                <td id="li2_7"></td>
                                <td id="li2_8"></td>
                                <td id="li2_9"></td>
                                <td id="li2_10"></td>
                                <td id="li2_11"></td>
                                <td id="li2_12"></td>
                                <td id="li2_13"></td>
                                <td id="li2_14"></td>
                                <td id="li2_15"></td>
                                <td id="li2_16"></td>
                                <td id="li2_17"></td>
                                <td id="li2_18"></td>
                                <td id="li2_19"></td>
                                <td id="li2_20"></td>
                                <td id="li2_21"></td>
                                <td id="li2_22"></td>
                                <td id="li2_23"></td>
                                <td id="li2_24"></td>
                                <td id="li2_25"></td>
                                <td id="li2_26"></td>
                                <td id="li2_27"></td>
                                <td id="li2_28"></td>
                                <td id="li2_29"></td>
                                <td id="li2_30"></td>
                                <td id="li2_31"></td>
                            </tr>
                            <tr id="li3">
                                <td>Baules</td>
                                <td id="li3_1"></td>
                                <td id="li3_2"></td>
                                <td id="li3_3"></td>
                                <td id="li3_4"></td>
                                <td id="li3_5"></td>
                                <td id="li3_6"></td>
                                <td id="li3_7"></td>
                                <td id="li3_8"></td>
                                <td id="li3_9"></td>
                                <td id="li3_10"></td>
                                <td id="li3_11"></td>
                                <td id="li3_12"></td>
                                <td id="li3_13"></td>
                                <td id="li3_14"></td>
                                <td id="li3_15"></td>
                                <td id="li3_16"></td>
                                <td id="li3_17"></td>
                                <td id="li3_18"></td>
                                <td id="li3_19"></td>
                                <td id="li3_20"></td>
                                <td id="li3_21"></td>
                                <td id="li3_22"></td>
                                <td id="li3_23"></td>
                                <td id="li3_24"></td>
                                <td id="li3_25"></td>
                                <td id="li3_26"></td>
                                <td id="li3_27"></td>
                                <td id="li3_28"></td>
                                <td id="li3_29"></td>
                                <td id="li3_30"></td>
                                <td id="li3_31"></td>
                            </tr>
                            <tr id="li4">
                                <td>Compuarta Lateral Motor</td>
                                <td id="li4_1"></td>
                                <td id="li4_2"></td>
                                <td id="li4_3"></td>
                                <td id="li4_4"></td>
                                <td id="li4_5"></td>
                                <td id="li4_6"></td>
                                <td id="li4_7"></td>
                                <td id="li4_8"></td>
                                <td id="li4_9"></td>
                                <td id="li4_10"></td>
                                <td id="li4_11"></td>
                                <td id="li4_12"></td>
                                <td id="li4_13"></td>
                                <td id="li4_14"></td>
                                <td id="li4_15"></td>
                                <td id="li4_16"></td>
                                <td id="li4_17"></td>
                                <td id="li4_18"></td>
                                <td id="li4_19"></td>
                                <td id="li4_20"></td>
                                <td id="li4_21"></td>
                                <td id="li4_22"></td>
                                <td id="li4_23"></td>
                                <td id="li4_24"></td>
                                <td id="li4_25"></td>
                                <td id="li4_26"></td>
                                <td id="li4_27"></td>
                                <td id="li4_28"></td>
                                <td id="li4_29"></td>
                                <td id="li4_30"></td>
                                <td id="li4_31"></td>
                            </tr>
                            <tr id="li5">
                                <td>Compuarta Lateral de Bateria</td>
                                <td id="li5_1"></td>
                                <td id="li5_2"></td>
                                <td id="li5_3"></td>
                                <td id="li5_4"></td>
                                <td id="li5_5"></td>
                                <td id="li5_6"></td>
                                <td id="li5_7"></td>
                                <td id="li5_8"></td>
                                <td id="li5_9"></td>
                                <td id="li5_10"></td>
                                <td id="li5_11"></td>
                                <td id="li5_12"></td>
                                <td id="li5_13"></td>
                                <td id="li5_14"></td>
                                <td id="li5_15"></td>
                                <td id="li5_16"></td>
                                <td id="li5_17"></td>
                                <td id="li5_18"></td>
                                <td id="li5_19"></td>
                                <td id="li5_20"></td>
                                <td id="li5_21"></td>
                                <td id="li5_22"></td>
                                <td id="li5_23"></td>
                                <td id="li5_24"></td>
                                <td id="li5_25"></td>
                                <td id="li5_26"></td>
                                <td id="li5_27"></td>
                                <td id="li5_28"></td>
                                <td id="li5_29"></td>
                                <td id="li5_30"></td>
                                <td id="li5_31"></td>
                            </tr>
                        </table>
		            </p>
	            </div>
	            <h3><a href="#">Parte Posterior</a></h3>
	            <div>
		            <p>
		                <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="po1">
                                <td>Defensa</td>
                                <td id="po1_1"></td>
                                <td id="po1_2"></td>
                                <td id="po1_3"></td>
                                <td id="po1_4"></td>
                                <td id="po1_5"></td>
                                <td id="po1_6"></td>
                                <td id="po1_7"></td>
                                <td id="po1_8"></td>
                                <td id="po1_9"></td>
                                <td id="po1_10"></td>
                                <td id="po1_11"></td>
                                <td id="po1_12"></td>
                                <td id="po1_13"></td>
                                <td id="po1_14"></td>
                                <td id="po1_15"></td>
                                <td id="po1_16"></td>
                                <td id="po1_17"></td>
                                <td id="po1_18"></td>
                                <td id="po1_19"></td>
                                <td id="po1_20"></td>
                                <td id="po1_21"></td>
                                <td id="po1_22"></td>
                                <td id="po1_23"></td>
                                <td id="po1_24"></td>
                                <td id="po1_25"></td>
                                <td id="po1_26"></td>
                                <td id="po1_27"></td>
                                <td id="po1_28"></td>
                                <td id="po1_29"></td>
                                <td id="po1_30"></td>
                                <td id="po1_31"></td>
                            </tr>
                            <tr id="po2">
                                <td>Luces</td>
                                <td id="po2_1"></td>
                                <td id="po2_2"></td>
                                <td id="po2_3"></td>
                                <td id="po2_4"></td>
                                <td id="po2_5"></td>
                                <td id="po2_6"></td>
                                <td id="po2_7"></td>
                                <td id="po2_8"></td>
                                <td id="po2_9"></td>
                                <td id="po2_10"></td>
                                <td id="po2_11"></td>
                                <td id="po2_12"></td>
                                <td id="po2_13"></td>
                                <td id="po2_14"></td>
                                <td id="po2_15"></td>
                                <td id="po2_16"></td>
                                <td id="po2_17"></td>
                                <td id="po2_18"></td>
                                <td id="po2_19"></td>
                                <td id="po2_20"></td>
                                <td id="po2_21"></td>
                                <td id="po2_22"></td>
                                <td id="po2_23"></td>
                                <td id="po2_24"></td>
                                <td id="po2_25"></td>
                                <td id="po2_26"></td>
                                <td id="po2_27"></td>
                                <td id="po2_28"></td>
                                <td id="po2_29"></td>
                                <td id="po2_30"></td>
                                <td id="po2_31"></td>
                            </tr>
                            <tr id="po3">
                                <td>Postes</td>
                                <td id="po3_1"></td>
                                <td id="po3_2"></td>
                                <td id="po3_3"></td>
                                <td id="po3_4"></td>
                                <td id="po3_5"></td>
                                <td id="po3_6"></td>
                                <td id="po3_7"></td>
                                <td id="po3_8"></td>
                                <td id="po3_9"></td>
                                <td id="po3_10"></td>
                                <td id="po3_11"></td>
                                <td id="po3_12"></td>
                                <td id="po3_13"></td>
                                <td id="po3_14"></td>
                                <td id="po3_15"></td>
                                <td id="po3_16"></td>
                                <td id="po3_17"></td>
                                <td id="po3_18"></td>
                                <td id="po3_19"></td>
                                <td id="po3_20"></td>
                                <td id="po3_21"></td>
                                <td id="po3_22"></td>
                                <td id="po3_23"></td>
                                <td id="po3_24"></td>
                                <td id="po3_25"></td>
                                <td id="po3_26"></td>
                                <td id="po3_27"></td>
                                <td id="po3_28"></td>
                                <td id="po3_29"></td>
                                <td id="po3_30"></td>
                                <td id="po3_31"></td>
                            </tr>
                            <tr id="po4">
                                <td>Ventanilla</td>
                                <td id="po4_1"></td>
                                <td id="po4_2"></td>
                                <td id="po4_3"></td>
                                <td id="po4_4"></td>
                                <td id="po4_5"></td>
                                <td id="po4_6"></td>
                                <td id="po4_7"></td>
                                <td id="po4_8"></td>
                                <td id="po4_9"></td>
                                <td id="po4_10"></td>
                                <td id="po4_11"></td>
                                <td id="po4_12"></td>
                                <td id="po4_13"></td>
                                <td id="po4_14"></td>
                                <td id="po4_15"></td>
                                <td id="po4_16"></td>
                                <td id="po4_17"></td>
                                <td id="po4_18"></td>
                                <td id="po4_19"></td>
                                <td id="po4_20"></td>
                                <td id="po4_21"></td>
                                <td id="po4_22"></td>
                                <td id="po4_23"></td>
                                <td id="po4_24"></td>
                                <td id="po4_25"></td>
                                <td id="po4_26"></td>
                                <td id="po4_27"></td>
                                <td id="po4_28"></td>
                                <td id="po4_29"></td>
                                <td id="po4_30"></td>
                                <td id="po4_31"></td>
                            </tr>
                            <tr id="po5">
                                <td>Calcomania Publicitaria</td>
                                <td id="po5_1"></td>
                                <td id="po5_2"></td>
                                <td id="po5_3"></td>
                                <td id="po5_4"></td>
                                <td id="po5_5"></td>
                                <td id="po5_6"></td>
                                <td id="po5_7"></td>
                                <td id="po5_8"></td>
                                <td id="po5_9"></td>
                                <td id="po5_10"></td>
                                <td id="po5_11"></td>
                                <td id="po5_12"></td>
                                <td id="po5_13"></td>
                                <td id="po5_14"></td>
                                <td id="po5_15"></td>
                                <td id="po5_16"></td>
                                <td id="po5_17"></td>
                                <td id="po5_18"></td>
                                <td id="po5_19"></td>
                                <td id="po5_20"></td>
                                <td id="po5_21"></td>
                                <td id="po5_22"></td>
                                <td id="po5_23"></td>
                                <td id="po5_24"></td>
                                <td id="po5_25"></td>
                                <td id="po5_26"></td>
                                <td id="po5_27"></td>
                                <td id="po5_28"></td>
                                <td id="po5_29"></td>
                                <td id="po5_30"></td>
                                <td id="po5_31"></td>
                            </tr>
                            <tr id="po6">
                                <td>Tapa de Motor</td>
                                <td id="po6_1"></td>
                                <td id="po6_2"></td>
                                <td id="po6_3"></td>
                                <td id="po6_4"></td>
                                <td id="po6_5"></td>
                                <td id="po6_6"></td>
                                <td id="po6_7"></td>
                                <td id="po6_8"></td>
                                <td id="po6_9"></td>
                                <td id="po6_10"></td>
                                <td id="po6_11"></td>
                                <td id="po6_12"></td>
                                <td id="po6_13"></td>
                                <td id="po6_14"></td>
                                <td id="po6_15"></td>
                                <td id="po6_16"></td>
                                <td id="po6_17"></td>
                                <td id="po6_18"></td>
                                <td id="po6_19"></td>
                                <td id="po6_20"></td>
                                <td id="po6_21"></td>
                                <td id="po6_22"></td>
                                <td id="po6_23"></td>
                                <td id="po6_24"></td>
                                <td id="po6_25"></td>
                                <td id="po6_26"></td>
                                <td id="po6_27"></td>
                                <td id="po6_28"></td>
                                <td id="po6_29"></td>
                                <td id="po6_30"></td>
                                <td id="po6_31"></td>
                            </tr>
                        </table>
		            </p>
	            </div>
                <h3><a href="#">Interior</a></h3>
	            <div>
		            <p>
		                <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="i1">
                                <td>Video / DVD</td>
                                <td id="i1_1"></td>
                                <td id="i1_2"></td>
                                <td id="i1_3"></td>
                                <td id="i1_4"></td>
                                <td id="i1_5"></td>
                                <td id="i1_6"></td>
                                <td id="i1_7"></td>
                                <td id="i1_8"></td>
                                <td id="i1_9"></td>
                                <td id="i1_10"></td>
                                <td id="i1_11"></td>
                                <td id="i1_12"></td>
                                <td id="i1_13"></td>
                                <td id="i1_14"></td>
                                <td id="i1_15"></td>
                                <td id="i1_16"></td>
                                <td id="i1_17"></td>
                                <td id="i1_18"></td>
                                <td id="i1_19"></td>
                                <td id="i1_20"></td>
                                <td id="i1_21"></td>
                                <td id="i1_22"></td>
                                <td id="i1_23"></td>
                                <td id="i1_24"></td>
                                <td id="i1_25"></td>
                                <td id="i1_26"></td>
                                <td id="i1_27"></td>
                                <td id="i1_28"></td>
                                <td id="i1_29"></td>
                                <td id="i1_30"></td>
                                <td id="i1_31"></td>
                            </tr>
                            <tr id="i2">
                                <td>Monitores/Pantallas</td>
                                <td id="i2_1"></td>
                                <td id="i2_2"></td>
                                <td id="i2_3"></td>
                                <td id="i2_4"></td>
                                <td id="i2_5"></td>
                                <td id="i2_6"></td>
                                <td id="i2_7"></td>
                                <td id="i2_8"></td>
                                <td id="i2_9"></td>
                                <td id="i2_10"></td>
                                <td id="i2_11"></td>
                                <td id="i2_12"></td>
                                <td id="i2_13"></td>
                                <td id="i2_14"></td>
                                <td id="i2_15"></td>
                                <td id="i2_16"></td>
                                <td id="i2_17"></td>
                                <td id="i2_18"></td>
                                <td id="i2_19"></td>
                                <td id="i2_20"></td>
                                <td id="i2_21"></td>
                                <td id="i2_22"></td>
                                <td id="i2_23"></td>
                                <td id="i2_24"></td>
                                <td id="i2_25"></td>
                                <td id="i2_26"></td>
                                <td id="i2_27"></td>
                                <td id="i2_28"></td>
                                <td id="i2_29"></td>
                                <td id="i2_30"></td>
                                <td id="i2_31"></td>
                            </tr>
                            <tr id="i3">
                                <td>Stereo/Micrófonos</td>
                                <td id="i3_1"></td>
                                <td id="i3_2"></td>
                                <td id="i3_3"></td>
                                <td id="i3_4"></td>
                                <td id="i3_5"></td>
                                <td id="i3_6"></td>
                                <td id="i3_7"></td>
                                <td id="i3_8"></td>
                                <td id="i3_9"></td>
                                <td id="i3_10"></td>
                                <td id="i3_11"></td>
                                <td id="i3_12"></td>
                                <td id="i3_13"></td>
                                <td id="i3_14"></td>
                                <td id="i3_15"></td>
                                <td id="i3_16"></td>
                                <td id="i3_17"></td>
                                <td id="i3_18"></td>
                                <td id="i3_19"></td>
                                <td id="i3_20"></td>
                                <td id="i3_21"></td>
                                <td id="i3_22"></td>
                                <td id="i3_23"></td>
                                <td id="i3_24"></td>
                                <td id="i3_25"></td>
                                <td id="i3_26"></td>
                                <td id="i3_27"></td>
                                <td id="i3_28"></td>
                                <td id="i3_29"></td>
                                <td id="i3_30"></td>
                                <td id="i3_31"></td>
                            </tr>
                            <tr id="i4">
                                <td>Butacas</td>
                                <td id="i4_1"></td>
                                <td id="i4_2"></td>
                                <td id="i4_3"></td>
                                <td id="i4_4"></td>
                                <td id="i4_5"></td>
                                <td id="i4_6"></td>
                                <td id="i4_7"></td>
                                <td id="i4_8"></td>
                                <td id="i4_9"></td>
                                <td id="i4_10"></td>
                                <td id="i4_11"></td>
                                <td id="i4_12"></td>
                                <td id="i4_13"></td>
                                <td id="i4_14"></td>
                                <td id="i4_15"></td>
                                <td id="i4_16"></td>
                                <td id="i4_17"></td>
                                <td id="i4_18"></td>
                                <td id="i4_19"></td>
                                <td id="i4_20"></td>
                                <td id="i4_21"></td>
                                <td id="i4_22"></td>
                                <td id="i4_23"></td>
                                <td id="i4_24"></td>
                                <td id="i4_25"></td>
                                <td id="i4_26"></td>
                                <td id="i4_27"></td>
                                <td id="i4_28"></td>
                                <td id="i4_29"></td>
                                <td id="i4_30"></td>
                                <td id="i4_31"></td>
                            </tr>
                            <tr id="i5">
                                <td>Aire Acondicionado</td>
                                <td id="i5_1"></td>
                                <td id="i5_2"></td>
                                <td id="i5_3"></td>
                                <td id="i5_4"></td>
                                <td id="i5_5"></td>
                                <td id="i5_6"></td>
                                <td id="i5_7"></td>
                                <td id="i5_8"></td>
                                <td id="i5_9"></td>
                                <td id="i5_10"></td>
                                <td id="i5_11"></td>
                                <td id="i5_12"></td>
                                <td id="i5_13"></td>
                                <td id="i5_14"></td>
                                <td id="i5_15"></td>
                                <td id="i5_16"></td>
                                <td id="i5_17"></td>
                                <td id="i5_18"></td>
                                <td id="i5_19"></td>
                                <td id="i5_20"></td>
                                <td id="i5_21"></td>
                                <td id="i5_22"></td>
                                <td id="i5_23"></td>
                                <td id="i5_24"></td>
                                <td id="i5_25"></td>
                                <td id="i5_26"></td>
                                <td id="i5_27"></td>
                                <td id="i5_28"></td>
                                <td id="i5_29"></td>
                                <td id="i5_30"></td>
                                <td id="i5_31"></td>
                            </tr>
                            <tr id="i6">
                                <td>Luces</td>
                                <td id="i6_1"></td>
                                <td id="i6_2"></td>
                                <td id="i6_3"></td>
                                <td id="i6_4"></td>
                                <td id="i6_5"></td>
                                <td id="i6_6"></td>
                                <td id="i6_7"></td>
                                <td id="i6_8"></td>
                                <td id="i6_9"></td>
                                <td id="i6_10"></td>
                                <td id="i6_11"></td>
                                <td id="i6_12"></td>
                                <td id="i6_13"></td>
                                <td id="i6_14"></td>
                                <td id="i6_15"></td>
                                <td id="i6_16"></td>
                                <td id="i6_17"></td>
                                <td id="i6_18"></td>
                                <td id="i6_19"></td>
                                <td id="i6_20"></td>
                                <td id="i6_21"></td>
                                <td id="i6_22"></td>
                                <td id="i6_23"></td>
                                <td id="i6_24"></td>
                                <td id="i6_25"></td>
                                <td id="i6_26"></td>
                                <td id="i6_27"></td>
                                <td id="i6_28"></td>
                                <td id="i6_29"></td>
                                <td id="i6_30"></td>
                                <td id="i6_31"></td>
                            </tr>
                            <tr id="i7">
                                <td>Fundas y Cortinas</td>
                                <td id="i7_1"></td>
                                <td id="i7_2"></td>
                                <td id="i7_3"></td>
                                <td id="i7_4"></td>
                                <td id="i7_5"></td>
                                <td id="i7_6"></td>
                                <td id="i7_7"></td>
                                <td id="i7_8"></td>
                                <td id="i7_9"></td>
                                <td id="i7_10"></td>
                                <td id="i7_11"></td>
                                <td id="i7_12"></td>
                                <td id="i7_13"></td>
                                <td id="i7_14"></td>
                                <td id="i7_15"></td>
                                <td id="i7_16"></td>
                                <td id="i7_17"></td>
                                <td id="i7_18"></td>
                                <td id="i7_19"></td>
                                <td id="i7_20"></td>
                                <td id="i7_21"></td>
                                <td id="i7_22"></td>
                                <td id="i7_23"></td>
                                <td id="i7_24"></td>
                                <td id="i7_25"></td>
                                <td id="i7_26"></td>
                                <td id="i7_27"></td>
                                <td id="i7_28"></td>
                                <td id="i7_29"></td>
                                <td id="i7_30"></td>
                                <td id="i7_31"></td>
                            </tr>
                            <tr id="i8">
                                <td>Baño</td>
                                <td id="i8_1"></td>
                                <td id="i8_2"></td>
                                <td id="i8_3"></td>
                                <td id="i8_4"></td>
                                <td id="i8_5"></td>
                                <td id="i8_6"></td>
                                <td id="i8_7"></td>
                                <td id="i8_8"></td>
                                <td id="i8_9"></td>
                                <td id="i8_10"></td>
                                <td id="i8_11"></td>
                                <td id="i8_12"></td>
                                <td id="i8_13"></td>
                                <td id="i8_14"></td>
                                <td id="i8_15"></td>
                                <td id="i8_16"></td>
                                <td id="i8_17"></td>
                                <td id="i8_18"></td>
                                <td id="i8_19"></td>
                                <td id="i8_20"></td>
                                <td id="i8_21"></td>
                                <td id="i8_22"></td>
                                <td id="i8_23"></td>
                                <td id="i8_24"></td>
                                <td id="i8_25"></td>
                                <td id="i8_26"></td>
                                <td id="i8_27"></td>
                                <td id="i8_28"></td>
                                <td id="i8_29"></td>
                                <td id="i8_30"></td>
                                <td id="i8_31"></td>
                            </tr>
                        </table>
		            </p>
	            </div>
                <h3><a href="#">Equipo de Seguridad</a></h3>
	            <div>
		            <p>
		                <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="es1">
                                <td>Botiquín</td>
                                <td id="es1_1"></td>
                                <td id="es1_2"></td>
                                <td id="es1_3"></td>
                                <td id="es1_4"></td>
                                <td id="es1_5"></td>
                                <td id="es1_6"></td>
                                <td id="es1_7"></td>
                                <td id="es1_8"></td>
                                <td id="es1_9"></td>
                                <td id="es1_10"></td>
                                <td id="es1_11"></td>
                                <td id="es1_12"></td>
                                <td id="es1_13"></td>
                                <td id="es1_14"></td>
                                <td id="es1_15"></td>
                                <td id="es1_16"></td>
                                <td id="es1_17"></td>
                                <td id="es1_18"></td>
                                <td id="es1_19"></td>
                                <td id="es1_20"></td>
                                <td id="es1_21"></td>
                                <td id="es1_22"></td>
                                <td id="es1_23"></td>
                                <td id="es1_24"></td>
                                <td id="es1_25"></td>
                                <td id="es1_26"></td>
                                <td id="es1_27"></td>
                                <td id="es1_28"></td>
                                <td id="es1_29"></td>
                                <td id="es1_30"></td>
                                <td id="es1_31"></td>
                            </tr>
                            <tr id="es2">
                                <td>Extinguidor</td>
                                <td id="es2_1"></td>
                                <td id="es2_2"></td>
                                <td id="es2_3"></td>
                                <td id="es2_4"></td>
                                <td id="es2_5"></td>
                                <td id="es2_6"></td>
                                <td id="es2_7"></td>
                                <td id="es2_8"></td>
                                <td id="es2_9"></td>
                                <td id="es2_10"></td>
                                <td id="es2_11"></td>
                                <td id="es2_12"></td>
                                <td id="es2_13"></td>
                                <td id="es2_14"></td>
                                <td id="es2_15"></td>
                                <td id="es2_16"></td>
                                <td id="es2_17"></td>
                                <td id="es2_18"></td>
                                <td id="es2_19"></td>
                                <td id="es2_20"></td>
                                <td id="es2_21"></td>
                                <td id="es2_22"></td>
                                <td id="es2_23"></td>
                                <td id="es2_24"></td>
                                <td id="es2_25"></td>
                                <td id="es2_26"></td>
                                <td id="es2_27"></td>
                                <td id="es2_28"></td>
                                <td id="es2_29"></td>
                                <td id="es2_30"></td>
                                <td id="es2_31"></td>
                            </tr>
                            <tr id="es3">
                                <td>Reflejantes</td>
                                <td id="es3_1"></td>
                                <td id="es3_2"></td>
                                <td id="es3_3"></td>
                                <td id="es3_4"></td>
                                <td id="es3_5"></td>
                                <td id="es3_6"></td>
                                <td id="es3_7"></td>
                                <td id="es3_8"></td>
                                <td id="es3_9"></td>
                                <td id="es3_10"></td>
                                <td id="es3_11"></td>
                                <td id="es3_12"></td>
                                <td id="es3_13"></td>
                                <td id="es3_14"></td>
                                <td id="es3_15"></td>
                                <td id="es3_16"></td>
                                <td id="es3_17"></td>
                                <td id="es3_18"></td>
                                <td id="es3_19"></td>
                                <td id="es3_20"></td>
                                <td id="es3_21"></td>
                                <td id="es3_22"></td>
                                <td id="es3_23"></td>
                                <td id="es3_24"></td>
                                <td id="es3_25"></td>
                                <td id="es3_26"></td>
                                <td id="es3_27"></td>
                                <td id="es3_28"></td>
                                <td id="es3_29"></td>
                                <td id="es3_30"></td>
                                <td id="es3_31"></td>
                            </tr>
                        </table>
		            </p>
	            </div>
                <h3><a href="#">Documentacion</a></h3>
	            <div>
		            <p>
		                <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="do1">
                                <td>Tarj. de Circulacion y placa</td>
                                <td id="do1_1"></td>
                                <td id="do1_2"></td>
                                <td id="do1_3"></td>
                                <td id="do1_4"></td>
                                <td id="do1_5"></td>
                                <td id="do1_6"></td>
                                <td id="do1_7"></td>
                                <td id="do1_8"></td>
                                <td id="do1_9"></td>
                                <td id="do1_10"></td>
                                <td id="do1_11"></td>
                                <td id="do1_12"></td>
                                <td id="do1_13"></td>
                                <td id="do1_14"></td>
                                <td id="do1_15"></td>
                                <td id="do1_16"></td>
                                <td id="do1_17"></td>
                                <td id="do1_18"></td>
                                <td id="do1_19"></td>
                                <td id="do1_20"></td>
                                <td id="do1_21"></td>
                                <td id="do1_22"></td>
                                <td id="do1_23"></td>
                                <td id="do1_24"></td>
                                <td id="do1_25"></td>
                                <td id="do1_26"></td>
                                <td id="do1_27"></td>
                                <td id="do1_28"></td>
                                <td id="do1_29"></td>
                                <td id="do1_30"></td>
                                <td id="do1_31"></td>
                            </tr>
                            <tr id="do2">
                                <td>Calcomania</td>
                                <td id="do2_1"></td>
                                <td id="do2_2"></td>
                                <td id="do2_3"></td>
                                <td id="do2_4"></td>
                                <td id="do2_5"></td>
                                <td id="do2_6"></td>
                                <td id="do2_7"></td>
                                <td id="do2_8"></td>
                                <td id="do2_9"></td>
                                <td id="do2_10"></td>
                                <td id="do2_11"></td>
                                <td id="do2_12"></td>
                                <td id="do2_13"></td>
                                <td id="do2_14"></td>
                                <td id="do2_15"></td>
                                <td id="do2_16"></td>
                                <td id="do2_17"></td>
                                <td id="do2_18"></td>
                                <td id="do2_19"></td>
                                <td id="do2_20"></td>
                                <td id="do2_21"></td>
                                <td id="do2_22"></td>
                                <td id="do2_23"></td>
                                <td id="do2_24"></td>
                                <td id="do2_25"></td>
                                <td id="do2_26"></td>
                                <td id="do2_27"></td>
                                <td id="do2_28"></td>
                                <td id="do2_29"></td>
                                <td id="do2_30"></td>
                                <td id="do2_31"></td>
                            </tr>
                            <tr id="do3">
                                <td>Tarj. de operación o temporal</td>
                                <td id="do3_1"></td>
                                <td id="do3_2"></td>
                                <td id="do3_3"></td>
                                <td id="do3_4"></td>
                                <td id="do3_5"></td>
                                <td id="do3_6"></td>
                                <td id="do3_7"></td>
                                <td id="do3_8"></td>
                                <td id="do3_9"></td>
                                <td id="do3_10"></td>
                                <td id="do3_11"></td>
                                <td id="do3_12"></td>
                                <td id="do3_13"></td>
                                <td id="do3_14"></td>
                                <td id="do3_15"></td>
                                <td id="do3_16"></td>
                                <td id="do3_17"></td>
                                <td id="do3_18"></td>
                                <td id="do3_19"></td>
                                <td id="do3_20"></td>
                                <td id="do3_21"></td>
                                <td id="do3_22"></td>
                                <td id="do3_23"></td>
                                <td id="do3_24"></td>
                                <td id="do3_25"></td>
                                <td id="do3_26"></td>
                                <td id="do3_27"></td>
                                <td id="do3_28"></td>
                                <td id="do3_29"></td>
                                <td id="do3_30"></td>
                                <td id="do3_31"></td>
                            </tr>
                            <tr id="do4">
                                <td>Tarj. de rodaje</td>
                                <td id="do4_1"></td>
                                <td id="do4_2"></td>
                                <td id="do4_3"></td>
                                <td id="do4_4"></td>
                                <td id="do4_5"></td>
                                <td id="do4_6"></td>
                                <td id="do4_7"></td>
                                <td id="do4_8"></td>
                                <td id="do4_9"></td>
                                <td id="do4_10"></td>
                                <td id="do4_11"></td>
                                <td id="do4_12"></td>
                                <td id="do4_13"></td>
                                <td id="do4_14"></td>
                                <td id="do4_15"></td>
                                <td id="do4_16"></td>
                                <td id="do4_17"></td>
                                <td id="do4_18"></td>
                                <td id="do4_19"></td>
                                <td id="do4_20"></td>
                                <td id="do4_21"></td>
                                <td id="do4_22"></td>
                                <td id="do4_23"></td>
                                <td id="do4_24"></td>
                                <td id="do4_25"></td>
                                <td id="do4_26"></td>
                                <td id="do4_27"></td>
                                <td id="do4_28"></td>
                                <td id="do4_29"></td>
                                <td id="do4_30"></td>
                                <td id="do4_31"></td>
                            </tr>
                            <tr id="do5">
                                <td>Poliza de Seguro</td>
                                <td id="do5_1"></td>
                                <td id="do5_2"></td>
                                <td id="do5_3"></td>
                                <td id="do5_4"></td>
                                <td id="do5_5"></td>
                                <td id="do5_6"></td>
                                <td id="do5_7"></td>
                                <td id="do5_8"></td>
                                <td id="do5_9"></td>
                                <td id="do5_10"></td>
                                <td id="do5_11"></td>
                                <td id="do5_12"></td>
                                <td id="do5_13"></td>
                                <td id="do5_14"></td>
                                <td id="do5_15"></td>
                                <td id="do5_16"></td>
                                <td id="do5_17"></td>
                                <td id="do5_18"></td>
                                <td id="do5_19"></td>
                                <td id="do5_20"></td>
                                <td id="do5_21"></td>
                                <td id="do5_22"></td>
                                <td id="do5_23"></td>
                                <td id="do5_24"></td>
                                <td id="do5_25"></td>
                                <td id="do5_26"></td>
                                <td id="do5_27"></td>
                                <td id="do5_28"></td>
                                <td id="do5_29"></td>
                                <td id="do5_30"></td>
                                <td id="do5_31"></td>
                            </tr>
                            <tr id="do6">
                                <td>Licencia de piloto</td>
                                <td id="do16_1"></td>
                                <td id="do16_2"></td>
                                <td id="do16_3"></td>
                                <td id="do16_4"></td>
                                <td id="do16_5"></td>
                                <td id="do16_6"></td>
                                <td id="do16_7"></td>
                                <td id="do16_8"></td>
                                <td id="do16_9"></td>
                                <td id="do16_10"></td>
                                <td id="do16_11"></td>
                                <td id="do16_12"></td>
                                <td id="do16_13"></td>
                                <td id="do16_14"></td>
                                <td id="do16_15"></td>
                                <td id="do16_16"></td>
                                <td id="do16_17"></td>
                                <td id="do16_18"></td>
                                <td id="do16_19"></td>
                                <td id="do16_20"></td>
                                <td id="do16_21"></td>
                                <td id="do16_22"></td>
                                <td id="do16_23"></td>
                                <td id="do16_24"></td>
                                <td id="do16_25"></td>
                                <td id="do16_26"></td>
                                <td id="do16_27"></td>
                                <td id="do16_28"></td>
                                <td id="do16_29"></td>
                                <td id="do16_30"></td>
                                <td id="do16_31"></td>
                            </tr>
                        </table>
		            </p>
	            </div>
                <h3><a href="#">Herramienta</a></h3>
	            <div>
		            <p>
		                <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="he1">
                                <td>Tricket</td>
                                <td id="he1_1"></td>
                                <td id="he1_2"></td>
                                <td id="he1_3"></td>
                                <td id="he1_4"></td>
                                <td id="he1_5"></td>
                                <td id="he1_6"></td>
                                <td id="he1_7"></td>
                                <td id="he1_8"></td>
                                <td id="he1_9"></td>
                                <td id="he1_10"></td>
                                <td id="he1_11"></td>
                                <td id="he1_12"></td>
                                <td id="he1_13"></td>
                                <td id="he1_14"></td>
                                <td id="he1_15"></td>
                                <td id="he1_16"></td>
                                <td id="he1_17"></td>
                                <td id="he1_18"></td>
                                <td id="he1_19"></td>
                                <td id="he1_20"></td>
                                <td id="he1_21"></td>
                                <td id="he1_22"></td>
                                <td id="he1_23"></td>
                                <td id="he1_24"></td>
                                <td id="he1_25"></td>
                                <td id="he1_26"></td>
                                <td id="he1_27"></td>
                                <td id="he1_28"></td>
                                <td id="he1_29"></td>
                                <td id="he1_30"></td>
                                <td id="he1_31"></td>
                            </tr>
                            <tr id="he2">
                                <td>Llave de Chuchos</td>
                                <td id="he2_1"></td>
                                <td id="he2_2"></td>
                                <td id="he2_3"></td>
                                <td id="he2_4"></td>
                                <td id="he2_5"></td>
                                <td id="he2_6"></td>
                                <td id="he2_7"></td>
                                <td id="he2_8"></td>
                                <td id="he2_9"></td>
                                <td id="he2_10"></td>
                                <td id="he2_11"></td>
                                <td id="he2_12"></td>
                                <td id="he2_13"></td>
                                <td id="he2_14"></td>
                                <td id="he2_15"></td>
                                <td id="he2_16"></td>
                                <td id="he2_17"></td>
                                <td id="he2_18"></td>
                                <td id="he2_19"></td>
                                <td id="he2_20"></td>
                                <td id="he2_21"></td>
                                <td id="he2_22"></td>
                                <td id="he2_23"></td>
                                <td id="he2_24"></td>
                                <td id="he2_25"></td>
                                <td id="he2_26"></td>
                                <td id="he2_27"></td>
                                <td id="he2_28"></td>
                                <td id="he2_29"></td>
                                <td id="he2_30"></td>
                                <td id="he2_31"></td>
                            </tr>
                            <tr id="he3">
                                <td>Llanta de Repuesto</td>
                                <td id="he3_1" ></td>
                                <td id="he3_2" ></td>
                                <td id="he3_3" ></td>
                                <td id="he3_4" ></td>
                                <td id="he3_5" ></td>
                                <td id="he3_6" ></td>
                                <td id="he3_7" ></td>
                                <td id="he3_8" ></td>
                                <td id="he3_9" ></td>
                                <td id="he3_10"></td>
                                <td id="he3_11"></td>
                                <td id="he3_12"></td>
                                <td id="he3_13"></td>
                                <td id="he3_14"></td>
                                <td id="he3_15"></td>
                                <td id="he3_16"></td>
                                <td id="he3_17"></td>
                                <td id="he3_18"></td>
                                <td id="he3_19"></td>
                                <td id="he3_20"></td>
                                <td id="he3_21"></td>
                                <td id="he3_22"></td>
                                <td id="he3_23"></td>
                                <td id="he3_24"></td>
                                <td id="he3_25"></td>
                                <td id="he3_26"></td>
                                <td id="he3_27"></td>
                                <td id="he3_28"></td>
                                <td id="he3_29"></td>
                                <td id="he3_30"></td>
                                <td id="he3_31"></td>
                            </tr>
                            <tr id="he4">
                                <td>Conos o Triangulos</td>
                                <td id="he4_1" ></td>
                                <td id="he4_2" ></td>
                                <td id="he4_3" ></td>
                                <td id="he4_4" ></td>
                                <td id="he4_5" ></td>
                                <td id="he4_6" ></td>
                                <td id="he4_7" ></td>
                                <td id="he4_8" ></td>
                                <td id="he4_9" ></td>
                                <td id="he4_10"></td>
                                <td id="he4_11"></td>
                                <td id="he4_12"></td>
                                <td id="he4_13"></td>
                                <td id="he4_14"></td>
                                <td id="he4_15"></td>
                                <td id="he4_16"></td>
                                <td id="he4_17"></td>
                                <td id="he4_18"></td>
                                <td id="he4_19"></td>
                                <td id="he4_20"></td>
                                <td id="he4_21"></td>
                                <td id="he4_22"></td>
                                <td id="he4_23"></td>
                                <td id="he4_24"></td>
                                <td id="he4_25"></td>
                                <td id="he4_26"></td>
                                <td id="he4_27"></td>
                                <td id="he4_28"></td>
                                <td id="he4_29"></td>
                                <td id="he4_30"></td>
                                <td id="he4_31"></td>
                            </tr>
                            <tr id="he5">
                                <td>Equipo Vigia</td>
                                <td id="he5_1" ></td>
                                <td id="he5_2" ></td>
                                <td id="he5_3" ></td>
                                <td id="he5_4" ></td>
                                <td id="he5_5" ></td>
                                <td id="he5_6" ></td>
                                <td id="he5_7" ></td>
                                <td id="he5_8" ></td>
                                <td id="he5_9" ></td>
                                <td id="he5_10"></td>
                                <td id="he5_11"></td>
                                <td id="he5_12"></td>
                                <td id="he5_13"></td>
                                <td id="he5_14"></td>
                                <td id="he5_15"></td>
                                <td id="he5_16"></td>
                                <td id="he5_17"></td>
                                <td id="he5_18"></td>
                                <td id="he5_19"></td>
                                <td id="he5_20"></td>
                                <td id="he5_21"></td>
                                <td id="he5_22"></td>
                                <td id="he5_23"></td>
                                <td id="he5_24"></td>
                                <td id="he5_25"></td>
                                <td id="he5_26"></td>
                                <td id="he5_27"></td>
                                <td id="he5_28"></td>
                                <td id="he5_29"></td>
                                <td id="he5_30"></td>
                                <td id="he5_31"></td>
                            </tr>
                            <tr id="he6">
                                <td>Suministros de Limpieza</td>
                                <td id="he6_1" ></td>
                                <td id="he6_2" ></td>
                                <td id="he6_3" ></td>
                                <td id="he6_4" ></td>
                                <td id="he6_5" ></td>
                                <td id="he6_6" ></td>
                                <td id="he6_7" ></td>
                                <td id="he6_8" ></td>
                                <td id="he6_9" ></td>
                                <td id="he6_10"></td>
                                <td id="he6_11"></td>
                                <td id="he6_12"></td>
                                <td id="he6_13"></td>
                                <td id="he6_14"></td>
                                <td id="he6_15"></td>
                                <td id="he6_16"></td>
                                <td id="he6_17"></td>
                                <td id="he6_18"></td>
                                <td id="he6_19"></td>
                                <td id="he6_20"></td>
                                <td id="he6_21"></td>
                                <td id="he6_22"></td>
                                <td id="he6_23"></td>
                                <td id="he6_24"></td>
                                <td id="he6_25"></td>
                                <td id="he6_26"></td>
                                <td id="he6_27"></td>
                                <td id="he6_28"></td>
                                <td id="he6_29"></td>
                                <td id="he6_30"></td>
                                <td id="he6_31"></td>
                            </tr>
                        </table>
		            </p>
	            </div>
                <h3><a href="#">Operación de la Unidad y Desempeño</a></h3>
	            <div>
		            <p>
		             <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="od1">
                                <td>Motor</td>
                                <td id="od1_1" ></td>
                                <td id="od1_2" ></td>
                                <td id="od1_3" ></td>
                                <td id="od1_4" ></td>
                                <td id="od1_5" ></td>
                                <td id="od1_6" ></td>
                                <td id="od1_7" ></td>
                                <td id="od1_8" ></td>
                                <td id="od1_9" ></td>
                                <td id="od1_10"></td>
                                <td id="od1_11"></td>
                                <td id="od1_12"></td>
                                <td id="od1_13"></td>
                                <td id="od1_14"></td>
                                <td id="od1_15"></td>
                                <td id="od1_16"></td>
                                <td id="od1_17"></td>
                                <td id="od1_18"></td>
                                <td id="od1_19"></td>
                                <td id="od1_20"></td>
                                <td id="od1_21"></td>
                                <td id="od1_22"></td>
                                <td id="od1_23"></td>
                                <td id="od1_24"></td>
                                <td id="od1_25"></td>
                                <td id="od1_26"></td>
                                <td id="od1_27"></td>
                                <td id="od1_28"></td>
                                <td id="od1_29"></td>
                                <td id="od1_30"></td>
                                <td id="od1_31"></td>
                            </tr>
                            <tr id="od2">
                                <td>Consumo de Combustible</td>
                                <td id="od2_1" ></td>
                                <td id="od2_2" ></td>
                                <td id="od2_3" ></td>
                                <td id="od2_4" ></td>
                                <td id="od2_5" ></td>
                                <td id="od2_6" ></td>
                                <td id="od2_7" ></td>
                                <td id="od2_8" ></td>
                                <td id="od2_9" ></td>
                                <td id="od2_10"></td>
                                <td id="od2_11"></td>
                                <td id="od2_12"></td>
                                <td id="od2_13"></td>
                                <td id="od2_14"></td>
                                <td id="od2_15"></td>
                                <td id="od2_16"></td>
                                <td id="od2_17"></td>
                                <td id="od2_18"></td>
                                <td id="od2_19"></td>
                                <td id="od2_20"></td>
                                <td id="od2_21"></td>
                                <td id="od2_22"></td>
                                <td id="od2_23"></td>
                                <td id="od2_24"></td>
                                <td id="od2_25"></td>
                                <td id="od2_26"></td>
                                <td id="od2_27"></td>
                                <td id="od2_28"></td>
                                <td id="od2_29"></td>
                                <td id="od2_30"></td>
                                <td id="od2_31"></td>
                            </tr>
                            <tr id="od3">
                                <td>Caja</td>
                                <td id="od3_1" ></td>
                                <td id="od3_2" ></td>
                                <td id="od3_3" ></td>
                                <td id="od3_4" ></td>
                                <td id="od3_5" ></td>
                                <td id="od3_6" ></td>
                                <td id="od3_7" ></td>
                                <td id="od3_8" ></td>
                                <td id="od3_9" ></td>
                                <td id="od3_10"></td>
                                <td id="od3_11"></td>
                                <td id="od3_12"></td>
                                <td id="od3_13"></td>
                                <td id="od3_14"></td>
                                <td id="od3_15"></td>
                                <td id="od3_16"></td>
                                <td id="od3_17"></td>
                                <td id="od3_18"></td>
                                <td id="od3_19"></td>
                                <td id="od3_20"></td>
                                <td id="od3_21"></td>
                                <td id="od3_22"></td>
                                <td id="od3_23"></td>
                                <td id="od3_24"></td>
                                <td id="od3_25"></td>
                                <td id="od3_26"></td>
                                <td id="od3_27"></td>
                                <td id="od3_28"></td>
                                <td id="od3_29"></td>
                                <td id="od3_30"></td>
                                <td id="od3_31"></td>
                            </tr>
                            <tr id="od4">
                                <td>Estado de eje trasero</td>
                                <td id="od4_1" ></td>
                                <td id="od4_2" ></td>
                                <td id="od4_3" ></td>
                                <td id="od4_4" ></td>
                                <td id="od4_5" ></td>
                                <td id="od4_6" ></td>
                                <td id="od4_7" ></td>
                                <td id="od4_8" ></td>
                                <td id="od4_9" ></td>
                                <td id="od4_10"></td>
                                <td id="od4_11"></td>
                                <td id="od4_12"></td>
                                <td id="od4_13"></td>
                                <td id="od4_14"></td>
                                <td id="od4_15"></td>
                                <td id="od4_16"></td>
                                <td id="od4_17"></td>
                                <td id="od4_18"></td>
                                <td id="od4_19"></td>
                                <td id="od4_20"></td>
                                <td id="od4_21"></td>
                                <td id="od4_22"></td>
                                <td id="od4_23"></td>
                                <td id="od4_24"></td>
                                <td id="od4_25"></td>
                                <td id="od4_26"></td>
                                <td id="od4_27"></td>
                                <td id="od4_28"></td>
                                <td id="od4_29"></td>
                                <td id="od4_30"></td>
                                <td id="od4_31"></td>
                            </tr>
                            <tr id="od5">
                                <td>Estado de eje cardan</td>
                                <td id="od5_1" ></td>
                                <td id="od5_2" ></td>
                                <td id="od5_3" ></td>
                                <td id="od5_4" ></td>
                                <td id="od5_5" ></td>
                                <td id="od5_6" ></td>
                                <td id="od5_7" ></td>
                                <td id="od5_8" ></td>
                                <td id="od5_9" ></td>
                                <td id="od5_10"></td>
                                <td id="od5_11"></td>
                                <td id="od5_12"></td>
                                <td id="od5_13"></td>
                                <td id="od5_14"></td>
                                <td id="od5_15"></td>
                                <td id="od5_16"></td>
                                <td id="od5_17"></td>
                                <td id="od5_18"></td>
                                <td id="od5_19"></td>
                                <td id="od5_20"></td>
                                <td id="od5_21"></td>
                                <td id="od5_22"></td>
                                <td id="od5_23"></td>
                                <td id="od5_24"></td>
                                <td id="od5_25"></td>
                                <td id="od5_26"></td>
                                <td id="od5_27"></td>
                                <td id="od5_28"></td>
                                <td id="od5_29"></td>
                                <td id="od5_30"></td>
                                <td id="od5_31"></td>
                            </tr>
                            <tr id="od6">
                                <td>Frenos</td>
                                <td id="od6_1" ></td>
                                <td id="od6_2" ></td>
                                <td id="od6_3" ></td>
                                <td id="od6_4" ></td>
                                <td id="od6_5" ></td>
                                <td id="od6_6" ></td>
                                <td id="od6_7" ></td>
                                <td id="od6_8" ></td>
                                <td id="od6_9" ></td>
                                <td id="od6_10"></td>
                                <td id="od6_11"></td>
                                <td id="od6_12"></td>
                                <td id="od6_13"></td>
                                <td id="od6_14"></td>
                                <td id="od6_15"></td>
                                <td id="od6_16"></td>
                                <td id="od6_17"></td>
                                <td id="od6_18"></td>
                                <td id="od6_19"></td>
                                <td id="od6_20"></td>
                                <td id="od6_21"></td>
                                <td id="od6_22"></td>
                                <td id="od6_23"></td>
                                <td id="od6_24"></td>
                                <td id="od6_25"></td>
                                <td id="od6_26"></td>
                                <td id="od6_27"></td>
                                <td id="od6_28"></td>
                                <td id="od6_29"></td>
                                <td id="od6_30"></td>
                                <td id="od6_31"></td>
                            </tr>
                            <tr id="od7">
                                <td>Sistema Electrico</td>
                                <td id="od7_1" ></td>
                                <td id="od7_2" ></td>
                                <td id="od7_3" ></td>
                                <td id="od7_4" ></td>
                                <td id="od7_5" ></td>
                                <td id="od7_6" ></td>
                                <td id="od7_7" ></td>
                                <td id="od7_8" ></td>
                                <td id="od7_9" ></td>
                                <td id="od7_10"></td>
                                <td id="od7_11"></td>
                                <td id="od7_12"></td>
                                <td id="od7_13"></td>
                                <td id="od7_14"></td>
                                <td id="od7_15"></td>
                                <td id="od7_16"></td>
                                <td id="od7_17"></td>
                                <td id="od7_18"></td>
                                <td id="od7_19"></td>
                                <td id="od7_20"></td>
                                <td id="od7_21"></td>
                                <td id="od7_22"></td>
                                <td id="od7_23"></td>
                                <td id="od7_24"></td>
                                <td id="od7_25"></td>
                                <td id="od7_26"></td>
                                <td id="od7_27"></td>
                                <td id="od7_28"></td>
                                <td id="od7_29"></td>
                                <td id="od7_30"></td>
                                <td id="od7_31"></td>
                            </tr>
                            <tr id="od8">
                                <td>Caja de Timón</td>
                                <td id="od8_1" ></td>
                                <td id="od8_2" ></td>
                                <td id="od8_3" ></td>
                                <td id="od8_4" ></td>
                                <td id="od8_5" ></td>
                                <td id="od8_6" ></td>
                                <td id="od8_7" ></td>
                                <td id="od8_8" ></td>
                                <td id="od8_9" ></td>
                                <td id="od8_10"></td>
                                <td id="od8_11"></td>
                                <td id="od8_12"></td>
                                <td id="od8_13"></td>
                                <td id="od8_14"></td>
                                <td id="od8_15"></td>
                                <td id="od8_16"></td>
                                <td id="od8_17"></td>
                                <td id="od8_18"></td>
                                <td id="od8_19"></td>
                                <td id="od8_20"></td>
                                <td id="od8_21"></td>
                                <td id="od8_22"></td>
                                <td id="od8_23"></td>
                                <td id="od8_24"></td>
                                <td id="od8_25"></td>
                                <td id="od8_26"></td>
                                <td id="od8_27"></td>
                                <td id="od8_28"></td>
                                <td id="od8_29"></td>
                                <td id="od8_30"></td>
                                <td id="od8_31"></td>
                            </tr>
                            <tr id="od9">
                                <td>Retardador</td>
                                <td id="od9_1" ></td>
                                <td id="od9_2" ></td>
                                <td id="od9_3" ></td>
                                <td id="od9_4" ></td>
                                <td id="od9_5" ></td>
                                <td id="od9_6" ></td>
                                <td id="od9_7" ></td>
                                <td id="od9_8" ></td>
                                <td id="od9_9" ></td>
                                <td id="od9_10"></td>
                                <td id="od9_11"></td>
                                <td id="od9_12"></td>
                                <td id="od9_13"></td>
                                <td id="od9_14"></td>
                                <td id="od9_15"></td>
                                <td id="od9_16"></td>
                                <td id="od9_17"></td>
                                <td id="od9_18"></td>
                                <td id="od9_19"></td>
                                <td id="od9_20"></td>
                                <td id="od9_21"></td>
                                <td id="od9_22"></td>
                                <td id="od9_23"></td>
                                <td id="od9_24"></td>
                                <td id="od9_25"></td>
                                <td id="od9_26"></td>
                                <td id="od9_27"></td>
                                <td id="od9_28"></td>
                                <td id="od9_29"></td>
                                <td id="od9_30"></td>
                                <td id="od9_31"></td>
                            </tr>
                            <tr id="od10">
                                <td>Llantas</td>
                                <td id="od10_1" ></td>
                                <td id="od10_2" ></td>
                                <td id="od10_3" ></td>
                                <td id="od10_4" ></td>
                                <td id="od10_5" ></td>
                                <td id="od10_6" ></td>
                                <td id="od10_7" ></td>
                                <td id="od10_8" ></td>
                                <td id="od10_9" ></td>
                                <td id="od10_10"></td>

                                <td id="od10_11"></td>
                                <td id="od10_12"></td>
                                <td id="od10_13"></td>
                                <td id="od10_14"></td>
                                <td id="od10_15"></td>
                                <td id="od10_16"></td>
                                <td id="od10_17"></td>
                                <td id="od10_18"></td>
                                <td id="od10_19"></td>
                                <td id="od10_20"></td>
                                <td id="od10_21"></td>
                                <td id="od10_22"></td>
                                <td id="od10_23"></td>
                                <td id="od10_24"></td>
                                <td id="od10_25"></td>
                                <td id="od10_26"></td>
                                <td id="od10_27"></td>
                                <td id="od10_28"></td>
                                <td id="od10_29"></td>
                                <td id="od10_30"></td>
                                <td id="od10_31"></td>
                            </tr>
                            <tr id="od11">
                                <td>Indicadores de Tablero</td>
                                <td id="od11_1" ></td>
                                <td id="od11_2" ></td>
                                <td id="od11_3" ></td>
                                <td id="od11_4" ></td>
                                <td id="od11_5" ></td>
                                <td id="od11_6" ></td>
                                <td id="od11_7" ></td>
                                <td id="od11_8" ></td>
                                <td id="od11_9" ></td>
                                <td id="od11_10"></td>
                                <td id="od11_11"></td>
                                <td id="od11_12"></td>
                                <td id="od11_13"></td>
                                <td id="od11_14"></td>
                                <td id="od11_15"></td>
                                <td id="od11_16"></td>
                                <td id="od11_17"></td>
                                <td id="od11_18"></td>
                                <td id="od11_19"></td>
                                <td id="od11_20"></td>
                                <td id="od11_21"></td>
                                <td id="od11_22"></td>
                                <td id="od11_23"></td>
                                <td id="od11_24"></td>
                                <td id="od11_25"></td>
                                <td id="od11_26"></td>
                                <td id="od11_27"></td>
                                <td id="od11_28"></td>
                                <td id="od11_29"></td>
                                <td id="od11_30"></td>
                                <td id="od11_31"></td>
                            </tr>
                            <tr id="od12">
                                <td>Presion de Aceite</td>
                                <td id="od12_1" ></td>
                                <td id="od12_2" ></td>
                                <td id="od12_3" ></td>
                                <td id="od12_4" ></td>
                                <td id="od12_5" ></td>
                                <td id="od12_6" ></td>
                                <td id="od12_7" ></td>
                                <td id="od12_8" ></td>
                                <td id="od12_9" ></td>
                                <td id="od12_10"></td>
                                <td id="od12_11"></td>
                                <td id="od12_12"></td>
                                <td id="od12_13"></td>
                                <td id="od12_14"></td>
                                <td id="od12_15"></td>
                                <td id="od12_16"></td>
                                <td id="od12_17"></td>
                                <td id="od12_18"></td>
                                <td id="od12_19"></td>
                                <td id="od12_20"></td>
                                <td id="od12_21"></td>
                                <td id="od12_22"></td>
                                <td id="od12_23"></td>
                                <td id="od12_24"></td>
                                <td id="od12_25"></td>
                                <td id="od12_26"></td>
                                <td id="od12_27"></td>
                                <td id="od12_28"></td>
                                <td id="od12_29"></td>
                                <td id="od12_30"></td>
                                <td id="od12_31"></td>
                            </tr>
                            <tr id="od13">
                                <td>Reloj temperatura / Chicarra</td>
                                <td id="od13_1" ></td>
                                <td id="od13_2" ></td>
                                <td id="od13_3" ></td>
                                <td id="od13_4" ></td>
                                <td id="od13_5" ></td>
                                <td id="od13_6" ></td>
                                <td id="od13_7" ></td>
                                <td id="od13_8" ></td>
                                <td id="od13_9" ></td>
                                <td id="od13_10"></td>
                                <td id="od13_11"></td>
                                <td id="od13_12"></td>
                                <td id="od13_13"></td>
                                <td id="od13_14"></td>
                                <td id="od13_15"></td>
                                <td id="od13_16"></td>
                                <td id="od13_17"></td>
                                <td id="od13_18"></td>
                                <td id="od13_19"></td>
                                <td id="od13_20"></td>
                                <td id="od13_21"></td>
                                <td id="od13_22"></td>
                                <td id="od13_23"></td>
                                <td id="od13_24"></td>
                                <td id="od13_25"></td>
                                <td id="od13_26"></td>
                                <td id="od13_27"></td>
                                <td id="od13_28"></td>
                                <td id="od13_29"></td>
                                <td id="od13_30"></td>
                                <td id="od13_31"></td>
                            </tr>
                            <tr id="od14">
                                <td>Reloj de PSI</td>
                                <td id="od14_1" ></td>
                                <td id="od14_2" ></td>
                                <td id="od14_3" ></td>
                                <td id="od14_4" ></td>
                                <td id="od14_5" ></td>
                                <td id="od14_6" ></td>
                                <td id="od14_7" ></td>
                                <td id="od14_8" ></td>
                                <td id="od14_9" ></td>
                                <td id="od14_10"></td>
                                <td id="od14_11"></td>
                                <td id="od14_12"></td>
                                <td id="od14_13"></td>
                                <td id="od14_14"></td>
                                <td id="od14_15"></td>
                                <td id="od14_16"></td>
                                <td id="od14_17"></td>
                                <td id="od14_18"></td>
                                <td id="od14_19"></td>
                                <td id="od14_20"></td>
                                <td id="od14_21"></td>
                                <td id="od14_22"></td>
                                <td id="od14_23"></td>
                                <td id="od14_24"></td>
                                <td id="od14_25"></td>
                                <td id="od14_26"></td>
                                <td id="od14_27"></td>
                                <td id="od14_28"></td>
                                <td id="od14_29"></td>
                                <td id="od14_30"></td>
                                <td id="od14_31"></td>
                            </tr>
                            <tr id="od15">
                                <td>Aspirometro</td>
                                <td id="od15_1" ></td>
                                <td id="od15_2" ></td>
                                <td id="od15_3" ></td>
                                <td id="od15_4" ></td>
                                <td id="od15_5" ></td>
                                <td id="od15_6" ></td>
                                <td id="od15_7" ></td>
                                <td id="od15_8" ></td>
                                <td id="od15_9" ></td>
                                <td id="od15_10"></td>
                                <td id="od15_11"></td>
                                <td id="od15_12"></td>
                                <td id="od15_13"></td>
                                <td id="od15_14"></td>
                                <td id="od15_15"></td>
                                <td id="od15_16"></td>
                                <td id="od15_17"></td>
                                <td id="od15_18"></td>
                                <td id="od15_19"></td>
                                <td id="od15_20"></td>
                                <td id="od15_21"></td>
                                <td id="od15_22"></td>
                                <td id="od15_23"></td>
                                <td id="od15_24"></td>
                                <td id="od15_25"></td>
                                <td id="od15_26"></td>
                                <td id="od15_27"></td>
                                <td id="od15_28"></td>
                                <td id="od15_29"></td>
                                <td id="od15_30"></td>
                                <td id="od15_31"></td>
                            </tr>
                        </table>
		            </p>
	            </div>
                <h3><a href="#">Información del Piloto</a></h3>
	            <div>
		            <p>
		                <table class="tabla">
                            <tr>
                                <td></td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                                <td>31</td>
                            </tr>
                            <tr id="pi1">
                                <td>Horario de trabajo permite atender asuntos personales</td>
                                <td id="pi1_1" ></td>
                                <td id="pi1_2" ></td>
                                <td id="pi1_3" ></td>
                                <td id="pi1_4" ></td>
                                <td id="pi1_5" ></td>
                                <td id="pi1_6" ></td>
                                <td id="pi1_7" ></td>
                                <td id="pi1_8" ></td>
                                <td id="pi1_9" ></td>
                                <td id="pi1_10"></td>
                                <td id="pi1_11"></td>
                                <td id="pi1_12"></td>
                                <td id="pi1_13"></td>
                                <td id="pi1_14"></td>
                                <td id="pi1_15"></td>
                                <td id="pi1_16"></td>
                                <td id="pi1_17"></td>
                                <td id="pi1_18"></td>
                                <td id="pi1_19"></td>
                                <td id="pi1_20"></td>
                                <td id="pi1_21"></td>
                                <td id="pi1_22"></td>
                                <td id="pi1_23"></td>
                                <td id="pi1_24"></td>
                                <td id="pi1_25"></td>
                                <td id="pi1_26"></td>
                                <td id="pi1_27"></td>
                                <td id="pi1_28"></td>
                                <td id="pi1_29"></td>
                                <td id="pi1_30"></td>
                                <td id="pi1_31"></td>
                            </tr>
                            <tr id="pi2">
                                <td>Cual es su estado de Salud?</td>
                                <td id="pi2_1" ></td>
                                <td id="pi2_2" ></td>
                                <td id="pi2_3" ></td>
                                <td id="pi2_4" ></td>
                                <td id="pi2_5" ></td>
                                <td id="pi2_6" ></td>
                                <td id="pi2_7" ></td>
                                <td id="pi2_8" ></td>
                                <td id="pi2_9" ></td>
                                <td id="pi2_10"></td>
                                <td id="pi2_11"></td>
                                <td id="pi2_12"></td>
                                <td id="pi2_13"></td>
                                <td id="pi2_14"></td>
                                <td id="pi2_15"></td>
                                <td id="pi2_16"></td>
                                <td id="pi2_17"></td>
                                <td id="pi2_18"></td>
                                <td id="pi2_19"></td>
                                <td id="pi2_20"></td>
                                <td id="pi2_21"></td>
                                <td id="pi2_22"></td>
                                <td id="pi2_23"></td>
                                <td id="pi2_24"></td>
                                <td id="pi2_25"></td>
                                <td id="pi2_26"></td>
                                <td id="pi2_27"></td>
                                <td id="pi2_28"></td>
                                <td id="pi2_29"></td>
                                <td id="pi2_30"></td>
                                <td id="pi2_31"></td>
                            </tr>
                            <tr id="pi3">
                                <td>Animicamente como se Siente?</td>
                                <td id="pi3_1" ></td>
                                <td id="pi3_2" ></td>
                                <td id="pi3_3" ></td>
                                <td id="pi3_4" ></td>
                                <td id="pi3_5" ></td>
                                <td id="pi3_6" ></td>
                                <td id="pi3_7" ></td>
                                <td id="pi3_8" ></td>
                                <td id="pi3_9" ></td>
                                <td id="pi3_10"></td>
                                <td id="pi3_11"></td>
                                <td id="pi3_12"></td>
                                <td id="pi3_13"></td>
                                <td id="pi3_14"></td>
                                <td id="pi3_15"></td>
                                <td id="pi3_16"></td>
                                <td id="pi3_17"></td>
                                <td id="pi3_18"></td>
                                <td id="pi3_19"></td>
                                <td id="pi3_20"></td>
                                <td id="pi3_21"></td>
                                <td id="pi3_22"></td>
                                <td id="pi3_23"></td>
                                <td id="pi3_24"></td>
                                <td id="pi3_25"></td>
                                <td id="pi3_26"></td>
                                <td id="pi3_27"></td>
                                <td id="pi3_28"></td>
                                <td id="pi3_29"></td>
                                <td id="pi3_30"></td>
                                <td id="pi3_31"></td>
                            </tr>
                            <tr id="pi4">
                                <td>Se apoyan mis iniciativas en el trabajo?</td>
                                <td id="pi4_1" ></td>
                                <td id="pi4_2" ></td>
                                <td id="pi4_3" ></td>
                                <td id="pi4_4" ></td>
                                <td id="pi4_5" ></td>
                                <td id="pi4_6" ></td>
                                <td id="pi4_7" ></td>
                                <td id="pi4_8" ></td>
                                <td id="pi4_9" ></td>
                                <td id="pi4_10"></td>
                                <td id="pi4_11"></td>
                                <td id="pi4_12"></td>
                                <td id="pi4_13"></td>
                                <td id="pi4_14"></td>
                                <td id="pi4_15"></td>
                                <td id="pi4_16"></td>
                                <td id="pi4_17"></td>
                                <td id="pi4_18"></td>
                                <td id="pi4_19"></td>
                                <td id="pi4_20"></td>
                                <td id="pi4_21"></td>
                                <td id="pi4_22"></td>
                                <td id="pi4_23"></td>
                                <td id="pi4_24"></td>
                                <td id="pi4_25"></td>
                                <td id="pi4_26"></td>
                                <td id="pi4_27"></td>
                                <td id="pi4_28"></td>
                                <td id="pi4_29"></td>
                                <td id="pi4_30"></td>
                                <td id="pi4_31"></td>
                            </tr>
                            <tr id="pi5">
                                <td>Como es el trato que recibo del jefe y compañeros de trabajo</td>
                                <td id="pi5_1" ></td>
                                <td id="pi5_2" ></td>
                                <td id="pi5_3" ></td>
                                <td id="pi5_4" ></td>
                                <td id="pi5_5" ></td>
                                <td id="pi5_6" ></td>
                                <td id="pi5_7" ></td>
                                <td id="pi5_8" ></td>
                                <td id="pi5_9" ></td>
                                <td id="pi5_10"></td>
                                <td id="pi5_11"></td>
                                <td id="pi5_12"></td>
                                <td id="pi5_13"></td>
                                <td id="pi5_14"></td>
                                <td id="pi5_15"></td>
                                <td id="pi5_16"></td>
                                <td id="pi5_17"></td>
                                <td id="pi5_18"></td>
                                <td id="pi5_19"></td>
                                <td id="pi5_20"></td>
                                <td id="pi5_21"></td>
                                <td id="pi5_22"></td>
                                <td id="pi5_23"></td>
                                <td id="pi5_24"></td>
                                <td id="pi5_25"></td>
                                <td id="pi5_26"></td>
                                <td id="pi5_27"></td>
                                <td id="pi5_28"></td>
                                <td id="pi5_29"></td>
                                <td id="pi5_30"></td>
                                <td id="pi5_31"></td>
                            </tr>
                            <tr id="pi6">
                                <td>Como es el trato humano y la armonia en mi equipo de trabajo</td>
                                <td id="pi6_1" ></td>
                                <td id="pi6_2" ></td>
                                <td id="pi6_3" ></td>
                                <td id="pi6_4" ></td>
                                <td id="pi6_5" ></td>
                                <td id="pi6_6" ></td>
                                <td id="pi6_7" ></td>
                                <td id="pi6_8" ></td>
                                <td id="pi6_9" ></td>
                                <td id="pi6_10"></td>
                                <td id="pi6_11"></td>
                                <td id="pi6_12"></td>
                                <td id="pi6_13"></td>
                                <td id="pi6_14"></td>
                                <td id="pi6_15"></td>
                                <td id="pi6_16"></td>
                                <td id="pi6_17"></td>
                                <td id="pi6_18"></td>
                                <td id="pi6_19"></td>
                                <td id="pi6_20"></td>
                                <td id="pi6_21"></td>
                                <td id="pi6_22"></td>
                                <td id="pi6_23"></td>
                                <td id="pi6_24"></td>
                                <td id="pi6_25"></td>
                                <td id="pi6_26"></td>
                                <td id="pi6_27"></td>
                                <td id="pi6_28"></td>
                                <td id="pi6_29"></td>
                                <td id="pi6_30"></td>
                                <td id="pi6_31"></td>
                            </tr>
                            <tr id="pi7">
                                <td>La capacidad de mis compañeros para colaborar y trabajar en equipo</td>
                                <td id="pi7_1" ></td>
                                <td id="pi7_2" ></td>
                                <td id="pi7_3" ></td>
                                <td id="pi7_4" ></td>
                                <td id="pi7_5" ></td>
                                <td id="pi7_6" ></td>
                                <td id="pi7_7" ></td>
                                <td id="pi7_8" ></td>
                                <td id="pi7_9" ></td>
                                <td id="pi7_10"></td>
                                <td id="pi7_11"></td>
                                <td id="pi7_12"></td>
                                <td id="pi7_13"></td>
                                <td id="pi7_14"></td>
                                <td id="pi7_15"></td>
                                <td id="pi7_16"></td>
                                <td id="pi7_17"></td>
                                <td id="pi7_18"></td>
                                <td id="pi7_19"></td>
                                <td id="pi7_20"></td>
                                <td id="pi7_21"></td>
                                <td id="pi7_22"></td>
                                <td id="pi7_23"></td>
                                <td id="pi7_24"></td>
                                <td id="pi7_25"></td>
                                <td id="pi7_26"></td>
                                <td id="pi7_27"></td>
                                <td id="pi7_28"></td>
                                <td id="pi7_29"></td>
                                <td id="pi7_30"></td>
                                <td id="pi7_31"></td>
                            </tr>
                        </table>
		            </p>                    
                    <table style=" margin:0 auto; width:400px;">
                        <tr>
                            <td>Mal: </td>
                            <td><img src="images/mal.png" height="16" width="16" /></td>
                            <td style="width:150px;"></td>
                            <td>Normal: </td>
                            <td><img src="images/normal.png" height="16" width="16" /></td>
                            <td style="width:150px;"></td>
                            <td>Bien: </td>
                            <td><img src="images/bien.png" height="16" width="16" /></td>
                        </tr>
                    </table>                   
	            </div>
</div>
</body>
 <script type="text/javascript">
     $(document).ready(function () {
         $("#accordion").accordion();

     });
    <%
            While Not RS.eof
    %>
    //alert('<%=RS("td")%>'+' - ' +'<%=RS("valor")%>');
	contenedor= document.getElementById('<%=RS("td")%>');
	if(contenedor != null) {
   var valor ='<%=RS("valor")%>';
       
            if(valor==1){
            if('<%=RS("dia")%>'>22){
                if('<%= RS("descripcion")%>'==""){
                    document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/close.png'/>";
                }else{
                    document.getElementById('<%=RS("td")%>').innerHTML = "<a class='tooltip' href='#'><img src='images/close.png'/> <span class='custom critical ver1'><img src='images/Critical.png' alt='Error' height='48' width='48' class='img' /><em>Descripcion</em>"+'<%= RS("descripcion")%>'+"</span></a>";
                }
            }else{
                if('<%= RS("descripcion")%>'==""){
                    document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/close.png'/>";
                }else{
                    document.getElementById('<%=RS("td")%>').innerHTML = "<a class='tooltip' href='#'><img src='images/close.png'/> <span class='custom critical ver'><img src='images/Critical.png' alt='Error' height='48' width='48' class='img' /><em>Descripcion</em>"+'<%= RS("descripcion")%>'+"</span></a>";
                }  
            }
            }
            if(valor==0){document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/check.png'/>";}
            if(valor==0 && ('<%= RS("idpregunta")%>'=='pi1' || '<%= RS("idpregunta")%>'=='pi2' || '<%= RS("idpregunta")%>'=='pi3' || '<%= RS("idpregunta")%>'=='pi4' || '<%= RS("idpregunta")%>'=='pi5' || '<%= RS("idpregunta")%>'=='pi6' || '<%= RS("idpregunta")%>'=='pi7' || '<%= RS("idpregunta")%>'=='pi8')){
                if('<%=RS("dia")%>'>22){ 
                    if('<%= RS("descripcion")%>'==""){
                        document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/mal.png' width='16' height='16'/>";
                    }else{
                        document.getElementById('<%=RS("td")%>').innerHTML = "<a class='tooltip' href='#'><img src='images/mal.png' width='16' height='16'/> <span class='custom critical ver1'><img src='images/Critical.png' alt='Error' height='48' width='48' class='img' /><em>Descripcion</em>"+'<%= RS("descripcion")%>'+"</span></a>";
                    }            
                }else{
                    if('<%= RS("descripcion")%>'==""){
                        document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/mal.png' width='16' height='16'/>";
                    }else{
                        document.getElementById('<%=RS("td")%>').innerHTML = "<a class='tooltip' href='#'><img src='images/mal.png' width='16' height='16'/> <span class='custom critical ver'><img src='images/Critical.png' alt='Error' height='48' width='48' class='img' /><em>Descripcion</em>"+'<%= RS("descripcion")%>'+"</span></a>";
                    }
                }
             }  
             if(valor==1 && ('<%= RS("idpregunta")%>'=='pi1' || '<%= RS("idpregunta")%>'=='pi2' || '<%= RS("idpregunta")%>'=='pi3' || '<%= RS("idpregunta")%>'=='pi4' || '<%= RS("idpregunta")%>'=='pi5' || '<%= RS("idpregunta")%>'=='pi6' || '<%= RS("idpregunta")%>'=='pi7' || '<%= RS("idpregunta")%>'=='pi8')){document.getElementById('<%= RS("td")%>').innerHTML = "<img src='images/normal.png' height=16 width=16/>";}  
             if(valor==2 && ('<%= RS("idpregunta")%>'=='pi1' || '<%= RS("idpregunta")%>'=='pi2' || '<%= RS("idpregunta")%>'=='pi3' || '<%= RS("idpregunta")%>'=='pi4' || '<%= RS("idpregunta")%>'=='pi5' || '<%= RS("idpregunta")%>'=='pi6' || '<%= RS("idpregunta")%>'=='pi7' || '<%= RS("idpregunta")%>'=='pi8')){document.getElementById('<%= RS("td")%>').innerHTML = "<img src='images/bien.png' height=16 width=16/>";}
    }
	<%
    Response.Flush
        RS.Movenext
        Wend
    %>
    document.getElementById('accordion').style.display = '';
</script>
</html>
