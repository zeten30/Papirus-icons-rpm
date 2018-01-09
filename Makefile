# RPM Makefile
RELEASE=27

sources:
	./sources.sh


clean:
	rm -rf rpmbuild/*.*


clean-sources:
	rm -rf upstream/*


srpm: clean sources
	mock -r fedora-$(RELEASE)-x86_64 --spec papirus.spec --sources rpmbuild/ --resultdir rpmbuild/ --buildsrpm
	mock -r fedora-$(RELEASE)-x86_64 --spec libreoffice-icon-theme-papirus.spec --sources rpmbuild/ --resultdir rpmbuild/ --buildsrpm


rpm: srpm
	mock -r fedora-$(RELEASE)-x86_64 --rebuild rpmbuild/papirus-*.src.rpm --resultdir rpmbuild/
	mock -r fedora-$(RELEASE)-x86_64 --rebuild rpmbuild/libreoffice-*.src.rpm --resultdir rpmbuild/


copr: srpm
	copr-cli build mzink/Utils rpmbuild/papirus-*.src.rpm --nowait
	copr-cli build mzink/Utils rpmbuild/libreoffice-*.src.rpm --nowait
