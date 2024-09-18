**Structured semi-structured data:**
CSV, XSLX, Parquet, JSON
**Different databases:**
PostGRESQL, MySQL, SQL server, MongoDB
**Unstructured data:**
Documents (pdf, word, excel)
**Other unstructered data:**
Mp3's, videos, pictures.

**Data can be scattered in different locations:**
On premise servers
Google drive, icloud, dropbox
**Cloud vendors:**
AWS, Azure, google cloud
**API's:**
Rest api.

Data gets updated with different frequencies, important that the data visualizations, reports and predictions to stakeholders reflect reality to properly support decision making.
Data get updated with different frequencies. Stakeholders rely on data that lead to decision-making. If stakeholders don't rely on and mistrusts the data, stakeholders will find it difficult to make desicion making with the information from the data.

Meet the data warehouse:
Different data sources (upstream), it goes to the data warehouse, here the transformation starts (downstream) and we can use the data to serve (downstream) the BI visualization, ML models, analytics.
Data warehouse is a central repository. With data from disparate sources. Consistent and comprehensive data analysis. Current and historical data in one place. This is different from OLTP systems, we keep the historical data to analyze the data over time. Data warehouse is a OLAP contrast to OLTP. Separations from operations, data warehouse data is separated from the operational databases we do the analysis in the data warehouse. It does not impact the performance operational system.
Scalable:
Horizontally
Vertically
Support BI
Reporting
Analytics

OLAP most commonly

Data warehouse lifecycle
Business requirements a data team works with stakeholders
Data modeling, how we want to build the data warehouse, how to store the data, how to serve the data. Dimensional modeling.
ETL/ELT development, we want to extract and load from different sources to the data warehouse (ingeston) then transform the data to various stakeholders.
Test the data, that it won't lead to faulty or misleading data, it should not contain any errors. 
Deployment, we can deployment a dashboard, you can deploy a data warehouse.
Maintenance, we need to keep the data warehouse up to date. orchastrate data, we have one ingeston per day, that lead to maintaining the data warehouse after the ingestons. New BR can come on the way, meet those requirements, the lower the grain or atomic is it is easier the better is to meet the BR.