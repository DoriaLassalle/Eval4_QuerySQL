
CREATE TABLE alternativas (
    id_alter                VARCHAR2(50) NOT NULL,
    desc_alter              VARCHAR2(100),
    choice                  CHAR(1),
    preguntas_id_question  VARCHAR2(30) NOT NULL,
    puntaje                 NUMBER
);

ALTER TABLE alternativas ADD CONSTRAINT alternativas_pk PRIMARY KEY ( id_alter );

CREATE TABLE alumnos (
    id_alumno        INTEGER NOT NULL,
    name_alumno      VARCHAR2(50),
    cursos_id_curso  INTEGER NOT NULL
);

ALTER TABLE alumnos ADD CONSTRAINT alumnos_pk PRIMARY KEY ( id_alumno );

CREATE TABLE cursos (
    id_curso      INTEGER NOT NULL,
    nombre_curso  VARCHAR2(50)
);

ALTER TABLE cursos ADD CONSTRAINT cursos_pk PRIMARY KEY ( id_curso );

CREATE TABLE preguntas (
    id_question   VARCHAR2(30) NOT NULL,
    enunciado     VARCHAR2(200),
    test_id_test  INTEGER NOT NULL
);

ALTER TABLE preguntas ADD CONSTRAINT preguntas_pk PRIMARY KEY ( id_question );

CREATE TABLE resultados (
    id_resultados      INTEGER NOT NULL,
    puntaje            NUMBER,
    nota               NUMBER,
    test_id_test       INTEGER NOT NULL,
    alumnos_id_alumno  INTEGER NOT NULL
);

ALTER TABLE resultados ADD CONSTRAINT resultados_pk PRIMARY KEY ( id_resultados );

CREATE TABLE examen (
    id_test          INTEGER NOT NULL,
    nombre           VARCHAR2(50),
    descripcion      VARCHAR2(60),
    programa         VARCHAR2(60),
    modulo           VARCHAR2(50),
    autor            VARCHAR2(50),
    fechacre         DATE,
    cursos_id_curso  INTEGER NOT NULL
);

ALTER TABLE examen ADD CONSTRAINT examen_pk PRIMARY KEY ( id_test );

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_preguntas_fk FOREIGN KEY ( preguntas_id_question )
        REFERENCES preguntas ( id_question );

ALTER TABLE alumnos
    ADD CONSTRAINT alumnos_cursos_fk FOREIGN KEY ( cursos_id_curso )
        REFERENCES cursos ( id_curso );

ALTER TABLE preguntas
    ADD CONSTRAINT preguntas_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES examen ( id_test );

ALTER TABLE resultados
    ADD CONSTRAINT resultados_alumnos_fk FOREIGN KEY ( alumnos_id_alumno )
        REFERENCES alumnos ( id_alumno );

ALTER TABLE resultados
    ADD CONSTRAINT resultados_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES examen( id_test );

ALTER TABLE examen
    ADD CONSTRAINT examen_cursos_fk FOREIGN KEY ( cursos_id_curso )
        REFERENCES cursos ( id_curso );

INSERT INTO CURSOS VALUES (2, '2to Basico');
INSERT INTO CURSOS VALUES (3, '3to Basico');
INSERT INTO CURSOS VALUES (4, '4to Basico');
INSERT INTO CURSOS VALUES (5, '5to Basico');
INSERT INTO CURSOS VALUES (6, '6to Basico');
INSERT INTO CURSOS VALUES (7, '7mo Basico');
INSERT INTO CURSOS VALUES (8, '8vo Basico');
        
INSERT INTO ALUMNOS VALUES (10, 'Rodolfo',5);
INSERT INTO ALUMNOS VALUES (11, 'Carolina',5);        
INSERT INTO ALUMNOS VALUES (12, 'Doria',5);        
INSERT INTO ALUMNOS VALUES (13, 'Jhonatan',5);        
INSERT INTO ALUMNOS VALUES (14, 'Juri',5);        
INSERT INTO ALUMNOS VALUES (15, 'Giovana',5);        
INSERT INTO ALUMNOS VALUES (16, 'Elias',5);
INSERT INTO ALUMNOS VALUES (17, 'Sebastian',5);
INSERT INTO ALUMNOS VALUES (18, 'Gonzalo',5);
INSERT INTO ALUMNOS VALUES (19, 'Matias',5);

