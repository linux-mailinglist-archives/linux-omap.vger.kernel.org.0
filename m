Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6196F16B591
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgBXXbQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:31:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:56816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727843AbgBXXbQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 18:31:16 -0500
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81D1420732;
        Mon, 24 Feb 2020 23:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582587074;
        bh=yyoIq9r3JJzdd087q+xbmylNb3EvsNWuyyYgC181N0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lZ7dEbmgnyrf7AGyLL+C5vvM/f+nR6bGrL6GrfGWA2UWETaDVMMcHbqJbRBhO68XQ
         SysGILhpBVtNwzdTVL0VyfUgpabApQqZGTSqFRkUyokwwkakOmfQZ+3hF5+C+YbvDx
         fzuxcceQjaoE7kkUhzAH5UwQywAh4f1Eut8KlDwg=
Received: by earth.universe (Postfix, from userid 1000)
        id 0EF153C0C82; Tue, 25 Feb 2020 00:31:12 +0100 (CET)
Date:   Tue, 25 Feb 2020 00:31:11 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/3] drm/omap: Prepare DSS for probing without legacy
 platform data
Message-ID: <20200224233111.gkctx27usfxj2wgz@earth.universe>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gmvioj7yfxkg2crl"
Content-Disposition: inline
In-Reply-To: <20200224191230.30972-2-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--gmvioj7yfxkg2crl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 24, 2020 at 11:12:28AM -0800, Tony Lindgren wrote:
> In order to probe display subsystem (DSS) components with ti-sysc
> interconnect target module without legacy platform data and using
> devicetree, we need to update dss probing a bit.
>=20
> In the device tree, we will be defining the data also for the interconnect
> target modules as DSS really is a private interconnect. There is some
> information about that in 4460 TRM in "Figure 10-3. DSS Integration" for
> example where it mentions "32-bit interconnect (SLX)".
>=20
> The changes we need to make are:
>=20
> 1. Parse also device tree subnodes for the compatible property fixup
>=20
> 2. Update the component code to consider device tree subnodes
>=20
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>=20
> This is needed for dropping DSS platform data that I'll be posting
> seprately. If this looks OK, can you guys please test and ack?
>=20
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

