pkgname=st
pkgver=0.8.3
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
url=https://st.suckless.org
source=(
    st-0.8.3.tar.gz
    st.desktop
    config.h
)
sha256sums=(
    'SKIP'
    'ea729b9dd5cd9b8e02bbe9bc213b8957dfd1d3835d788fa6fbe5d16473f87376'
    'SKIP'
)
_sourcedir=$pkgname
_makeopts="--directory=$_sourcedir"

prepare() {
    cd $srcdir/$pkgname
    sed -i '/tic /d' Makefile
    cp $srcdir/$pkgname.desktop $pkgname.desktop
    cp $srcdir/config.h config.h
}

build() {
    #cd $srcdir/$pkgname-$pkgver
    make $_makeopts X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd $srcdir/$pkgname
    make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/application/$pkgname.desktop"
}

