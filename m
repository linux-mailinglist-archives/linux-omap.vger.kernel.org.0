Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFFDA2794D
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2019 11:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730363AbfEWJd3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 May 2019 05:33:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:47006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726913AbfEWJd2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 May 2019 05:33:28 -0400
Received: from earth.universe (host-091-097-045-018.ewe-ip-backbone.de [91.97.45.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C220220675;
        Thu, 23 May 2019 09:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558604008;
        bh=oJnvgKctkTsQXW1nRvLR74e52CYy5mqld95knmHvY/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sp/5OXrGoPLMjtuOycQR9EF4c3ltP9LVMOowt6r0XNYWRXSJd9fATJGRJX4VJP7zf
         QYldPePwx+JVM6V4Nc+J1IQ8puJGkGuDnd9coflRgOrqHz4ELvFC97QmX1VfZOKR2p
         5139yk7dIolljUiEh2WqxZARw+9NJExZmFbCEl18=
Received: by earth.universe (Postfix, from userid 1000)
        id 23FEC3C0EA7; Thu, 23 May 2019 11:33:25 +0200 (CEST)
Date:   Thu, 23 May 2019 11:33:25 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org
Subject: Re: 5.2-rc1 on droid4: spi crash
Message-ID: <20190523093325.6si5jpvrvyktpax6@earth.universe>
References: <20190523090926.GA9106@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ungvfzrp4zeutewo"
Content-Disposition: inline
In-Reply-To: <20190523090926.GA9106@amd>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ungvfzrp4zeutewo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 23, 2019 at 11:09:26AM +0200, Pavel Machek wrote:
> This was greeting me overnight... I don't yet know how reproducible it
> is, it happened once so far.

Please pipe the stacktrace into ./scripts/decode_stacktrace.sh
to get a readable stacktrace, otherwise this is pretty much useless.
FWIW the only SPI device in the Droid 4 is the PMIC.

-- Sebastian

> root@devuan:/sys/class/leds#
> Message from syslogd@devuan at May 23 00:11:31 ...
>  kernel:[14889.641143] Internal error: Oops: 5 [#1] SMP ARM
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.638275] Process spi0 (pid: 100, stack limit =3D
>  0x97305d31)
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.650238] Stack: (0xedee7ed0 to 0xedee8000)
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.652069] 7ec0:
>  00000000 00000000 eba35c14 eba35c50
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.662841] 7ee0: edd93000 edd93360 ede3da50 c052683c
>  ffffffff edadcc10 edadcc9c 00000004
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.671051] 7f00: 00000000 ede3d800 600f0013 edd93000
>  eba35c14 eba35c50 edadcc10 edadcc10
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.679260] 7f20: 00000002 00000001 edd9322c c0526cb4
>  edd932a4 edb34600 edd932a0 edd932a4
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.687499] 7f40: 00000000 edd932d0 edd932a0 edd932a4
>  00000000 00000001 c0e82d14 edd932b4
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.695709] 7f60: c0e82d14 c0148f40 00000000 edca5580
>  00000000 ede39400 edca55a8 edd932a0
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.703918] 7f80: ed88dd48 c0148e74 00000000 c01491ec
>  ede39400 c01490dc 00000000 00000000
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.708251] 7fa0: 00000000 00000000 00000000 c01010e8
>  00000000 00000000 00000000 00000000
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.720367] 7fc0: 00000000 00000000 00000000 00000000
>  00000000 00000000 00000000 00000000
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.724334] 7fe0: 00000000 00000000 00000000 00000000
>  00000013 00000000 00000000 00000000
>=20
> Message from syslogd@devuan at May 23 00:11:51 ...
>  kernel:[14909.807312] Code: e3a08c02 e5954034 e1a01005 e1a00007
>  (e5943008)
>  Write failed: Broken pipe
>  pavel@duo:/data/l/k$
> =20
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html



--ungvfzrp4zeutewo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlzmaN8ACgkQ2O7X88g7
+pqvEw/9GaGTkn2sdHP4E/nBVDOskOXymv3VuTAymJjFtLO14SxcogFTV5NXoyiw
o8Mcu5Yq+aFehyzelPPHYRBxM795P+r+r5pGzDLkwxHFIJ9NPGmXs/LT6ByTIDjv
HD0lqG0zL8TUI/+xhlVHcDqYCk8DMh9Jnu8YN3dovQBIF9AEl2zxfnTLcY1JTl93
pAaXBcfwQ8vq++0vSIX4zYDh9UDUwHW6u2TR0vK0fM67/XD3WmM5YESelVtIxk7S
NuRtYGKePQ+A+LvR+IXDg4p9o9IHZZ+a9WkiWfNa7r/rrWijYN1qN33FQmWBzGmd
gFN6VO6SMsjO8PDn1/xDrDMvih4lc5YuhTI29uQTBzTFe8aPdYGFMu8JBr28XQKB
3np8vxbB6Zp1dNngl9so9XjUba4UrQ3f+emh9seY/s8OVHNp2WOSItp9js25pNoV
7ch1PIlAdSCZ30eWrFoVarj67Hv9/NV477jCwMqU27cbTyNYr3B4sb+O99H1IWAI
s+U4DukAZftmepJlsftiosUZrNiwMASDiBfevBx3Y8nCI/W1HQ9L+//WfE84VVDt
L4mCd2rFSswvXMKaPpWXFdLkNhNqyqA3ZYVaXt8IQdHZzy8RW125kenxiJOV1zz0
05COfbMVDrAZYxCpcZWXJ7JXgVtxfHeSgvF8pGgpQAbUi1OcKxA=
=Gk9g
-----END PGP SIGNATURE-----

--ungvfzrp4zeutewo--
