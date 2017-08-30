# RPM Makefile
RELEASE=26

sources:
	./sources.sh


clean:
	rm -rf rpmbuild/*.*


clean-sources:
	rm -rf upstream/*


srpm: clean sources
	mock -r fedora-$(RELEASE)-x86_64 --spec papirus.spec --sources rpmbuild/ --resultdir rpmbuild/ --buildsrpm


rpm: srpm
	mock -r fedora-$(RELEASE)-x86_64 --rebuild rpmbuild/papirus-*.src.rpm --resultdir rpmbuild/


copr: srpm
	copr-cli build mzink/Utils rpmbuild/papirus-*.src.rpm
