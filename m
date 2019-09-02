Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15606A52BA
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 11:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731037AbfIBJXs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 05:23:48 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50472 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729603AbfIBJXr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 05:23:47 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 68A6080905; Mon,  2 Sep 2019 11:23:31 +0200 (CEST)
Date:   Mon, 2 Sep 2019 11:23:44 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 0/4] musb host improvments mostly for omap2430 glue
Message-ID: <20190902092344.GA31410@amd>
References: <20190830232058.53414-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20190830232058.53414-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> So I ended up cleaning up omap2430 glue layer a bit for host mode with the
> various reproducable errors I was seeing docking droid4 to a lapdock. The=
re
> are a few fixes, and then we end up removing all the devctl register tink=
ering
> for omap2430 glue layer.

I should have your recent patches up-to [PATCH] power: supply:
cpcap-charger: Enable vbus boost voltage applied to linux-next, -0830.

So... to get usb host to work even with stock kernel, I need a hub and
external power... and "right" cable between phone and hub.

When I plugged/unplugged it several times, I got

### usb unplug:
musb-hdrc.0.auto: musb_set_peripheral: already in peripheral mode: 80
musb-hdrc.0.auto: musb_set_peripheral: already in peripheral mode: 80
ub0: stop stats: rx/tx 0/0, errs 0/0
l3_init_cm:clk:0040:0: failed to disable
l3_init_cm:clk:00c0:0: failed to disable
### usb plug produces nothing
### usb unplug:
musb-hdrc.0.auto: musb_set_peripheral: already in peripheral mode: 80
musb-hdrc.0.auto: musb_set_peripheral: already in peripheral mode: 80

Hmm. I did it two more times, and now machine rebooted, and USB was
powered from the phone for a while (3.6V).

And I reproduced the crash on the next boot.

Is there anything I may be missing in .config?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1s36AACgkQMOfwapXb+vIWZACgmFqp1q2DKFKpNF6u+etS5VXE
4roAnRmGpeNboURqJDD4h6CSfZs/INw0
=73nW
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