INSERT INTO ALUMNOS VALUES (20, 'Fernanda',6);
INSERT INTO ALUMNOS VALUES (21, 'Joaquin',6);        
INSERT INTO ALUMNOS VALUES (22, 'Catalina',6);        
INSERT INTO ALUMNOS VALUES (23, 'Juan',6);        
INSERT INTO ALUMNOS VALUES (24, 'Carla',6);        
INSERT INTO ALUMNOS VALUES (25, 'Hector',6);        
INSERT INTO ALUMNOS VALUES (26, 'Andres',6);
INSERT INTO ALUMNOS VALUES (27, 'Camila',6);
INSERT INTO ALUMNOS VALUES (28, 'Bastian',6);
INSERT INTO ALUMNOS VALUES (29, 'Jorge',6);
    
INSERT INTO EXAMEN VALUES (1,'Prueba Sistema Respiratorio', 'Prueba de Alternativas','Ciencias Naturales','Unidad 1','Rodolfo Fuentes','21/08/2020',5);
INSERT INTO EXAMEN VALUES (2,'Prueba de Sexualidad', 'Prueba de Alternativas','Ciencias Naturales','Unidad 2','Doria Lassalle','20/07/2020',6);
INSERT INTO EXAMEN VALUES (3,'Prueba de Sistema Circulatorio', 'Prueba de Alternativas','Ciencias Naturales','Unidad 3','Carolina Salort','29/07/2020',7);
INSERT INTO EXAMEN VALUES (4,'Prueba de Sistema Solar', 'Prueba de Alternativas','Ciencias Naturales','Unidad 4','Jhonatan Mejias','20/04/2020',8);
INSERT INTO EXAMEN VALUES (5,'Prueba de Electricidad', 'Prueba de Alternativas','Ciencias Naturales','Unidad 5','Mario Canedo','19/04/2020',8);

----INSERTO PRUEBA 2      
INSERT INTO PREGUNTAS VALUES ('P1','1.¿Qué es la sexualidad humana?',2);
INSERT INTO PREGUNTAS VALUES ('P2','2.¿Cuáles son características secundarias de la mujer?',2);
INSERT INTO PREGUNTAS VALUES ('P3','3.Los ovarios son estructura pares en formas de almendra, que liberan al ovocito II en:',2);
INSERT INTO PREGUNTAS VALUES ('P4','4.Las etapas de la vida de un ser humano en orden cronológico son:',2);
INSERT INTO PREGUNTAS VALUES ('P5','5.Aumento de la estatura, aparición del acné, crecimiento del bello axilar y pubis, crecimiento de órganos sexuales son de:',2);
INSERT INTO PREGUNTAS VALUES ('P6','6.¿Cuál de los siguientes órganos, no corresponde al sistema reproductor masculino?:',2);
INSERT INTO PREGUNTAS VALUES ('P7','7.Son células especializadas para la reproducción. En el hombre se llaman espermatozoide y en las mujeres se llaman ovocitos II… la anterior definición corresponde a:',2);
INSERT INTO PREGUNTAS VALUES ('P8','8.El órgano copulador femenino se llama:',2);
INSERT INTO PREGUNTAS VALUES ('P9','9.¿Qué son los caracteres sexuales primarios?',2);
INSERT INTO PREGUNTAS VALUES ('P10','10.Un Espermatozoide es:',2);

