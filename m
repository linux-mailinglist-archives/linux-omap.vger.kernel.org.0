Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3B04A4B79
	for <lists+linux-omap@lfdr.de>; Sun,  1 Sep 2019 21:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbfIATtP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 1 Sep 2019 15:49:15 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:46835 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728506AbfIATtP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 1 Sep 2019 15:49:15 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id B812181841; Sun,  1 Sep 2019 21:48:58 +0200 (CEST)
Date:   Sun, 1 Sep 2019 21:49:11 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Pavel Machek <pavel@denx.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Michael Scott <hashcode0f@gmail.com>
Subject: Re: next-20190830 on Droid 4 was Re: [PATCH 0/4] musb host
 improvments mostly for omap2430 glue
Message-ID: <20190901194911.GB30586@amd>
References: <20190830232058.53414-1-tony@atomide.com>
 <20190901193925.GA30586@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline
In-Reply-To: <20190901193925.GA30586@amd>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-09-01 21:39:25, Pavel Machek wrote:
> Hi!
>=20
> > So I ended up cleaning up omap2430 glue layer a bit for host mode with =
the
> > various reproducable errors I was seeing docking droid4 to a lapdock. T=
here
> > are a few fixes, and then we end up removing all the devctl register ti=
nkering
> > for omap2430 glue layer.
>=20
> I thought I'd test this, so I took
>=20
> commit 6d028043b55e54f48fbdf62ea8ce11a4ad830cac
>     Add linux-next specific files for 20190830
>=20
> Series (and the other two patches you sent around it) applies ok, but
> the result does not boot.

Hmm. Maybe I'm just having problem with the backlight. I do see
regulator failure:

[    2.143920] cpcap-usb-phy cpcap-usb-phy.0: using device tree for
GPIO lookup
[    2.151031] of_get_named_gpiod_flags: parsed 'mode-gpios' property
of node ')
[    2.166015] gpio gpiochip2: Persistence not supported for GPIO 28
214935] ------------[ cut here ]------------
[    2.219604] WARNING: CPU: 0 PID: 1 at drivers/regulator/core.c:2040
_regulat0
[    2.228118] Modules linked in:
[    2.231201] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.3.0-rc6-next-20190834
[    2.238800] Hardware name: Generic OMAP4 (Flattened Device Tree)
[    2.244873] [<c010f224>] (unwind_backtrace) from [<c010b4fc>]
(show_stack+0x)
[    2.252655] [<c010b4fc>] (show_stack) from [<c08ca584>]
(dump_stack+0xa8/0xc)

and some drm problems:

[   59.303253] omap-mcbsp 40124000.mcbsp: CLKS: could not clk_get()
prcm_fck
[   59.311492] ------------[ cut here ]------------
[   59.314666] WARNING: CPU: 0 PID: 2704 at
drivers/gpu/drm/omapdrm/dss/hdmi4.c0
[   59.325866] Modules linked in:
[   59.328948] CPU: 0 PID: 2704 Comm: alsa-sink-HDMI  Tainted: G
W      4
[   59.337982] Hardware name: Generic OMAP4 (Flattened Device Tree)
[   59.344757] [<c010f224>] (unwind_backtrace) from [<c010b4fc>]
(show_stack+0x)
[   59.352569] [<c010b4fc>] (show_stack) from [<c08ca584>]
(dump_stack+0xa8/0xc)
[   59.359832] [<c08ca584>] (dump_stack) from [<c012de94>]
(__warn+0xc8/0xf0)

But I get login prompt on the serial. And after I do:

root@devuan:/sys/class/leds/lm3532::backlight# echo 255 > brightness

I can even see X are running.

Good so far :-).

Best regards,							Pavel

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1sILcACgkQMOfwapXb+vJyDACgkYHyNaGha8AzYvK35pKloee1
m2EAoIvw/eYdUmGoDUBy6nO6XeLFC2/K
=oxiI
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
