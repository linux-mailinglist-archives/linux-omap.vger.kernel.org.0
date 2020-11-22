Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244D02BC593
	for <lists+linux-omap@lfdr.de>; Sun, 22 Nov 2020 13:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgKVMTo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Nov 2020 07:19:44 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42492 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbgKVMTn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 22 Nov 2020 07:19:43 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E22721C0B92; Sun, 22 Nov 2020 13:19:40 +0100 (CET)
Date:   Sun, 22 Nov 2020 13:19:40 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz, phone-devel@vger.kernel.org,
        maemo-leste@lists.dyne.org
Subject: Droid 4 in next-20201120: cpcap-usb-phy.0: could not initialize VBUS
 or ID IIO:
Message-ID: <20201122121940.GA26145@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm getting this warning during boot:

[    3.413299] gpio gpiochip1: Persistence not supported for GPIO 0
[    3.419494] cpcap-usb-phy cpcap-usb-phy.0: could not initialize VBUS or =
ID IIO: -517
[    3.427398] ------------[ cut here ]------------
[    3.432067] WARNING: CPU: 0 PID: 1 at drivers/regulator/core.c:2123 _reg=
ulator_put.part.2+0x168/0x17c
[    3.441406] Modules linked in:
[    3.444519] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.0-rc4-next-20=
201120-dirty #198
[    3.452728] Hardware name: Generic OMAP4 (Flattened Device Tree)
[    3.458801] [<c010db44>] (unwind_backtrace) from [<c0109ec0>] (show_stac=
k+0x10/0x14)
[    3.466613] [<c0109ec0>] (show_stack) from [<c095561c>] (dump_stack+0xb8=
/0xd4)
[    3.473876] [<c095561c>] (dump_stack) from [<c0953208>] (__warn+0xa8/0xd=
0)
[    3.480804] [<c0953208>] (__warn) from [<c095327c>] (warn_slowpath_fmt+0=
x4c/0x98)
[    3.488311] [<c095327c>] (warn_slowpath_fmt) from [<c0479b90>] (_regulat=
or_put.part.2+0x168/0x17c)
[    3.497344] [<c0479b90>] (_regulator_put.part.2) from [<c0479bcc>] (regu=
lator_put+0x28/0x38)
[    3.505828] [<c0479bcc>] (regulator_put) from [<c053a86c>] (release_node=
s+0x1a0/0x248)
[    3.513793] [<c053a86c>] (release_nodes) from [<c05366b8>] (really_probe=
+0x104/0x3b4)
[    3.521667] [<c05366b8>] (really_probe) from [<c0536acc>] (driver_probe_=
device+0x58/0xb4)
[    3.529907] [<c0536acc>] (driver_probe_device) from [<c0534b34>] (bus_fo=
r_each_drv+0x70/0x94)
[    3.538482] [<c0534b34>] (bus_for_each_drv) from [<c0536540>] (__device_=
attach+0xbc/0x128)

(and then cpcap does not work). Is my configuration missing something?

Later I get warnings about framedone interrupt not being done (IIRC)
=66rom HDMI audio module, and I have screen freezing in framebuffer.

Any ideas?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX7pXXAAKCRAw5/Bqldv6
8v2DAJ4479P2CJHSxpGpQflJ32jkWO6TjACgqBhdPnebCowchVQfHHPwU7Y3crc=
=IraW
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
