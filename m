Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 338364F7932
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 10:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbiDGIOd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 04:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243135AbiDGIMw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 04:12:52 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2BD1C6EEC;
        Thu,  7 Apr 2022 01:09:56 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id BF6823200F76;
        Thu,  7 Apr 2022 04:09:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 07 Apr 2022 04:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=33I+fZ1kqaoH1BTmydgzC4TuSwCoEES+/40hDO
        mxd6c=; b=wlfLL322Q/m+7Dc+oUh60UhRP6CG4CRlOafKIjARDz0Lf/ka7XZe1A
        BVDS1s65yFa9gs4u+xkRUCiF4ipttrg5RDUvBHY0NbbhDmDR4rqz82Z2YyhKKv38
        D6YQbaQOftGUelmweA1Dveiwwy9lvL6QJMJ1GNyRvAr72eJ9UvD3vak3ipavON2d
        CoramREFIbZEA9l3IGD/3iL+iflPq1eictxTIlFZS+/sgNffzotLvmm6z+1QzGOd
        BVtOMWZdFKYDPRsu3Nkn5JMjwjuuukie3x/tSd/TJ17tlYQJsrZfU7eEk4HSVtTW
        nVjnhKf+MtrXi/HF65+/pa7n9NU+jtNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=33I+fZ1kqaoH1BTmy
        dgzC4TuSwCoEES+/40hDOmxd6c=; b=WNED18hVmvs8VodQ1dA8Wrx7zpjjsURG7
        Y8FG8T4TFlhgWLrggXLD0JzMRjU/CfHzY4obC0ZDG9Xtz+tiakrxgwyGz7rYN/zY
        f8AtLW/9rHh9+7M0wMHgsi3zAfqt0/espve3Zoa3mIU4g3rSepx3iDvXv7itGHZ/
        u/mp41FyTSwgQivWY3FGH6+/PC/KxuW/4j3+Wpvx9rp08sdZN/dVQkKbabrJsXpk
        xLcR88gK7eqCaXRt+BXoPqLlRAIeg3ShBGn2jovDhapVjH3Tr60JwLC5PLG5XFlR
        Hou5v+KthDwZLzloh/AlILdCg8FnV9hx7bChXwlRMxJ7pdlmoUQ6w==
X-ME-Sender: <xms:SJxOYkBij5BzsNS1iZikoUvRuTKudwJ0oqE0C0npwvZ8ckOinOFiwQ>
    <xme:SJxOYmhxSLqd9qCRCKLpggC4VG459vLMOlPm-8kqfvtLygeNuFz2nnfYoEy1EItKz
    3IbLPFPx8Reaa9G-WY>
X-ME-Received: <xmr:SJxOYnkR_BloLAIY7F6naLoS9ZuAte3__vp8zCfXV44TEV4DFbt2DJ3P8sQkgsfHQkG2cDGkuu2wgy_Kh67sWrTcZG4f2AYy1wU2Mz0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
    hnpeevgeduteektefhtefggfdtkeekgfehhffffeegudelheegheeiueevfeegvdeigeen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SJxOYqySddZreOL1tT-r60OiXxYUSAIjfd-lqtiIBnbtcqlmES6doA>
    <xmx:SJxOYpS_qYyYHXILNRfzIEo_QHaSYW5q11p2VJeTcGsxZFSglCJYCQ>
    <xmx:SJxOYlYmvNu0uYvVdIOeCY5lXg8IGtu-pe6gyX8odZqTJj7-YJ0RdA>
    <xmx:SZxOYm-2BHK9D1fls2FCo9uXxwZ4kt3D3113KHle9CpJCK4bEuY2jQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 04:09:44 -0400 (EDT)
Date:   Thu, 7 Apr 2022 10:09:43 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re:
 [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <20220407080943.o5qpnw5trtqwqkmq@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <4391300.LvFx2qVVIh@steina-w>
 <20220404072712.bbsbkq3cpyx4xuzy@houat>
 <12990313.uLZWGnKmhe@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zy42mrjvu2jsbpn4"
Content-Disposition: inline
In-Reply-To: <12990313.uLZWGnKmhe@steina-w>
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


--zy42mrjvu2jsbpn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Mon, Apr 04, 2022 at 12:54:02PM +0200, Alexander Stein wrote:
> Am Montag, 4. April 2022, 09:27:12 CEST schrieb Maxime Ripard:
> > On Mon, Apr 04, 2022 at 09:06:42AM +0200, Alexander Stein wrote:
> > > Here is the requested output:
> > > ---
> > > $ ./scripts/faddr2line build_arm64/vmlinux
> > > 'clk_mux_determine_rate_flags+0x33c/0x380'
> > > clk_mux_determine_rate_flags+0x33c/0x380:
> > > clk_mux_determine_rate_flags at drivers/clk/clk.c:627
> > > ---
> > > From a first look it seems that 'best_parent' is just a NULL-pointer =
here.
> > > With this small fix
> > > --->8---
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 071857ef381a..45e081330fac 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -626,7 +626,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *h=
w,
> > >=20
> > >         pr_crit("%s: Best parent %s (%lu)\n",
> > >        =20
> > >                 __func__,
> > >=20
> > > -               best_parent->name,
> > > +               best_parent? best_parent->name : "unknown",
> > >=20
> > >                 best);
> > >        =20
> > >         return 0;
> > >=20
> > > --->8---
> > >=20
> > > The boot eventually get stuck, but at a later point.Which is probably=
 why
> > > your analysis found nothing strange. Due to the size of the output I =
put
> > > it on a gist on github [1]. Please note that this is still based on a
> > > next-20220331 based tree without the revert.
> >=20
> > I've looked into it over the weekend, and ran qemu on an imx6 to try to
> > see if it was any similar
> >=20
> > I believe the issue comes from the fact that the core will forward rate
> > requests structure to the parent clock as is, and if the parent clock
> > changes the parent it wants, we end up trying to use that parent in the
> > initial clock which doesn't work really well.
> >=20
> > I've fixed it in my branch here:
> > https://github.com/mripard/linux/commits/rpi/clk-improvements-more-fixes
>=20
> Thanks for providing another patchset. Unfortunately, my board hangs stil=
l at=20
> the same location. For reference I put a branch based on next-20220401 on=
 [1].
> Reverting still does the jobs, a branch is shown on [2]
>=20
> next-20220404 has the offending patch already reverted, so this should wo=
rk=20
> again, I did not test it on that base on purpose.

Could you give it another try with the branch I pushed today?

I've fixed some issues for exynos4 that could explain why it doesn't
boot on imx8 as well.

Maxime

--zy42mrjvu2jsbpn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYk6cRwAKCRDj7w1vZxhR
xfeHAQDF+E9uE9KQ6zBENb2dwCqwLzqtt7ovlhch8oNXP4M3TwD/flUsKr4kQA1o
sOntot2+Gb41KdEDVW4XNQmC2OJUHgo=
=MxCM
-----END PGP SIGNATURE-----

--zy42mrjvu2jsbpn4--
