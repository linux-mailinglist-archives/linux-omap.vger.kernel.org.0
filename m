Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7900811DDBB
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 06:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbfLMF2L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 00:28:11 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46202 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfLMF2L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Dec 2019 00:28:11 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBD5S1cI037841;
        Thu, 12 Dec 2019 23:28:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576214881;
        bh=tvtGX9m/uqesfRcBDbruG1zyPWhH/JPbuWRgG9lqu2s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dn4S0U4XIlWZee/McyX1z/T34Crd2H18YjsIFV3daJUJGlZ4HUiOuEGQ9glsKF5+2
         sHCx9f6mU7IWPcx9xtF30EvlWFDGQqtzG8MXzlf58jHTyoASVxwghmUNf57bA9lcuu
         sSdvnxpOIuqXoDbMQ0n/05A7TGEYd+X2IxIKQmdU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD5S1tF113488;
        Thu, 12 Dec 2019 23:28:01 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 23:28:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 23:28:00 -0600
Received: from [10.24.69.174] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD5RvPn120072;
        Thu, 12 Dec 2019 23:27:57 -0600
Subject: Re: [PATCH 12/16] ARM: OMAP2+: Drop legacy platform data for am3 and
 am4 rtc
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        "Andrew F. Davis" <afd@ti.com>,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Jyri Sarha <jsarha@ti.com>, Roger Quadros <rogerq@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Vignesh R <vigneshr@ti.com>
References: <20191211172014.35201-1-tony@atomide.com>
 <20191211172014.35201-13-tony@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
X-Pep-Version: 2.0
Message-ID: <422c4d8d-27e3-7055-e8a4-c830a7e569be@ti.com>
Date:   Fri, 13 Dec 2019 10:58:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211172014.35201-13-tony@atomide.com>
Content-Type: multipart/mixed;
        boundary="------------2AAA9547B1D936A896CFD252"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--------------2AAA9547B1D936A896CFD252
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On 11/12/19 10:50 pm, Tony Lindgren wrote:
> We can now probe devices with ti-sysc interconnect driver and dts
> data. Let's drop the related platform data and custom ti,hwmods
> dts property.
>=20
> As we're just dropping data, and the early platform data init
> is based on the custom ti,hwmods property, we want to drop both
> the platform data and ti,hwmods property in a single patch.
>=20
> Note that we also must tag rtc as disabled on am43x-epos-evm as
> it's not accessible according to commit 4321dc8dff35 ("ARM: AM43XX:
> hwmod: Add rtc hwmod").
>=20

Tony,

Both AM3 & AM4 are crashing while probing rtc. Due to rtc-clkctrl enable
failure. So this breaks AM4/3.

