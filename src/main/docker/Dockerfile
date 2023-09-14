FROM desarrollo.jaha.com.py/base-api:0.1
RUN mkdir -p /usr/local/@project.artifactId@
RUN mkdir -p /usr/local/@project.artifactId@/config
ADD @project.build.finalName@.jar /usr/local/@project.artifactId@/
ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh
