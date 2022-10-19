PERL_DOCKER_TAG=5.36.0-slim-bullseye
CPAN_MODULES=$(grep -E '^[A-Z].+' cpan_modules.txt | tr '\n' ' ')
