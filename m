Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3CD1ADD8B
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 14:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbgDQMo2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 08:44:28 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60693 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729034AbgDQMo1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 08:44:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id CADD25C0207;
        Fri, 17 Apr 2020 08:44:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 17 Apr 2020 08:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=KRTBXgxtnpIGY2Rffw9qnshJuWR
        4Sx3VOxgPioXE+Wk=; b=jKWNIpb/gchBDf8b6tKNx9h+rDp7o4zch5BMhABV1n+
        wYXsXhr1CgAGK4NKTUSTmgFAXTqguJokWrd6lnE7g4UnTP7FsDSva4SwfoYDD1M4
        k1K0ALePbSPZUgucMePPt7GRVzhG+5lDTYcHJQ3Qq2csr5YMVHbSRFgkv8jUPEwi
        R9uljDj82HviF/ps6TEdURJyYwVkkxST9ENeNwi9w6+pUgNZFCX+RNNAO7bycJLL
        r9GZcFZW12/zIdU2cpaMU9oL7ZVNP52zn0kIXy/cUY+k60m7Y905lDkr5nKZUEOW
        GxESfZB0+Qhx/kbU9Sob7BLa6ei4qMt6ND3AJlDf71Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KRTBXg
        xtnpIGY2Rffw9qnshJuWR4Sx3VOxgPioXE+Wk=; b=L7tx7yWXT+ng7Dx1Ke2XfS
        sdGjM1pjvpjHhqXk1xeR1VoBT/N/taUYgna2syAjD48iIi/lnFOkQ3ItbSQPt7wG
        RkZkD3g2GgflxLaYsunqlrqDr+WFvXjbUAKVP3aALdXzlS+Ty+XZ49YdZ0Yir9hG
        a6wdM/ssM8EC03hSrt90ssH9PjESLw6lPxE5bvj3RaXwYwC6a3pTC+/O39Tt3q7/
        606iTkuo+kW0tkDKcA1IfR/IEXpRjboUT+mM/hSsMM4wDMOhm03+Y8rC76HSnrFt
        plZM0znazF708XnT/SIe77wwdir0GW1OlzrTeGTdgI9iIr59js57nEUNG4Iyufdg
        ==
X-ME-Sender: <xms:qKSZXqT_lQ9VGLtM5z6SHltgALFrxtchQYkNDlC_m_v8jnWE8VOHaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeejgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
    hordhtvggthh
X-ME-Proxy: <xmx:qKSZXhy4J0mzJxJiqN-NWWtzo-zPmD3n-6ZDoHri6kU3X3dQnWMx5A>
    <xmx:qKSZXsJAXYlwU1AxxETriuzDAO_URZGf9Gx-WyhD8_p6Rkn3JInhRQ>
    <xmx:qKSZXuP6nlV9mNq-dT-8l0qVPkYYwhFq2rWTEIXvQKzPOaY4FayoOg>
    <xmx:qaSZXtX67zhIwYR17HlHWpPk22jyHhf3JobJ6CuEx-5Dg074wn3h6g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 63CE23280060;
        Fri, 17 Apr 2020 08:44:24 -0400 (EDT)
Date:   Fri, 17 Apr 2020 14:44:22 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge
 driver to make connector optional!
Message-ID: <20200417124422.fl35igitvd7thpr5@gilmour.lan>
References: <CB5A5B81-F06C-4CBE-95DE-96C8723D2AC5@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uebxnokcear6r3sc"
Content-Disposition: inline
In-Reply-To: <CB5A5B81-F06C-4CBE-95DE-96C8723D2AC5@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--uebxnokcear6r3sc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Cc'ing Laurent

On Fri, Apr 17, 2020 at 02:18:11PM +0200, H. Nikolaus Schaller wrote:
> Hi Maxime,
> I have started to test v5.7-rc1 and can't fully boot the GTA04
> device any more.
>=20
> What I see in the log is:
>=20
> [   28.567840] [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bri=
dge driver to make connector optional!
> [   28.567871] omapdrm omapdrm.0: unable to attach bridge /ocp@68000000/d=
ss@48050000/encoder@48050c00
> [   28.786529] omapdrm omapdrm.0: omap_modeset_init failed: ret=3D-22
> [   28.841552] omapdrm: probe of omapdrm.0 failed with error -22
>=20
> This device uses the ti,opa362 chip which did have a dedicated
> omapdss driver before (which is removed now) and which seems to
> be supported by the simple_bridge now.
>=20
> The opa362 is sitting in the video out path from
>=20
> 	omapdrm -> venc -> opa362 -> video-out-connector.
>=20
> What does this error mean? How can it be fixed?

-22 is usually EINVAL, which can be pretty much anything. A good thing to do
 would be to bisect to see which actual commit broke it, but if I was to be=
t on
 something I guess it would be

https://lore.kernel.org/dri-devel/20200226112514.12455-1-laurent.pinchart@i=
deasonboard.com/

Maxime

--uebxnokcear6r3sc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpmkpgAKCRDj7w1vZxhR
xQiLAQCJ2xQosSagOkqyXxot5lEViVcLssIszdTzpkTitzEG6AEAvPbauwwDo1R9
7QwBbCXIj9aSKnpQcBvxDQ0ooUEpIw8=
=Tp4p
-----END PGP SIGNATURE-----

--uebxnokcear6r3sc--