FWIW, I dropped omapdss-boot-init.c in my patch series updating DSI
code to use common panel infrastructure, so this will conflict.

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dss.c             | 25 ++++++++++++++++---
>  .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   | 25 +++++++++++++------
>  2 files changed, 39 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/=
dss/dss.c
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1339,9 +1339,15 @@ static int dss_component_compare(struct device *de=
v, void *data)
>  	return dev =3D=3D child;
>  }
> =20
> +struct dss_component_match_data {
> +	struct device *dev;
> +	struct component_match **match;
> +};
> +
>  static int dss_add_child_component(struct device *dev, void *data)
>  {
> -	struct component_match **match =3D data;
> +	struct dss_component_match_data *cmatch =3D data;
> +	struct component_match **match =3D cmatch->match;
> =20
>  	/*
>  	 * HACK
> @@ -1352,7 +1358,17 @@ static int dss_add_child_component(struct device *=
dev, void *data)
>  	if (strstr(dev_name(dev), "rfbi"))
>  		return 0;
> =20
> -	component_match_add(dev->parent, match, dss_component_compare, dev);
> +	/*
> +	 * Handle possible interconnect target modules defined within the DSS.
> +	 * The DSS components can be children of an interconnect target module
> +	 * after the device tree has been updated for the module data.
> +	 * See also omapdss_boot_init() for compatible fixup.
> +	 */
> +	if (strstr(dev_name(dev), "target-module"))
> +		return device_for_each_child(dev, cmatch,
> +					     dss_add_child_component);
> +
> +	component_match_add(cmatch->dev, match, dss_component_compare, dev);
> =20
>  	return 0;
>  }
> @@ -1395,6 +1411,7 @@ static int dss_probe_hardware(struct dss_device *ds=
s)
>  static int dss_probe(struct platform_device *pdev)
>  {
>  	const struct soc_device_attribute *soc;
> +	struct dss_component_match_data cmatch;
>  	struct component_match *match =3D NULL;
>  	struct resource *dss_mem;
>  	struct dss_device *dss;
> @@ -1472,7 +1489,9 @@ static int dss_probe(struct platform_device *pdev)
> =20
>  	omapdss_gather_components(&pdev->dev);
> =20
> -	device_for_each_child(&pdev->dev, &match, dss_add_child_component);
> +	cmatch.dev =3D &pdev->dev;
> +	cmatch.match =3D &match;
> +	device_for_each_child(&pdev->dev, &cmatch, dss_add_child_component);
> =20
>  	r =3D component_master_add_with_match(&pdev->dev, &dss_component_ops, m=
atch);
>  	if (r)
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gp=
u/drm/omapdrm/dss/omapdss-boot-init.c
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> @@ -183,9 +183,24 @@ static const struct of_device_id omapdss_of_fixups_w=
hitelist[] __initconst =3D {
>  	{},
>  };
> =20
> +static void __init omapdss_find_children(struct device_node *np)
> +{
> +	struct device_node *child;
> +
> +	for_each_available_child_of_node(np, child) {
> +		if (!of_find_property(child, "compatible", NULL))
> +			continue;
> +
> +		omapdss_walk_device(child, true);
> +
> +		if (of_device_is_compatible(child, "ti,sysc"))
> +			omapdss_find_children(child);
> +	}
> +}
> +
>  static int __init omapdss_boot_init(void)
>  {
> -	struct device_node *dss, *child;
> +	struct device_node *dss;
> =20
>  	INIT_LIST_HEAD(&dss_conv_list);
> =20
> @@ -195,13 +210,7 @@ static int __init omapdss_boot_init(void)
>  		return 0;
> =20
>  	omapdss_walk_device(dss, true);
> -
> -	for_each_available_child_of_node(dss, child) {
> -		if (!of_find_property(child, "compatible", NULL))
> -			continue;
> -
> -		omapdss_walk_device(child, true);
> -	}
> +	omapdss_find_children(dss);
> =20
>  	while (!list_empty(&dss_conv_list)) {
>  		struct dss_conv_node *n;
> --=20
> 2.25.1

--gmvioj7yfxkg2crl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5UXLkACgkQ2O7X88g7
+pqvHQ/+MVhgl1M4zDe/OMecKEJF4uCdkdG91ptiFdPBBV8SSRY5jY8dopPpRYGg
kzElUh1NCOZa9bIrK1Qi679UeR0gXpgiepSBoHe/I692eU3k6qKYodnmU9ov3Q+o
Nzwa58BI7RAajMKD/YoosJDwpLQGelvYXeFwPIqCLVGSxYryobRjnvtY4njMtbse
TJiDDNwLM6U4UADQKcI4MJtggdAn4u5U5yi0xZssI9U+eycLequvYn3yRLjngY0e
1km/CLhcUt/OKUgjQmpOS9rSirCpEsGTJsAeDmfq2enfP7ZgGJQ7d2ODcofmZpSV
6Njh5A0wu82y8rit714t0s3lG71wUN0NE/M2PW6E59D4+QQ4839JHO+gA4eqrqob
auMxA6MWmvp549+m1K+HmrIEPL/8G5K0Rm9AB8e+eaQEurRlyzCG1GtliUUlrLRn
1f82RrbAS1Uho6CjveVABFLqXBQ3WqMltaCE/rjlVY5mjoVpCltB3P1aSrcprDw3
NWnjGnzTO32ODYiB3psQmEqxoPKlcYDMBC6ErSgULf1H1Zdq27Mjf1+XatYvfSGN
tynLqDIwinYuZ9qHoER68UASq6QsYs7FI71VPC7TY+hilRggQOyblWyTvOJ6MOc4
T00iFoLdEBGFszLiK6ae8Mqc0TUaApQNBt67M7IoQmoPdGHTAsI=
=qcVF
-----END PGP SIGNATURE-----

--gmvioj7yfxkg2crl--
