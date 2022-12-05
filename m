Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3A5642EFF
	for <lists+linux-omap@lfdr.de>; Mon,  5 Dec 2022 18:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiLERmB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Dec 2022 12:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbiLERmA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Dec 2022 12:42:00 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F7326EE;
        Mon,  5 Dec 2022 09:41:59 -0800 (PST)
Received: from mercury (dyndsl-091-096-035-193.ewe-ip-backbone.de [91.96.35.193])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E229660038D;
        Mon,  5 Dec 2022 17:41:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1670262118;
        bh=LqnzPlkZpZ1kDmkuSMvd1lcS/g4tXqwV3xRr1AHaHMw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hY27qSSd2yMRnSkEubRZlPQS+jWe87ZRKnGCRhbe/a9z+gHt0rU/eg5hDjKNzxGDX
         KzOccqotwKbEIERnJSrEchYUcrtQCK1kkYtSndYKzv/TVegeoEHKMjKQSVdRI58hDH
         9WZJcWOdKRwtKN+Cl5jYFmeu6g0L4EADa6drIx2ax4AWvbjqWrcTUZHNh5GmMNxu4P
         BDjN8s2o6xLQWGy+ftBncs1+AyL+kCLCL9OHuGeISPyVOsEZO+BHVRi/kKoirW6/df
         bujhjixElVzfE/hdRJvYyvaRWjEygFCosZrZ7yknyyaUfsZIuucXmfRs3IR+6s6/ij
         WO9iaqyfUN6SQ==
Received: by mercury (Postfix, from userid 1000)
        id E7A8B1060F2F; Mon,  5 Dec 2022 18:41:55 +0100 (CET)
Date:   Mon, 5 Dec 2022 18:41:55 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] leds: cpcap: add support for the keyboard light
 channel
Message-ID: <20221205174155.cbqxyqfaqdgajd2u@mercury.elektranox.org>
References: <20221204104313.17478-1-philipp@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ql5lvt6czyurbbhx"
Content-Disposition: inline
In-Reply-To: <20221204104313.17478-1-philipp@uvos.xyz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ql5lvt6czyurbbhx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Dec 04, 2022 at 11:43:10AM +0100, Carl Philipp Klemm wrote:
> The keyboard light channel is used on xt875 for the touchscreen
> button lights.
> This commit also adds a checks for the sucessfull return of
> device_get_match_data.

"this commit also adds ..." means, that the commit should be split
:)

> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> ---
>  drivers/leds/leds-cpcap.c    | 15 +++++++++++++++
>  drivers/mfd/motorola-cpcap.c |  4 ++++
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/leds/leds-cpcap.c b/drivers/leds/leds-cpcap.c
> index 7d41ce8c9bb1..11a9b857d8ea 100644
> --- a/drivers/leds/leds-cpcap.c
> +++ b/drivers/leds/leds-cpcap.c
> @@ -58,6 +58,15 @@ static const struct cpcap_led_info cpcap_led_cp =3D {
>  	.init_val	=3D 0x0008,
>  };
> =20
> +/* keyboard led */
> +static const struct cpcap_led_info cpcap_led_kl =3D {
> +	.reg		=3D CPCAP_REG_KLC,
> +	.mask		=3D 0x0001,
> +	.limit		=3D 1,
> +	.init_mask	=3D 0x07FF,
> +	.init_val	=3D 0x07F0,
> +};
> +
>  struct cpcap_led {
>  	struct led_classdev led;
>  	const struct cpcap_led_info *info;
> @@ -152,6 +161,7 @@ static const struct of_device_id cpcap_led_of_match[]=
 =3D {
>  	{ .compatible =3D "motorola,cpcap-led-blue",  .data =3D &cpcap_led_blue=
 },
>  	{ .compatible =3D "motorola,cpcap-led-adl", .data =3D &cpcap_led_adl },
>  	{ .compatible =3D "motorola,cpcap-led-cp", .data =3D &cpcap_led_cp },
> +	{ .compatible =3D "motorola,cpcap-led-kl", .data =3D &cpcap_led_kl },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, cpcap_led_of_match);
> @@ -168,6 +178,11 @@ static int cpcap_led_probe(struct platform_device *p=
dev)
>  	led->info =3D device_get_match_data(&pdev->dev);
>  	led->dev =3D &pdev->dev;
> =20
> +	if (!led->info) {
> +		dev_warn(led->dev, "Can't get match data");
> +		return -ENODEV;
> +	}

If it's fatal, it should be dev_err and not dev_warn:

if (!led->info)
    return dev_err_probe(led->dev, -ENODEV, "Can't get match data");

-- Sebastian

> +
>  	if (led->info->reg =3D=3D 0x0000) {
>  		dev_err(led->dev, "Unsupported LED");
>  		return -ENODEV;
> diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
> index 265464b5d7cc..57b3378a8829 100644
> --- a/drivers/mfd/motorola-cpcap.c
> +++ b/drivers/mfd/motorola-cpcap.c
> @@ -285,6 +285,10 @@ static const struct mfd_cell cpcap_mfd_devices[] =3D=
 {
>  		.name          =3D "cpcap-led",
>  		.id            =3D 4,
>  		.of_compatible =3D "motorola,cpcap-led-cp",
> +	}, {
> +		.name          =3D "cpcap-led",
> +		.id            =3D 5,
> +		.of_compatible =3D "motorola,cpcap-led-kl",
>  	}, {
>  		.name          =3D "cpcap-codec",
>  	}
> --=20
> 2.38.1
>=20
>=20

--ql5lvt6czyurbbhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmOOLVcACgkQ2O7X88g7
+pp0cg//Y2QCueRfXqJDASylrO8rJOFqIIyhXNBqu7BGGapSjHXJkQO3+kgdcL90
qtgDb4Ljw0l/2iJTzGWAUdrsjNpsl1UR/sUDfibWzPw8PLOUHwxETUCt0WKzAa74
D54ds/JVznrLrEhk0q/8S411B4qmD4fOdkZ2wk2LuOxEo1v50MG3fBcVCHV0E9LJ
6i/+AuMfKeSIDcCl//HO6josOMYM9As7yISJsCHSNt+oPE5b4jkYZXQLNZuGI81R
WNNOSFTWdP11eEEtnlVZ/CsjEBu5oBil4D+cjZKY3JEiPuexO75xM45TZ/hTpOe8
R8CdxxKTplFwG+LGlhA5ej+7uDSFrSYhbeekeFwA99nJSU/qKKkaFbTdqvO446KZ
RczKajYM7p2hBXf01yUFl4hBfvh2ZhgoMjNhalXd6Qa5HTLH8r8c16vF69MNi8TQ
i6ZvMYw9ohTUXfGnMuQ3mQNCACvZ79fPyYBWI79NdL5uWq5l0VAfztPBGP1jBbzF
KSfL642b+J+YkEAkVK3MoJCtFQ8RGf/3vHKFxnT0s9MBTjIYHHw+kZCmiIy9ZI3J
2el2N1PrZlEJvY/Qdb4wzikF/AxfrvxaPyK14Fh37w0li+vk8Sqkxzu1Y7a6VYrw
4wy+FzN8VRK4KnCbooy1XkriT/KOkL1mxPMSsR4TbGbMr7gatG4=
=odNb
-----END PGP SIGNATURE-----

--ql5lvt6czyurbbhx--
