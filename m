Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEC815CF83
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 02:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgBNBj2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Feb 2020 20:39:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:49408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727955AbgBNBj2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Feb 2020 20:39:28 -0500
Received: from earth.universe (dyndsl-037-138-190-090.ewe-ip-backbone.de [37.138.190.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C59EF217F4;
        Fri, 14 Feb 2020 01:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581644366;
        bh=R+uvHmPDw6tAok37vBR5/eI6ga0my/lPOeNir3F9E/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GkxWJfuQmrrqXHalF1xO4WNtze7P8KOxd3ehxYmAlo14MjNdFQd60g9qydeqrioAQ
         hQthb8YoJ3aGNRbHwic4hllX91ySOEE34Crfiybh76OE5f3y3TzCJvrQ8gR9yVmYtg
         d/+EvVg0IrMJ1AuXLrd6erDdnosA3jmW5OjvrWC0=
Received: by earth.universe (Postfix, from userid 1000)
        id 8C3FF3C0C83; Fri, 14 Feb 2020 02:39:24 +0100 (CET)
Date:   Fri, 14 Feb 2020 02:39:24 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>, Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        "Arthur D." <spinal.by@gmail.com>
Subject: Re: N900: Remove mmc1 "safety feature"? (was: Re: mmc0 on Nokia N900
 on Linux 5.4.18)
Message-ID: <20200214013924.7wcama5ix2ivok2e@earth.universe>
References: <5362c659-120f-5247-aaa5-7916229300bc@wizzup.org>
 <20200208190448.GA12984@amd>
 <270f27c9-afd6-171d-7dce-fe1d71dd8f9a@wizzup.org>
 <1eac0db3-17ce-8ebd-4997-8b1c282126e4@wizzup.org>
 <20200208220621.GA18161@amd>
 <d2d6d6ac-c964-ac48-1616-6f1826219385@wizzup.org>
 <20200210192714.GC14939@darkstar.musicnaut.iki.fi>
 <8d0ecfcd-f9a7-9563-8a39-9793cfbeb893@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uiikh7f4rkctkik7"
Content-Disposition: inline
In-Reply-To: <8d0ecfcd-f9a7-9563-8a39-9793cfbeb893@wizzup.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--uiikh7f4rkctkik7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 12, 2020 at 02:02:53PM +0100, Merlijn Wajer wrote:
> On 10/02/2020 20:27, Aaro Koskinen wrote:
> >> So how does this currently happen, the unmounting? Does the mmc1 card
> >> just disappear from /dev/ without any safe unmount? I don't understand
> >> how the current setup can work from a userspace point of view.
> >>
> >> Userspace could react on kernel events that tell it the cover is open,
> >> but I assume the kernel doesn't just decide to nuke the node from /dev=
/,
> >> so in that case the current DTS setup still doesn't make sense, right?
> >>
> >> What am I missing? Could you describe how this would work in a 'real
> >> life' scenario?
> >=20
> > I don't think it can work with the current mainline kernel.
> >=20
> > I recall the original Nokia kernel used the GPIO for "cover switch"
> > instead of card detect, and it was visible in sysfs, and this allowed
> > userspace to react on cover removal.. In the mainline kernel we have
> > this for older Nokia devices (770, N8x0), but not for N900. Still it
> > wouldn't help much for "safe unmount" as the unmount can take quite a
> > while, and user may remove the card too early.
>=20
> Shall I send in a patch removing this check from the device tree, then?

I agree it's mostly annoying and suggest to convert the GPIO
into a gpio-key using a newly defined

SW_MACHINE_COVER /* set =3D cover closed */

Similar to the camera lens cover. It means userspace has a chance to
show a warning, but system works generally. I think it's ok to
assume that people running mainline on their N900 nowadays know what
could happen when they hot-remove SD cards.

-- Sebastian

--uiikh7f4rkctkik7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5F+kkACgkQ2O7X88g7
+poCXhAAnBEcV5nOxp+Dp3eXkvRWoKVfXm3AvTm+qabCcmifOQD5RWTfIptZ7RCm
0xzn+G8/FXSp17vmOElqV2Cybryqgb3xedQ3BRA+HsWPd4k0cuxcLNJVtSBuN3aI
+xadepRN8uxFXFI8xlYJHuF1ekEAaxu4y3LqEf+WazWPWuxnUbaVpj6IbNiG5ReH
t+oJbxiy90757w8WcjJ3/0icbwCTfDDIrjs+HV4TPAZFshdUiE3nbQDdXRtENOaB
ebVrzpNyvytRvyznl46qhmrzvCPta7vHk8qZT9/Ou/2RkPkeEL37temB7yotI1yy
6++HmxRUq1yQhA25Y6DFe9GhQX8zrwG8+1IQLHSsyNeMnZEGmApozxFVLf9prm++
6NdeeFA6s5KBAuys+4SkTsfPjfkBK6mIwoG/Dn1oTZzgZO2LE13zt5USEe9e1PAa
dFgNI1UF23yZsk51noORDVfTEFkM66yC32t4UJTOJRa70VMCussE4wV87Sv3sPyB
ZfLqzhM1PSJf4M8kxpbuN/DMfC5iaopQ1i793P1zG5Yd503EuHHOMIjPuDayqrqb
0uehMp+2v3tzaWTAGX1RpjfoGRm9RSdwijEp89efm+y+fV4Ev2/BZnDZIjDjODWP
k2HuElGcQ98s7HRwhUdXUBA3wtIX5eSQ3hYSkfsLBRPWiVewA2w=
=Z2hN
-----END PGP SIGNATURE-----

--uiikh7f4rkctkik7--
