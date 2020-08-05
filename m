Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C42223D12B
	for <lists+linux-omap@lfdr.de>; Wed,  5 Aug 2020 21:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgHET5R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Aug 2020 15:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbgHEQoI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Aug 2020 12:44:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5F2C061A32
        for <linux-omap@vger.kernel.org>; Wed,  5 Aug 2020 04:34:19 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 0C683296D13
Received: by earth.universe (Postfix, from userid 1000)
        id 200B43C0C80; Wed,  5 Aug 2020 13:28:31 +0200 (CEST)
Date:   Wed, 5 Aug 2020 13:28:31 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Message-ID: <20200805112831.akufm5wxkwqehiff@earth.universe>
References: <20200706143613.GS37466@atomide.com>
 <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
 <20200707180115.GB5849@atomide.com>
 <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
 <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
 <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
 <20200724012411.GJ21353@pendragon.ideasonboard.com>
 <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
 <20200801232259.hitcfosiq6f2i57y@earth.universe>
 <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a37zflkawikvjlp7"
Content-Disposition: inline
In-Reply-To: <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--a37zflkawikvjlp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Aug 05, 2020 at 11:19:20AM +0200, H. Nikolaus Schaller wrote:
> What I do not yet understand is how Laurent's patch should be able
> to break it.

omapdrm will not probe successfully if any DT enabled component
does not probe correctly. Since the patch you identified touched
HDMI and VENC and you are probably using HDMI, I suggest looking
there first.

-- Sebastian

--a37zflkawikvjlp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl8ql9wACgkQ2O7X88g7
+pqeDRAAnqk/I1N3UtFVhKyYwGdjweNLWWlDvUQwEVEnQYTLMDEvqBv1k+Ueu3HF
8gCY53VYX4yWmaJABE31gneKOIaaMlSweNDFAeUbyQVdJg3y+k6jupi6+Jdmek6H
+6LSf6kUyQkftiEoolmZ+cDFuWjAuR2MTv2JePqraKJfEnZ/xDv9YhvbI1hz0SSt
2k7XpZ+09n9XG1/UZ8eeOWSqfgWwi0Gyv6N2ZESYLJ+zPwKMZH5fGaUSiiJi8sMG
tkmHq8YCHdzeWhpJSrIR7PIb8MPldZvcLFzKaRdbfOx+2p9FAJy2QNUNbfBT6RUZ
Rj4zVvLxFmfz+hIg2gPGruEiS0iWn7vYIlsYRKIGtBXYeYqU+hjHQ9Yv9N7PauQj
wsJiLzKqunHHrmYGdkg+Sog5WvVAjrW1rM6X75BIgOhfjmrFba0tLriTc9uYgMTV
gf/Z2BzSxzSqfdvT0D1StjP51tm6pvnGGDZH6Bjne0ORzoJ/3mEWnhaPYwUFQVIM
XcYHBjdaMTPK/mU/kSUF4wnGGa1BdC45GIIc4wW2mUi7HPN0FoCbr4UE59WGlaVm
9jhzRyIj0U1nNUC3X2CyrWW63Oeq/xHyYO3duh+d2G4iIbmHZZYylSthHjKnPSSk
8bMkTRCIpdTroYXDQAOArqc+hL3kx9wNaDBySpebEPdy2ZcQcXE=
=2Ypw
-----END PGP SIGNATURE-----

--a37zflkawikvjlp7--
