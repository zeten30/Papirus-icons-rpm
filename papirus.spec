Name:		papirus
Version:	2017.7
Release:	1%{?dist}
Summary:	Papirus icon themes
Group:		User Interface/Desktops
License:	GPL-3
URL:		  https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git
Vendor:		https://github.com/PapirusDevelopmentTeam
Source0:	papirus-icon-theme.tar.gz
BuildArch:	noarch

%description
Papirus icon themes


# Papirus subpackage
%package icon-theme
Summary:  Papirus icon theme
Group:    User Interface/Desktops

%description icon-theme
Papirus icon themes

# Papirus Light subpackage
%package light-icon-theme
Summary:  Papirus Light icon theme
Group:    User Interface/Desktops
Requires: papirus-icon-theme 

%description light-icon-theme
Papirus Light icon themes

# Papirus Dark subpackage
%package dark-icon-theme
Summary:  Papirus Dark icon theme
Group:    User Interface/Desktops
Requires: papirus-icon-theme 

%description dark-icon-theme
Papirus Dark icon themes

# ePapirus icons subpackage
%package epapirus-icon-theme
Summary:  ePapirus icon theme
Group:    User Interface/Desktops
Requires: papirus-icon-theme 

%description epapirus-icon-theme
ePapirus icon themes


%prep
%setup -q -n papirus-icon-theme


%build
# Nothing to build


%install
%{__install} -d -m755 %{buildroot}%{_datadir}/icons/
for file in ePapirus Papirus Papirus-Dark Papirus-Light; do
  %{__cp} -pr ${file} %{buildroot}%{_datadir}/icons
done

# Files splitted per subpackage
%files epapirus-icon-theme
%defattr(-,root,root)
%{_datadir}/icons/ePapirus

%files icon-theme
%defattr(-,root,root)
%{_datadir}/icons/Papirus

%files dark-icon-theme
%defattr(-,root,root)
%{_datadir}/icons/Papirus-Dark

%files light-icon-theme
%defattr(-,root,root)
%{_datadir}/icons/Papirus-Light


%changelog
* Mon Jul 10 2017 Milan Zink <zeten30@gmail.com> - 2017.7
- sync with upstream

* Tue Jun 20 2017 Milan Zink <zeten30@gmail.com> - 2017.6
- sync with upstream

* Thu Apr 27 2017 Milan Zink <zeten30@gmail.com> - 2017.4
- sync with upstream
- versioning based on date

* Fri Mar 3 2017 Milan Zink <zeten30@gmail.com> - 1.1.1
- subpackages per variant

* Thu Feb 2 2017 Milan Zink <zeten30@gmail.com> - 1.0.1
- Initial build for Fedora
