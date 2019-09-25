Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E192BE5E4
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2019 21:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732451AbfIYTv2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Sep 2019 15:51:28 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46280 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbfIYTv1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Sep 2019 15:51:27 -0400
Received: by mail-io1-f65.google.com with SMTP id c6so1858462ioo.13
        for <linux-omap@vger.kernel.org>; Wed, 25 Sep 2019 12:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7UzUPhdDwye0y9pei0w7rdNmv2ryHHm6LDWbyRnVYSM=;
        b=Jz3bj8mMNC56BKXs2n2SMJ0d2h55KjTNKe8YC6ViXX6LoPaXgBnHzUfhhNMkL9Fa/4
         u+eRbsSoXjoi0t71SgHUHC2HdGFleskh9MZ3whT5uAr7pFz95h8NpSr+0NbGfPv7CgOj
         3jbTFmX6alYk4PsRE671QrYXdixfJshL/YFAtd/zANi/DxDYatQhIhAkxfubHLxzjDez
         eOXmlCwglkfO2gXdzFWBpi1oVhQzNcdH7XCzv2HitvVZhIngYbJfnQpOgZu7K9thPz/y
         9FkNV1FF6/O42BCrcbOwbJtMUY6zvCxzILf9qJLP5GQDJUKUehaYbJNrgzcSnzSc9SKy
         ZiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7UzUPhdDwye0y9pei0w7rdNmv2ryHHm6LDWbyRnVYSM=;
        b=oy2/ZwWuR9wVEFItcCR9qIhjNa1SKevHVeLINGpL5cQeNHnFopiX+cCmND8c9L49S/
         FrdHh+A7Cw1XpBBP8HLziF8wHucfeLcLpoDqxN/muX0SdTTjLTevvqiT5s0Xw/dxgy6w
         t4Md2e8fmU8vON/ZgRBfo0i2bQCcUWdef+Kx2554gM7cMQ1vd1D90gJIQaMFy/mCpgmV
         hB6d+Ktqptd9WSDFxCW65YLuFQCfj2MKcdasVpLuOOPyZWdG+tgQ8T1cdVQ0DrEmBwTv
         FZZEghWvE7S1Gsa8/xip7/YjyWpjeNavgSMuooo6kjkQvgp6NDfkObxmGzJncLw5/Vmx
         2Mvw==
X-Gm-Message-State: APjAAAXtmrFko3BZH9JYb0QzzyPG914+h4nedA0NniM6rH/VV/RaOuAw
        PZq9LMaRuMdnSnCfPgMcG6RjxMQ8STB1v/KQn2g=
X-Google-Smtp-Source: APXvYqxcvI6IY3d2gQ423bUVEy1STmzRP8gUTGUS8oc/J0R9DQhj159yNvNzXmKFKih9k353isQqBHIslijHdk+6+8E=
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr1215257iod.205.1569441086526;
 Wed, 25 Sep 2019 12:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190924233222.52757-1-tony@atomide.com>