[   15.884334] l4-rtc-clkctrl:0000:0: failed to enable
[   15.889502] 8<--- cut here ---
[   15.892580] Unhandled fault: external abort on non-linefetch (0x1028)
at 0xf9e3e054
[   15.900276] pgd =3D 5fc023bc
[   15.902992] [f9e3e054] *pgd=3D44e11452(bad)
[   15.907031] Internal error: : 1028 [#1] SMP ARM
[   15.911582] Modules linked in: rtc_omap(+) musb_dsps(+) omap_wdt
musb_hdrc watchdog udc_core ti_am335x_tscadc phy_am335x usbcore
phy_am335x_control phy_generic usb_common cppi41 wkup_m3_rproc
matrix_keypad matrix_keymap cpufreq_dt pwm_bl autofs4
[   15.933449] CPU: 0 PID: 127 Comm: systemd-udevd Not tainted
5.5.0-rc1-207506-g8ce8793 #1
[   15.941572] Hardware name: Generic AM33XX (Flattened Device Tree)
[   15.947722] PC is at omap_rtc_probe+0x388/0x508 [rtc_omap]
[   15.953237] LR is at omap_rtc_probe+0x104/0x508 [rtc_omap]
[   15.958744] pc : [<bf09e250>]    lr : [<bf09dfcc>]    psr: 200f0013
[   15.965036] sp : eda7bcc8  ip : 00000001  fp : c0e05148
[   15.970280] r10: 00000016  r9 : bf0a0080  r8 : 00000000
[   15.975525] r7 : 00000000  r6 : eeb85800  r5 : eeb85810  r4 : ed8250c0=

[   15.982079] r3 : f9e3e000  r2 : 00000001  r1 : 600f0013  r0 : ed8250c0=

[   15.988634] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment none
[   15.995799] Control: 10c5387d  Table: ada58019  DAC: 00000051
[   16.001567] Process systemd-udevd (pid: 127, stack limit =3D 0x102b225=
7)
[   16.008122] Stack: (0xeda7bcc8 to 0xeda7c000)
[   16.012500] bcc0:                   00000001 eeb85810 c0ee7b9c
bf0a0080 eeb85810 00000000
[   16.020715] bce0: bf0a0080 00000000 00000000 c060ad50 eeb85810
c0ee7b9c c0ee7ba0 00000000
[   16.028931] bd00: 00000000 c0608cf8 eeb85810 bf0a0080 bf0a0080
c0e05148 ffffe000 00000028
[   16.037146] bd20: bf0a0100 c0608fe8 bf09f13c a00f0013 ef4e3f70
eeb85810 00000000 bf0a0080
[   16.045361] bd40: c0e05148 ffffe000 00000028 c0609290 00000000
bf0a0080 eeb85810 c06092f0
[   16.053577] bd60: eeb847b4 bf0a0080 c0609298 c06070d0 00000028
ee81be58 eeb847b4 d88e86a8
[   16.061793] bd80: c0e858e0 bf0a0080 eda08280 c0e858e0 00000000
c060803c bf09f5c0 00000000
[   16.070008] bda0: bf0a0080 bf0a0080 c0e05148 bf0a3000 00000000
c0609d88 c0ead180 c0e05148
[   16.078223] bdc0: bf0a3000 c0102e80 c08fc7ec ed85e000 a00f0013
c08fc500 c0ea6b9c d88e86a8
[   16.086438] bde0: c0ba1dc0 eda08280 a00f0013 a00f0013 00000008
c01d9200 00000001 bf0a0100
[   16.094653] be00: c0e05148 d88e86a8 edc62d00 bf0a0100 00000002
d88e86a8 bf0a0100 edc62d00
[   16.102868] be20: ed98ab80 00000002 ed98abc0 c01d923c 00000002
ed98ab80 eda7bf30 00000002
[   16.111083] be40: ed98ab80 c01db70c bf0a010c 00007fff bf0a0100
c01d8008 00010a34 bf0a0148
[   16.119300] be60: b6e7a0c4 bf0a5560 bf0a0100 bf0a0214 bf0a02f8
c0a06314 ffffe000 bf09f635
[   16.127515] be80: ed920001 00000000 c0bd8d00 c0bc2958 bf09f03c
00000001 00000000 00000000
[   16.135729] bea0: 00000000 00000000 6e72656b 00006c65 00000000
00000000 00000000 00000000
[   16.143944] bec0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   16.152160] bee0: 00000000 d88e86a8 7fffffff c0e05148 00000000
00000007 b6e7a0c4 7fffffff
[   16.160375] bf00: 00000000 0000017b 00497d88 c01dbbe4 7fffffff
00000000 00000003 eef12840
[   16.168590] bf20: 00000000 f1245000 00010a34 00000000 f1246a77
f1247740 f1245000 00010a34
[   16.176806] bf40: f12550fc f1254eb8 f125105c 00004000 000043a0
000024cc 00004630 00000000
[   16.185022] bf60: 00000000 00000000 000024bc 00000038 00000039
0000001e 0000001b 00000018
[   16.193238] bf80: 00000000 d88e86a8 004985d0 00000000 00000001
00000000 0000017b c0101204
[   16.201453] bfa0: eda7a000 c01011e0 00000000 00000001 00000007
b6e7a0c4 00000000 004985d0
[   16.209668] bfc0: 00000000 00000001 00000000 0000017b 00000000
00473dec 00000000 00497d88
[   16.217883] bfe0: bead4990 bead4980 b6e72c58 b6daca82 60010030
00000007 00000000 00000000
[   16.226148] [<bf09e250>] (omap_rtc_probe [rtc_omap]) from
[<c060ad50>] (platform_drv_probe+0x48/0x98)
[   16.235420] [<c060ad50>] (platform_drv_probe) from [<c0608cf8>]
(really_probe+0x1dc/0x348)
[   16.243725] [<c0608cf8>] (really_probe) from [<c0608fe8>]
(driver_probe_device+0x5c/0x164)
[   16.252029] [<c0608fe8>] (driver_probe_device) from [<c0609290>]
(device_driver_attach+0x58/0x60)
[   16.260942] [<c0609290>] (device_driver_attach) from [<c06092f0>]
(__driver_attach+0x58/0xcc)
[   16.269506] [<c06092f0>] (__driver_attach) from [<c06070d0>]
(bus_for_each_dev+0x70/0xb4)
[   16.277722] [<c06070d0>] (bus_for_each_dev) from [<c060803c>]
(bus_add_driver+0xf0/0x1d4)
[   16.285938] [<c060803c>] (bus_add_driver) from [<c0609d88>]
(driver_register+0x74/0x108)
[   16.294072] [<c0609d88>] (driver_register) from [<c0102e80>]
(do_one_initcall+0x48/0x22c)
[   16.302293] [<c0102e80>] (do_one_initcall) from [<c01d923c>]
(do_init_module+0x5c/0x234)
[   16.310422] [<c01d923c>] (do_init_module) from [<c01db70c>]
(load_module+0x2270/0x24f4)
[   16.318462] [<c01db70c>] (load_module) from [<c01dbbe4>]
(sys_finit_module+0xbc/0xdc)
[   16.326329] [<c01dbbe4>] (sys_finit_module) from [<c01011e0>]
(__sys_trace_return+0x0/0x20)
[   16.334714] Exception stack(0xeda7bfa8 to 0xeda7bff0)
[   16.339788] bfa0:                   00000000 00000001 00000007
b6e7a0c4 00000000 004985d0
[   16.348004] bfc0: 00000000 00000001 00000000 0000017b 00000000
00473dec 00000000 00497d88
[   16.356216] bfe0: bead4990 bead4980 b6e72c58 b6daca82
[   16.361294] Code: eb5a9a1f e2900000 13a00001 eaffff31 (e5d38054)
[   16.367418] ---[ end trace dee8d33f801e8530 ]---