----INSERTO ALTERNATIVAS PRUEBA 2
INSERT INTO ALTERNATIVAS VALUES ('A1', 'a) Comprende a los seres que se reproducen.', 'F', 'P1',0);
INSERT INTO ALTERNATIVAS VALUES ('A2', 'b) Es el contacto de los hijos con los padres.', 'F', 'P1',0);
INSERT INTO ALTERNATIVAS VALUES ('A3', 'c) Comprende a una conducta de cortejo.', 'F', 'P1',0);
INSERT INTO ALTERNATIVAS VALUES ('A4', 'd) Es el conjunto de fenómenos emocionales y de conducta relacionados con el sexo del individuo.', 'V', 'P1',1);
INSERT INTO ALTERNATIVAS VALUES ('A5', 'a) Desarrollo de los testículos.', 'F', 'P2',0);
INSERT INTO ALTERNATIVAS VALUES ('A6', 'b) Aumento de masa muscular.', 'F', 'P2',0);
INSERT INTO ALTERNATIVAS VALUES ('A7', 'c) Ensanchamiento de las caderas.  ', 'V', 'P2',0.5);
INSERT INTO ALTERNATIVAS VALUES ('A8', 'd) Menarquia.', 'V', 'P2',0.5);
INSERT INTO ALTERNATIVAS VALUES ('A9', 'a) Cuello uterino', 'F', 'P3', 0);
INSERT INTO ALTERNATIVAS VALUES ('A10', 'b) Las trompas de Falopio', 'V', 'P3', 1);
INSERT INTO ALTERNATIVAS VALUES ('A11', 'c) El útero', 'F', 'P3', 0);
INSERT INTO ALTERNATIVAS VALUES ('A12', 'd) la vagina', 'F', 'P3', 0);
INSERT INTO ALTERNATIVAS VALUES ('A13', 'a) Niñez – adultez – vejez – adolescencia.', 'F', 'P4', 0);
INSERT INTO ALTERNATIVAS VALUES ('A14', 'b) Niñez -  pubertad y adolescencia – vejez – adultez.', 'V', 'P4', 1);
INSERT INTO ALTERNATIVAS VALUES ('A15', 'c) Niñez – pubertad y adolescencia – adultez - vejez.', 'F', 'P4', 0);
INSERT INTO ALTERNATIVAS VALUES ('A16', 'd) Pubertad – niñez –adultez – vejez.', 'F', 'P4', 0);
INSERT INTO ALTERNATIVAS VALUES ('A17', 'a) hombres.', 'V', 'P5', 0.5);
INSERT INTO ALTERNATIVAS VALUES ('A18', 'b) únicamente mujeres.', 'F', 'P5', 0);
INSERT INTO ALTERNATIVAS VALUES ('A19', 'c) Son característico tanto en hombre como mujeres.', 'V', 'P5', 0.5);
INSERT INTO ALTERNATIVAS VALUES ('A20', 'd) Ninguna de las anteriores.', 'F', 'P5', 0);
INSERT INTO ALTERNATIVAS VALUES ('A21', 'a) Conductos deferentes.', 'F', 'P6', 0);
INSERT INTO ALTERNATIVAS VALUES ('A22', 'b) Oviductos', 'V', 'P6', 1);
INSERT INTO ALTERNATIVAS VALUES ('A23', 'c) Próstata. ', 'F', 'P6', 0);
INSERT INTO ALTERNATIVAS VALUES ('A24', 'd) Epidídimo. ', 'F', 'P6', 0);
INSERT INTO ALTERNATIVAS VALUES ('A25', 'a) Óvulos. ', 'F', 'P7', 0);
INSERT INTO ALTERNATIVAS VALUES ('A26', 'b) Gametos. ', 'V', 'P7', 1);
INSERT INTO ALTERNATIVAS VALUES ('A27', 'c) Embrión.', 'F', 'P7', 0);
INSERT INTO ALTERNATIVAS VALUES ('A28', 'd) epidídimo.', 'F', 'P7', 0);
INSERT INTO ALTERNATIVAS VALUES ('A29', 'a) Vagina', 'V', 'P8', 1);
INSERT INTO ALTERNATIVAS VALUES ('A30', 'b) Útero', 'F', 'P8', 0);
INSERT INTO ALTERNATIVAS VALUES ('A31', 'c) Ovario', 'F', 'P8', 0);
INSERT INTO ALTERNATIVAS VALUES ('A32', 'd) Oviducto', 'F', 'P8', 0);	
INSERT INTO ALTERNATIVAS VALUES ('A33', 'a) Los órganos sexuales masculinos y femeninos.', 'V', 'P9', 1);
INSERT INTO ALTERNATIVAS VALUES ('A34', 'b) Los cambios físicos que aparecen en la pubertad.', 'F', 'P9', 0);
INSERT INTO ALTERNATIVAS VALUES ('A35', 'c) Las glándulas encargadas de producir las hormonas sexuales.', 'F', 'P9', 0);
INSERT INTO ALTERNATIVAS VALUES ('A36', 'd) Las hormonas sexuales producidas por hombres y mujeres.', 'F', 'P9', 0);
INSERT INTO ALTERNATIVAS VALUES ('A37', 'a) Gameto femenino', 'F', 'P9', 0);
INSERT INTO ALTERNATIVAS VALUES ('A38', 'b) Órgano productor de hormonas', 'F', 'P9', 0);
INSERT INTO ALTERNATIVAS VALUES ('A39', 'c) Gameto masculino', 'V', 'P9', 1);
INSERT INTO ALTERNATIVAS VALUES ('A40', 'd) Ninguna de las anteriores', 'F', 'P9', 0);

