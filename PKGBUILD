pkgname=st
pkgver=0.8.3
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
url=https://st.suckless.org
source=(
    https://dl.suckless.org/st/st-0.8.3.tar.gz
    https://st.suckless.org/patches/scrollback/st-scrollback-20200419-72e3f6c.diff
    https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20191024-a2c479c.diff
    https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20200416-5703aa0.diff
    https://github.com/juliusHuelsmann/st/releases/download/patchesV3/st-vimBrowse-20200212-2b8333f.diff
    https://st.suckless.org/patches/clipboard/st-clipboard-0.8.3.diff
    st.desktop
    config.h
)
sha256sums=(
    '939ae3da237e7c9489694853c205c7cbd5f2a2f0c17fe41a07477f1df8e28552'
    '1e41fe17a5ef5a8194eea07422b49d815e2c2bb4d58d84771f793be423005310'
    '319458d980195d18fa0f81a6898d58f8d046c5ff982ab872d741f54bb60e267d'
    'cb87eb654985da46ff63663407184402393ad3d3013c8795570552fe56a15b9d'
    'f6e1c0c5f1d02a27d6b111e50c8731ea5a0ae372d8cd5aedccd82207be7d8275'
    '0f5ce33953abce74a9da3088ea35bf067a9a4cfeb9fe6ea9800268ce69e436c0'
    'ea729b9dd5cd9b8e02bbe9bc213b8957dfd1d3835d788fa6fbe5d16473f87376'
    'SKIP'
)
_sourcedir=$pkgname-$pkgver
_makeopts="--directory=$_sourcedir"

prepare() {
    cd $srcdir/$pkgname-$pkgver
    sed -i '/tic /d' Makefile
    patch -i $srcdir/st-scrollback-20200419-72e3f6c.diff
    patch -i $srcdir/st-scrollback-mouse-20191024-a2c479c.diff
    patch -i $srcdir/st-scrollback-mouse-altscreen-20200416-5703aa0.diff
    cp $srcdir/$pkgname.desktop $pkgname.desktop
    cp $srcdir/config.h config.h
}

build() {
    #cd $srcdir/$pkgname-$pkgver
    make $_makeopts X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/application/$pkgname.desktop"
}

