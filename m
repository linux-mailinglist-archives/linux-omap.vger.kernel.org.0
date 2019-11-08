Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C7AF59FB
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 22:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731721AbfKHVdq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 16:33:46 -0500
Received: from 6.mo7.mail-out.ovh.net ([188.165.39.218]:35301 "EHLO
        6.mo7.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731601AbfKHVdq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Nov 2019 16:33:46 -0500
X-Greylist: delayed 2396 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Nov 2019 16:33:45 EST
Received: from player763.ha.ovh.net (unknown [10.109.160.217])
        by mo7.mail-out.ovh.net (Postfix) with ESMTP id 9DAED13D964
        for <linux-omap@vger.kernel.org>; Fri,  8 Nov 2019 21:16:22 +0100 (CET)
Received: from sk2.org (gw.sk2.org [88.186.243.14])
        (Authenticated sender: steve@sk2.org)
        by player763.ha.ovh.net (Postfix) with ESMTPSA id 0C47DBED04EE;
        Fri,  8 Nov 2019 20:16:13 +0000 (UTC)
Date:   Fri, 8 Nov 2019 21:17:54 +0100
From:   Stephen Kitt <steve@sk2.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk/ti/adpll: allocate room for terminating null
Message-ID: <20191108211754.430d4c52@heffalump.sk2.org>
In-Reply-To: <20191108170026.55DA52178F@mail.kernel.org>
References: <20191019155441.2b1b349f@heffalump.sk2.org>
        <20191019140634.15596-1-steve@sk2.org>
        <20191108170026.55DA52178F@mail.kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/urfJBMy9eUwjFd6M5Ta2c=G"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 14777999228607679960
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvuddgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgesghdtreerredtvdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecukfhppedtrddtrddtrddtpdekkedrudekiedrvdegfedrudegnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejieefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/urfJBMy9eUwjFd6M5Ta2c=G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 08 Nov 2019 09:00:25 -0800, Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Stephen Kitt (2019-10-19 07:06:34)
> > The buffer allocated in ti_adpll_clk_get_name doesn't account for the
> > terminating null. This patch switches to devm_kasprintf to avoid
> > overflowing.
> >=20
> > Signed-off-by: Stephen Kitt <steve@sk2.org>
> > --- =20
>=20
> Please don't send as replies to existing threads. It screws up my
> tooling and makes it more manual to apply the patch. I guess I'll have
> to go fix my scripts to ignore certain emails.

My bad, sorry about that, I misread the In-Reply-To section of
submitting-patches :-(.

Regards,

Stephen

--Sig_/urfJBMy9eUwjFd6M5Ta2c=G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl3FzXIACgkQgNMC9Yht
g5yOAhAAnGdI2emqN4a/GrokLIb57cKV63Y80R0avBz7ROKWLNIDr4LaZ9cB64Yw
7cZCVIuMbrQHY/nPkVMZEi9Ay3d/BwxDeNOEpstOd5sgPcw89uJbQ7q/+INR6lt7
REXx/NP4DTgkL+XIymdUPY0D5W7NvszWJy5XRE/UKCQZB/aPxolR+rFH23+wESdg
P0NfyarVlcSfdjBBh5f+/BzWTpYvokzQEbq1CrIMgHKZrXKy4+Up7uXyiMNrlXUG
uBcc1XrJFH80f/tRcldSsoaNBjnqtBljCfoXstvpEMs/sG6NCvOcxPH/fHfu4JLi
9B0/C32B4vOdIzL+yHdXFBYZHq33eRjc3j9+Yj7gGKpRqHji3sDL+XDjbSvZxbf9
adQ40ZQJvj/e1VDmjqT18pl8RSZnVGqGzXvVQ5WVkKvdIsHEHSlYKHmqmRwvwIMT
jD5B2zH8lkKQwQMMT0URBSVw9uKyE0QzOWfIKvO+ZpDuE+LptBl7G5KGT0019oh3
3pGYYype7J5XIs5dF0I7xVTsogwFR7X/fMK2N7yLefJbthPo1bbCx4akl5kIaXG7
/aVU0RcZzX9ta5dJ6sE+KlWP9OaRo2MoTQmSfxfnWgLP9Bk99UgltFQk+FILXiHG
+1JRD4bnI5BKUmshBpJ9Rk9h7QTYrJBmn6ed7FRxlwP0piEkFgQ=
=ZIn8
-----END PGP SIGNATURE-----

--Sig_/urfJBMy9eUwjFd6M5Ta2c=G--