------INSERTO PRUEBA 1
INSERT INTO PREGUNTAS VALUES ('P11','1. El aire que acabas de inhalar es rico en: ',1);
INSERT INTO PREGUNTAS VALUES ('P12','2. El intercambio de dióxido de carbono por oxígeno se lleva a cabo en: ',1);
INSERT INTO PREGUNTAS VALUES ('P13','3. Que gas es principalmente necesario para las reacciones químicas en la célula:',1);
INSERT INTO PREGUNTAS VALUES ('P14','4. En relación al contenido del aire inspirado y espirado, es correcto que:',1);
INSERT INTO PREGUNTAS VALUES ('P15','5. Dentro del cuerpo, la tráquea se divide en dos: ',1);
INSERT INTO PREGUNTAS VALUES ('P16','6. ¿A qué se debe que durante la carrera, el atleta note que su pulso y frecuencia respiratoria aumenta?',1);
INSERT INTO PREGUNTAS VALUES ('P17','7. El sistema respiratorio está formado principalmente por:',1);
INSERT INTO PREGUNTAS VALUES ('P18','8. ¿Cuál es el principal órgano respiratorio?',1);
INSERT INTO PREGUNTAS VALUES ('P19','9. ¿Cuál es el componente del humo de tabaco con propiedades adictivas?',1);
INSERT INTO PREGUNTAS VALUES ('P20','10. Debido a una enfermedad un hombre ha perdido gran parte de sus alvéolos. ¿Qué función de su sistema respiratorio se vería afectada?',1);
  
