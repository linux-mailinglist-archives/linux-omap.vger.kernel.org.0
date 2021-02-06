Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB66311D60
	for <lists+linux-omap@lfdr.de>; Sat,  6 Feb 2021 14:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhBFNPP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 6 Feb 2021 08:15:15 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:59944 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhBFNPP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 6 Feb 2021 08:15:15 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9ED161C0B77; Sat,  6 Feb 2021 14:14:16 +0100 (CET)
Date:   Sat, 6 Feb 2021 14:14:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz, phone-devel@vger.kernel.org,
        maemo-leste@lists.dyne.org
Subject: Droid 4 charging
Message-ID: <20210206131415.GA4499@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

(I'm using Leste 5.10 kernel here).

When battery is full, green light is off and 0.00A being drawn from
USB.

But that means that phone is now powered from battery, discharging
it... And soon charging starts again. (Pretty much immediately, for me)

That's bad ... right? It wears the battery out.

If I turn off charging with echo 0 > input_current_limit, 0.2 to 0.4A
is drawn from USB, and battery is not discharged:

root@devuan-droid4:/sys/class/power_supply/usb# echo 0 >  input_current_lim=
it
root@devuan-droid4:/sys/class/power_supply/usb# cat current_now
0

Is that a better way to handle full battery?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAelicACgkQMOfwapXb+vK/bwCguKUzZuXqGMMpi7o3wYZkwua0
qOAAoKJtVeDNf10adOClXBO+1nl0+ACG
=hAuc
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
