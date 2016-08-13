#!/usr/bin/env bash


function echospaced() {
    printf "\n# %s\n" "${1}"
}

ICONSIZES="16 22 32 48 64 128 256 512"


BUILDER="luis@huntingbears.com.ve"

URXVT_BUILD_DEPENDS="libxt-dev libxrender-dev libx11-dev libxpm-dev groff-base \
                    autotools-dev xutils-dev libxft-dev chrpath libperl-dev \
                    libev-dev libstartup-notification0-dev libgtk2.0-dev"
VIM_BUILD_DEPENDS="libacl1-dev libgpmg1-dev autoconf debhelper libncurses5-dev \
                   libselinux1-dev libgtk2.0-dev libgtk-3-dev libxaw7-dev libxt-dev \
                   libxpm-dev libperl-dev tcl-dev python3-dev ruby ruby-dev lua5.2 \
                   liblua5.2-dev"

BASEDIR="$(pwd)"
URXVT_TEMPDIR="$(mktemp -d)"
VIM_TEMPDIR="$(mktemp -d)"
GIT_REPOS="$(cat "${BASEDIR}/init.vim" | grep "Plug" | grep -v "subliminal-view" | awk -F"'" '{print "https://github.com/"$2".git"}')"
DEB_HOST_GNU_TYPE="$(dpkg-architecture -qDEB_HOST_GNU_TYPE)"
DEB_BUILD_GNU_TYPE="$(dpkg-architecture -qDEB_BUILD_GNU_TYPE)"
CPPFLAGS="$(dpkg-buildflags --get CPPFLAGS) -Wall"
CFLAGS="$(dpkg-buildflags --get CFLAGS) -Wall"
CXXFLAGS="$(dpkg-buildflags --get CXXFLAGS) -Wall"
LDFLAGS="$(dpkg-buildflags --get LDFLAGS)"

VIM_FLAGS=" \
    CPPFLAGS=\"${CPPFLAGS}\" \
    CFLAGS=\"${CFLAGS}\" \
    CXXFLAGS=\"${CXXFLAGS}\" \
    LDFLAGS=\"${LDFLAGS}\""

VIM_CONFIG=" \
    --prefix=/opt \
    --mandir=\${prefix}/share/man \
    --without-local-dir \
    --with-modified-by=${BUILDER} \
    --with-compiledby=${BUILDER} \
    --enable-fail-if-missing \
    --enable-cscope \
    --with-features=huge \
    --enable-multibyte \
    --enable-acl \
    --enable-gpm \
    --enable-selinux \
    --disable-smack \
    --with-x \
    --enable-xim \
    --disable-gui \
    --enable-fontset \
    --enable-luainterp \
    --disable-mzschemeinterp \
    --enable-perlinterp \
    --enable-python3interp \
    --with-python3-config-dir=$(python3-config --configdir) \
    --disable-pythoninterp \
    --enable-rubyinterp \
    --enable-tclinterp \
    --with-tclsh=/usr/bin/tclsh"

URXVT_FLAGS=" \
    CPPFLAGS=\"${CPPFLAGS}\" \
    CFLAGS=\"${CFLAGS}\" \
    CXXFLAGS=\"${CXXFLAGS}\" \
    LDFLAGS=\"${LDFLAGS}\""

URXVT_CONFIG=" \
    --host=${DEB_HOST_GNU_TYPE} \
    --build=${DEB_BUILD_GNU_TYPE} \
    --prefix=/opt \
    --mandir=\${prefix}/share/man \
    --infodir=\${prefix}/share/info \
    --enable-keepscrolling \
    --enable-selectionscrolling \
    --enable-pointer-blank \
    --enable-utmp \
    --enable-wtmp \
    --enable-warnings \
    --enable-lastlog \
    --enable-unicode3 \
    --enable-combining \
    --enable-xft \
    --enable-font-styles \
    --enable-256-color \
    --enable-24-bit-color \
    --enable-pixbuf \
    --enable-transparency \
    --enable-fading \
    --enable-rxvt-scroll \
    --enable-next-scroll \
    --enable-xterm-scroll \
    --enable-perl \
    --enable-xim \
    --enable-iso14755 \
    --enable-mousewheel \
    --enable-slipwheeling \
    --enable-smart-resize \
    --enable-startup-notification \
    --with-term=rxvt-unicode-256color"

mkdir -p "${BASEDIR}/subliminal-view/bin"
mkdir -p "${BASEDIR}/subliminal-view/urxvt"

echospaced "Downloading Vim source ..."
git clone --depth 1 --branch master --single-branch \
    https://github.com/vim/vim "${VIM_TEMPDIR}/vim"

