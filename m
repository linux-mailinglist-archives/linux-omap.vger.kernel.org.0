Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3ED3D26C5
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 11:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387637AbfJJJyP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 05:54:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727330AbfJJJyP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Oct 2019 05:54:15 -0400
Received: from earth.universe (dyndsl-037-138-093-062.ewe-ip-backbone.de [37.138.93.62])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 952FA2190F;
        Thu, 10 Oct 2019 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570701253;
        bh=zYnEA43N+yNd72umH2kRcCuRlBKmXNf3sRWiwm2OjuY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aDYRiJmUC9nZ/Zbq/wa09izbN20Zrdk853TyAhRJindD0cFySLYdzr1LlAD1aqcxD
         3CT3lj59R6YyVFEZg6ee1b8q7TUXVXscxbihJHXWYYa7yLMStBUO2NAQbqzCnhPoQc
         YgBgZ1cgu20zYCl7UGuWUu9QYy7yiGbTbZNLuNqE=
Received: by earth.universe (Postfix, from userid 1000)
        id 664E13C0CA2; Thu, 10 Oct 2019 11:54:11 +0200 (CEST)
Date:   Thu, 10 Oct 2019 11:54:11 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: omapdrm: dsi panels
Message-ID: <20191010095411.zklj4vwodrxzzfto@earth.universe>
References: <3C538A9E-BCE9-4ECF-97C2-52E823266296@goldelico.com>
 <a84c175e-3d78-6d51-2018-179d828fc7c7@ti.com>
 <20191010062540.GA4756@pendragon.ideasonboard.com>
 <B5784A6E-1EC1-471C-BE38-F7165002F659@goldelico.com>
 <20191010071633.GC4756@pendragon.ideasonboard.com>
 <01479203-47C8-4C68-9A03-653C151B89E1@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qiffkg5yzbdvmz43"
Content-Disposition: inline
In-Reply-To: <01479203-47C8-4C68-9A03-653C151B89E1@goldelico.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--qiffkg5yzbdvmz43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 10, 2019 at 09:27:52AM +0200, H. Nikolaus Schaller wrote:
> > Am 10.10.2019 um 09:16 schrieb Laurent Pinchart <laurent.pinchart@ideas=
onboard.com>:
> > On Thu, Oct 10, 2019 at 08:41:43AM +0200, H. Nikolaus Schaller wrote:
> >> Am 10.10.2019 um 08:25 schrieb Laurent Pinchart:
> >>> On Thu, Oct 10, 2019 at 09:07:27AM +0300, Tomi Valkeinen wrote:
> >>>> On 10/10/2019 09:02, H. Nikolaus Schaller wrote:
> >>>>> Hi Tomi,
> >>>>> now as DPI panels have been moved to drm/panel are there plans to
> >>>>> support DSI panels sitting there as well?
> >>>>>=20
> >>>>> I have looked to move our boe-w677l driver for the omap5/Pyra handh=
eld
> >>>>> but it seems there are still some omapdrm dependencies.
> >>>>=20
> >>>> No, OMAPDSS DSI support has not been moved to DRM model yet. I belie=
ve=20
> >>>> Sebastian has been looking at that.
> >>>=20
> >>> That's my understanding too, if I recall correctly Sebastian told me =
he
> >>> had a working implementation, but I'm not sure if it can be upstreamed
> >>> as-is. It would be amazing to get it in mainline, as we'll be able to
> >>> drop lots of code from omapdrm.
> >>=20
> >> Ok, fine. I just wonder if a new driver for omapdrm/displays can then
> >> be accepted for upstreaming or how long we should have to wait.
> >=20
> > I would prefer avoiding new drivers in omapdrm/displays. If you could
> > collaborate with Sebastian that would be best :-)
>=20
> if you have a patch series to share, I could base my driver on it for
> testing.

This is my WIP development branch for converting the panel-dsi-cm
driver into a drm_panel. The driver still is in omapdrm/displays in
the branch, but it is free of any omapdrm specific things and can
trivially be moved to drm/panels.

https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/log/?h=
=3Domapdrm-5.4-dsi-dev

The branch is working on Droid 4, but panel unblanking after a blank
results in a kernel crash. Also system shutdown results in a kernel
crash. I plan to send out the series once I fixed these issues.

-- Sebastian

--qiffkg5yzbdvmz43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2e/74ACgkQ2O7X88g7
+pqtnQ/+OlvWyh1mrrrkGEpFB/y2vxJkFs+w+G8dtBurbNdYA7EWsQ2IHtWbrhap
UxRctF2laZtaTv5hQRcu4QHVOcuWHiib1Qy+pZvpu8JS9+1ymnJKhxoIh2nHShyN
6ENf+HAj4FpvGUxreTkcwmQZjhSYzJf9wYAbnOi6t90yrZmEULjnaHaxYprSjx0f
bhFZMosShxZdzwyKgHnzKOgC99mQdtqX9HZqsR9OavBUE8rKwQoFKi0lnRGsHWCs
7zaUVA0BQSgoqAi2iq5fx6B6sy5F9jy+RXnJvM7wdvXldBls6CSMq1MwOXeHlZ8Z
ZHBXtc8sH24Re2AJhHWqSmW2oqVriloP+z1FqOGxEF8u8MEwhnJhA7ckW0lJzcDz
A32UUvIYlZfsebF8I1JDxg5YD1L+tGbJbaF08Upd1TVLsNFpefuOgjBTH9JTscNd
nWApIC56rnsWUtRiDBdbJcH2d+B39IPcRzrT6bnN3CqQT/w9acDC9LGYQvFNrf6W
Uwx/zhBgBqPoniWt6W+HWOoawzHmLZfeZMU9uKw2YZCJFBsYnZBkxwUbjQshM8Yj
bszk8paG2RvbiZMkQXPOY4jBpNMGnyYUMQjjnucmZUE+HjGZhNTy1QbicxIoP1Ux
VWFZwkm/oZauV7EmXnDy0zu+UMfxM3vundizxb40PlJPqyz3N0A=
=RkRm
-----END PGP SIGNATURE-----

--qiffkg5yzbdvmz43--
