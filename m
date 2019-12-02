Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8469010F1E8
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2019 22:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbfLBVJ5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Dec 2019 16:09:57 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:35738 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfLBVJ5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Dec 2019 16:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575320991;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FrGufs8yOusYQL5oaAaiiF5A9W8IpjOBuIOCcxFy/38=;
        b=SA7Z6kQYADs7C6nXYWjDpMgZczSe4dtxT411+oBq5PLvIdCDqg3tLu6gQfuuT3hGCZ
        Jvw9aSpGLYDeOqy2fxjUhIbyYQPXe23lilrXaDLbsxz+qyh0vXJwm7FjHxuH7Esue8wZ
        qsVNokDRCiCqKauUbaL+5crVE38PO5ejjYZQhso6/4AP+s8tokYrXdW/azSD02+MB6IW
        ej74Rne67KV6gWQcvSVXoLSX7stbIlaj0GUwMbfYVklIcj5g8UOvbkl7F75AkEL+EGLR
        YApkGnaEcHCx+vRiDLaw44DyPQtLE9ONB+g28HuIhM6xnUUe0VRnvHMyNAPXotHZuBqA
        JbTQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaVXA4EIw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.0.2 DYNA|AUTH)
        with ESMTPSA id 6067eavB2L9Q1cK
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 2 Dec 2019 22:09:26 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: OMAP2+: Fix warnings with broken omap2_set_init_voltage()
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190924233222.52757-1-tony@atomide.com>
Date:   Mon, 2 Dec 2019 22:09:26 +0100
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Adam Ford <aford173@gmail.com>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com>
References: <20190924233222.52757-1-tony@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 25.09.2019 um 01:32 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> This code is currently unable to find the dts opp tables as ti-cpufreq
> needs to set them up first based on speed binning.
>=20
> We stopped initializing the opp tables with platform code years ago =
for
> device tree based booting with commit 92d51856d740 ("ARM: OMAP3+: do =
not
> register non-dt OPP tables for device tree boot"), and all of =
mach-omap2
> is now booting using device tree.
>=20
> We currently get the following errors on init:
>=20
> omap2_set_init_voltage: unable to find boot up OPP for vdd_mpu
> omap2_set_init_voltage: unable to set vdd_mpu
> omap2_set_init_voltage: unable to find boot up OPP for vdd_core
> omap2_set_init_voltage: unable to set vdd_core
> omap2_set_init_voltage: unable to find boot up OPP for vdd_iva
> omap2_set_init_voltage: unable to set vdd_iva
>=20
> Let's just drop the unused code. Nowadays ti-cpufreq should be used to
> to initialize things properly.
>=20
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Andr=C3=A9 Roth <neolynx@gmail.com>
> Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>=20
> Guys, please check and ack if we can really do this to get rid of some
> pointless dmesg -l3 errors without affecting the ongoing cpufreq and
> voltage work.

unfortunately we did not yet test in combination with the 1GHz OPP
patches for omap3630 (queued for v5.5-rc1) and it appears that this
patch breaks the 1GHz OPP.

The symptom is that it works fine on a dm3730 with 800MHz rating
but results in spurious kernel panics, stack corruption, virtual memory
failures, OneNAND DMA timeouts etc. on a dm3730 with 1GHz speed grade.

We can also re-add the "turbo-mode" tags in the omap36xx.dtsi (or
remove the 1GHz OPP) and can then boot with 800MHz max. clock. But
enabling boost (echo 1 >/sys/devices/system/cpu/cpufreq/boost) makes
the problem and its symptoms appear almost immediately.

After some scratching our heads we found that v5.3.7 is still good and
v5.3.8 is bad. A bisect of our tree (which includes the 1GHz OPP) did
point to this patch whichwas apparently already backported to v5.3.8 and
v5.4.

So I assume that the code removed here enabled or initialized something
we need for safe 1GHz transitions. Maybe the ABB-LDO. Or it looks up the
vdd regulator and initializes it earlier than without this code. Maybe
it also (pre-)initializes some clk which could now be left uninitialized
too long?

Note that seeing the log message indicates that voltdm_scale() and
dev_pm_opp_get_voltage() are not called, but all functions before could
be with side-effects.

v5.5-rc1 will likely fail right from the beginning (only on 1GHz rated
omap36xx) because it makes the combination of this patch and 1GHz OPP
public (linux-next should already fail but it appears that nobody has
tested).

Any ideas how to fix? Before I try to do a revert and then add goto =
exit;
after each function call and see which ones are essential for 1GHz.

BR,
Nikolaus


>=20
> ---
> arch/arm/mach-omap2/pm.c | 100 ---------------------------------------
> 1 file changed, 100 deletions(-)
>=20
> diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
> --- a/arch/arm/mach-omap2/pm.c
> +++ b/arch/arm/mach-omap2/pm.c
> @@ -74,83 +74,6 @@ int omap_pm_clkdms_setup(struct clockdomain *clkdm, =
void *unused)
> 	return 0;
> }
>=20
> -/*
> - * This API is to be called during init to set the various voltage
> - * domains to the voltage as per the opp table. Typically we boot up
> - * at the nominal voltage. So this function finds out the rate of
> - * the clock associated with the voltage domain, finds out the =
correct
> - * opp entry and sets the voltage domain to the voltage specified
> - * in the opp entry
> - */
> -static int __init omap2_set_init_voltage(char *vdd_name, char =
*clk_name,
> -					 const char *oh_name)
> -{
> -	struct voltagedomain *voltdm;
> -	struct clk *clk;
> -	struct dev_pm_opp *opp;
> -	unsigned long freq, bootup_volt;
> -	struct device *dev;
> -
> -	if (!vdd_name || !clk_name || !oh_name) {
> -		pr_err("%s: invalid parameters\n", __func__);
> -		goto exit;
> -	}
> -
> -	if (!strncmp(oh_name, "mpu", 3))
> -		/*=20
> -		 * All current OMAPs share voltage rail and clock
> -		 * source, so CPU0 is used to represent the MPU-SS.
> -		 */
> -		dev =3D get_cpu_device(0);
> -	else
> -		dev =3D omap_device_get_by_hwmod_name(oh_name);
> -
> -	if (IS_ERR(dev)) {
> -		pr_err("%s: Unable to get dev pointer for hwmod %s\n",
> -			__func__, oh_name);
> -		goto exit;
> -	}
> -
> -	voltdm =3D voltdm_lookup(vdd_name);
> -	if (!voltdm) {
> -		pr_err("%s: unable to get vdd pointer for vdd_%s\n",
> -			__func__, vdd_name);
> -		goto exit;
> -	}
> -
> -	clk =3D  clk_get(NULL, clk_name);
> -	if (IS_ERR(clk)) {
> -		pr_err("%s: unable to get clk %s\n", __func__, =
clk_name);
> -		goto exit;
> -	}
> -
> -	freq =3D clk_get_rate(clk);
> -	clk_put(clk);
> -
> -	opp =3D dev_pm_opp_find_freq_ceil(dev, &freq);
> -	if (IS_ERR(opp)) {
> -		pr_err("%s: unable to find boot up OPP for vdd_%s\n",
> -			__func__, vdd_name);
> -		goto exit;
> -	}
> -
> -	bootup_volt =3D dev_pm_opp_get_voltage(opp);
> -	dev_pm_opp_put(opp);
> -
> -	if (!bootup_volt) {
> -		pr_err("%s: unable to find voltage corresponding to the =
bootup OPP for vdd_%s\n",
> -		       __func__, vdd_name);
> -		goto exit;
> -	}
> -
> -	voltdm_scale(voltdm, bootup_volt);
> -	return 0;
> -
> -exit:
> -	pr_err("%s: unable to set vdd_%s\n", __func__, vdd_name);
> -	return -EINVAL;
> -}
> -
> #ifdef CONFIG_SUSPEND
> static int omap_pm_enter(suspend_state_t suspend_state)
> {
> @@ -208,25 +131,6 @@ void omap_common_suspend_init(void *pm_suspend)
> }
> #endif /* CONFIG_SUSPEND */
>=20
> -static void __init omap3_init_voltages(void)
> -{
> -	if (!soc_is_omap34xx())
> -		return;
> -
> -	omap2_set_init_voltage("mpu_iva", "dpll1_ck", "mpu");
> -	omap2_set_init_voltage("core", "l3_ick", "l3_main");
> -}
> -
> -static void __init omap4_init_voltages(void)
> -{
> -	if (!soc_is_omap44xx())
> -		return;
> -
> -	omap2_set_init_voltage("mpu", "dpll_mpu_ck", "mpu");
> -	omap2_set_init_voltage("core", "l3_div_ck", "l3_main_1");
> -	omap2_set_init_voltage("iva", "dpll_iva_m5x2_ck", "iva");
> -}
> -
> int __maybe_unused omap_pm_nop_init(void)
> {
> 	return 0;
> @@ -246,10 +150,6 @@ int __init omap2_common_pm_late_init(void)
> 	omap4_twl_init();
> 	omap_voltage_late_init();
>=20
> -	/* Initialize the voltages */
> -	omap3_init_voltages();
> -	omap4_init_voltages();
> -
> 	/* Smartreflex device init */
> 	omap_devinit_smartreflex();
>=20
> --=20
> 2.23.0

