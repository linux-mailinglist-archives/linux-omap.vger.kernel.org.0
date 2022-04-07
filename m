Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78AAA4F80E4
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 15:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240034AbiDGNrY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 09:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiDGNrX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 09:47:23 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C183DA4A;
        Thu,  7 Apr 2022 06:45:21 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id B76FB3201F18;
        Thu,  7 Apr 2022 09:45:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 07 Apr 2022 09:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=XkgppvWgDnu/dZMOPFJ84XRY5MZLfXMWnu3CdV
        AKWzo=; b=ErC8jTThrapv3meVeiCaIp4oQMk1742n5RkSAhpxngeFRxZdCaX5Rv
        tbN/SaLmQ6MEjyWmlFoY4jptA+/CdJjtapBcbadaGE5GuZ1SsoPAnY1ZiNOemg5J
        YAoUN0B+KZPgrqp4q3RjHp+GomLVUQ+xkA6ODZs9XE02yScCzQ8Qrosq9CZsh2aC
        J/G0hxDhqiKUaz3Mbjo98OAcrQ0vjYu53dgR3kT33/kz5GRQfl7yh3D2i6tpWf4t
        EDtiZy45C5/Mkexh3gsa2v3N1zlCuxeVHfUA18k/YPSIFEOp22qWGKusSb5pcuNS
        TsCnsiDdmQBfp+kvnWycs96kc9pKPE4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XkgppvWgDnu/dZMOP
        FJ84XRY5MZLfXMWnu3CdVAKWzo=; b=Xl2w+l77DtuRQfLFe5XimIwd63k8tYMFK
        2yQ3Op+jnrgMHdXT/q+s9Siljg+WhBeWA5FDS14tvNiziqB34y0pvXgzE2UGuoVM
        pDW3K5hEajfSmMiOhPwLPOsj+QnpjIFddMI9PgGjoxnAAwZgXskzLmX7H/Q8Y3af
        n1+ZbpyZw5vDCEzDthACJ6wf79ksjpkFB/+VrqJFUHhQ0QWT+xFxBNbzA/wO/Ubo
        6R4UofifRQkoAVgRu16is3k3nr9u8etrw2ESPpwaXwzlalZFMIBTdsnbRR4Jxh34
        HMyXbOJCPYQsS6pNQe1yJVckgWKh9JtkpSBhE3QvxIiaiA9dkZ/Kg==
X-ME-Sender: <xms:7OpOYlM1bekRlxSaKAsr27tB-r0yvn1IDR1Dahx-Ejk9VJIgC3Amkw>
    <xme:7OpOYn9i4uu5ALEe5GK9sexLHZgUVDz7VQ-1N_2MQIWt3UJ6cYnFJhlNTnrhGvdfd
    SuGUxMgRgsDR5jWXQY>
X-ME-Received: <xmr:7OpOYkRiVrocdVIVXayPSzll4MazcZZ-da0Lugf4amDdUQXQHlteYheFN8k9pyjF_fK6b2GmE1KMA05Hd2T73DqPYFxGxK2CKN4y0nc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
    ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7OpOYhtbpMYLolv3eqNP-UzpuFOix2F0UlT0Mug28Jn_Eun5dDhtGQ>
    <xmx:7OpOYtfQ_OBwLW0z8TSOviHu8bTA0bpF1PCfu-8SNgGZzVNwKd0xug>
    <xmx:7OpOYt2xYGgQI7waoL6OGOMkctYS3EfAGrze-Z_mr_-MPzlIQvftsw>
    <xmx:7upOYsxjMjuEkj8Fmk-gMr_daYo48UE3vPj21r0UevDMV0DJufF7_A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 09:45:16 -0400 (EDT)
Date:   Thu, 7 Apr 2022 15:45:14 +0200
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
Message-ID: <20220407134514.sct7g23yto47ylgr@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220407075356.lmqnax35cewiwh4k@houat>
 <Yk6a7meIO+fV5J1D@atomide.com>
 <Yk7GFWdJd2EN7L1V@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s43o3564yso7cyde"
