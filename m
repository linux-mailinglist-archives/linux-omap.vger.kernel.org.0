Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC5C5F9D95
	for <lists+linux-omap@lfdr.de>; Mon, 10 Oct 2022 13:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiJJL3Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Oct 2022 07:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiJJL3Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 10 Oct 2022 07:29:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C171E66116;
        Mon, 10 Oct 2022 04:29:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2C332B80E7E;
        Mon, 10 Oct 2022 11:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB47C433C1;
        Mon, 10 Oct 2022 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665401349;
        bh=F6OfICI7r4PwRMBfL6dgOBGtpknlg3wF8xOYlj+tJ+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QkKUHp56SqSE5rYUsHfeEW/3UK0eP1p/i6/toNtmGEL1Hg98Uo34kTC3VVnwcy650
         RFLhciaGsFWnQM8652lQa6w08flskhTOsqlOogmL+XIkKzSpXtCN7PMrlfHSvWzGT0
         pVqe63+snsRqTzhFJKAp8sxxYNJfOp9Knfv9X7S5IGY7JeO4wfknZFZdni8B+mcAXN
         O1UGPUaaZUFxZE3XjnOIhLqCJ8a4DpcdUUrc0zQgWMem/tPg61xOVhEEacwckn/RHS
         z5WNEIy3zdGEg0R8XkeZTiB2nz9li1gsCN1GxXWdH8zT/kfyOrQIPjcN+51+zflahq
         SdRa/WjrcIL8A==
