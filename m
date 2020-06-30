Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F9E20FB34
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 19:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390523AbgF3R64 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 13:58:56 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34334 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389322AbgF3R64 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Jun 2020 13:58:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 821DC1C0C0F; Tue, 30 Jun 2020 19:58:53 +0200 (CEST)
Date:   Tue, 30 Jun 2020 19:58:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pavel Machek <pavel@denx.de>, Merlijn Wajer <merlijn@wizzup.org>,
        jikos@suse.cz, vojtech@suse.cz,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        Beno??t Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Borislav Petkov <bp@suse.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mattias Jacobsson <2pi@mok.nu>,
        Mark Gross <mgross@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:OMAP DEVICE TREE SUPPORT" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>
Subject: Re: input maintainer -- are you there? was Re: [PATCH 1/2] Input:
 add `SW_MACHINE_COVER`
Message-ID: <20200630175853.GA15783@duo.ucw.cz>
References: <20200612125402.18393-1-merlijn@wizzup.org>
 <20200612125402.18393-2-merlijn@wizzup.org>
 <20200616105045.GB1718@bug>
 <fef69c79-9943-7bd1-5c51-101f551cf2c8@wizzup.org>
 <20200629133644.GA22227@amd>
 <20200630052212.GH248110@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20200630052212.GH248110@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Looks like we're blocking on this input patch.
> > >=20
> > > On 16/06/2020 12:50, Pavel Machek wrote:
> > > > On Fri 2020-06-12 14:53:58, Merlijn Wajer wrote:
> > > >> This event code represents the state of a removable cover of a dev=
ice.
> > > >> Value 0 means that the cover is open or removed, value 1 means tha=
t the
> > > >> cover is closed.
> > > >>
> > > >> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com> A=
cked-by: Tony Lindgren=20
> > > >> <tony@atomide.com> Signed-off-by: Merlijn Wajer <merlijn@wizzup.or=
g> ---
> > > >=20
> > > > Dmitry, can we get some kind of comment here, or better yet can we =
get you to apply this?
> > >=20
> > > This is part of a patch series to resolve problems with the Nokia N900
> > > not booting when the cover is removed (making the cover be the card
> > > detect was also just weird IMHO). Just removing the card-detect from =
the
> > > DTS is fine, but it was suggested that we expose the data instead as
> > > input event. And that's gotten no response for about four months.
> > >=20
> > > Should we just drop the feature and only remove the cd-gpios line from
> > > the DTS, assuming upstream doesn't want this SW_MACHINE_COVER code?
> >=20
> > I believe series is good, lets keep it. Changing now will only delay
> > it a bit more. Let me try to get Dmitry's attention...
> >=20
> > If that does not work, we can get Linus' attention :-).
> >=20
> > If that does not work, umm, there are some other options.
>=20
> Sorry, am really swamped the last couple months. I can pick up the input
> code, do you want me to pick up DTS as well?

No problem, sorry for being pushy.

If you could pick up just the input one-liner, that would be best. It
is not risky.

OMAP people will take care of the DTS, I believe, and we can iterate
if it does not work at the first try.

Best regards,
								Pavel

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXvt9XQAKCRAw5/Bqldv6
8mLJAJ9niDdQ0JAxVRvuUYBk2ikmgrMFpQCdH8udpSS3/U1mTinpWbKQVzepJks=
=btfG
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
