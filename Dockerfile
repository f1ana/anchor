FROM denoland/deno:alpine

# The port that your application listens to.
EXPOSE 43385

WORKDIR /app

# Prefer not to run as root.
USER deno

# Copy in source code
COPY *.ts .

# Compile the main app so that it doesn't need to be compiled each startup/entry.
RUN deno cache mod.ts

CMD ["run", "--allow-net", "--allow-env", "--allow-write", "mod.ts"]