echospaced "Downloading Urxvt source ..."
git clone --depth 1 --branch 24bit-deprecated --single-branch \
    --recursive --shallow-submodules \
    https://github.com/LuisAlejandro/rxvt-unicode "${URXVT_TEMPDIR}/urxvt"

echospaced "Compiling Vim ..."
cd "${VIM_TEMPDIR}/vim"
cp src/config.mk.dist src/auto/config.mk
env "${VIM_FLAGS}" ./configure ${VIM_CONFIG} && make

echospaced "Compiling Urxvt ..."
cd "${URXVT_TEMPDIR}/urxvt"
env "${URXVT_FLAGS}" ./configure ${URXVT_CONFIG} && make

echospaced "Compiling Subliminal View UI ..."
cd "${BASEDIR}"
gcc $(pkg-config --cflags gtk+-3.0) "ui/search.c" -o "ui/search" $(pkg-config --libs gtk+-3.0)

echospaced "Copying Subliminal View source ..."
cp "${BASEDIR}/ui/search" "${BASEDIR}/subliminal-view/bin"
cp "${URXVT_TEMPDIR}/urxvt/src/rxvt" "${BASEDIR}/subliminal-view/bin"
cp "${URXVT_TEMPDIR}/urxvt/src/urxvt.pm" "${BASEDIR}/subliminal-view/urxvt"
cp "${VIM_TEMPDIR}/vim/src/vim" "${BASEDIR}/subliminal-view/bin"

echospaced "Generating Subliminal View icons ..."
for S in ${ICONSIZES}; do
    mkdir -p "${BASEDIR}/subliminal-view/icons/hicolor/${S}x${S}/apps"
    convert -verbose -background None -resize "${S}x${S}" \
        "${BASEDIR}/subliminal-view.svg" \
        "${BASEDIR}/subliminal-view/icons/hicolor/${S}x${S}/apps/subliminal-view.png"
done

echospaced "Generating Subliminal View icons ..."
curl -fLo "${BASEDIR}/subliminal-view/plug/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

NERDFONT="DejaVu Sans Mono for Powerline Nerd Font Complete Mono.ttf"
ESCNERDFONT="$(python -c "import urllib; print urllib.quote('''${NERDFONT}''')")"

curl -fLo "${BASEDIR}/subliminal-view/fonts/${NERDFONT}" --create-dirs \
    "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/${ESCNERDFONT}"

curl -fLo "${BASEDIR}/subliminal-view/fonts/fontawesome-webfont.ttf" --create-dirs \
    https://github.com/FortAwesome/Font-Awesome/raw/master/fonts/fontawesome-webfont.ttf

mkdir "${BASEDIR}/subliminal-view/plugins"
cd "${BASEDIR}/subliminal-view/plugins"

git clone --depth 1 --single-branch --branch development \
    https://github.com/LuisAlejandro/subliminal-view.git

for G in ${GIT_REPOS}; do
    git clone --depth 1 --single-branch ${G}
done

cd ${BASEDIR}

PYTHONPKGLIST="pylint pyflakes pep8 pydocstyle docutils yamllint vim-vint"
NODEPKGLIST="jshint jsonlint csslint sass-lint less dockerfile_lint"
RUBYPKGLIST="rubocop mdl sqlint"
GOPKGLIST="github.com/golang/lint/golint"

RUBYSNDBX="${BASEDIR}/sandboxes/ruby"
PYTHONSNDBX="${BASEDIR}/sandboxes/python"
NODESNDBX="${BASEDIR}/sandboxes/node"
GOSNDBX="${BASEDIR}/sandboxes/go"

echospaced "Generating Ruby sandbox ..."
mkdir -vp ${RUBYSNDBX}
gem install --install-dir ${RUBYSNDBX} ${RUBYPKGLIST}

echospaced "Generating Python sandbox ..."
mkdir -vp ${PYTHONSNDBX}
virtualenv ${PYTHONSNDBX}
${PYTHONSNDBX}/bin/pip install ${PYTHONPKGLIST}

echospaced "Generating NodeJS sandbox ..."
mkdir -vp ${NODESNDBX}
npm --prefix ${NODESNDBX} install ${NODEPKGLIST}

echospaced "Generating Go sandbox ..."
mkdir -vp ${GOSNDBX}
export GOPATH="${GOSNDBX}"
go get -v ${GOPKGLIST}

tar -czf subliminal-view_${VERSION}.tar.gz subliminal-view



# rm -rf "${VIM_TEMPDIR}" "${URXVT_TEMPDIR}" subliminal-view
