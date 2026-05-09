FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Expose the port n8n runs on
EXPOSE 5678

# Use the default n8n entrypoint
ENTRYPOINT ["n8n"]
CMD ["start"]