Content-Disposition: inline
In-Reply-To: <Yk7GFWdJd2EN7L1V@atomide.com>
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


--s43o3564yso7cyde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Thu, Apr 07, 2022 at 02:08:05PM +0300, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [220407 08:23]:
> > Hi,
> >=20
> > * Maxime Ripard <maxime@cerno.tech> [220407 07:51]:
> > > I haven't been able to find an omap3 board or a qemu target that could
> > > help me debug this, but I fixed a few issues already that could fix o=
map
> > > as well.
> > >=20
> > > Could you test today's
> > > https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes
> > >=20
> > > And let me know if it works?
> >=20
> > Yes sorry I've been meaning to try your fixes but had some file system
> > issues on my build box after a power cut while updating the system. All
> > good now though, I should be able to give it a try this afternoon.
>=20
> It now boots, but does a lot of checks on the clocks before the timers
> get initialized compared to v5.18-rc1.

I was about to say that this is fairly normal with the new behaviour,
but I've reworked the initial patch in that discussion to only call into
clk_set_rate_range if there was a range on that clock to begin with.

It should remove the huge majority of the checks you mentioned (and
hopefully get rid of most of the side effects as well).

It's now pushed to my branch, so it would be awesome if you could test
again.

> And then there's this:
>=20
> [    2.532501] clk_core_set_rate_nolock +2293: ssi_ssr_fck_3430es2 affect=
ed!
> ...
> [    2.554443]  unwind_backtrace from show_stack+0x10/0x14
> [    2.559875]  show_stack from dump_stack_lvl+0x40/0x4c
> [    2.565093]  dump_stack_lvl from clk_core_set_rate_nolock+0x278/0x2c4
> [    2.571777]  clk_core_set_rate_nolock from clk_set_rate_range_nolock.p=
art.0+0x154/0x384
> [    2.580047]  clk_set_rate_range_nolock.part.0 from __clk_put+0x64/0x174
> [    2.586853]  __clk_put from clk_add_alias+0x48/0x5c
> [    2.591918]  clk_add_alias from _add_clkdev.part.0+0x94/0x154
> [    2.597869]  _add_clkdev.part.0 from omap_device_alloc+0x88/0x114
> [    2.604156]  omap_device_alloc from _omap_device_notifier_call+0x25c/0=
x3b4
> [    2.611236]  _omap_device_notifier_call from blocking_notifier_call_ch=
ain+0x6c/0x90
> [    2.619140]  blocking_notifier_call_chain from device_add+0x360/0x894
> [    2.625823]  device_add from of_platform_device_create_pdata+0x8c/0xb8
> [    2.632568]  of_platform_device_create_pdata from of_platform_bus_crea=
te+0x194/0x22c
> [    2.640563]  of_platform_bus_create from of_platform_bus_create+0x1e0/=
0x22c
> [    2.647735]  of_platform_bus_create from of_platform_populate+0x60/0xb8
> [    2.654571]  of_platform_populate from pdata_quirks_init+0xb4/0xe0
> [    2.660980]  pdata_quirks_init from omap_generic_init+0xc/0x18
> [    2.666992]  omap_generic_init from customize_machine+0x1c/0x30
> [    2.673126]  customize_machine from do_one_initcall+0x44/0x24c
> [    2.679138]  do_one_initcall from kernel_init_freeable+0x1e8/0x298
> [    2.685546]  kernel_init_freeable from kernel_init+0x14/0x140
> [    2.691467]  kernel_init from ret_from_fork+0x14/0x24

It shouldn't be there anymore after that rework, but I couldn't find
wher the ssi_ssr_fck clock was defined? The only relevant driver seems
to be omap_ssi_core.c but I don't see any clock driver registered there
either.

Thanks!
Maxime

--s43o3564yso7cyde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYk7q6gAKCRDj7w1vZxhR
xT8RAPsF2jISFo6CxJQha6ZZVnCgejb1BfTDE4in0xEHwBrGJgEA+KOr64odsCO6
iACqEk1ESIdBRsaRsLaRK2yxLg0+7A0=
=e3xE
-----END PGP SIGNATURE-----

--s43o3564yso7cyde--
