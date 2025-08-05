# Dùng image Tomcat 9
FROM tomcat:9.0

# Xóa webapp mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file vào
COPY target/eCommerceWebsite-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080
