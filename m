Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A95BA4B67
	for <lists+linux-omap@lfdr.de>; Sun,  1 Sep 2019 21:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfIATj2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 1 Sep 2019 15:39:28 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:44664 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfIATj2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 1 Sep 2019 15:39:28 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id A29FC8153D; Sun,  1 Sep 2019 21:39:12 +0200 (CEST)
Date:   Sun, 1 Sep 2019 21:39:25 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: next-20190830 on Droid 4 was Re: [PATCH 0/4] musb host improvments
 mostly for omap2430 glue
Message-ID: <20190901193925.GA30586@amd>
References: <20190830232058.53414-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <20190830232058.53414-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--0OAP2g/MAC+5xKAE
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

I thought I'd test this, so I took

commit 6d028043b55e54f48fbdf62ea8ce11a4ad830cac
    Add linux-next specific files for 20190830

Series (and the other two patches you sent around it) applies ok, but
the result does not boot.

Hmm.

I guess I'll need to resurrect the serial port cable.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1sHm0ACgkQMOfwapXb+vIVbQCgsPODxEwwCon5ZeHC4gpSLfq1
aB4An14jJZbgRELk7gz8FZPreGgMAzW+
=paUb
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
