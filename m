Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9417E1B033E
	for <lists+linux-omap@lfdr.de>; Mon, 20 Apr 2020 09:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgDTHit (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Apr 2020 03:38:49 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:38743 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725773AbgDTHis (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Apr 2020 03:38:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id C558658021E;
        Mon, 20 Apr 2020 03:38:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 20 Apr 2020 03:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=5Sw64u1dSQy+/AZPUD2ocyiGqku
        gbFqYdfvxed0EDRY=; b=YynSS5+9xuhmRiG56G7GdbYPCW8jO8KOD4IoTjNhpnV
        TXKPXqmua83B8ei57HL3DaYlRJtfUMcPxYtn08/hp3mXUdF2d25A/1X3KKbAkRlK
        ghitZz0zjSvzOfK/R2z0rKR1g5H4w904f+KY6Jqs1ZRt+O1pAwUEoNgsFaBAFrI9
        58LgC7+dI3pGibuVGwzVop5UyctI++7yP9IwO5IwhmwOfBE8U1/d9CdNS/s/KbUS
        3gW79VGBNMpAwFOG7/O+ptXcq4Qfkbt50JVeeKk5Nq9o+DrjpD5KaKA9K47176hS
        R0/LMSSildCA/fbL0E+dhzbGYYYMY9tEtqMlg3hek2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5Sw64u
        1dSQy+/AZPUD2ocyiGqkugbFqYdfvxed0EDRY=; b=HLp4uB1Tle4K92shgr1Z4o
        I6IqDdPkOLErhagBFdX0SF7qQYacnanlpFk3AnPXZjZNzAX2Trij5GpfMMfK4oXY
        0u/0BGBFXezH6WZfumh/kyWtXSARqqBRhQiU+h1HDBav7AUTmGgBgGp+HuFQZZ8L
        OSuKN0+yXX5SHYcom3W2ZsRh+SkdTZWTWq9EuA1FR/Uv5nHrXv6v57k+Au2MM441
        wB1yetUvg9Wy0v9RFu3TbmxS+IboXoiUwyoYuba+stcj46e9q68I1duMo9hIGMfx
        NGLcimcFtLWubDIovljxJYdAd+6CIjyfSceHn47wJ6TxfjZr2nf0jFog8A9MYQbw
        ==
X-ME-Sender: <xms:hFGdXqSLF4RpRYkTefunXLy68Ah9GyhS0RKRLmpBwtI_hJTAszptjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgedvgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hFGdXuS5lZijoMyt14sVshcQo6T4aTzHUJEVa3IzCfMJcuGJjNB-pA>
    <xmx:hFGdXgP06PsbO8XuzzC0aJZhlbh5ZY10dnOrooV5_FkdXCbT0y5ztQ>
    <xmx:hFGdXn2rcXlRRicCiP5MqsSec5lFGRnU2audJYs15o6DDLkM4mq0eQ>
    <xmx:hlGdXtusGVYKKvBUw4w6T_rD-GJekUI0m6eZa8s1_ntY-dlevIq47A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5B36A3280069;
        Mon, 20 Apr 2020 03:38:44 -0400 (EDT)
Date:   Mon, 20 Apr 2020 09:38:42 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Philipp Rossak <embed3d@gmail.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nd4xfztpubexblrg"
Content-Disposition: inline
In-Reply-To: <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--nd4xfztpubexblrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 17, 2020 at 02:09:06PM +0200, Philipp Rossak wrote:
> > > I'm a bit skeptical on that one since it doesn't even list the
> > > interrupts connected to the GPU that the binding mandates.
> >=20
> > I think he left it out for a future update.
> > But best he comments himself.
>=20
> I'm currently working on those bindings. They are now 90% done, but they =
are
> not finished till now. Currently there is some mainline support missing to
> add the full binding. The A83T and also the A31/A31s have a GPU Power Off
> Gating Register in the R_PRCM module, that is not supported right now in
> Mainline. The Register need to be written when the GPU is powered on and
> off.
>=20
> @Maxime: I totally agree on your point that a demo needs to be provided
> before the related DTS patches should be provided. That's the reason why I
> added the gpu placeholder patches.
> Do you have an idea how a driver for the R_PRCM stuff can look like? I'm =
not
> that experienced with the clock driver framework.

It looks like a power-domain to me, so you'd rather plug that into the genpd
framework.

> The big question is right now how to proceed with the A83T and A31s patch=
es.
> I see there three options, which one do you prefer?:
>=20
> 1. Provide now placeholder patches and send new patches, if everything is
> clear and other things are mainlined
> 2. Provide now patches as complete as possible and provide later patches =
to
> complete them when the R_PRCM things are mainlined
> 3. Leave them out, till the related work is mainlined and the bindings are
> final.

Like I said, the DT *has* to be backward-compatible, so for any DT patch th=
at
you are asking to be merged, you should be prepared to support it indefinit=
ely
and be able to run from it, and you won't be able to change the bindings la=
ter
on.

> Since this GPU IP core is very flexible and the SOC manufactures can
> configure it on their needs, I think the binding will extend in the futur=
e.
> For example the SGX544 GPU is available in different configurations: there
> is a SGX544 core and SGX544MPx core. The x stands for the count of the US=
SE
> (Universal Scalable Shader Engine) cores. For example the GPU in the A83T=
 is
> a MP1 and the A31/A31s a MP2.

Mali is in the same situation and it didn't cause much trouble.

> In addition to that some of the GPU's have also a 2D engine.

In the same memory region, running from the same interrupts, or is it a
completely separate IP that happens to be sold by the same vendor?

> There might be even more differences in the GPU's that we don't know right
> now and should be described in the Devicetree, but that's a different top=
ic
> that we should keep in mind.

Like I said, it's not a completely different topic.

Maxime

--nd4xfztpubexblrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXp1RggAKCRDj7w1vZxhR
xUoGAQD6t2KhRl/JXPpcbOq2qYAidBLKV4Lqvkk8MmRHUxeoNQEAt6SP6CIMrrfb
nDX66jY4FpmurrYXbFF39NVW4Y9HWw8=
=Wz+7
-----END PGP SIGNATURE-----

--nd4xfztpubexblrg--
