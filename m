Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A4E2EBF01
	for <lists+linux-omap@lfdr.de>; Wed,  6 Jan 2021 14:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbhAFNoU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Jan 2021 08:44:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:49020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727060AbhAFNoU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Jan 2021 08:44:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8C9222B40;
        Wed,  6 Jan 2021 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609940619;
        bh=OuYEJr0husHlZLtAFcIhA7cogdH62xmcWA33p4g/SsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HOOfKcWzVij7vyTXXHvJ0dt4sWHfOGVffxpoJDUtJcil/OTHi/1urjPfVgdTqOM7x
         8u832y04QuX9Kxo8uW0qZA0CnjEOJI5y+OJ5s+fCTq5SkECTQH+rCj345GYc3pP3j8
         iEPToAMuN552oGx5EQyYTal8efGtrfSlNhQDpGmS4q3gUEGjAyKGzTtdG//af+M64d
         oOEUAc73ipILgkK+lGIJp+IuDmomStGYWvLbLtl33SiOkiw17GxOcZxr3Gt3rKSNsd
         q8veiCxAJxwq5doYk1vbEOPM4OlzqJc4Q/Ma800tXdezXDRqUt0lszE/xMGllKynmt
         Q2ljqmHhUTsQg==
Received: by earth.universe (Postfix, from userid 1000)
        id 676363C0C94; Wed,  6 Jan 2021 14:43:36 +0100 (CET)
Date:   Wed, 6 Jan 2021 14:43:36 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCH 4/4] Input: omap4-keypad - simplify probe with devm
Message-ID: <20210106134336.lmbaywvn7aqohsj5@earth.universe>
References: <20210106125822.31315-1-tony@atomide.com>
 <20210106125822.31315-5-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5sfagtjpp2hfgowb"
Content-Disposition: inline
In-Reply-To: <20210106125822.31315-5-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--5sfagtjpp2hfgowb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Wed, Jan 06, 2021 at 02:58:22PM +0200, Tony Lindgren wrote:
> Simplify probe with devm.

[...]

>  	/* input device allocation */
> -	keypad_data->input =3D input_dev =3D input_allocate_device();
> +	keypad_data->input =3D input_dev =3D devm_input_allocate_device(&pdev->=
dev);
>  	if (!input_dev) {
>  		error =3D -ENOMEM;
>  		goto err_pm_disable;

[...]

>  static int omap4_keypad_remove(struct platform_device *pdev)
>  {
>  	struct omap4_keypad *keypad_data =3D platform_get_drvdata(pdev);
> -	struct resource *res;
> =20
>  	dev_pm_clear_wake_irq(&pdev->dev);
> -
> -	free_irq(keypad_data->irq, keypad_data);
> -
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -
>  	input_unregister_device(keypad_data->input);

not needed:

 * devm_input_allocate_device - allocate managed input device
 * @dev: device owning the input device being created
 *
 * Returns prepared struct input_dev or %NULL.
 *
 * Managed input devices do not need to be explicitly unregistered or
 * freed as it will be done automatically when owner device unbinds from
 * its driver (or binding fails). [...]

-- Sebastian

--5sfagtjpp2hfgowb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/1voIACgkQ2O7X88g7
+pr4HxAAkSP1D4kkvC9azLp/JepNBuTF+YCif7FAdLUfKY8tTQzzTml6ADRwE2Hl
TQmwXOiJUqS7h/EK8oUMiNVdvR6+5SrSlPbgT5KhwaMJ4x2Fjjh2WMlmYUyjZBn8
YtHSTsiQvCyUJ68g8nE+PPXq+EWB+3anu398bWYx8uRTxzfC+XnTfHaJDfs0YfFo
DExm4z57I9sP/y47bBLw/J28IzbMAqlwRAhlPNvCz+iNlh3CaM2wwZYF7Xcf5JFn
TddOaftsIeumRVMFnOJrnyfm4FKHmjFhGqvo7UhHL6G/irCEtC6Gq4RwLNrsbJ4M
7ZraWDqEKVUUdOFdF7jz1MaGSCrsncAkTmr3J6D9NvFXmBTW9U25z9wgyxgsVmyt
8aDhOYDe+tS5B1zzJISm9SWkGkWCuELBww6xs3gxc6yaRKwjm9RRX/DMW8YLivwA
NcTrHy+mA8MmyZIyTLoHxSMXglSQQ4GH6HrMSR3FX4RQsdvpwBpMKNmyYKzzqNRu
PRURKaamp1YChM+qMlHSLr1EjH/50wAaCia59a+earf2Tt+IK7RI6VX8ll/3BV4p
DOXHM28SW6EUgzvWA9/Hj2qeBZKvVw5LxXIlKnYL9UqmnYH8fAoQr/mye+0D8BFZ
JpEczSFDlQFfr6J4CWehkxMDk+qr2eEyWc6mvrQqY42dCe/kjeY=
=nptw
-----END PGP SIGNATURE-----

--5sfagtjpp2hfgowb--
