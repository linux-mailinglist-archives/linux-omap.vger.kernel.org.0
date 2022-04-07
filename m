Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67E24F7840
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 09:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbiDGH4G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 03:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiDGH4F (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 03:56:05 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E881E4616;
        Thu,  7 Apr 2022 00:54:01 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E34013202052;
        Thu,  7 Apr 2022 03:54:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 07 Apr 2022 03:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=6yvBpZXhQ3nbfBEU4elG5l+52Ht2Gn/B3/bTxD
        VxAtA=; b=VlJlaN3tFdpA5biRTQUV106ddY3u0aeQGfjwrGrqRGCozubpKedzWW
        3XpQMUNb+bT8o/8aKfLnw0Oixug/YESwLjI2czXfltBrLupq5rb9F/arf29v9zR+
        LG51HtzCQ2N2lZGNKFeaj+7eYEObNg9BoVT1JIw153ikrCCwJQV6FbhtkLy/sBjs
        QudaavgN9TQBk8okP3GadGA9Fb3n2qxoiTKhxSsLXUqYQUgkBlANXsdCVSYp2Hoo
        cru4zu6efFRbcDFPduC+o6k4zOblA5R+oA+36cGqVLFdFB/D6dbORIbZNRCarB09
        b4C7pc6YCyDWCNr2t6dM9ghSqVHUmr7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6yvBpZXhQ3nbfBEU4
        elG5l+52Ht2Gn/B3/bTxDVxAtA=; b=YFHLW0FDYsn6hN9LWZhoYvCXUfUzQCTcE
        NJNwBQr/WE7HBUMriwi0QqdqsWoPShzO/sQqm6LQhVxfzeIZxJZfCPRkp8rNAZn0
        nk3FcynVYK2hIFHhnhBnHfmW4eVxZPy5X99oIX9fXyJX4SMJR8nTuiYOhyyDsTi5
        b0lzWpuSmuobm78SwZgNicI4/lRauxhkMrgtDjaOtJZc9w+ooY0GnU/xUDOM4zrq
        GuFGuOuXG+de5zj9TAZVjbQncBLdfkgBhCZEFlEAPuKn0t/i0e6VZo2PfQOse5Mg
        1Al/fcC98TiyxWA0fvm4vC4EAG6XkcH1LzZcBYF+vyME7DpX5pM8g==
X-ME-Sender: <xms:l5hOYuF6at5B9Hh7DCtiNjWSigE5AYQhUS4Cq-jFZK0ova-ovah0rw>
    <xme:l5hOYvWTHguJ_QJLPy8BSCjvSJzWK70GtSvR2WWFEabkhYyeOYx4Y_atfA0kXMIh2
    6cyCDUq9qw-lK2hBEs>
X-ME-Received: <xmr:l5hOYoJ1LwgF7VIrGXoVmot6AsxsGZNy37O9i0inqBalbAm0QEdMD-jN0XGlaN8tGN0xA__lmlIyMzHXKnduI2wlOpiDWsD6MSpm7Oc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejjedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetgfejtdelgeffffeitdfhtddvfeeijeffteelkefhledvvefggfdujeeg
    ieeghfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:l5hOYoFAg3Qv9oyDqQsUyhJzTRJFfgHJIr-2NmutglkmcFFfj0yRNw>
    <xmx:l5hOYkUhBhlN5RAWpSB13CStEwBLGCCih-qtX9ATPk1vPHp8tSh0jw>
    <xmx:l5hOYrPEAiwABBfSsWj49Vi4dAqsRrzyJowuhzddvqex0NtiqjTESg>
    <xmx:mJhOYorCjqnldwbdDZo9oEMTEBaqjTlfbqz7Ru5ZsZjCt0iaME6E5Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 03:53:59 -0400 (EDT)
Date:   Thu, 7 Apr 2022 09:53:56 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <20220407075356.lmqnax35cewiwh4k@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iwpvajgf3v6xunui"
Content-Disposition: inline
In-Reply-To: <YkV3ch7R7YxlATW+@atomide.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--iwpvajgf3v6xunui
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> * Maxime Ripard <maxime@cerno.tech> [700101 02:00]:
> > Hi Marek,
> >=20
> > On Wed, Mar 30, 2022 at 10:06:13AM +0200, Marek Szyprowski wrote:
> > > On 25.03.2022 17:11, Maxime Ripard wrote:
> > > > While the current code will trigger a new clk_set_rate call wheneve=
r the
> > > > rate boundaries are changed through clk_set_rate_range, this doesn't
> > > > occur when clk_put() is called.
> > > >
> > > > However, this is essentially equivalent since, after clk_put()
> > > > completes, those boundaries won't be enforced anymore.
> > > >
> > > > Let's add a call to clk_set_rate_range in clk_put to make sure those
> > > > rate boundaries are dropped and the clock drivers can react.
> > > >
> > > > Let's also add a few tests to make sure this case is covered.
> > > >
> > > > Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rat=
e")
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >=20
> > > This patch landed recently in linux-next 20220328 as commit 7dabfa2bc=
480=20
> > > ("clk: Drop the rate range on clk_put()"). Sadly it breaks booting of=
=20
> > > the few of my test systems: Samsung ARM 32bit Exynos3250 based Rinato=
=20
> > > board and all Amlogic Meson G12B/SM1 based boards (Odroid C4, N2, Kha=
das=20
> > > VIM3/VIM3l). Rinato hangs always with the following oops:
> > >=20
> > > --->8---
> > >=20
> > > Kernel panic - not syncing: MCT hangs after writing 4 (offset:0x420)
> > > CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc1-00014-g7dabfa2bc=
480=20
> > > #11551
> > > Hardware name: Samsung Exynos (Flattened Device Tree)
> > >  =A0unwind_backtrace from show_stack+0x10/0x14
> > >  =A0show_stack from dump_stack_lvl+0x58/0x70
> > >  =A0dump_stack_lvl from panic+0x10c/0x328
> > >  =A0panic from exynos4_mct_tick_stop+0x0/0x2c
> > > ---[ end Kernel panic - not syncing: MCT hangs after writing 4=20
> > > (offset:0x420) ]---
> > >=20
> > > --->8---
> > >=20
> > > Amlogic boards hang randomly during early userspace init, usually jus=
t=20
> > > after loading the driver modules.
> > >=20
> > > Reverting $subject on top of linux-next fixes all those problems.
> > >=20
> > > I will try to analyze it a bit more and if possible provide some more=
=20
> > > useful/meaning full logs later.
> >=20
> > I'm not sure what could go wrong there, but if you can figure out the
> > clock, if it tries to set a new rate and what rate it is, it would be
> > awesome :)
>=20
> I'm also seeing clockevent break on omaps as a wrong source clock gets
> picked.
>=20
> It seems the dts assigned-clock-parents no longer works now?
>=20
> So the following no longer sets omap_32k_fck as the clockevent source:
>=20
> timer@0 {
> 	assigned-clocks =3D <&gpt1_fck>;
> 	assigned-clock-parents =3D <&omap_32k_fck>;
> };

I haven't been able to find an omap3 board or a qemu target that could
help me debug this, but I fixed a few issues already that could fix omap
as well.

Could you test today's
https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes

And let me know if it works?

Thanks!
Maxime

--iwpvajgf3v6xunui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYk6YlAAKCRDj7w1vZxhR
xaesAQC4rR3HwZovHNfTkG3Cba2C43aYvgAwbaS5SnVSfgnWiAEAnUJlYI5I8mZP
JQC1kn9HqNOIjnjd0KlyG9Tofs6M/AA=
=dFvE
-----END PGP SIGNATURE-----

--iwpvajgf3v6xunui--