-----INSERTO ALTERNATIVAS PRUEBA 1         
INSERT INTO ALTERNATIVAS VALUES ('A41', 'a) dióxido de carbono. ', 'F', 'P11',0);
INSERT INTO ALTERNATIVAS VALUES ('A42', 'b) vapor de agua. ', 'F', 'P11',0);
INSERT INTO ALTERNATIVAS VALUES ('A43', 'c) oxígeno. ', 'V', 'P11',1);
INSERT INTO ALTERNATIVAS VALUES ('A44', 'd) hidrógeno.', 'F', 'P11',0);
INSERT INTO ALTERNATIVAS VALUES ('A45', 'a) Los alvéolos. ', 'V', 'P12',1);
INSERT INTO ALTERNATIVAS VALUES ('A46', 'b) la tráquea. ', 'F', 'P12',0);
INSERT INTO ALTERNATIVAS VALUES ('A47', 'c) las ventanillas. ', 'F', 'P12',0);
INSERT INTO ALTERNATIVAS VALUES ('A48', 'd) el diafragma.', 'F', 'P12',0);
INSERT INTO ALTERNATIVAS VALUES ('A49', 'a) Oxígeno', 'V', 'P13',1);
INSERT INTO ALTERNATIVAS VALUES ('A50', 'b) Nitrógeno', 'F', 'P13',0);
INSERT INTO ALTERNATIVAS VALUES ('A51', 'c) Dióxido de carbono', 'F', 'P13',0);
INSERT INTO ALTERNATIVAS VALUES ('A52', 'd) Hidrógeno', 'F', 'P13',0);
INSERT INTO ALTERNATIVAS VALUES ('A53', 'a) el aire inspirado contiene menos oxígeno', 'F', 'P14',0);
INSERT INTO ALTERNATIVAS VALUES ('A54', 'b) el aire espirado contiene menos oxígeno', 'V', 'P14',0.5);
INSERT INTO ALTERNATIVAS VALUES ('A55', 'c) el contenido de dióxido de carbono es mayor en el aire espirado', 'V', 'P14',0.5);
INSERT INTO ALTERNATIVAS VALUES ('A56', 'd) el aire espirado contiene más nitrógeno.', 'F', 'P14',0);
INSERT INTO ALTERNATIVAS VALUES ('A57', 'a) alvéolos. ', 'F', 'P15',0);
INSERT INTO ALTERNATIVAS VALUES ('A58', 'b) ventanillas. ', 'F', 'P15',0);
INSERT INTO ALTERNATIVAS VALUES ('A59', 'c) músculos. ', 'F', 'P15',0);
INSERT INTO ALTERNATIVAS VALUES ('A60', 'd) bronquios.', 'V', 'P15',1);            
INSERT INTO ALTERNATIVAS VALUES ('A61', 'a) Su preparación para la carrera no ha sido adecuada.', 'F', 'P16',0);
INSERT INTO ALTERNATIVAS VALUES ('A62', 'b) Su corazón se acelera para bombear más rápido la sangre', 'V', 'P16',0.5);
INSERT INTO ALTERNATIVAS VALUES ('A63', 'c) Requiere más oxígeno y este debe ser trasladado rápidamente a las células de su cuerpo', 'V', 'P16',0.5);
INSERT INTO ALTERNATIVAS VALUES ('A64', 'd) Sus pulmones necesitan más oxígeno y para ello el corazón aumenta sus latidos', 'F', 'P16',0);
INSERT INTO ALTERNATIVAS VALUES ('A65', 'a) las fosas nasales, el esófago, la tráquea, los bronquios y los pulmones.', 'F', 'P17',0);
INSERT INTO ALTERNATIVAS VALUES ('A66', 'b) las fosas nasales, la laringe los pulmones. ', 'V', 'P17',0.5);
INSERT INTO ALTERNATIVAS VALUES ('A67', 'c) las fosas nasales, los bronquios y los pulmones. ', 'V', 'P17',0.5);
INSERT INTO ALTERNATIVAS VALUES ('A68', 'd) las fosas nasales, las cuerdas vocales, estomago, los bronquios y los pulmones.', 'F', 'P17',0);
INSERT INTO ALTERNATIVAS VALUES ('A69', 'a) Laringe.', 'F', 'P18',0);
INSERT INTO ALTERNATIVAS VALUES ('A70', 'b) Faringe.', 'F', 'P18',0);
INSERT INTO ALTERNATIVAS VALUES ('A71', 'c) El corazón.', 'F', 'P18',0);
INSERT INTO ALTERNATIVAS VALUES ('A72', 'd) Los pulmones.', 'V', 'P18',1);
INSERT INTO ALTERNATIVAS VALUES ('A73', 'a) Nicotina.', 'V', 'P19',1);
INSERT INTO ALTERNATIVAS VALUES ('A74', 'b) Tolueno.', 'F', 'P19',0);
INSERT INTO ALTERNATIVAS VALUES ('A75', 'c) Alquitrán.', 'F', 'P19',0);
INSERT INTO ALTERNATIVAS VALUES ('A76', 'd) Amoniaco.', 'F', 'P19',0);
INSERT INTO ALTERNATIVAS VALUES ('A77', 'a) Inspiración. ', 'F', 'P20',0);
INSERT INTO ALTERNATIVAS VALUES ('A78', 'b) Intercambio gaseoso. ', 'V', 'P20',1);
INSERT INTO ALTERNATIVAS VALUES ('A79', 'c) Transporte de oxígeno.', 'F', 'P20',0);
INSERT INTO ALTERNATIVAS VALUES ('A80', 'd) Transporte de dióxido de carbono.', 'F', 'P20',0);        

