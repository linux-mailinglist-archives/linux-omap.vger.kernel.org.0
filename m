Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50FD479D4C9
	for <lists+linux-omap@lfdr.de>; Tue, 12 Sep 2023 17:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbjILP1y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Sep 2023 11:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236424AbjILP1p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Sep 2023 11:27:45 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7331726;
        Tue, 12 Sep 2023 08:27:40 -0700 (PDT)
Received: from mercury (dyndsl-091-248-213-163.ewe-ip-backbone.de [91.248.213.163])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BE776660731E;
        Tue, 12 Sep 2023 16:27:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694532459;
        bh=69K1SslWRsSlfHjf3b1eh1NJngiKuNK5WTVr61ojS2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l5BKK2ycZjEbOkG2646Bqrl6QDvBwt+hCD4k/Z1YHfuKEuFUQQRFNAPRvRYtQ0Wy5
         AaPztWn5Ao+CGaH00DhV7WfZJsSZDt5A5/8iyTf6RPf7mrrc9reViSE0/68dGPq9pY
         03t+zwlfnuTNMLrtj1a5ygg+yI3xEeiCanOLwnUmoIXXWPQ3+zzn0q/zqt+EjMtccz
         BR3ohJJiy+fupfAhpifOTXE+lNBsm6W8W5vHnogqUSptbgeMflQrf6VZzA1oKvFsyV
         71M58GWTjsJKxDHO+8GLqmIxZnVGBNpxu0+e3W+8S2FjRF1r6mQctL7XyNM0g4eV60
         z5hS9Za2slzIQ==
Received: by mercury (Postfix, from userid 1000)
        id 8F1761060929; Tue, 12 Sep 2023 17:27:37 +0200 (CEST)
Date:   Tue, 12 Sep 2023 17:27:37 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 4/4] ARM: omap2+: Downgrade u-boot version warnings to
 debug statements
Message-ID: <20230912152737.ylqt4tpeeczt2tdz@mercury.elektranox.org>
References: <20230911040828.39386-1-tony@atomide.com>
 <20230911040828.39386-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bsl6hze6x22fpa5r"
Content-Disposition: inline
In-Reply-To: <20230911040828.39386-4-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--bsl6hze6x22fpa5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 11, 2023 at 07:08:27AM +0300, Tony Lindgren wrote:
> We should be able to see real issues with dmesg -l err,warn. The u-boot
> revision warning should be a debug statement rather than a warning.
>=20
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Carl Philipp Klemm <philipp@uvos.xyz>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  arch/arm/mach-omap2/pm44xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-omap2/pm44xx.c b/arch/arm/mach-omap2/pm44xx.c
> --- a/arch/arm/mach-omap2/pm44xx.c
> +++ b/arch/arm/mach-omap2/pm44xx.c
> @@ -99,7 +99,7 @@ static int omap4_pm_suspend(void)
>  		 * possible causes.
>  		 * http://www.spinics.net/lists/arm-kernel/msg218641.html
>  		 */
> -		pr_warn("A possible cause could be an old bootloader - try u-boot >=3D=
 v2012.07\n");
> +		pr_debug("A possible cause could be an old bootloader - try u-boot >=
=3D v2012.07\n");
>  	} else {
>  		pr_info("Successfully put all powerdomains to target state\n");
>  	}
> @@ -257,7 +257,7 @@ int __init omap4_pm_init(void)
>  	 * http://www.spinics.net/lists/arm-kernel/msg218641.html
>  	 */
>  	if (cpu_is_omap44xx())
> -		pr_warn("OMAP4 PM: u-boot >=3D v2012.07 is required for full PM suppor=
t\n");
> +		pr_debug("OMAP4 PM: u-boot >=3D v2012.07 is required for full PM suppo=
rt\n");
> =20
>  	ret =3D pwrdm_for_each(pwrdms_setup, NULL);
>  	if (ret) {
> --=20
> 2.42.0

--bsl6hze6x22fpa5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmUAg2kACgkQ2O7X88g7
+ppnWg/5AaBd/DcZIfQSGv8F3yh3vt6MCGUq+XUxUPrllMSKvUish/bv/tbKthRu
20Z3/4ZSR1kzbjMJKxH/Onp9ITxezwsYQEfS1Wh+1pc8w60jUUnQ1zNBj0JBVs4v
sLqDyw0qbS5aJdtjDdap8Dg7huht5QxXomq90dnru4P25FYLZfXjkqtGzKsnqryi
rY0OeG2QsFjFGwyifnU6zZFa+8RyyKo9Dt7DY7TK/c08zmclE/qkm2EHImkBJQd9
4w7o1lfVeHJzlHk0iDW1I+Au9/2CpKrQTUvt+JskCbKGOLvXZtSRqVSyi2MYQCt3
tVfYF4mu540P+cyjrAB6zzwxCt0jzOpS1vZ6wUxguK5nH4q9REJByHqh4pkZ4Voh
R7Qs+fD2SDUqe4HqMUyGPFx5955nKOyFeq+xznB0IO5rRyHtwH6UmLA8YZnaV1rC
y2Debq0X3FjDGObV2bFEInsibvt2fhKSDn1VbgH9NsMnRHPrSX15e3xk70lR6KrC
rboaRVeY5k6drdgadtXxStzwRrVdPhyYj6Fl3EFjGkeeIt2i0+qniqZciq/Y0PoD
S9IZjBTE/PAJZcoYLUiHnj7Vdo7vbYCvPFYb4NZiqALqZ8NXk/jhNqE3sznC7LTw
rNiCvQF7WjhpZ8EwoUgN+0s28aVOwSRUE8cnNpuZXc74u+0/tdI=
=UdH5
-----END PGP SIGNATURE-----

--bsl6hze6x22fpa5r--
