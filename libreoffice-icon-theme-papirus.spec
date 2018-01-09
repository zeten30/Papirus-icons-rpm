#
# spec file for package libreoffice-style-papirus for Fedora, CentOS
# and RedHat Enterprise Linux 7
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.


Name:           libreoffice-style-papirus
Version:        2018.01
Release:        1%{?dist}
Summary:        Papirus theme for Libreoffice
License:        GPLv3
Group:          System/GUI/Other
Url:            https://github.com/PapirusDevelopmentTeam/papirus-libreoffice-theme
Source0:        papirus-libreoffice-theme.tar.gz
BuildRequires:  automake


%description
Papirus symbol style for LibreOffice.

This package contains the following symbol styles:
 - Epapirus
 - Papirus
 - Papirus_dark


%prep
%setup -n papirus-libreoffice-theme


%install
make install DESTDIR=%{buildroot} PREFIX=%{_libdir}


%files
%defattr(-,root,root)
%doc AUTHORS LICENSE README.md
%dir %{_libdir}/libreoffice
%dir %{_libdir}/libreoffice/share
%dir %{_libdir}/libreoffice/share/config
%{_libdir}/libreoffice/share/config/images_papirus.zip
%{_libdir}/libreoffice/share/config/images_epapirus.zip
%{_libdir}/libreoffice/share/config/images_papirus_dark.zip


%changelog
* Tue Oct 24 2017 Milan Zink <zeten30@gmail.com> - 2017.10
- sync with upstream

* Mon Sep 11 2017 Milan Zink <zeten30@gmail.com> - 2017.9
- sync with upstream