------INSERTO PRUEBA ERRONEA 5 
INSERT INTO PREGUNTAS VALUES ('P21','1.	Son conductores de electricidad:',5);
INSERT INTO PREGUNTAS VALUES ('P22','2.	Un ejemplo de aislante es:',5);
INSERT INTO PREGUNTAS VALUES ('P23','3.	¿Cuál de las siguientes conductas permite ahorrar energía eléctrica? ',5);
INSERT INTO PREGUNTAS VALUES ('P24','4. la energía eólica, Esta forma de energía usa como recurso fundamental:',5);
INSERT INTO PREGUNTAS VALUES ('P25','5.	La energía es:',5);

-----INSERTO ALTERNATIVAS PRUEBA ERRONEA 5 CON ALTERNATIVAS FALTANTES  
INSERT INTO ALTERNATIVAS VALUES ('A81', 'a)	El agua destilada.', 'F', 'P22',1);     
INSERT INTO ALTERNATIVAS VALUES ('A82', 'b)	Un papel.', 'V', 'P22',1);
INSERT INTO ALTERNATIVAS VALUES ('A83', 'c)	Una goma.', 'V', 'P22',1);
INSERT INTO ALTERNATIVAS VALUES ('A84', 'd)	Un panel de plástico..', 'V', 'P22',1);
INSERT INTO ALTERNATIVAS VALUES ('A85', 'a)	Colocar ampolletas de mayor intensidad. ', 'F', 'P23',0);
INSERT INTO ALTERNATIVAS VALUES ('A86', 'b)	Utilizar ampolletas que consuman menor cantidad de watt por hora. ', 'V', 'P23',1);
INSERT INTO ALTERNATIVAS VALUES ('A87', 'a)	El agua.', 'F', 'P24',0); 
INSERT INTO ALTERNATIVAS VALUES ('A88', 'b)	El calor.', 'F', 'P24',0);
INSERT INTO ALTERNATIVAS VALUES ('A89', 'c)	El viento.', 'V', 'P24',1);
INSERT INTO ALTERNATIVAS VALUES ('A90', 'd)	Las mareas.', 'F', 'P24',0); 
INSERT INTO ALTERNATIVAS VALUES ('A91', 'a)	Todo lo que nos rodea.', 'F', 'P25',0); 
INSERT INTO ALTERNATIVAS VALUES ('A92', 'b)	Todo aquello que provoca cambios en la materia.', 'V', 'P25',1);
INSERT INTO ALTERNATIVAS VALUES ('A93', 'c)	Levantarse temprano y tener ganas de hacer cosas.', 'F', 'P25',0); 
INSERT INTO ALTERNATIVAS VALUES ('A94', 'd)	Tener fuerza y desarrollo muscular.', 'F', 'P25',0);
INSERT INTO ALTERNATIVAS VALUES ('A95', 'a)	El agua .', 'V', 'P21',1);

------INSERTO PRUEBA ERRONEA 4
INSERT INTO PREGUNTAS VALUES ('P26','1. Indica planetas del Sistema Solar:',4);
INSERT INTO PREGUNTAS VALUES ('P27','2. ¿Cual es el planeta más cercano al Sol?',4);
INSERT INTO PREGUNTAS VALUES ('P28','2. ¿Cual es el planeta más alejado al Sol?',4);

-----INSERTO ALTERNATIVAS PRUEBA ERRONEA 4 ALTERNATIVAS TODAS VERDADERAS O TODAS FALSAS
INSERT INTO ALTERNATIVAS VALUES ('A96', 'a) Pluton.', 'F', 'P27',0);
INSERT INTO ALTERNATIVAS VALUES ('A97', 'b) Marte', 'F', 'P27',0);
INSERT INTO ALTERNATIVAS VALUES ('A98', 'c) Tierra.', 'F', 'P27',0);
INSERT INTO ALTERNATIVAS VALUES ('A99', 'd) Jupiter.', 'F', 'P27',0); 
INSERT INTO ALTERNATIVAS VALUES ('A100', 'a) Pluton.', 'V', 'P28',1);
INSERT INTO ALTERNATIVAS VALUES ('A101', 'b) Marte', 'V', 'P28',1);
INSERT INTO ALTERNATIVAS VALUES ('A102', 'c) Tierra.', 'V', 'P28',1);
INSERT INTO ALTERNATIVAS VALUES ('A103', 'd) Jupiter.', 'V', 'P28',1); 

