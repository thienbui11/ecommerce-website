# Dùng image Tomcat 9
FROM tomcat:9.0

# Xóa webapp mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file vào
COPY target/ecommerce-website.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080
