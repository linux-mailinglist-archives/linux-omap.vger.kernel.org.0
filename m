Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF86821C841
	for <lists+linux-omap@lfdr.de>; Sun, 12 Jul 2020 11:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbgGLJ13 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 12 Jul 2020 05:27:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54012 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728112AbgGLJ13 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 12 Jul 2020 05:27:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5A1BF1C0BD2; Sun, 12 Jul 2020 11:27:27 +0200 (CEST)
Date:   Sun, 12 Jul 2020 11:27:26 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     maemo-leste@lists.dyne.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Subject: GPS fun on Droid 4 and leste
Message-ID: <20200712092726.GC13495@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

GPS on the droid 4 does not really work out of the box.

gpsd is not in default installation, maybe it should be?

What is worse, there's something broken with gpsd. Try:

/usr/sbin/gpsd -N -D 5 /dev/gnss0
gpspipe -w
# this seems to work, but do ^C and restart
gpspipe -w
=2E..and it hangs.

xgps from gpsd-clients is broken: probably missing dependency
on gtk3 libraries.

user@devuan-droid4:/my/tui/lib$ xgps
Traceback (most recent call last):
  File "/usr/bin/xgps", line 30, in <module>
      gi.require_version('Gtk', '3.0')
 File "/usr/lib/python2.7/dist-packages/gi/__init__.py", line
 129, in require_version
 raise ValueError('Namespace %s not available' % namespace)
 ValueError: Namespace Gtk not available

Any ideas?

Best regards,
								Pavel
	   =20
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8K134ACgkQMOfwapXb+vLzGgCgsei4ZZLbLbv/sMfBqswePsXX
5/EAoLKw6NHpR+1u0Xz14KwX2P9CJipt
=ioJe
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
