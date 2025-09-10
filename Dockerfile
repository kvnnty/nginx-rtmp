FROM tiangolo/nginx-rtmp:latest

RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Copy custom nginx config
COPY infra/nginx.conf /etc/nginx/nginx.conf

# Make directories for HLS and VOD
RUN mkdir -p /hls /vod

# Copy ffmpeg scripts
COPY ffmpeg/ /ffmpeg
RUN chmod +x /ffmpeg/*.sh

# Expose RTMP and HTTP ports
EXPOSE 1935 8083

# Start nginx-rtmp by default
CMD ["nginx", "-g", "daemon off;"]