-----INSERTO ALGUNOS RESULTADOS CON NOTA Y PUNTAJE DE ALGUNOS ALUMNOS          
INSERT INTO RESULTADOS VALUES (1,10,7,1,10);        
INSERT INTO RESULTADOS VALUES (2,4,3,1,11); 
INSERT INTO RESULTADOS VALUES (3,5,4,1,12); 
INSERT INTO RESULTADOS VALUES (4,3,2,1,13);   
INSERT INTO RESULTADOS VALUES (5,9,6,1,14);   
INSERT INTO RESULTADOS VALUES (6,10,7,2,20);   
INSERT INTO RESULTADOS VALUES (7,8,6,2,21);   
INSERT INTO RESULTADOS VALUES (8,2,1,2,22);   
INSERT INTO RESULTADOS VALUES (9,6,5,2,23);   
INSERT INTO RESULTADOS VALUES (10,8,6,2,24);   


----ESTA TABLA LA CREE POSTERIOR AL MODELO FISICO INICIAL
CREATE TABLE respuestas (
    id_respuesta    INTEGER NOT NULL,
    a_id_alumno     INTEGER NOT NULL,
    alter_id_alter  VARCHAR2(50) NOT NULL
);
ALTER TABLE respuestas  ADD CONSTRAINT respuestas_pk PRIMARY KEY (id_respuesta);
  
ALTER TABLE respuestas 
    ADD CONSTRAINT respuestas_alumnos_fk FOREIGN KEY ( a_id_alumno ) 
       REFERENCES alumnos ( id_alumno );
      
ALTER TABLE respuestas  
      ADD CONSTRAINT respuestas_id_alter_fk FOREIGN KEY (alter_id_alter)
        REFERENCES alternativas (id_alter);  
----- 

------INSERTO RESPUESTAS DE UN ALUMNO PARA LA PRUEBA 1       
INSERT INTO RESPUESTAS VALUES (101, 16, 'A73');
INSERT INTO RESPUESTAS VALUES (102, 16, 'A72');
INSERT INTO RESPUESTAS VALUES (103, 16, 'A67');
INSERT INTO RESPUESTAS VALUES (104, 16, 'A62');
INSERT INTO RESPUESTAS VALUES (105, 16, 'A61');   
INSERT INTO RESPUESTAS VALUES (106, 16, 'A58');    
INSERT INTO RESPUESTAS VALUES (107, 16, 'A54'); 
INSERT INTO RESPUESTAS VALUES (108, 16, 'A49'); 
INSERT INTO RESPUESTAS VALUES (109, 16, 'A45'); 
INSERT INTO RESPUESTAS VALUES (110, 16, 'A43'); 
   
        
---------------------CONSULTAS EVALUACION 4 FINAL MODULO 2------------------------

--1 NUMERO DE EVALUACIONES X CURSO
SELECT nombre_curso AS curso,COUNT (id_test) AS Evaluaciones_realizadas 
FROM examen e JOIN cursos c
ON e.cursos_id_curso=c.id_curso
WHERE id_test IN (1,2,3,4,5)
GROUP BY nombre_curso
ORDER BY nombre_curso ASC;

--2 CURSOS SIN EVALUACIONES
SELECT nombre_curso AS cursos_sin_evaluaciones FROM cursos c
LEFT JOIN examen e
ON c.id_curso=e.cursos_id_curso 
WHERE e.id_test IS NULL;

--3 EVALUACIONES CON DEFICIENCIA
--------3A EVAL. SIN PREGUNTAS
SELECT NOMBRE AS EVALUACIONES_DEFICIENTES  FROM EXAMEN E 
LEFT JOIN PREGUNTAS P
ON E.ID_TEST=P.TEST_ID_TEST
WHERE P.TEST_ID_TEST IS NULL;