Date:   Mon, 10 Oct 2022 12:29:03 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Tony Lindgren <tony@atomide.com>, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        gtucker@collabora.com, stable@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: stable-rc/linux-5.10.y bisection: baseline.login on panda
Message-ID: <Y0QB/9dmTwd1tx11@sirena.org.uk>
References: <6341c30d.170a0220.2bfa7.6117@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R34J7XK9/APsBwJE"
Content-Disposition: inline
In-Reply-To: <6341c30d.170a0220.2bfa7.6117@mx.google.com>
X-Cookie: This sentence no verb.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--R34J7XK9/APsBwJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The KernelCI bisection bot bisected a boot failure on the 5.10-rc stable
tree on Panda to d86c6447ee250 ("clk: ti: Stop using legacy clkctrl names
for omap4") in the v5.10 stable tree.  There's a lot of clock related
warnings/errors including:

<4>[    0.000000] WARNING: CPU: 0 PID: 0 at drivers/clk/clk.c:3778 __clk_re=
gister+0x464/0x868
<4>[    0.000000] ti_dt_clocks_register: failed to lookup clock node abe-cl=
kctrl:0008:24, ret=3D-517
<4>[    0.416076] omap_hwmod: debugss: cannot _init_clocks
<4>[    0.421447] ------------[ cut here ]------------
<4>[    0.426513] WARNING: CPU: 0 PID: 1 at arch/arm/mach-omap2/omap_hwmod.=
c:2371 _init+0x428/0x488

(there's a *lot* of probe deferrals and hwmods that fail to init). The
last output from the kernel is:

<3>[   10.523590] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1410=
000 Vs max 1316660
<6>[   10.531890] Power Management for TI OMAP4+ devices.
<4>[   10.537048] OMAP4 PM: u-boot >=3D v2012.07 is required for full PM su=
pport
<5>[   10.544555] Loading compiled-in X.509 certificates

I've left the full report from the bot with more information including
full logs and a reported-by tag below:

On Sat, Oct 08, 2022 at 11:35:57AM -0700, KernelCI bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>=20
> stable-rc/linux-5.10.y bisection: baseline.login on panda
>=20
> Summary:
>   Start:      014862eecf03f Linux 5.10.147
>   Plain log:  https://storage.kernelci.org/stable-rc/linux-5.10.y/v5.10.1=
46-52-g014862eecf03f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-pa=
nda.txt
>   HTML log:   https://storage.kernelci.org/stable-rc/linux-5.10.y/v5.10.1=
46-52-g014862eecf03f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-pa=
nda.html
>   Result:     d86c6447ee250 clk: ti: Stop using legacy clkctrl names for =
omap4 and 5
>=20
> Checks:
>   revert:     PASS
>   verify:     PASS
>=20
> Parameters:
>   Tree:       stable-rc
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x-stable-rc.git
>   Branch:     linux-5.10.y
>   Target:     panda
>   CPU arch:   arm
>   Lab:        lab-baylibre
>   Compiler:   gcc-10
>   Config:     multi_v7_defconfig
>   Test case:  baseline.login
>=20
> Breaking commit found:
>=20
> -------------------------------------------------------------------------=
------
> commit d86c6447ee250822256470ad43add20470d1cd3d
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Wed Jun 15 09:43:06 2022 +0300
>=20
>     clk: ti: Stop using legacy clkctrl names for omap4 and 5
>    =20
>     [ Upstream commit 255584b138343d4a28c6d25bd82d04b09460d672 ]
>    =20
>     With the addition of clock-output-names, we can now unify the internal
>     clock naming for omap4 and 5 to follow the other TI SoCs.
>    =20
>     We are still using legacy clkctrl names for omap4 and 5 based on the =
clock
>     manager name which is wrong. Instead, we want to use the clkctrl clock
>     based naming.
>    =20
>     We must now also drop the legacy TI_CLK_CLKCTRL_COMPAT quirk for the
>     clkctrl clock.
>    =20
>     This change will allow further devicetree warning cleanup as already
>     done for am3/4 and dra7.
>    =20
>     Cc: linux-clk@vger.kernel.org
>     Cc: Stephen Boyd <sboyd@kernel.org>
>     Cc: Tero Kristo <kristo@kernel.org>
>     Signed-off-by: Tony Lindgren <tony@atomide.com>
>     Link: https://lore.kernel.org/r/20220615064306.22254-1-tony@atomide.c=
om
>     Signed-off-by: Stephen Boyd <sboyd@kernel.org>
>     Signed-off-by: Sasha Levin <sashal@kernel.org>
>=20
> diff --git a/drivers/clk/ti/clk-44xx.c b/drivers/clk/ti/clk-44xx.c
> index a38c921539793..cbf9922d93d4e 100644
> --- a/drivers/clk/ti/clk-44xx.c
> +++ b/drivers/clk/ti/clk-44xx.c
> @@ -56,7 +56,7 @@ static const struct omap_clkctrl_bit_data omap4_aess_bi=
t_data[] __initconst =3D {
>  };
> =20
>  static const char * const omap4_func_dmic_abe_gfclk_parents[] __initcons=
t =3D {
> -	"abe_cm:clk:0018:26",
> +	"abe-clkctrl:0018:26",
>  	"pad_clks_ck",
>  	"slimbus_clk",
>  	NULL,
> @@ -76,7 +76,7 @@ static const struct omap_clkctrl_bit_data omap4_dmic_bi=
t_data[] __initconst =3D {
>  };
> =20
>  static const char * const omap4_func_mcasp_abe_gfclk_parents[] __initcon=
st =3D {
> -	"abe_cm:clk:0020:26",
> +	"abe-clkctrl:0020:26",
>  	"pad_clks_ck",
>  	"slimbus_clk",
>  	NULL,
> @@ -89,7 +89,7 @@ static const struct omap_clkctrl_bit_data omap4_mcasp_b=
it_data[] __initconst =3D {
>  };
> =20
>  static const char * const omap4_func_mcbsp1_gfclk_parents[] __initconst =
=3D {
> -	"abe_cm:clk:0028:26",
> +	"abe-clkctrl:0028:26",
>  	"pad_clks_ck",
>  	"slimbus_clk",
>  	NULL,
> @@ -102,7 +102,7 @@ static const struct omap_clkctrl_bit_data omap4_mcbsp=
1_bit_data[] __initconst =3D
>  };
> =20
>  static const char * const omap4_func_mcbsp2_gfclk_parents[] __initconst =
=3D {
> -	"abe_cm:clk:0030:26",
> +	"abe-clkctrl:0030:26",
>  	"pad_clks_ck",
>  	"slimbus_clk",
>  	NULL,
> @@ -115,7 +115,7 @@ static const struct omap_clkctrl_bit_data omap4_mcbsp=
2_bit_data[] __initconst =3D
>  };
> =20
>  static const char * const omap4_func_mcbsp3_gfclk_parents[] __initconst =
=3D {
> -	"abe_cm:clk:0038:26",
> +	"abe-clkctrl:0038:26",
>  	"pad_clks_ck",
>  	"slimbus_clk",
>  	NULL,
> @@ -183,18 +183,18 @@ static const struct omap_clkctrl_bit_data omap4_tim=
er8_bit_data[] __initconst =3D
> =20
>  static const struct omap_clkctrl_reg_data omap4_abe_clkctrl_regs[] __ini=
tconst =3D {
>  	{ OMAP4_L4_ABE_CLKCTRL, NULL, 0, "ocp_abe_iclk" },
> -	{ OMAP4_AESS_CLKCTRL, omap4_aess_bit_data, CLKF_SW_SUP, "abe_cm:clk:000=
8:24" },
> +	{ OMAP4_AESS_CLKCTRL, omap4_aess_bit_data, CLKF_SW_SUP, "abe-clkctrl:00=
08:24" },
>  	{ OMAP4_MCPDM_CLKCTRL, NULL, CLKF_SW_SUP, "pad_clks_ck" },
> -	{ OMAP4_DMIC_CLKCTRL, omap4_dmic_bit_data, CLKF_SW_SUP, "abe_cm:clk:001=
8:24" },
> -	{ OMAP4_MCASP_CLKCTRL, omap4_mcasp_bit_data, CLKF_SW_SUP, "abe_cm:clk:0=
020:24" },
> -	{ OMAP4_MCBSP1_CLKCTRL, omap4_mcbsp1_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0028:24" },
> -	{ OMAP4_MCBSP2_CLKCTRL, omap4_mcbsp2_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0030:24" },
> -	{ OMAP4_MCBSP3_CLKCTRL, omap4_mcbsp3_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0038:24" },
> -	{ OMAP4_SLIMBUS1_CLKCTRL, omap4_slimbus1_bit_data, CLKF_SW_SUP, "abe_cm=
:clk:0040:8" },
> -	{ OMAP4_TIMER5_CLKCTRL, omap4_timer5_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0048:24" },
> -	{ OMAP4_TIMER6_CLKCTRL, omap4_timer6_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0050:24" },
> -	{ OMAP4_TIMER7_CLKCTRL, omap4_timer7_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0058:24" },
> -	{ OMAP4_TIMER8_CLKCTRL, omap4_timer8_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0060:24" },
> +	{ OMAP4_DMIC_CLKCTRL, omap4_dmic_bit_data, CLKF_SW_SUP, "abe-clkctrl:00=
18:24" },
> +	{ OMAP4_MCASP_CLKCTRL, omap4_mcasp_bit_data, CLKF_SW_SUP, "abe-clkctrl:=
0020:24" },
> +	{ OMAP4_MCBSP1_CLKCTRL, omap4_mcbsp1_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0028:24" },
> +	{ OMAP4_MCBSP2_CLKCTRL, omap4_mcbsp2_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0030:24" },
> +	{ OMAP4_MCBSP3_CLKCTRL, omap4_mcbsp3_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0038:24" },
> +	{ OMAP4_SLIMBUS1_CLKCTRL, omap4_slimbus1_bit_data, CLKF_SW_SUP, "abe-cl=
kctrl:0040:8" },
> +	{ OMAP4_TIMER5_CLKCTRL, omap4_timer5_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0048:24" },
> +	{ OMAP4_TIMER6_CLKCTRL, omap4_timer6_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0050:24" },
> +	{ OMAP4_TIMER7_CLKCTRL, omap4_timer7_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0058:24" },
> +	{ OMAP4_TIMER8_CLKCTRL, omap4_timer8_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0060:24" },
>  	{ OMAP4_WD_TIMER3_CLKCTRL, NULL, CLKF_SW_SUP, "sys_32k_ck" },
>  	{ 0 },
>  };
> @@ -287,7 +287,7 @@ static const struct omap_clkctrl_bit_data omap4_fdif_=
bit_data[] __initconst =3D {
> =20
>  static const struct omap_clkctrl_reg_data omap4_iss_clkctrl_regs[] __ini=
tconst =3D {
>  	{ OMAP4_ISS_CLKCTRL, omap4_iss_bit_data, CLKF_SW_SUP, "ducati_clk_mux_c=
k" },
> -	{ OMAP4_FDIF_CLKCTRL, omap4_fdif_bit_data, CLKF_SW_SUP, "iss_cm:clk:000=
8:24" },
> +	{ OMAP4_FDIF_CLKCTRL, omap4_fdif_bit_data, CLKF_SW_SUP, "iss-clkctrl:00=
08:24" },
>  	{ 0 },
>  };
> =20
> @@ -320,7 +320,7 @@ static const struct omap_clkctrl_bit_data omap4_dss_c=
ore_bit_data[] __initconst
>  };
> =20
>  static const struct omap_clkctrl_reg_data omap4_l3_dss_clkctrl_regs[] __=
initconst =3D {
> -	{ OMAP4_DSS_CORE_CLKCTRL, omap4_dss_core_bit_data, CLKF_SW_SUP, "l3_dss=
_cm:clk:0000:8" },
> +	{ OMAP4_DSS_CORE_CLKCTRL, omap4_dss_core_bit_data, CLKF_SW_SUP, "l3-dss=
-clkctrl:0000:8" },
>  	{ 0 },
>  };
> =20
> @@ -336,7 +336,7 @@ static const struct omap_clkctrl_bit_data omap4_gpu_b=
it_data[] __initconst =3D {
>  };
> =20
>  static const struct omap_clkctrl_reg_data omap4_l3_gfx_clkctrl_regs[] __=
initconst =3D {
> -	{ OMAP4_GPU_CLKCTRL, omap4_gpu_bit_data, CLKF_SW_SUP, "l3_gfx_cm:clk:00=
00:24" },
> +	{ OMAP4_GPU_CLKCTRL, omap4_gpu_bit_data, CLKF_SW_SUP, "l3-gfx-clkctrl:0=
000:24" },
>  	{ 0 },
>  };
> =20
> @@ -372,12 +372,12 @@ static const struct omap_clkctrl_bit_data omap4_hsi=
_bit_data[] __initconst =3D {
>  };
> =20
>  static const char * const omap4_usb_host_hs_utmi_p1_clk_parents[] __init=
const =3D {
> -	"l3_init_cm:clk:0038:24",
> +	"l3-init-clkctrl:0038:24",
>  	NULL,
>  };
> =20
>  static const char * const omap4_usb_host_hs_utmi_p2_clk_parents[] __init=
const =3D {
> -	"l3_init_cm:clk:0038:25",
> +	"l3-init-clkctrl:0038:25",
>  	NULL,
>  };
> =20
> @@ -418,7 +418,7 @@ static const struct omap_clkctrl_bit_data omap4_usb_h=
ost_hs_bit_data[] __initcon
>  };
> =20
>  static const char * const omap4_usb_otg_hs_xclk_parents[] __initconst =
=3D {
> -	"l3_init_cm:clk:0040:24",
> +	"l3-init-clkctrl:0040:24",
>  	NULL,
>  };
> =20
> @@ -452,14 +452,14 @@ static const struct omap_clkctrl_bit_data omap4_ocp=
2scp_usb_phy_bit_data[] __ini
>  };
> =20
>  static const struct omap_clkctrl_reg_data omap4_l3_init_clkctrl_regs[] _=
_initconst =3D {
> -	{ OMAP4_MMC1_CLKCTRL, omap4_mmc1_bit_data, CLKF_SW_SUP, "l3_init_cm:clk=
:0008:24" },
> -	{ OMAP4_MMC2_CLKCTRL, omap4_mmc2_bit_data, CLKF_SW_SUP, "l3_init_cm:clk=
:0010:24" },
> -	{ OMAP4_HSI_CLKCTRL, omap4_hsi_bit_data, CLKF_HW_SUP, "l3_init_cm:clk:0=
018:24" },
> +	{ OMAP4_MMC1_CLKCTRL, omap4_mmc1_bit_data, CLKF_SW_SUP, "l3-init-clkctr=
l:0008:24" },
> +	{ OMAP4_MMC2_CLKCTRL, omap4_mmc2_bit_data, CLKF_SW_SUP, "l3-init-clkctr=
l:0010:24" },
> +	{ OMAP4_HSI_CLKCTRL, omap4_hsi_bit_data, CLKF_HW_SUP, "l3-init-clkctrl:=
0018:24" },
>  	{ OMAP4_USB_HOST_HS_CLKCTRL, omap4_usb_host_hs_bit_data, CLKF_SW_SUP, "=
init_60m_fclk" },
>  	{ OMAP4_USB_OTG_HS_CLKCTRL, omap4_usb_otg_hs_bit_data, CLKF_HW_SUP, "l3=
_div_ck" },
>  	{ OMAP4_USB_TLL_HS_CLKCTRL, omap4_usb_tll_hs_bit_data, CLKF_HW_SUP, "l4=
_div_ck" },
>  	{ OMAP4_USB_HOST_FS_CLKCTRL, NULL, CLKF_SW_SUP, "func_48mc_fclk" },
> -	{ OMAP4_OCP2SCP_USB_PHY_CLKCTRL, omap4_ocp2scp_usb_phy_bit_data, CLKF_H=
W_SUP, "l3_init_cm:clk:00c0:8" },
> +	{ OMAP4_OCP2SCP_USB_PHY_CLKCTRL, omap4_ocp2scp_usb_phy_bit_data, CLKF_H=
W_SUP, "l3-init-clkctrl:00c0:8" },
>  	{ 0 },
>  };
> =20
> @@ -530,7 +530,7 @@ static const struct omap_clkctrl_bit_data omap4_gpio6=
_bit_data[] __initconst =3D {
>  };
> =20
>  static const char * const omap4_per_mcbsp4_gfclk_parents[] __initconst =
=3D {
> -	"l4_per_cm:clk:00c0:26",
> +	"l4-per-clkctrl:00c0:26",
>  	"pad_clks_ck",
>  	NULL,
>  };
> @@ -570,12 +570,12 @@ static const struct omap_clkctrl_bit_data omap4_sli=
mbus2_bit_data[] __initconst
>  };
> =20
>  static const struct omap_clkctrl_reg_data omap4_l4_per_clkctrl_regs[] __=
initconst =3D {
> -	{ OMAP4_TIMER10_CLKCTRL, omap4_timer10_bit_data, CLKF_SW_SUP, "l4_per_c=
m:clk:0008:24" },
> -	{ OMAP4_TIMER11_CLKCTRL, omap4_timer11_bit_data, CLKF_SW_SUP, "l4_per_c=
m:clk:0010:24" },
> -	{ OMAP4_TIMER2_CLKCTRL, omap4_timer2_bit_data, CLKF_SW_SUP, "l4_per_cm:=
clk:0018:24" },
> -	{ OMAP4_TIMER3_CLKCTRL, omap4_timer3_bit_data, CLKF_SW_SUP, "l4_per_cm:=
clk:0020:24" },
> -	{ OMAP4_TIMER4_CLKCTRL, omap4_timer4_bit_data, CLKF_SW_SUP, "l4_per_cm:=
clk:0028:24" },
> -	{ OMAP4_TIMER9_CLKCTRL, omap4_timer9_bit_data, CLKF_SW_SUP, "l4_per_cm:=
clk:0030:24" },
> +	{ OMAP4_TIMER10_CLKCTRL, omap4_timer10_bit_data, CLKF_SW_SUP, "l4-per-c=
lkctrl:0008:24" },
> +	{ OMAP4_TIMER11_CLKCTRL, omap4_timer11_bit_data, CLKF_SW_SUP, "l4-per-c=
lkctrl:0010:24" },
> +	{ OMAP4_TIMER2_CLKCTRL, omap4_timer2_bit_data, CLKF_SW_SUP, "l4-per-clk=
ctrl:0018:24" },
> +	{ OMAP4_TIMER3_CLKCTRL, omap4_timer3_bit_data, CLKF_SW_SUP, "l4-per-clk=
ctrl:0020:24" },
> +	{ OMAP4_TIMER4_CLKCTRL, omap4_timer4_bit_data, CLKF_SW_SUP, "l4-per-clk=
ctrl:0028:24" },
> +	{ OMAP4_TIMER9_CLKCTRL, omap4_timer9_bit_data, CLKF_SW_SUP, "l4-per-clk=
ctrl:0030:24" },
>  	{ OMAP4_ELM_CLKCTRL, NULL, 0, "l4_div_ck" },
>  	{ OMAP4_GPIO2_CLKCTRL, omap4_gpio2_bit_data, CLKF_HW_SUP, "l4_div_ck" },
>  	{ OMAP4_GPIO3_CLKCTRL, omap4_gpio3_bit_data, CLKF_HW_SUP, "l4_div_ck" },
> @@ -588,14 +588,14 @@ static const struct omap_clkctrl_reg_data omap4_l4_=
per_clkctrl_regs[] __initcons
>  	{ OMAP4_I2C3_CLKCTRL, NULL, CLKF_SW_SUP, "func_96m_fclk" },
>  	{ OMAP4_I2C4_CLKCTRL, NULL, CLKF_SW_SUP, "func_96m_fclk" },
>  	{ OMAP4_L4_PER_CLKCTRL, NULL, 0, "l4_div_ck" },
> -	{ OMAP4_MCBSP4_CLKCTRL, omap4_mcbsp4_bit_data, CLKF_SW_SUP, "l4_per_cm:=
clk:00c0:24" },
> +	{ OMAP4_MCBSP4_CLKCTRL, omap4_mcbsp4_bit_data, CLKF_SW_SUP, "l4-per-clk=
ctrl:00c0:24" },
>  	{ OMAP4_MCSPI1_CLKCTRL, NULL, CLKF_SW_SUP, "func_48m_fclk" },
>  	{ OMAP4_MCSPI2_CLKCTRL, NULL, CLKF_SW_SUP, "func_48m_fclk" },
>  	{ OMAP4_MCSPI3_CLKCTRL, NULL, CLKF_SW_SUP, "func_48m_fclk" },
>  	{ OMAP4_MCSPI4_CLKCTRL, NULL, CLKF_SW_SUP, "func_48m_fclk" },
>  	{ OMAP4_MMC3_CLKCTRL, NULL, CLKF_SW_SUP, "func_48m_fclk" },
>  	{ OMAP4_MMC4_CLKCTRL, NULL, CLKF_SW_SUP, "func_48m_fclk" },
> -	{ OMAP4_SLIMBUS2_CLKCTRL, omap4_slimbus2_bit_data, CLKF_SW_SUP, "l4_per=
_cm:clk:0118:8" },
> +	{ OMAP4_SLIMBUS2_CLKCTRL, omap4_slimbus2_bit_data, CLKF_SW_SUP, "l4-per=
-clkctrl:0118:8" },
>  	{ OMAP4_UART1_CLKCTRL, NULL, CLKF_SW_SUP, "func_48m_fclk" },
>  	{ OMAP4_UART2_CLKCTRL, NULL, CLKF_SW_SUP, "func_48m_fclk" },
>  	{ OMAP4_UART3_CLKCTRL, NULL, CLKF_SW_SUP, "func_48m_fclk" },
> @@ -630,7 +630,7 @@ static const struct omap_clkctrl_reg_data omap4_l4_wk=
up_clkctrl_regs[] __initcon
>  	{ OMAP4_L4_WKUP_CLKCTRL, NULL, 0, "l4_wkup_clk_mux_ck" },
>  	{ OMAP4_WD_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "sys_32k_ck" },
>  	{ OMAP4_GPIO1_CLKCTRL, omap4_gpio1_bit_data, CLKF_HW_SUP, "l4_wkup_clk_=
mux_ck" },
> -	{ OMAP4_TIMER1_CLKCTRL, omap4_timer1_bit_data, CLKF_SW_SUP, "l4_wkup_cm=
:clk:0020:24" },
> +	{ OMAP4_TIMER1_CLKCTRL, omap4_timer1_bit_data, CLKF_SW_SUP, "l4-wkup-cl=
kctrl:0020:24" },
>  	{ OMAP4_COUNTER_32K_CLKCTRL, NULL, 0, "sys_32k_ck" },
>  	{ OMAP4_KBD_CLKCTRL, NULL, CLKF_SW_SUP, "sys_32k_ck" },
>  	{ 0 },
> @@ -644,7 +644,7 @@ static const char * const omap4_pmd_stm_clock_mux_ck_=
parents[] __initconst =3D {
>  };
> =20
>  static const char * const omap4_trace_clk_div_div_ck_parents[] __initcon=
st =3D {
> -	"emu_sys_cm:clk:0000:22",
> +	"emu-sys-clkctrl:0000:22",
>  	NULL,
>  };
> =20
> @@ -662,7 +662,7 @@ static const struct omap_clkctrl_div_data omap4_trace=
_clk_div_div_ck_data __init
>  };
> =20
>  static const char * const omap4_stm_clk_div_ck_parents[] __initconst =3D=
 {
> -	"emu_sys_cm:clk:0000:20",
> +	"emu-sys-clkctrl:0000:20",
>  	NULL,
>  };
> =20
> @@ -716,73 +716,73 @@ static struct ti_dt_clk omap44xx_clks[] =3D {
>  	 * hwmod support. Once hwmod is removed, these can be removed
>  	 * also.
>  	 */
> -	DT_CLK(NULL, "aess_fclk", "abe_cm:0008:24"),
> -	DT_CLK(NULL, "cm2_dm10_mux", "l4_per_cm:0008:24"),
> -	DT_CLK(NULL, "cm2_dm11_mux", "l4_per_cm:0010:24"),
> -	DT_CLK(NULL, "cm2_dm2_mux", "l4_per_cm:0018:24"),
> -	DT_CLK(NULL, "cm2_dm3_mux", "l4_per_cm:0020:24"),
> -	DT_CLK(NULL, "cm2_dm4_mux", "l4_per_cm:0028:24"),
> -	DT_CLK(NULL, "cm2_dm9_mux", "l4_per_cm:0030:24"),
> -	DT_CLK(NULL, "dmic_sync_mux_ck", "abe_cm:0018:26"),
> -	DT_CLK(NULL, "dmt1_clk_mux", "l4_wkup_cm:0020:24"),
> -	DT_CLK(NULL, "dss_48mhz_clk", "l3_dss_cm:0000:9"),
> -	DT_CLK(NULL, "dss_dss_clk", "l3_dss_cm:0000:8"),
> -	DT_CLK(NULL, "dss_sys_clk", "l3_dss_cm:0000:10"),
> -	DT_CLK(NULL, "dss_tv_clk", "l3_dss_cm:0000:11"),
> -	DT_CLK(NULL, "fdif_fck", "iss_cm:0008:24"),
> -	DT_CLK(NULL, "func_dmic_abe_gfclk", "abe_cm:0018:24"),
> -	DT_CLK(NULL, "func_mcasp_abe_gfclk", "abe_cm:0020:24"),
> -	DT_CLK(NULL, "func_mcbsp1_gfclk", "abe_cm:0028:24"),
> -	DT_CLK(NULL, "func_mcbsp2_gfclk", "abe_cm:0030:24"),
> -	DT_CLK(NULL, "func_mcbsp3_gfclk", "abe_cm:0038:24"),
> -	DT_CLK(NULL, "gpio1_dbclk", "l4_wkup_cm:0018:8"),
> -	DT_CLK(NULL, "gpio2_dbclk", "l4_per_cm:0040:8"),
> -	DT_CLK(NULL, "gpio3_dbclk", "l4_per_cm:0048:8"),
> -	DT_CLK(NULL, "gpio4_dbclk", "l4_per_cm:0050:8"),
> -	DT_CLK(NULL, "gpio5_dbclk", "l4_per_cm:0058:8"),
> -	DT_CLK(NULL, "gpio6_dbclk", "l4_per_cm:0060:8"),
> -	DT_CLK(NULL, "hsi_fck", "l3_init_cm:0018:24"),
> -	DT_CLK(NULL, "hsmmc1_fclk", "l3_init_cm:0008:24"),
> -	DT_CLK(NULL, "hsmmc2_fclk", "l3_init_cm:0010:24"),
> -	DT_CLK(NULL, "iss_ctrlclk", "iss_cm:0000:8"),
> -	DT_CLK(NULL, "mcasp_sync_mux_ck", "abe_cm:0020:26"),
> -	DT_CLK(NULL, "mcbsp1_sync_mux_ck", "abe_cm:0028:26"),
> -	DT_CLK(NULL, "mcbsp2_sync_mux_ck", "abe_cm:0030:26"),
> -	DT_CLK(NULL, "mcbsp3_sync_mux_ck", "abe_cm:0038:26"),
> -	DT_CLK(NULL, "mcbsp4_sync_mux_ck", "l4_per_cm:00c0:26"),
> -	DT_CLK(NULL, "ocp2scp_usb_phy_phy_48m", "l3_init_cm:00c0:8"),
> -	DT_CLK(NULL, "otg_60m_gfclk", "l3_init_cm:0040:24"),
> -	DT_CLK(NULL, "per_mcbsp4_gfclk", "l4_per_cm:00c0:24"),
> -	DT_CLK(NULL, "pmd_stm_clock_mux_ck", "emu_sys_cm:0000:20"),
> -	DT_CLK(NULL, "pmd_trace_clk_mux_ck", "emu_sys_cm:0000:22"),
> -	DT_CLK(NULL, "sgx_clk_mux", "l3_gfx_cm:0000:24"),
> -	DT_CLK(NULL, "slimbus1_fclk_0", "abe_cm:0040:8"),
> -	DT_CLK(NULL, "slimbus1_fclk_1", "abe_cm:0040:9"),
> -	DT_CLK(NULL, "slimbus1_fclk_2", "abe_cm:0040:10"),
> -	DT_CLK(NULL, "slimbus1_slimbus_clk", "abe_cm:0040:11"),
> -	DT_CLK(NULL, "slimbus2_fclk_0", "l4_per_cm:0118:8"),
> -	DT_CLK(NULL, "slimbus2_fclk_1", "l4_per_cm:0118:9"),
> -	DT_CLK(NULL, "slimbus2_slimbus_clk", "l4_per_cm:0118:10"),
> -	DT_CLK(NULL, "stm_clk_div_ck", "emu_sys_cm:0000:27"),
> -	DT_CLK(NULL, "timer5_sync_mux", "abe_cm:0048:24"),
> -	DT_CLK(NULL, "timer6_sync_mux", "abe_cm:0050:24"),
> -	DT_CLK(NULL, "timer7_sync_mux", "abe_cm:0058:24"),
> -	DT_CLK(NULL, "timer8_sync_mux", "abe_cm:0060:24"),
> -	DT_CLK(NULL, "trace_clk_div_div_ck", "emu_sys_cm:0000:24"),
> -	DT_CLK(NULL, "usb_host_hs_func48mclk", "l3_init_cm:0038:15"),
> -	DT_CLK(NULL, "usb_host_hs_hsic480m_p1_clk", "l3_init_cm:0038:13"),
> -	DT_CLK(NULL, "usb_host_hs_hsic480m_p2_clk", "l3_init_cm:0038:14"),
> -	DT_CLK(NULL, "usb_host_hs_hsic60m_p1_clk", "l3_init_cm:0038:11"),
> -	DT_CLK(NULL, "usb_host_hs_hsic60m_p2_clk", "l3_init_cm:0038:12"),
> -	DT_CLK(NULL, "usb_host_hs_utmi_p1_clk", "l3_init_cm:0038:8"),
> -	DT_CLK(NULL, "usb_host_hs_utmi_p2_clk", "l3_init_cm:0038:9"),
> -	DT_CLK(NULL, "usb_host_hs_utmi_p3_clk", "l3_init_cm:0038:10"),
> -	DT_CLK(NULL, "usb_otg_hs_xclk", "l3_init_cm:0040:8"),
> -	DT_CLK(NULL, "usb_tll_hs_usb_ch0_clk", "l3_init_cm:0048:8"),
> -	DT_CLK(NULL, "usb_tll_hs_usb_ch1_clk", "l3_init_cm:0048:9"),
> -	DT_CLK(NULL, "usb_tll_hs_usb_ch2_clk", "l3_init_cm:0048:10"),
> -	DT_CLK(NULL, "utmi_p1_gfclk", "l3_init_cm:0038:24"),
> -	DT_CLK(NULL, "utmi_p2_gfclk", "l3_init_cm:0038:25"),
> +	DT_CLK(NULL, "aess_fclk", "abe-clkctrl:0008:24"),
> +	DT_CLK(NULL, "cm2_dm10_mux", "l4-per-clkctrl:0008:24"),
> +	DT_CLK(NULL, "cm2_dm11_mux", "l4-per-clkctrl:0010:24"),
> +	DT_CLK(NULL, "cm2_dm2_mux", "l4-per-clkctrl:0018:24"),
> +	DT_CLK(NULL, "cm2_dm3_mux", "l4-per-clkctrl:0020:24"),
> +	DT_CLK(NULL, "cm2_dm4_mux", "l4-per-clkctrl:0028:24"),
> +	DT_CLK(NULL, "cm2_dm9_mux", "l4-per-clkctrl:0030:24"),
> +	DT_CLK(NULL, "dmic_sync_mux_ck", "abe-clkctrl:0018:26"),
> +	DT_CLK(NULL, "dmt1_clk_mux", "l4-wkup-clkctrl:0020:24"),
> +	DT_CLK(NULL, "dss_48mhz_clk", "l3-dss-clkctrl:0000:9"),
> +	DT_CLK(NULL, "dss_dss_clk", "l3-dss-clkctrl:0000:8"),
> +	DT_CLK(NULL, "dss_sys_clk", "l3-dss-clkctrl:0000:10"),
> +	DT_CLK(NULL, "dss_tv_clk", "l3-dss-clkctrl:0000:11"),
> +	DT_CLK(NULL, "fdif_fck", "iss-clkctrl:0008:24"),
> +	DT_CLK(NULL, "func_dmic_abe_gfclk", "abe-clkctrl:0018:24"),
> +	DT_CLK(NULL, "func_mcasp_abe_gfclk", "abe-clkctrl:0020:24"),
> +	DT_CLK(NULL, "func_mcbsp1_gfclk", "abe-clkctrl:0028:24"),
> +	DT_CLK(NULL, "func_mcbsp2_gfclk", "abe-clkctrl:0030:24"),
> +	DT_CLK(NULL, "func_mcbsp3_gfclk", "abe-clkctrl:0038:24"),
> +	DT_CLK(NULL, "gpio1_dbclk", "l4-wkup-clkctrl:0018:8"),
> +	DT_CLK(NULL, "gpio2_dbclk", "l4-per-clkctrl:0040:8"),
> +	DT_CLK(NULL, "gpio3_dbclk", "l4-per-clkctrl:0048:8"),
> +	DT_CLK(NULL, "gpio4_dbclk", "l4-per-clkctrl:0050:8"),
> +	DT_CLK(NULL, "gpio5_dbclk", "l4-per-clkctrl:0058:8"),
> +	DT_CLK(NULL, "gpio6_dbclk", "l4-per-clkctrl:0060:8"),
> +	DT_CLK(NULL, "hsi_fck", "l3-init-clkctrl:0018:24"),
> +	DT_CLK(NULL, "hsmmc1_fclk", "l3-init-clkctrl:0008:24"),
> +	DT_CLK(NULL, "hsmmc2_fclk", "l3-init-clkctrl:0010:24"),
> +	DT_CLK(NULL, "iss_ctrlclk", "iss-clkctrl:0000:8"),
> +	DT_CLK(NULL, "mcasp_sync_mux_ck", "abe-clkctrl:0020:26"),
> +	DT_CLK(NULL, "mcbsp1_sync_mux_ck", "abe-clkctrl:0028:26"),
> +	DT_CLK(NULL, "mcbsp2_sync_mux_ck", "abe-clkctrl:0030:26"),
> +	DT_CLK(NULL, "mcbsp3_sync_mux_ck", "abe-clkctrl:0038:26"),
> +	DT_CLK(NULL, "mcbsp4_sync_mux_ck", "l4-per-clkctrl:00c0:26"),
> +	DT_CLK(NULL, "ocp2scp_usb_phy_phy_48m", "l3-init-clkctrl:00c0:8"),
> +	DT_CLK(NULL, "otg_60m_gfclk", "l3-init-clkctrl:0040:24"),
> +	DT_CLK(NULL, "per_mcbsp4_gfclk", "l4-per-clkctrl:00c0:24"),
> +	DT_CLK(NULL, "pmd_stm_clock_mux_ck", "emu-sys-clkctrl:0000:20"),
> +	DT_CLK(NULL, "pmd_trace_clk_mux_ck", "emu-sys-clkctrl:0000:22"),
> +	DT_CLK(NULL, "sgx_clk_mux", "l3-gfx-clkctrl:0000:24"),
> +	DT_CLK(NULL, "slimbus1_fclk_0", "abe-clkctrl:0040:8"),
> +	DT_CLK(NULL, "slimbus1_fclk_1", "abe-clkctrl:0040:9"),
> +	DT_CLK(NULL, "slimbus1_fclk_2", "abe-clkctrl:0040:10"),
> +	DT_CLK(NULL, "slimbus1_slimbus_clk", "abe-clkctrl:0040:11"),
> +	DT_CLK(NULL, "slimbus2_fclk_0", "l4-per-clkctrl:0118:8"),
> +	DT_CLK(NULL, "slimbus2_fclk_1", "l4-per-clkctrl:0118:9"),
> +	DT_CLK(NULL, "slimbus2_slimbus_clk", "l4-per-clkctrl:0118:10"),
> +	DT_CLK(NULL, "stm_clk_div_ck", "emu-sys-clkctrl:0000:27"),
> +	DT_CLK(NULL, "timer5_sync_mux", "abe-clkctrl:0048:24"),
> +	DT_CLK(NULL, "timer6_sync_mux", "abe-clkctrl:0050:24"),
> +	DT_CLK(NULL, "timer7_sync_mux", "abe-clkctrl:0058:24"),
> +	DT_CLK(NULL, "timer8_sync_mux", "abe-clkctrl:0060:24"),
> +	DT_CLK(NULL, "trace_clk_div_div_ck", "emu-sys-clkctrl:0000:24"),
> +	DT_CLK(NULL, "usb_host_hs_func48mclk", "l3-init-clkctrl:0038:15"),
> +	DT_CLK(NULL, "usb_host_hs_hsic480m_p1_clk", "l3-init-clkctrl:0038:13"),
> +	DT_CLK(NULL, "usb_host_hs_hsic480m_p2_clk", "l3-init-clkctrl:0038:14"),
> +	DT_CLK(NULL, "usb_host_hs_hsic60m_p1_clk", "l3-init-clkctrl:0038:11"),
> +	DT_CLK(NULL, "usb_host_hs_hsic60m_p2_clk", "l3-init-clkctrl:0038:12"),
> +	DT_CLK(NULL, "usb_host_hs_utmi_p1_clk", "l3-init-clkctrl:0038:8"),
> +	DT_CLK(NULL, "usb_host_hs_utmi_p2_clk", "l3-init-clkctrl:0038:9"),
> +	DT_CLK(NULL, "usb_host_hs_utmi_p3_clk", "l3_init-clkctrl:0038:10"),
> +	DT_CLK(NULL, "usb_otg_hs_xclk", "l3-init-clkctrl:0040:8"),
> +	DT_CLK(NULL, "usb_tll_hs_usb_ch0_clk", "l3-init-clkctrl:0048:8"),
> +	DT_CLK(NULL, "usb_tll_hs_usb_ch1_clk", "l3-init-clkctrl:0048:9"),
> +	DT_CLK(NULL, "usb_tll_hs_usb_ch2_clk", "l3-init-clkctrl:0048:10"),
> +	DT_CLK(NULL, "utmi_p1_gfclk", "l3-init-clkctrl:0038:24"),
> +	DT_CLK(NULL, "utmi_p2_gfclk", "l3-init-clkctrl:0038:25"),
>  	{ .node_name =3D NULL },
>  };
> =20
> diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
> index 8694bc9f5fc7f..04a5408085acc 100644
> --- a/drivers/clk/ti/clk-54xx.c
> +++ b/drivers/clk/ti/clk-54xx.c
> @@ -50,7 +50,7 @@ static const struct omap_clkctrl_bit_data omap5_aess_bi=
t_data[] __initconst =3D {
>  };
> =20
>  static const char * const omap5_dmic_gfclk_parents[] __initconst =3D {
> -	"abe_cm:clk:0018:26",
> +	"abe-clkctrl:0018:26",
>  	"pad_clks_ck",
>  	"slimbus_clk",
>  	NULL,
> @@ -70,7 +70,7 @@ static const struct omap_clkctrl_bit_data omap5_dmic_bi=
t_data[] __initconst =3D {
>  };
> =20
>  static const char * const omap5_mcbsp1_gfclk_parents[] __initconst =3D {
> -	"abe_cm:clk:0028:26",
> +	"abe-clkctrl:0028:26",
>  	"pad_clks_ck",
>  	"slimbus_clk",
>  	NULL,
> @@ -83,7 +83,7 @@ static const struct omap_clkctrl_bit_data omap5_mcbsp1_=
bit_data[] __initconst =3D
>  };
> =20
>  static const char * const omap5_mcbsp2_gfclk_parents[] __initconst =3D {
> -	"abe_cm:clk:0030:26",
> +	"abe-clkctrl:0030:26",
>  	"pad_clks_ck",
>  	"slimbus_clk",
>  	NULL,
> @@ -96,7 +96,7 @@ static const struct omap_clkctrl_bit_data omap5_mcbsp2_=
bit_data[] __initconst =3D
>  };
> =20
>  static const char * const omap5_mcbsp3_gfclk_parents[] __initconst =3D {
> -	"abe_cm:clk:0038:26",
> +	"abe-clkctrl:0038:26",
>  	"pad_clks_ck",
>  	"slimbus_clk",
>  	NULL,
> @@ -136,16 +136,16 @@ static const struct omap_clkctrl_bit_data omap5_tim=
er8_bit_data[] __initconst =3D
> =20
>  static const struct omap_clkctrl_reg_data omap5_abe_clkctrl_regs[] __ini=
tconst =3D {
>  	{ OMAP5_L4_ABE_CLKCTRL, NULL, 0, "abe_iclk" },
> -	{ OMAP5_AESS_CLKCTRL, omap5_aess_bit_data, CLKF_SW_SUP, "abe_cm:clk:000=
8:24" },
> +	{ OMAP5_AESS_CLKCTRL, omap5_aess_bit_data, CLKF_SW_SUP, "abe-clkctrl:00=
08:24" },
>  	{ OMAP5_MCPDM_CLKCTRL, NULL, CLKF_SW_SUP, "pad_clks_ck" },
> -	{ OMAP5_DMIC_CLKCTRL, omap5_dmic_bit_data, CLKF_SW_SUP, "abe_cm:clk:001=
8:24" },
> -	{ OMAP5_MCBSP1_CLKCTRL, omap5_mcbsp1_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0028:24" },
> -	{ OMAP5_MCBSP2_CLKCTRL, omap5_mcbsp2_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0030:24" },
> -	{ OMAP5_MCBSP3_CLKCTRL, omap5_mcbsp3_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0038:24" },
> -	{ OMAP5_TIMER5_CLKCTRL, omap5_timer5_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0048:24" },
> -	{ OMAP5_TIMER6_CLKCTRL, omap5_timer6_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0050:24" },
> -	{ OMAP5_TIMER7_CLKCTRL, omap5_timer7_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0058:24" },
> -	{ OMAP5_TIMER8_CLKCTRL, omap5_timer8_bit_data, CLKF_SW_SUP, "abe_cm:clk=
:0060:24" },
> +	{ OMAP5_DMIC_CLKCTRL, omap5_dmic_bit_data, CLKF_SW_SUP, "abe-clkctrl:00=
18:24" },
> +	{ OMAP5_MCBSP1_CLKCTRL, omap5_mcbsp1_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0028:24" },
> +	{ OMAP5_MCBSP2_CLKCTRL, omap5_mcbsp2_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0030:24" },
> +	{ OMAP5_MCBSP3_CLKCTRL, omap5_mcbsp3_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0038:24" },
> +	{ OMAP5_TIMER5_CLKCTRL, omap5_timer5_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0048:24" },
> +	{ OMAP5_TIMER6_CLKCTRL, omap5_timer6_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0050:24" },
> +	{ OMAP5_TIMER7_CLKCTRL, omap5_timer7_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0058:24" },
> +	{ OMAP5_TIMER8_CLKCTRL, omap5_timer8_bit_data, CLKF_SW_SUP, "abe-clkctr=
l:0060:24" },
>  	{ 0 },
>  };
> =20
> @@ -266,12 +266,12 @@ static const struct omap_clkctrl_bit_data omap5_gpi=
o8_bit_data[] __initconst =3D {
>  };
> =20
>  static const struct omap_clkctrl_reg_data omap5_l4per_clkctrl_regs[] __i=
nitconst =3D {
> -	{ OMAP5_TIMER10_CLKCTRL, omap5_timer10_bit_data, CLKF_SW_SUP, "l4per_cm=
:clk:0008:24" },
> -	{ OMAP5_TIMER11_CLKCTRL, omap5_timer11_bit_data, CLKF_SW_SUP, "l4per_cm=
:clk:0010:24" },
> -	{ OMAP5_TIMER2_CLKCTRL, omap5_timer2_bit_data, CLKF_SW_SUP, "l4per_cm:c=
lk:0018:24" },
> -	{ OMAP5_TIMER3_CLKCTRL, omap5_timer3_bit_data, CLKF_SW_SUP, "l4per_cm:c=
lk:0020:24" },
> -	{ OMAP5_TIMER4_CLKCTRL, omap5_timer4_bit_data, CLKF_SW_SUP, "l4per_cm:c=
lk:0028:24" },
> -	{ OMAP5_TIMER9_CLKCTRL, omap5_timer9_bit_data, CLKF_SW_SUP, "l4per_cm:c=
lk:0030:24" },
> +	{ OMAP5_TIMER10_CLKCTRL, omap5_timer10_bit_data, CLKF_SW_SUP, "l4per-cl=
kctrl:0008:24" },
> +	{ OMAP5_TIMER11_CLKCTRL, omap5_timer11_bit_data, CLKF_SW_SUP, "l4per-cl=
kctrl:0010:24" },
> +	{ OMAP5_TIMER2_CLKCTRL, omap5_timer2_bit_data, CLKF_SW_SUP, "l4per-clkc=
trl:0018:24" },
> +	{ OMAP5_TIMER3_CLKCTRL, omap5_timer3_bit_data, CLKF_SW_SUP, "l4per-clkc=
trl:0020:24" },
> +	{ OMAP5_TIMER4_CLKCTRL, omap5_timer4_bit_data, CLKF_SW_SUP, "l4per-clkc=
trl:0028:24" },
> +	{ OMAP5_TIMER9_CLKCTRL, omap5_timer9_bit_data, CLKF_SW_SUP, "l4per-clkc=
trl:0030:24" },
>  	{ OMAP5_GPIO2_CLKCTRL, omap5_gpio2_bit_data, CLKF_HW_SUP, "l4_root_clk_=
div" },
>  	{ OMAP5_GPIO3_CLKCTRL, omap5_gpio3_bit_data, CLKF_HW_SUP, "l4_root_clk_=
div" },
>  	{ OMAP5_GPIO4_CLKCTRL, omap5_gpio4_bit_data, CLKF_HW_SUP, "l4_root_clk_=
div" },
> @@ -343,7 +343,7 @@ static const struct omap_clkctrl_bit_data omap5_dss_c=
ore_bit_data[] __initconst
>  };
> =20
>  static const struct omap_clkctrl_reg_data omap5_dss_clkctrl_regs[] __ini=
tconst =3D {
> -	{ OMAP5_DSS_CORE_CLKCTRL, omap5_dss_core_bit_data, CLKF_SW_SUP, "dss_cm=
:clk:0000:8" },
> +	{ OMAP5_DSS_CORE_CLKCTRL, omap5_dss_core_bit_data, CLKF_SW_SUP, "dss-cl=
kctrl:0000:8" },
>  	{ 0 },
>  };
> =20
> @@ -376,7 +376,7 @@ static const struct omap_clkctrl_bit_data omap5_gpu_c=
ore_bit_data[] __initconst
>  };
> =20
>  static const struct omap_clkctrl_reg_data omap5_gpu_clkctrl_regs[] __ini=
tconst =3D {
> -	{ OMAP5_GPU_CLKCTRL, omap5_gpu_core_bit_data, CLKF_SW_SUP, "gpu_cm:clk:=
0000:24" },
> +	{ OMAP5_GPU_CLKCTRL, omap5_gpu_core_bit_data, CLKF_SW_SUP, "gpu-clkctrl=
:0000:24" },
>  	{ 0 },
>  };
> =20
> @@ -387,7 +387,7 @@ static const char * const omap5_mmc1_fclk_mux_parents=
[] __initconst =3D {
>  };
> =20
>  static const char * const omap5_mmc1_fclk_parents[] __initconst =3D {
> -	"l3init_cm:clk:0008:24",
> +	"l3init-clkctrl:0008:24",
>  	NULL,
>  };
> =20
> @@ -403,7 +403,7 @@ static const struct omap_clkctrl_bit_data omap5_mmc1_=
bit_data[] __initconst =3D {
>  };
> =20
>  static const char * const omap5_mmc2_fclk_parents[] __initconst =3D {
> -	"l3init_cm:clk:0010:24",
> +	"l3init-clkctrl:0010:24",
>  	NULL,
>  };
> =20
> @@ -428,12 +428,12 @@ static const char * const omap5_usb_host_hs_hsic480=
m_p3_clk_parents[] __initcons
>  };
> =20
>  static const char * const omap5_usb_host_hs_utmi_p1_clk_parents[] __init=
const =3D {
> -	"l3init_cm:clk:0038:24",
> +	"l3init-clkctrl:0038:24",
>  	NULL,
>  };
> =20
>  static const char * const omap5_usb_host_hs_utmi_p2_clk_parents[] __init=
const =3D {
> -	"l3init_cm:clk:0038:25",
> +	"l3init-clkctrl:0038:25",
>  	NULL,
>  };
> =20
> @@ -492,8 +492,8 @@ static const struct omap_clkctrl_bit_data omap5_usb_o=
tg_ss_bit_data[] __initcons
>  };
> =20
>  static const struct omap_clkctrl_reg_data omap5_l3init_clkctrl_regs[] __=
initconst =3D {
> -	{ OMAP5_MMC1_CLKCTRL, omap5_mmc1_bit_data, CLKF_SW_SUP, "l3init_cm:clk:=
0008:25" },
> -	{ OMAP5_MMC2_CLKCTRL, omap5_mmc2_bit_data, CLKF_SW_SUP, "l3init_cm:clk:=
0010:25" },
> +	{ OMAP5_MMC1_CLKCTRL, omap5_mmc1_bit_data, CLKF_SW_SUP, "l3init-clkctrl=
:0008:25" },
> +	{ OMAP5_MMC2_CLKCTRL, omap5_mmc2_bit_data, CLKF_SW_SUP, "l3init-clkctrl=
:0010:25" },
>  	{ OMAP5_USB_HOST_HS_CLKCTRL, omap5_usb_host_hs_bit_data, CLKF_SW_SUP, "=
l3init_60m_fclk" },
>  	{ OMAP5_USB_TLL_HS_CLKCTRL, omap5_usb_tll_hs_bit_data, CLKF_HW_SUP, "l4=
_root_clk_div" },
>  	{ OMAP5_SATA_CLKCTRL, omap5_sata_bit_data, CLKF_SW_SUP, "func_48m_fclk"=
 },
> @@ -517,7 +517,7 @@ static const struct omap_clkctrl_reg_data omap5_wkupa=
on_clkctrl_regs[] __initcon
>  	{ OMAP5_L4_WKUP_CLKCTRL, NULL, 0, "wkupaon_iclk_mux" },
>  	{ OMAP5_WD_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "sys_32k_ck" },
>  	{ OMAP5_GPIO1_CLKCTRL, omap5_gpio1_bit_data, CLKF_HW_SUP, "wkupaon_iclk=
_mux" },
> -	{ OMAP5_TIMER1_CLKCTRL, omap5_timer1_bit_data, CLKF_SW_SUP, "wkupaon_cm=
:clk:0020:24" },
> +	{ OMAP5_TIMER1_CLKCTRL, omap5_timer1_bit_data, CLKF_SW_SUP, "wkupaon-cl=
kctrl:0020:24" },
>  	{ OMAP5_COUNTER_32K_CLKCTRL, NULL, 0, "wkupaon_iclk_mux" },
>  	{ OMAP5_KBD_CLKCTRL, NULL, CLKF_SW_SUP, "sys_32k_ck" },
>  	{ 0 },
> @@ -547,58 +547,58 @@ const struct omap_clkctrl_data omap5_clkctrl_data[]=
 __initconst =3D {
>  static struct ti_dt_clk omap54xx_clks[] =3D {
>  	DT_CLK(NULL, "timer_32k_ck", "sys_32k_ck"),
>  	DT_CLK(NULL, "sys_clkin_ck", "sys_clkin"),
> -	DT_CLK(NULL, "dmic_gfclk", "abe_cm:0018:24"),
> -	DT_CLK(NULL, "dmic_sync_mux_ck", "abe_cm:0018:26"),
> -	DT_CLK(NULL, "dss_32khz_clk", "dss_cm:0000:11"),
> -	DT_CLK(NULL, "dss_48mhz_clk", "dss_cm:0000:9"),
> -	DT_CLK(NULL, "dss_dss_clk", "dss_cm:0000:8"),
> -	DT_CLK(NULL, "dss_sys_clk", "dss_cm:0000:10"),
> -	DT_CLK(NULL, "gpio1_dbclk", "wkupaon_cm:0018:8"),
> -	DT_CLK(NULL, "gpio2_dbclk", "l4per_cm:0040:8"),
> -	DT_CLK(NULL, "gpio3_dbclk", "l4per_cm:0048:8"),
> -	DT_CLK(NULL, "gpio4_dbclk", "l4per_cm:0050:8"),
> -	DT_CLK(NULL, "gpio5_dbclk", "l4per_cm:0058:8"),
> -	DT_CLK(NULL, "gpio6_dbclk", "l4per_cm:0060:8"),
> -	DT_CLK(NULL, "gpio7_dbclk", "l4per_cm:00f0:8"),
> -	DT_CLK(NULL, "gpio8_dbclk", "l4per_cm:00f8:8"),
> -	DT_CLK(NULL, "mcbsp1_gfclk", "abe_cm:0028:24"),
> -	DT_CLK(NULL, "mcbsp1_sync_mux_ck", "abe_cm:0028:26"),
> -	DT_CLK(NULL, "mcbsp2_gfclk", "abe_cm:0030:24"),
> -	DT_CLK(NULL, "mcbsp2_sync_mux_ck", "abe_cm:0030:26"),
> -	DT_CLK(NULL, "mcbsp3_gfclk", "abe_cm:0038:24"),
> -	DT_CLK(NULL, "mcbsp3_sync_mux_ck", "abe_cm:0038:26"),
> -	DT_CLK(NULL, "mmc1_32khz_clk", "l3init_cm:0008:8"),
> -	DT_CLK(NULL, "mmc1_fclk", "l3init_cm:0008:25"),
> -	DT_CLK(NULL, "mmc1_fclk_mux", "l3init_cm:0008:24"),
> -	DT_CLK(NULL, "mmc2_fclk", "l3init_cm:0010:25"),
> -	DT_CLK(NULL, "mmc2_fclk_mux", "l3init_cm:0010:24"),
> -	DT_CLK(NULL, "sata_ref_clk", "l3init_cm:0068:8"),
> -	DT_CLK(NULL, "timer10_gfclk_mux", "l4per_cm:0008:24"),
> -	DT_CLK(NULL, "timer11_gfclk_mux", "l4per_cm:0010:24"),
> -	DT_CLK(NULL, "timer1_gfclk_mux", "wkupaon_cm:0020:24"),
> -	DT_CLK(NULL, "timer2_gfclk_mux", "l4per_cm:0018:24"),
> -	DT_CLK(NULL, "timer3_gfclk_mux", "l4per_cm:0020:24"),
> -	DT_CLK(NULL, "timer4_gfclk_mux", "l4per_cm:0028:24"),
> -	DT_CLK(NULL, "timer5_gfclk_mux", "abe_cm:0048:24"),
> -	DT_CLK(NULL, "timer6_gfclk_mux", "abe_cm:0050:24"),
> -	DT_CLK(NULL, "timer7_gfclk_mux", "abe_cm:0058:24"),
> -	DT_CLK(NULL, "timer8_gfclk_mux", "abe_cm:0060:24"),
> -	DT_CLK(NULL, "timer9_gfclk_mux", "l4per_cm:0030:24"),
> -	DT_CLK(NULL, "usb_host_hs_hsic480m_p1_clk", "l3init_cm:0038:13"),
> -	DT_CLK(NULL, "usb_host_hs_hsic480m_p2_clk", "l3init_cm:0038:14"),
> -	DT_CLK(NULL, "usb_host_hs_hsic480m_p3_clk", "l3init_cm:0038:7"),
> -	DT_CLK(NULL, "usb_host_hs_hsic60m_p1_clk", "l3init_cm:0038:11"),
> -	DT_CLK(NULL, "usb_host_hs_hsic60m_p2_clk", "l3init_cm:0038:12"),
> -	DT_CLK(NULL, "usb_host_hs_hsic60m_p3_clk", "l3init_cm:0038:6"),
> -	DT_CLK(NULL, "usb_host_hs_utmi_p1_clk", "l3init_cm:0038:8"),
> -	DT_CLK(NULL, "usb_host_hs_utmi_p2_clk", "l3init_cm:0038:9"),
> -	DT_CLK(NULL, "usb_host_hs_utmi_p3_clk", "l3init_cm:0038:10"),
> -	DT_CLK(NULL, "usb_otg_ss_refclk960m", "l3init_cm:00d0:8"),
> -	DT_CLK(NULL, "usb_tll_hs_usb_ch0_clk", "l3init_cm:0048:8"),
> -	DT_CLK(NULL, "usb_tll_hs_usb_ch1_clk", "l3init_cm:0048:9"),
> -	DT_CLK(NULL, "usb_tll_hs_usb_ch2_clk", "l3init_cm:0048:10"),
> -	DT_CLK(NULL, "utmi_p1_gfclk", "l3init_cm:0038:24"),
> -	DT_CLK(NULL, "utmi_p2_gfclk", "l3init_cm:0038:25"),
> +	DT_CLK(NULL, "dmic_gfclk", "abe-clkctrl:0018:24"),
> +	DT_CLK(NULL, "dmic_sync_mux_ck", "abe-clkctrl:0018:26"),
> +	DT_CLK(NULL, "dss_32khz_clk", "dss-clkctrl:0000:11"),
> +	DT_CLK(NULL, "dss_48mhz_clk", "dss-clkctrl:0000:9"),
> +	DT_CLK(NULL, "dss_dss_clk", "dss-clkctrl:0000:8"),
> +	DT_CLK(NULL, "dss_sys_clk", "dss-clkctrl:0000:10"),
> +	DT_CLK(NULL, "gpio1_dbclk", "wkupaon-clkctrl:0018:8"),
> +	DT_CLK(NULL, "gpio2_dbclk", "l4per-clkctrl:0040:8"),
> +	DT_CLK(NULL, "gpio3_dbclk", "l4per-clkctrl:0048:8"),
> +	DT_CLK(NULL, "gpio4_dbclk", "l4per-clkctrl:0050:8"),
> +	DT_CLK(NULL, "gpio5_dbclk", "l4per-clkctrl:0058:8"),
> +	DT_CLK(NULL, "gpio6_dbclk", "l4per-clkctrl:0060:8"),
> +	DT_CLK(NULL, "gpio7_dbclk", "l4per-clkctrl:00f0:8"),
> +	DT_CLK(NULL, "gpio8_dbclk", "l4per-clkctrl:00f8:8"),
> +	DT_CLK(NULL, "mcbsp1_gfclk", "abe-clkctrl:0028:24"),
> +	DT_CLK(NULL, "mcbsp1_sync_mux_ck", "abe-clkctrl:0028:26"),
> +	DT_CLK(NULL, "mcbsp2_gfclk", "abe-clkctrl:0030:24"),
> +	DT_CLK(NULL, "mcbsp2_sync_mux_ck", "abe-clkctrl:0030:26"),
> +	DT_CLK(NULL, "mcbsp3_gfclk", "abe-clkctrl:0038:24"),
> +	DT_CLK(NULL, "mcbsp3_sync_mux_ck", "abe-clkctrl:0038:26"),
> +	DT_CLK(NULL, "mmc1_32khz_clk", "l3init-clkctrl:0008:8"),
> +	DT_CLK(NULL, "mmc1_fclk", "l3init-clkctrl:0008:25"),
> +	DT_CLK(NULL, "mmc1_fclk_mux", "l3init-clkctrl:0008:24"),
> +	DT_CLK(NULL, "mmc2_fclk", "l3init-clkctrl:0010:25"),
> +	DT_CLK(NULL, "mmc2_fclk_mux", "l3init-clkctrl:0010:24"),
> +	DT_CLK(NULL, "sata_ref_clk", "l3init-clkctrl:0068:8"),
> +	DT_CLK(NULL, "timer10_gfclk_mux", "l4per-clkctrl:0008:24"),
> +	DT_CLK(NULL, "timer11_gfclk_mux", "l4per-clkctrl:0010:24"),
> +	DT_CLK(NULL, "timer1_gfclk_mux", "wkupaon-clkctrl:0020:24"),
> +	DT_CLK(NULL, "timer2_gfclk_mux", "l4per-clkctrl:0018:24"),
> +	DT_CLK(NULL, "timer3_gfclk_mux", "l4per-clkctrl:0020:24"),
> +	DT_CLK(NULL, "timer4_gfclk_mux", "l4per-clkctrl:0028:24"),
> +	DT_CLK(NULL, "timer5_gfclk_mux", "abe-clkctrl:0048:24"),
> +	DT_CLK(NULL, "timer6_gfclk_mux", "abe-clkctrl:0050:24"),
> +	DT_CLK(NULL, "timer7_gfclk_mux", "abe-clkctrl:0058:24"),
> +	DT_CLK(NULL, "timer8_gfclk_mux", "abe-clkctrl:0060:24"),
> +	DT_CLK(NULL, "timer9_gfclk_mux", "l4per-clkctrl:0030:24"),
> +	DT_CLK(NULL, "usb_host_hs_hsic480m_p1_clk", "l3init-clkctrl:0038:13"),
> +	DT_CLK(NULL, "usb_host_hs_hsic480m_p2_clk", "l3init-clkctrl:0038:14"),
> +	DT_CLK(NULL, "usb_host_hs_hsic480m_p3_clk", "l3init-clkctrl:0038:7"),
> +	DT_CLK(NULL, "usb_host_hs_hsic60m_p1_clk", "l3init-clkctrl:0038:11"),
> +	DT_CLK(NULL, "usb_host_hs_hsic60m_p2_clk", "l3init-clkctrl:0038:12"),
> +	DT_CLK(NULL, "usb_host_hs_hsic60m_p3_clk", "l3init-clkctrl:0038:6"),
> +	DT_CLK(NULL, "usb_host_hs_utmi_p1_clk", "l3init-clkctrl:0038:8"),
> +	DT_CLK(NULL, "usb_host_hs_utmi_p2_clk", "l3init-clkctrl:0038:9"),
> +	DT_CLK(NULL, "usb_host_hs_utmi_p3_clk", "l3init-clkctrl:0038:10"),
> +	DT_CLK(NULL, "usb_otg_ss_refclk960m", "l3init-clkctrl:00d0:8"),
> +	DT_CLK(NULL, "usb_tll_hs_usb_ch0_clk", "l3init-clkctrl:0048:8"),
> +	DT_CLK(NULL, "usb_tll_hs_usb_ch1_clk", "l3init-clkctrl:0048:9"),
> +	DT_CLK(NULL, "usb_tll_hs_usb_ch2_clk", "l3init-clkctrl:0048:10"),
> +	DT_CLK(NULL, "utmi_p1_gfclk", "l3init-clkctrl:0038:24"),
> +	DT_CLK(NULL, "utmi_p2_gfclk", "l3init-clkctrl:0038:25"),
>  	{ .node_name =3D NULL },
>  };
> =20
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> index 864c484bde1b4..08a85c559f795 100644
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -511,10 +511,6 @@ static void __init _ti_omap4_clkctrl_setup(struct de=
vice_node *node)
>  	char *c;
>  	u16 soc_mask =3D 0;
> =20
> -	if (!(ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) &&
> -	    of_node_name_eq(node, "clk"))
> -		ti_clk_features.flags |=3D TI_CLK_CLKCTRL_COMPAT;
> -
>  	addrp =3D of_get_address(node, 0, NULL, NULL);
>  	addr =3D (u32)of_translate_address(node, addrp);
> -------------------------------------------------------------------------=
------
>=20
>=20
> Git bisection log:
>=20
> -------------------------------------------------------------------------=
------
> git bisect start
> # good: [6eae1503ddf94b4c3581092d566b17ed12d80f20] Linux 5.10.136
> git bisect good 6eae1503ddf94b4c3581092d566b17ed12d80f20
> # bad: [014862eecf03f58066a957027dde73cbecdf4395] Linux 5.10.147
> git bisect bad 014862eecf03f58066a957027dde73cbecdf4395
> # good: [aa16c8c4e830b9173e6a296ef88e44dc84f5a1de] spi: meson-spicc: add =
local pow2 clock ops to preserve rate between messages
> git bisect good aa16c8c4e830b9173e6a296ef88e44dc84f5a1de
> # bad: [39a90720f3abe96625d1224e7a7463410875de4c] ALSA: emu10k1: Fix out =
of bounds access in snd_emu10k1_pcm_channel_alloc()
> git bisect bad 39a90720f3abe96625d1224e7a7463410875de4c
> # bad: [297ae7e87a87a001dd3dfeac1cb26a42fd929708] s390: fix double free o=
f GS and RI CBs on fork() failure
> git bisect bad 297ae7e87a87a001dd3dfeac1cb26a42fd929708
> # bad: [4f7286422a7836459f79445fbbdacff53da3b58b] qrtr: Convert qrtr_port=
s from IDR to XArray
> git bisect bad 4f7286422a7836459f79445fbbdacff53da3b58b
> # bad: [c29a4baaad38a332c0ae480cf6d6c5bf75ac1828] scsi: lpfc: Prevent buf=
fer overflow crashes in debugfs with malformed user input
> git bisect bad c29a4baaad38a332c0ae480cf6d6c5bf75ac1828
> # good: [e2a49009ba037e3710fd1d6a285d688415ddcbe1] audit: log nftables co=
nfiguration change events once per table
> git bisect good e2a49009ba037e3710fd1d6a285d688415ddcbe1
> # good: [152c94c10bc470ee5aded8be5a67663398ee6c94] drm/meson: Fix overflo=
w implicit truncation warnings
> git bisect good 152c94c10bc470ee5aded8be5a67663398ee6c94
> # bad: [eddb352a807d16682ac73f6e5c2ab0a7fe1c139e] vboxguest: Do not use d=
evm for irq
> git bisect bad eddb352a807d16682ac73f6e5c2ab0a7fe1c139e
> # bad: [cb5dd65e889163e723df1c2f02288cc527a57785] usb: host: ohci-ppc-of:=
 Fix refcount leak bug
> git bisect bad cb5dd65e889163e723df1c2f02288cc527a57785
> # bad: [d86c6447ee250822256470ad43add20470d1cd3d] clk: ti: Stop using leg=
acy clkctrl names for omap4 and 5
> git bisect bad d86c6447ee250822256470ad43add20470d1cd3d
> # first bad commit: [d86c6447ee250822256470ad43add20470d1cd3d] clk: ti: S=
top using legacy clkctrl names for omap4 and 5
> -------------------------------------------------------------------------=
------
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#32448): https://groups.io/g/kernelci-results/message/=
32448
> Mute This Topic: https://groups.io/mt/94204526/1131744
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.o=
rg]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--R34J7XK9/APsBwJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNEAf8ACgkQJNaLcl1U
h9DeXQf9H4LB4Ba61VdtecxhjWFTJcS0qckfpu1HVOjSQ0eTZniy/zRHRiNCpbuA
7eORkBbZ/QN+fDmaUdIqXYHMiRg6RkslbFNTFT+GBXxXWZnrqpl72wr+WiyW9t6w
FVycSeRXXlb6v1xK630Ev6+/mCjIpcg8IrHuZAHOG3CUErILq+flIizmwKX5tgNS
BrzWAFBPRfieJZLvBM8qvSrFpJPQ6kIQUXhUvK8SWFgj0hvpv1OnA/BqLih17RST
9Ji8DxFH2zOrD7X6fMicEIkyD9r2coRVqmc3QlQBlHtJX0+JRnsQGo6amzna/jWz
jUtdnV3Xz23XLS4MnuTc4I5swMFWmQ==
=BV8D
-----END PGP SIGNATURE-----

--R34J7XK9/APsBwJE--
