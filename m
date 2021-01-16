Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF48A2F8E0C
	for <lists+linux-omap@lfdr.de>; Sat, 16 Jan 2021 18:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbhAPROA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Jan 2021 12:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728195AbhAPRKW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Jan 2021 12:10:22 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4451DC0617AA
        for <linux-omap@vger.kernel.org>; Sat, 16 Jan 2021 06:13:14 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 9908E1F45AB1
Received: by earth.universe (Postfix, from userid 1000)
        id 79B403C0C94; Sat, 16 Jan 2021 15:12:29 +0100 (CET)
Date:   Sat, 16 Jan 2021 15:12:29 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Ladislav Michl <ladis@linux-mips.org>
Cc:     Carl Philipp Klemm <philipp@uvos.xyz>, tony@atomide.com,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 1/1] power: supply: cpcap-charger: Add usleep to cpcap
 charger to avoid usb plug bounce
Message-ID: <20210116141229.wgsepdc5jij5fm6y@earth.universe>
References: <20210105195231.e045af1ab1c91de9c726e045@uvos.xyz>
 <X/TCc9ARn2BPuOnt@lenoch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dedeq4usize7uynq"
Content-Disposition: inline
In-Reply-To: <X/TCc9ARn2BPuOnt@lenoch>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--dedeq4usize7uynq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 05, 2021 at 08:48:03PM +0100, Ladislav Michl wrote:
> Dear Carl Philipp,
>=20
> a few comments...
>=20
> On Tue, Jan 05, 2021 at 07:52:31PM +0100, Carl Philipp Klemm wrote:
> > Adds 80000 us sleep when the usb cable is plugged in to hopfully avoid =
bounceing
> 							hopefully	bouncing
> > contacts.
> >=20
> > Upon pluging in the usb cable vbus will bounce for some time, causing c=
pcap to
> > dissconnect charging due to detecting an undervoltage condition. This i=
s a
> disconnect
> > scope of vbus on xt894 while quickly inserting the usb cable with firm =
force,
> > probed at the far side of the usb soccet and vbus loaded with approx 1k:
> 				socket
> > http://uvos.xyz/maserati/usbplug.jpg.
> >=20
> > As can clearly be seen, vbus is all over the place for the first 15 ms =
or so=20
> > with a small blip at ~40 ms this causes the cpcap to trip up and disabl=
e=20
> > charging again.
> >=20
> > The delay helps cpcap_usb_detect avoid the worst of this. It is, howeve=
r, still
> > not ideal as strong vibrations can cause the issue to reapear at any ti=
me during
> > charging. I have however not been able to cause the device to stop char=
ging due
> > to this in practice as it is hard to vibrate the device sutch that the =
vbus pins
> 							such
> > start bouncing again but cpcap_usb_detect is not called again due to a =
detected
> > dissconnect/reconnect event.
> disconnect
> >=20
> > Changes in v4:
> > Increase timeout after some experiamentation suggested its not suffican=
t on all=20
> > devices.
>=20
> Changelog here would become part of a commit message, which is undesirabl=
e. Please
> move it bellow ---
>=20
> > Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> > ---
> >  drivers/power/supply/cpcap-charger.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/suppl=
y/cpcap-charger.c
> > index c0d452e3dc8b..e6b230dd6de4 100644
> > --- a/drivers/power/supply/cpcap-charger.c
> > +++ b/drivers/power/supply/cpcap-charger.c
> > @@ -613,6 +613,9 @@ static void cpcap_usb_detect(struct work_struct *wo=
rk)
> >         if (error)
> >                 return;
> > =20
> > +    /* Delay for 80ms to avoid vbus bouncing when usb cable is plugged=
 in */
> > +       usleep_range(80000, 120000);
> > +
>=20
> indent with tabs please, verify your mailer did not corrupt patch.
>=20
> >         /* Just init the state if a charger is connected with no chrg_d=
et set */
> >         if (!s.chrg_det && s.chrgcurr1 && s.vbusvld) {
> >                 cpcap_charger_update_state(ddata, CPCAP_CHARGER_DETECTI=
NG);

Patch itself looks sensible to me. After fixing the issues mentioned
by Ladislav, please check your mailer carefully. The patch you sent
uses spaces instead of tabs also for the surrounding code suggesting
the mailer broke this. Last but not least I applied a big series
=66rom Tony to cpcap, so don't forget to rebase against current
power-supply for-next branch.

Thanks,

-- Sebastian

--dedeq4usize7uynq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmAC9E0ACgkQ2O7X88g7
+prFtg//TUU+wM3Sr1owlVjxcqsc1z/Jb1g/Bz0nnos5WtjGAHOyJUeMdyd7GDhz
F/9Ne4plfULGKftybhaku3vK9PcjmAnmNNAxNXvICN4F5vjs+oDlQbH29gmYJiLn
90U50PpNZCighsYkfyvOp/V4bGE7CJO/aZqVp4LPMIZZ/jtpJ1aP0g6owRH8k7G0
v5DPoqCcQ8GdC+wxriy52fmjnYFstTqTwXH+HMmzSEBlLODtNpyAfna4zer9lGE7
KgZsgrBkvYpSAJ6RX8s7hVImgnoroqPA0/ebZ1Q5Qbgnq2Kl6NYCyXY6Qc23x3c+
y8qXos1nRFk2YIuxKixY123Mk81a1lzGVbaZcQ8yecFHfsD8n1u1jNbGxqR4A8kF
1lhdF9XfzXe7cUyj4BZHj4utQpy2idv8K8org3nlL6lnGK1du/+t784LSSz6z5VY
5jskcsr+2STCq+obcft47aBTeD6HemUFL8/TImtBVZyc0xziZ/JBxHUVOyLaSLHD
vzt3XIf+zBrkg0EeBer1N87f3s7N0mHQX9rXhJeDV/3ixn45/HceZzkfSq0LSL/t
iggCuurynR5F275NaYXq+ADLa5nxBk/wZt2GUIk1O4fNjVG/liQVeEy2VCMLozn2
49nRpkI6SCwLfq8ioHjpIJe9bCRww2u0eJAKxHT/sbxSDM4ncSA=
=tHCH
-----END PGP SIGNATURE-----

--dedeq4usize7uynq--
