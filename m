Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E501AA2FB
	for <lists+linux-omap@lfdr.de>; Wed, 15 Apr 2020 15:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505740AbgDONCt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Apr 2020 09:02:49 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:59003 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2897195AbgDONCp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Apr 2020 09:02:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id BBB2A580395;
        Wed, 15 Apr 2020 09:02:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 15 Apr 2020 09:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=039DxBF+ah5v0vg8ROQIv9FjG5q
        WhfMw1SLvfcd04OU=; b=CkV6dsPcz9Y8idW+hVEyDm6mSV+pUN9Xres8bMKvdRL
        VALjfsC9aI3bhfwoujPhd7EQWqTFMM3MpY0CXMnqitTCS8Fof1sumtKs+1noHkck
        0zy18sJCCWvRsROIXMI80ldSbi7DqI7VYqCLs/1mdKw9zI/NcBitSAQbREvT7L8g
        D4/NJhFvTCxTM7g/tnjms6irqeB7SlILFscWcV0Ce03qvfwgv9/2EatxXaqwDpOt
        //I1mYI1uCDy9IhEch95UxPJJ+Kv4Kn4Nyja93nWS05Egy1qnFDulfPzV8LpPw3s
        DonUZNuI0Jhy6aVgp2M7WLectakQApnHU18B32D9UPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=039DxB
        F+ah5v0vg8ROQIv9FjG5qWhfMw1SLvfcd04OU=; b=S9h1/Q+pWQGqd+nltx7U9q
        EtiyPyF6+ndcxfpEsE8fKQDJuXpfo16gmVbpfrTLMpDeNmvuN9vlkr4FPoAkLMQm
        9IqswPbsY1N2m95yuHAtlQw3clcmF8saECBneO0wNSjOMXxIqltgpA+y6ONjUj68
        AFBBsJvEeWG3Z9Of09J8HkEnMLsZVx3GogUvVVpEWD6E4MNaS5HjS01rkaGt9TXi
        y9HyZu0mKxSdRDvuzEDI5liYqgvTHXR63Zht+ftr8lzaAYk9NXUHyw5RG9uZYXSu
        CkvJHJDRd/moF8rMWHtNLJ9EyLR2y9cj02+vehqJfB8HMOv8YWoOxKAJDN9M3DVQ
        ==
X-ME-Sender: <xms:7AWXXh82Tz9QrgxCYXxwiUQuqvXNIYslbCEeOSB8EK9jqYSp_7Z4Aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeefgdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7AWXXjHxvIxxyP6a2yvja6_mj0wSrBN48QEe3Nw1WyoqXA1cLZ-20A>
    <xmx:7AWXXkrlPi5zXv3NYFVpM8E20gPMRRwOXPqTkM0T5VGb043_hRT93A>
    <xmx:7AWXXgAfYxDQc7ACxpWBH6yA5fa2JTCRXbHr-EPSPe_jpeeWde-k-w>
    <xmx:8QWXXipi434smJv24Fiv-djdHGL_1nvMAm8dctLyIRDrtTUu2D9z5g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9C9A93280066;
        Wed, 15 Apr 2020 09:02:35 -0400 (EDT)
Date:   Wed, 15 Apr 2020 15:02:33 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
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
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="il2lli6whdapbh2d"
Content-Disposition: inline
In-Reply-To: <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--il2lli6whdapbh2d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 02:41:52PM +0200, H. Nikolaus Schaller wrote:
> >> The kernel modules built from this project have successfully
> >> demonstrated to work with the DTS definitions from this patch set on
> >> AM335x BeagleBone Black, DM3730 and OMAP5 Pyra and Droid 4. They
> >> partially work on OMAP3530 and PandaBoard ES but that is likely a
> >> problem in the kernel driver or the (non-free) user-space libraries
> >> and binaries.
> >>
> >> Wotk for JZ4780 (CI20 board) is in progress and there is potential
> >> to extend this work to e.g. BananaPi-M3 (A83) and some Intel Poulsbo
> >> and CedarView devices.
> >
> > If it's not been tested on any Allwinner board yet, I'll leave it
> > aside until it's been properly shown to work.
>
> Phillip has testes something on a83.

I'm a bit skeptical on that one since it doesn't even list the
interrupts connected to the GPU that the binding mandates.

Maxime

--il2lli6whdapbh2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpcF6QAKCRDj7w1vZxhR
xTUIAP9UGzsDJo2NmFuuOEh6FQ/3E2jykOavlFl7nNEkbp/76QEAgh0UD8HzNN4c
lB61sBbeDdFaPvEy3tOwvQ2UnCbWKAA=
=cHXH
-----END PGP SIGNATURE-----

--il2lli6whdapbh2d--
