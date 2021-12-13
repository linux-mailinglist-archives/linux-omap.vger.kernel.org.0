Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0196472CDC
	for <lists+linux-omap@lfdr.de>; Mon, 13 Dec 2021 14:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbhLMNKb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Dec 2021 08:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhLMNKa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Dec 2021 08:10:30 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E5EC061574
        for <linux-omap@vger.kernel.org>; Mon, 13 Dec 2021 05:10:30 -0800 (PST)
Received: from mail.kernel.org (unknown [198.145.29.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 68E0FCE101B
        for <linux-omap@vger.kernel.org>; Mon, 13 Dec 2021 13:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F8D760E52;
        Mon, 13 Dec 2021 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639401026;
        bh=Le5DmDoskJWhF6xkovUkon4tp/1va5qaVzVF98Vi1EQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kleFyRCE+hZBZ8FH3mhyajsGiT+C7f8S4edI/VohELahRpWI4KZ1eWJzHoiRfusOl
         9FMLkHW77Mrd+XEv75BGcMYj0FjWLxIxscTvEqu7M6LDTohyxtENb+qH52sYCRi+fK
         WkQmqiifEcpL1Vv7f9C7bR4yJb/qpCZ1XSczqwUNi0+Pm2G1BCAS7d/pXjYcfYeAUh
         oio/kbanKLfUaVuVPiC4Hz0uJRyJpHhjTo3FVEfXgAsHS/oSonj4M6iTnPdHBh93Tm
         0T2H/b2TFuxwduEUhUmQfrQNNQkjVpIggIBM3D9u/iYISZzOR2huYhzXrOufAP3KRH
         jCt5aEX8bTpeQ==
Received: by earth.universe (Postfix, from userid 1000)
        id DF9543C0CA8; Mon, 13 Dec 2021 14:10:23 +0100 (CET)
Date:   Mon, 13 Dec 2021 14:10:23 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>, Pavel Machek <pavel@ucw.cz>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: Nokia N900 increased power draw with panel-sony-acx565akm loaded
 v5.9 and v5.10
Message-ID: <20211213131023.ese6lrkayj4qopfa@earth.universe>
References: <001a77db-80c0-d000-3d78-b9b301669826@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hjdvrgxlu7kmersq"
Content-Disposition: inline
In-Reply-To: <001a77db-80c0-d000-3d78-b9b301669826@wizzup.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--hjdvrgxlu7kmersq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 10, 2021 at 08:18:35PM +0100, Merlijn Wajer wrote:
> Hi Sebastian,
>=20
> I don't know if this is something that requires any action currently,
> but I wanted to report that I'm seeing some increased power draw on a
> Nokia N900 with minimal userspace on Linux 5.10 (and the same happens on
> 5.15 it seems, so it doesn't seem to be resolved since). I tried to
> bisect the problem but my initial attempt failed, because the problem
> seems a bit racy or unpredictable.
>=20
> Basically I boot a system to init=3D/bin/bash and run the following:
>=20
> > modprobe panel-sony-acx565akm
> >=20
> > mount -t proc none /proc
> > mount -t sysfs none /sys
> > mount -t debugfs none /sys/kernel/debug
> > mount -o rw,remount /
> >=20
> > echo 1 > /sys/kernel/debug/pm_debug/enable_off_mode
> > echo 0 > /sys/class/backlight/acx565akm/brightness
> >=20
> >=20
> > consoles=3D$(find /sys/bus/platform/devices/4*.serial/ -name console)
> > for console in ${consoles}; do
> >     echo N > ${console}
> > done
> >=20
> > # Enable autosuspend
> > uarts=3D$(find /sys/bus/platform/devices/4*.serial/power/ -type d)
> > for uart in ${uarts}; do
> >     echo 2000 > ${uart}/autosuspend_delay_ms
> >     echo enabled > ${uart}/wakeup
> >     echo auto > ${uart}/control
> > done
> >=20
> > # Configure wake-up from suspend
> > uarts=3D$(find /sys/class/tty/tty[SO]*/power/ -type d)
> > for uart in ${uarts}; do
> >     echo enabled > ${uart}/wakeup
> > done
>=20
> This loads the panel and then sets the brightness to zero, enables off
> mode and idles the kernel console/serial.
>=20
> Then run the following to check idle states:
>=20
> 	grep ^core_pwrdm /sys/kernel/debug/pm_debug/count | cut -d',' -f2,3
>=20
> And also check the power usage on lab power supply that I have here.
>=20
> With the above, Linux v5.9 (no patches applied) idles at around 42mW
> (15mW goes to the serial device, so it's more like 27mW, anyway...).
>=20
> Linux v5.10 with the following two commits reverted (otherwise the
> system is not stable):
>=20
> * fb2c599f056640d289b2147fbe6d9eaee689f1b2 (ARM: omap3: enable off mode
> automatically)
> * 21b2cec61c04bd175f0860d9411a472d5a0e7ba1 (mmc: Set
> PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4)
>=20
> And the following config change on top of omap2plus_defconfig (to make
> OFF mode work on v5.10 as detailed in "Nokia N900 not hitting OFF mode
> since 5.9 is caused by proactive memory compaction"):
>=20
> > sed -i 's/CONFIG_COMPACTION=3Dy/CONFIG_COMPACTION=3Dn/' .config
>=20
> Idles at much more -- 60mW (compared to 42mW). Executing "rmmod
> panel-sony-acx565akm" makes the power draw return to v5.9 levels.
>=20
> I don't really understand why this would happen, and as stated before
> wasn't able to really bisect the problem. However, some simple guesswork
> led me to find that reverting 7c4bada12d320d8648ba3ede6f9b6f9e10f1126a
> ("drm/panel: sony-acx565akm: Fix race condition in probe") makes v5.10
> idle at 42mW again. I don't know if this because v5.9 never properly
> initialised the panel, or because the race condition fix introduced
> another problem that leaves the hardware in an abnormal state.
>=20
> Any hints on what could cause this extra power draw? Maybe the panel is
> waiting for something? I suppose it's potentially feasible that with
> more modules and userspace loaded the panel idles properly, but I
> currently don't have a way to measure that.

First of all: I do not have documentation for that panel. Before my
patch what happened was that gpiod_get() initialized the reset GPIO
as OUTPUT_LOW. Immediately afterwards it is configured as OUTPUT_HIGH
in acx565akm_detect(). So there are 2 options:

1. The reset GPIO was low before the driver probe starts. In that
   case everything is fine with or without 7c4bada12d320 and there
   is no expected change in behaviour. The GPIO is just toggled
   slightly earlier.

2. The reset GPIO was output-high before the driver probe starts
   (e.g. because bootloader used the panel, kexec, ...). In that
   case the reset GPIO will be low for just a very short time (just
   a few instructions). Usually panels have a minimum time required
   for reset lines to be asserted. In acx565akm_power_off() it is
   hinted, that 100ms should be ok.

My patch fixes the behaviour, so that reset is no longer asserted
for less than 100ms in the second case by not asserting it at all.
That also means, that the LCD is not reset when it has already been
configured before the probe routine is called. An alternative would
be the following patch, which does the reset and ensures minimum
reset times are ok:

------------------------------------------------------
git diff drivers/gpu/drm/panel/panel-sony-acx565akm.c
diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm=
/panel/panel-sony-acx565akm.c
index ba0b3ead150f..2a8c0f7342ce 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -629,11 +629,12 @@ static int acx565akm_probe(struct spi_device *spi)
        lcd->spi =3D spi;
        mutex_init(&lcd->mutex);
=20
-       lcd->reset_gpio =3D devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HI=
GH);
+       lcd->reset_gpio =3D devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LO=
W);
        if (IS_ERR(lcd->reset_gpio)) {
                dev_err(&spi->dev, "failed to get reset GPIO\n");
                return PTR_ERR(lcd->reset_gpio);
        }
+       msleep(100); /* ensure minimum reset assertion time */
=20
        ret =3D acx565akm_detect(lcd);
        if (ret < 0) {
------------------------------------------------------

-- Sebastian

>=20
> Regards,
> Merlijn
>=20
>=20
> PS: For both v5.9 and v5.10 kernels the only other change to
> omap2plus_defconfig is to make the watchdog(s) built-in.

--hjdvrgxlu7kmersq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmG3RjMACgkQ2O7X88g7
+priOg//c3F+tMwqq7jHcwULEO7yLbO6TA0rxxyTbUryJHmz5rCUnar+WqI5G+gQ
A2unCWsfP8xOwIjJCCf/iF+Hf7ipkzfsUorSos4VNQl9GmMyBWxryRYClRBxsz+Q
7mXCIQ98If60j59oJCTSp0FZwdRqzd1QJDd2lgG/jPEYZO185fHjSGpUvYs/CIK3
0r0oByXQqqM1vxowkCCshf9o0IP25Y8jcf1t0/LIiRpNdMIL3oIYuPJ6edP6o2R8
b8xnuOsY4vKHBJ5X84ZXD6Qju4hm0A6d0vORXn9mAf7QWAazobM0c3NCanaW/nTs
TisKZhGq6OXsuMFN6OfFT/CB0wqRf+Y3G5vP96rtTbkCXkzjxp3Trh1oy+pOyt3n
0CH6WrvPXQkQpMExA+nT+dpia+uSDOSBV8ukpp0hPWcIu2aiI6664PYIgi7gYCuW
Hbsh64ZAxxAIrFwL33pRZXlPefoclMGKfDMOvmbLVWEN9thBB50/BguXDDljHenp
9AcPj5ZdSwh2lIQ7pXUvsTehCTlvEOA/KsQjei4s9Y1kj59+NvFOKP7wZ/gSNzD/
WN7uwaPgayx66bAB5hoq/Ke2S6HAeaP0W4Vk3/BNDU93xEC0lTneU+cRtusJtjhY
2zZTiI8Gr3pz+rvl5v3CUTIKna9vZQScVEIInMUFe10BSls7R70=
=ikDS
-----END PGP SIGNATURE-----

--hjdvrgxlu7kmersq--
