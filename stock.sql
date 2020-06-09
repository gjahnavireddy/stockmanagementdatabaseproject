


insert into stockcomp value('Reliance','Reliance Industries Ltd',990088,1545,1579.9,1537.1,1561.8,1506.95,3.64),('HUL','Hindustan Uniliver Ltd',490651,2074.95,2098,2036,2089.45,1992.05,4.89),('Marico','Marico Ltd',38731,302.9,304.9,298.25,300.25,298.95,0.43),('Asianpaint','Asian Paints Ltd',151351,1611.8,1638,1570,1578.4,1594.3,-1),('HDFCBANK','HDFC Bank Ltd',509430,942,943.95,925.2,929.05,925,0.44),('DRREDDY','Dr Reddys Laboratories Ltd',66193,3900.1,4132.2,3900.1,3984,3837.65,3.81),('Sunpharma','Sun Pharmacetucial Industries Ltd',112528,460,471,454.05,469,452.2,3.72),('Cadilahc','Cadila Healthcare Ltd',32857,323.5,327.45,318,321.25,321.2,0.02),('Ongc','Oil and Natural Gas Corporation Ltd',95547,76.4,77.2,74.75,76,75.6,0.53),('Infy','Infosys Ltd',287332,672.25,680.9,668.5,674.2,664.95,1.39),('LT','Larsen & Toubro Ltd',114564,1605.25,1614,1570.1,1584.65,1593.25,-0.54),('Wipro','Wipro Ltd',105127,185.2,186,182.55,184,181.1,-0.05),('SBIN','State Bank of India',148773,172.45,173.8,166.1,166.65,170.75,-2.4),('UPL','UPL Ltd',27864,373.45,375.8,363,364.6,368.4,-1.03),('AXISBANK','Axis Bank Ltd',107868,403.5,409.45,379.65,382.05,387.35,-3.85),('NESTLEIND','Nestle India Ltd',171601,17350,17820,17201.5,17802.95,17142.45,3.85),('TATACONSUM','TATA Consumer Products Ltd',32139,347,355.5,344.1,348.75,341.3,2.18),('ITC','ITC Ltd',194586,163.95,164.15,157.1,158.25,161,-1.71),('IOC','Indian Oil Corporation Ltd',69994,76.1,77,74.05,74.35,75.75,-1.85),('TATAMOTORS','Tata Motors Ltd',25036,84.5,84.95,80.55,81.05,82.5,-1.76);




  insert into user_credentials values('Meghana Rai', 102, 33, 0,0,0),('Shikha Jain',103,42,0,0,0),('Sharat Kumar',104,50,0,0,0),('Malini',105,47,0,0,0);





CREATE TABLE stockcomp(stockcomp_id varchar(20) NOT NULL UNIQUE,
                    company_name varchar(50) NOT NULL UNIQUE,
                     capitol_in_rs_cr double NOT NULL,
                     open double, high double, low double, current_price double,previous_price double, change_percentage double,
                    PRIMARY KEY(stockcomp_id)); 




 create table user_credentials(name varchar(20) not null, 
                        user_id int unique not null, 
                        age int not null, 
                        investment double, 
                        networth double,
                         gain_per double, 
                         primary key(user_id));


   create table user_transaction(user_id int, 
                            company_id varchar(20), 
                            buying_price double, 
                            qty double, 
                            current_price double,
                            time date,
                            primary key(user_id,company_id,time),
                             foreign key(user_id) references user_credentials(user_id));

    create table top_gainers(stock_id varchar(20) unique, 
                            current_price double, 
                            52week_high double, 
                            52week_low double,
                            foreign key(stock_id) references stockcomp(stockcomp_id));


    create table top_losers(stock_id varchar(20) unique, 
                        current_price double, 
                        52week_high double, 
                        52week_low double,
                        foreign key(stock_id) references stockcomp(stockcomp_id));

                        create trigger gainper before insert on user_transaction for each row set new.gain=((new.current_price * new.qty)-(new.buying_price * new.qty))*100/(new.buying_price *new.qty);
                          
                         create trigger net after insert on user_transaction for each row update 
                         user_credentials set networth=networth+(new.buying_price * new.qty) where user_id =new.user_id;

                          create trigger inv after insert on user_transaction for each row update 
                          user_credentials set investment=investment+(new.current_price * new.qty) where user_id =new.user_id;

                          