In-Reply-To: <20190924233222.52757-1-tony@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 25 Sep 2019 14:51:15 -0500
Message-ID: <CAHCN7xKfk8C=cccMUPLn1voKRaUQC1GSJi_0EPAaW2Rg7Zc8Eg@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: Fix warnings with broken omap2_set_init_voltage()
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 24, 2019 at 6:32 PM Tony Lindgren <tony@atomide.com> wrote:
>
> This code is currently unable to find the dts opp tables as ti-cpufreq
> needs to set them up first based on speed binning.
>
> We stopped initializing the opp tables with platform code years ago for
> device tree based booting with commit 92d51856d740 ("ARM: OMAP3+: do not
> register non-dt OPP tables for device tree boot"), and all of mach-omap2
> is now booting using device tree.
>
> We currently get the following errors on init:
>
> omap2_set_init_voltage: unable to find boot up OPP for vdd_mpu
> omap2_set_init_voltage: unable to set vdd_mpu
> omap2_set_init_voltage: unable to find boot up OPP for vdd_core
> omap2_set_init_voltage: unable to set vdd_core
> omap2_set_init_voltage: unable to find boot up OPP for vdd_iva
> omap2_set_init_voltage: unable to set vdd_iva
>
> Let's just drop the unused code. Nowadays ti-cpufreq should be used to
> to initialize things properly.

AFAICT, the ti-cpufreq changes haven't been applied yet to support
omap3 boards, but the regular cpufreq does, and it seems OK.

>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Andr=C3=A9 Roth <neolynx@gmail.com>
> Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>
> Guys, please check and ack if we can really do this to get rid of some
> pointless dmesg -l3 errors without affecting the ongoing cpufreq and
> voltage work.
>

Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit

> ---
>  arch/arm/mach-omap2/pm.c | 100 ---------------------------------------
>  1 file changed, 100 deletions(-)
>
> diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
> --- a/arch/arm/mach-omap2/pm.c
> +++ b/arch/arm/mach-omap2/pm.c
> @@ -74,83 +74,6 @@ int omap_pm_clkdms_setup(struct clockdomain *clkdm, vo=
id *unused)
>         return 0;
>  }
>
> -/*
> - * This API is to be called during init to set the various voltage
> - * domains to the voltage as per the opp table. Typically we boot up
> - * at the nominal voltage. So this function finds out the rate of
> - * the clock associated with the voltage domain, finds out the correct
> - * opp entry and sets the voltage domain to the voltage specified
> - * in the opp entry
> - */
> -static int __init omap2_set_init_voltage(char *vdd_name, char *clk_name,
> -                                        const char *oh_name)
> -{
> -       struct voltagedomain *voltdm;
> -       struct clk *clk;
> -       struct dev_pm_opp *opp;
> -       unsigned long freq, bootup_volt;
> -       struct device *dev;
> -
> -       if (!vdd_name || !clk_name || !oh_name) {
> -               pr_err("%s: invalid parameters\n", __func__);
> -               goto exit;
> -       }
> -
> -       if (!strncmp(oh_name, "mpu", 3))
> -               /*
> -                * All current OMAPs share voltage rail and clock
> -                * source, so CPU0 is used to represent the MPU-SS.
> -                */
> -               dev =3D get_cpu_device(0);
> -       else
> -               dev =3D omap_device_get_by_hwmod_name(oh_name);
> -
> -       if (IS_ERR(dev)) {
> -               pr_err("%s: Unable to get dev pointer for hwmod %s\n",
> -                       __func__, oh_name);
> -               goto exit;
> -       }
> -
> -       voltdm =3D voltdm_lookup(vdd_name);
> -       if (!voltdm) {
> -               pr_err("%s: unable to get vdd pointer for vdd_%s\n",
> -                       __func__, vdd_name);
> -               goto exit;
> -       }
> -
> -       clk =3D  clk_get(NULL, clk_name);
> -       if (IS_ERR(clk)) {
> -               pr_err("%s: unable to get clk %s\n", __func__, clk_name);
> -               goto exit;
> -       }
> -
> -       freq =3D clk_get_rate(clk);
> -       clk_put(clk);
> -
> -       opp =3D dev_pm_opp_find_freq_ceil(dev, &freq);
> -       if (IS_ERR(opp)) {
> -               pr_err("%s: unable to find boot up OPP for vdd_%s\n",
> -                       __func__, vdd_name);
> -               goto exit;
> -       }
> -
> -       bootup_volt =3D dev_pm_opp_get_voltage(opp);
> -       dev_pm_opp_put(opp);
> -
> -       if (!bootup_volt) {
> -               pr_err("%s: unable to find voltage corresponding to the b=
ootup OPP for vdd_%s\n",
> -                      __func__, vdd_name);
> -               goto exit;
> -       }
> -
> -       voltdm_scale(voltdm, bootup_volt);
> -       return 0;
> -
> -exit:
> -       pr_err("%s: unable to set vdd_%s\n", __func__, vdd_name);
> -       return -EINVAL;
> -}
> -
>  #ifdef CONFIG_SUSPEND
>  static int omap_pm_enter(suspend_state_t suspend_state)
>  {
> @@ -208,25 +131,6 @@ void omap_common_suspend_init(void *pm_suspend)
>  }
>  #endif /* CONFIG_SUSPEND */
>
> -static void __init omap3_init_voltages(void)
> -{
> -       if (!soc_is_omap34xx())
> -               return;
> -
> -       omap2_set_init_voltage("mpu_iva", "dpll1_ck", "mpu");
> -       omap2_set_init_voltage("core", "l3_ick", "l3_main");
> -}
> -
> -static void __init omap4_init_voltages(void)
> -{
> -       if (!soc_is_omap44xx())
> -               return;
> -
> -       omap2_set_init_voltage("mpu", "dpll_mpu_ck", "mpu");
> -       omap2_set_init_voltage("core", "l3_div_ck", "l3_main_1");
> -       omap2_set_init_voltage("iva", "dpll_iva_m5x2_ck", "iva");
> -}
> -
>  int __maybe_unused omap_pm_nop_init(void)
>  {
>         return 0;
> @@ -246,10 +150,6 @@ int __init omap2_common_pm_late_init(void)
>         omap4_twl_init();
>         omap_voltage_late_init();
>
> -       /* Initialize the voltages */
> -       omap3_init_voltages();
> -       omap4_init_voltages();
> -
>         /* Smartreflex device init */
>         omap_devinit_smartreflex();
>
> --
> 2.23.0