Regards,
Keerthy

> Keerthy <j-keerthy@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/am33xx-l4.dtsi              |  1 -
>  arch/arm/boot/dts/am437x-l4.dtsi              |  3 +-
>  arch/arm/boot/dts/am43x-epos-evm.dts          |  4 +++
>  .../omap_hwmod_33xx_43xx_common_data.h        |  2 --
>  .../omap_hwmod_33xx_43xx_interconnect_data.c  |  8 -----
>  .../omap_hwmod_33xx_43xx_ipblock_data.c       | 36 -------------------=

>  arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
>  arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  8 -----
>  8 files changed, 5 insertions(+), 58 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33x=
x-l4.dtsi
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -414,7 +414,6 @@ target-module@39000 {			/* 0x44e39000, ap 33 02.0 *=
/
> =20
>  		target-module@3e000 {			/* 0x44e3e000, ap 35 60.0 */
>  			compatible =3D "ti,sysc-omap4-simple", "ti,sysc";
> -			ti,hwmods =3D "rtc";
>  			reg =3D <0x3e074 0x4>,
>  			      <0x3e078 0x4>;
>  			reg-names =3D "rev", "sysc";
> diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437=
x-l4.dtsi
> --- a/arch/arm/boot/dts/am437x-l4.dtsi
> +++ b/arch/arm/boot/dts/am437x-l4.dtsi
> @@ -410,9 +410,8 @@ target-module@39000 {			/* 0x44e39000, ap 32 02.0 *=
/
>  			ranges =3D <0x0 0x39000 0x1000>;
>  		};
> =20
> -		target-module@3e000 {			/* 0x44e3e000, ap 34 60.0 */
> +		rtc_target: target-module@3e000 {	/* 0x44e3e000, ap 34 60.0 */
>  			compatible =3D "ti,sysc-omap4-simple", "ti,sysc";
> -			ti,hwmods =3D "rtc";
>  			reg =3D <0x3e074 0x4>,
>  			      <0x3e078 0x4>;
>  			reg-names =3D "rev", "sysc";
> diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/a=
m43x-epos-evm.dts
> --- a/arch/arm/boot/dts/am43x-epos-evm.dts
> +++ b/arch/arm/boot/dts/am43x-epos-evm.dts
> @@ -828,6 +828,10 @@ &epwmss0 {
>  	status =3D "okay";
>  };
> =20
> +&rtc_target {
> +	status =3D "disabled";
> +};
> +
>  &tscadc {
>  	status =3D "okay";
> =20
> diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/a=
rch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
> --- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
> +++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
> @@ -27,7 +27,6 @@ extern struct omap_hwmod_ocp_if am33xx_l3_s__l3_main;=

>  extern struct omap_hwmod_ocp_if am33xx_pruss__l3_main;
>  extern struct omap_hwmod_ocp_if am33xx_gfx__l3_main;
>  extern struct omap_hwmod_ocp_if am33xx_l3_main__gfx;
> -extern struct omap_hwmod_ocp_if am33xx_l4_wkup__rtc;
>  extern struct omap_hwmod_ocp_if am33xx_l4_ls__elm;
>  extern struct omap_hwmod_ocp_if am33xx_l3_s__gpmc;
>  extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer2;
> @@ -51,7 +50,6 @@ extern struct omap_hwmod am33xx_smartreflex0_hwmod;
>  extern struct omap_hwmod am33xx_smartreflex1_hwmod;
>  extern struct omap_hwmod am33xx_elm_hwmod;
>  extern struct omap_hwmod am33xx_gpmc_hwmod;
> -extern struct omap_hwmod am33xx_rtc_hwmod;
>  extern struct omap_hwmod am33xx_timer1_hwmod;
>  extern struct omap_hwmod am33xx_timer2_hwmod;
>  extern struct omap_hwmod am33xx_tpcc_hwmod;
> diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data=
=2Ec b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
> --- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
> @@ -98,14 +98,6 @@ struct omap_hwmod_ocp_if am33xx_l3_main__gfx =3D {
>  	.user		=3D OCP_USER_MPU | OCP_USER_SDMA,
>  };
> =20
> -/* l4 wkup -> rtc */
> -struct omap_hwmod_ocp_if am33xx_l4_wkup__rtc =3D {
> -	.master		=3D &am33xx_l4_wkup_hwmod,
> -	.slave		=3D &am33xx_rtc_hwmod,
> -	.clk		=3D "clkdiv32k_ick",
> -	.user		=3D OCP_USER_MPU,
> -};
> -
>  struct omap_hwmod_ocp_if am33xx_l4_ls__elm =3D {
>  	.master		=3D &am33xx_l4_ls_hwmod,
>  	.slave		=3D &am33xx_elm_hwmod,
> diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/=
arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
> --- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
> @@ -26,7 +26,6 @@
>  #define CLKCTRL(oh, clkctrl) ((oh).prcm.omap4.clkctrl_offs =3D (clkctr=
l))
>  #define RSTCTRL(oh, rstctrl) ((oh).prcm.omap4.rstctrl_offs =3D (rstctr=
l))
>  #define RSTST(oh, rstst) ((oh).prcm.omap4.rstst_offs =3D (rstst))
> -#define PRCM_FLAGS(oh, flag) ((oh).prcm.omap4.flags =3D (flag))
> =20
>  /*
>   * 'l3' class
> @@ -331,38 +330,6 @@ struct omap_hwmod am33xx_gpmc_hwmod =3D {
>  };
> =20
> =20
> -/*
> - * 'rtc' class
> - * rtc subsystem
> - */
> -static struct omap_hwmod_class_sysconfig am33xx_rtc_sysc =3D {
> -	.rev_offs	=3D 0x0074,
> -	.sysc_offs	=3D 0x0078,
> -	.sysc_flags	=3D SYSC_HAS_SIDLEMODE,
> -	.idlemodes	=3D (SIDLE_FORCE | SIDLE_NO |
> -			  SIDLE_SMART | SIDLE_SMART_WKUP),
> -	.sysc_fields	=3D &omap_hwmod_sysc_type3,
> -};
> -
> -static struct omap_hwmod_class am33xx_rtc_hwmod_class =3D {
> -	.name		=3D "rtc",
> -	.sysc		=3D &am33xx_rtc_sysc,
> -	.unlock		=3D &omap_hwmod_rtc_unlock,
> -	.lock		=3D &omap_hwmod_rtc_lock,
> -};
> -
> -struct omap_hwmod am33xx_rtc_hwmod =3D {
> -	.name		=3D "rtc",
> -	.class		=3D &am33xx_rtc_hwmod_class,
> -	.clkdm_name	=3D "l4_rtc_clkdm",
> -	.main_clk	=3D "clk_32768_ck",
> -	.prcm		=3D {
> -		.omap4	=3D {
> -			.modulemode	=3D MODULEMODE_SWCTRL,
> -		},
> -	},
> -};
> -
>  /* 'timer 2-7' class */
>  static struct omap_hwmod_class_sysconfig am33xx_timer_sysc =3D {
>  	.rev_offs	=3D 0x0000,
> @@ -504,8 +471,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
>  	CLKCTRL(am33xx_smartreflex1_hwmod,
>  		AM33XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
>  	CLKCTRL(am33xx_timer1_hwmod, AM33XX_CM_WKUP_TIMER1_CLKCTRL_OFFSET);
> -	CLKCTRL(am33xx_rtc_hwmod, AM33XX_CM_RTC_RTC_CLKCTRL_OFFSET);
> -	PRCM_FLAGS(am33xx_rtc_hwmod, HWMOD_OMAP4_ZERO_CLKCTRL_OFFSET);
>  	CLKCTRL(am33xx_gpmc_hwmod, AM33XX_CM_PER_GPMC_CLKCTRL_OFFSET);
>  	CLKCTRL(am33xx_l4_ls_hwmod, AM33XX_CM_PER_L4LS_CLKCTRL_OFFSET);
>  	CLKCTRL(am33xx_l4_wkup_hwmod, AM33XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
> @@ -543,7 +508,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
>  	CLKCTRL(am33xx_smartreflex1_hwmod,
>  		AM43XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
>  	CLKCTRL(am33xx_timer1_hwmod, AM43XX_CM_WKUP_TIMER1_CLKCTRL_OFFSET);
> -	CLKCTRL(am33xx_rtc_hwmod, AM43XX_CM_RTC_RTC_CLKCTRL_OFFSET);
>  	CLKCTRL(am33xx_gpmc_hwmod, AM43XX_CM_PER_GPMC_CLKCTRL_OFFSET);
>  	CLKCTRL(am33xx_l4_ls_hwmod, AM43XX_CM_PER_L4LS_CLKCTRL_OFFSET);
>  	CLKCTRL(am33xx_l4_wkup_hwmod, AM43XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
> diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach=
-omap2/omap_hwmod_33xx_data.c
> --- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
> @@ -336,7 +336,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_i=
fs[] __initdata =3D {
>  	&am33xx_l4_wkup__smartreflex0,
>  	&am33xx_l4_wkup__smartreflex1,
>  	&am33xx_l4_wkup__timer1,
> -	&am33xx_l4_wkup__rtc,
>  	&am33xx_l4_hs__pruss,
>  	&am33xx_l4_ls__timer2,
>  	&am33xx_l3_main__tpcc,
> diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach=
-omap2/omap_hwmod_43xx_data.c
> --- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
> @@ -491,11 +491,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_=
ifs[] __initdata =3D {
>  	NULL,
>  };
> =20
> -static struct omap_hwmod_ocp_if *am43xx_rtc_hwmod_ocp_ifs[] __initdata=
 =3D {
> -	&am33xx_l4_wkup__rtc,
> -	NULL,
> -};
> -
>  int __init am43xx_hwmod_init(void)
>  {
>  	int ret;
> @@ -504,8 +499,5 @@ int __init am43xx_hwmod_init(void)
>  	omap_hwmod_init();
>  	ret =3D omap_hwmod_register_links(am43xx_hwmod_ocp_ifs);
> =20
> -	if (!ret && of_machine_is_compatible("ti,am4372"))
> -		ret =3D omap_hwmod_register_links(am43xx_rtc_hwmod_ocp_ifs);
> -
>  	return ret;
>  }
>=20

--------------2AAA9547B1D936A896CFD252
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
Xpo=3D
=3DNfsW
-----END PGP PUBLIC KEY BLOCK-----

--------------2AAA9547B1D936A896CFD252--