-------3B EVAL. PREGUNTAS CON 2 O MENOS ALTERNATIVAS
SELECT NOMBRE AS EVALUACIONES_DEFICIENTES, PROGRAMA AS RAMO, PREGUNTAS_ID_QUESTION AS ERROR_PREG_NUMERO 
FROM EXAMEN E 
JOIN PREGUNTAS P ON E.ID_TEST=P.TEST_ID_TEST
JOIN ALTERNATIVAS A ON P.ID_QUESTION=A.PREGUNTAS_ID_QUESTION
GROUP BY NOMBRE, PREGUNTAS_ID_QUESTION, PROGRAMA
HAVING COUNT(PREGUNTAS_ID_QUESTION)<3;

------3C EVAL. PREGUNTAS CON TODAS ALTERNATIVAS F O V
SELECT NOMBRE AS EVALUACIONES_DEFICIENTES, PREGUNTAS_ID_QUESTION AS ERROR_PREG_NUMERO, CHOICE AS TODAS_SON
FROM EXAMEN E
JOIN PREGUNTAS P ON E.ID_TEST=P.TEST_ID_TEST
JOIN ALTERNATIVAS A ON P.ID_QUESTION=A.PREGUNTAS_ID_QUESTION
GROUP BY NOMBRE, PREGUNTAS_ID_QUESTION, CHOICE
HAVING COUNT(CHOICE)=4;

--4 ALUMNOS POR CURSO
SELECT COUNT(NAME_ALUMNO) AS CANTIDAD_ALUMNOS, NOMBRE_CURSO 
FROM ALUMNOS A JOIN CURSOS C
ON A.CURSOS_ID_CURSO= C.ID_CURSO
GROUP BY NOMBRE_CURSO;

--5 PUNTAJE NO NORMALIZADO, A LAS BUENAS LES RESTO LAS (MALAS/4)
SELECT SUM (PUNTAJE)-(SELECT COUNT (CHOICE)/(4) FROM ALTERNATIVAS A JOIN RESPUESTAS R
ON A.ID_ALTER=R.ALTER_ID_ALTER WHERE CHOICE='F' AND A_ID_ALUMNO=16 )
AS PUNTAJE_OBTENIDO_DE_10, NAME_ALUMNO AS ALUMNO, CURSOS_ID_CURSO AS CURSO
FROM ALTERNATIVAS A 
JOIN RESPUESTAS R ON A.ID_ALTER=R.ALTER_ID_ALTER
JOIN ALUMNOS AL ON R.A_ID_ALUMNO=AL.ID_ALUMNO
WHERE A.CHOICE='V' AND  R.A_ID_ALUMNO=16 
GROUP BY NAME_ALUMNO, CURSOS_ID_CURSO;

--6 PUNTAJE Y SU NOTA
SELECT PUNTAJE, NOTA AS NOTA_EVAL, NAME_ALUMNO AS NOMBRE_ALUMNO, CURSOS_ID_CURSO AS CURSO 
FROM ALUMNOS A
JOIN RESULTADOS R ON A.ID_ALUMNO=R.ALUMNOS_ID_ALUMNO
GROUP BY CURSOS_ID_CURSO, PUNTAJE, NOTA, NAME_ALUMNO
ORDER BY CURSOS_ID_CURSO;

--7 LISTA DE ALUMNNOS QUE APRUEBAN CON NOTA >=4
SELECT NAME_ALUMNO AS NOMBRE_ALUMNO, NOTA AS APRUEBA_CON, NOMBRE AS EVALUACION FROM ALUMNOS A
JOIN RESULTADOS R
ON A.ID_ALUMNO = R.ALUMNOS_ID_ALUMNO
JOIN EXAMEN E
ON TEST_ID_TEST=ID_TEST
WHERE NOTA >=4;

--8 PROMEDIO DE LAS NOTAS DE LOS ALUMNOS DE UN CURSO PARA LA PRUEBA 1
SELECT AVG (NOTA) AS PROMEDIO_CURSO, NOMBRE AS EVALUACION, A.CURSOS_ID_CURSO AS CURSO  FROM RESULTADOS R
JOIN EXAMEN E ON R.TEST_ID_TEST= E.ID_TEST
JOIN ALUMNOS A ON E.CURSOS_ID_CURSO=A.CURSOS_ID_CURSO
WHERE ID_TEST=1
GROUP BY NOMBRE , A.CURSOS_ID_CURSO ;

------------------------- END ----------------------------



