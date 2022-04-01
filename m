Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDEB94EEDC6
	for <lists+linux-omap@lfdr.de>; Fri,  1 Apr 2022 15:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbiDANGj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Apr 2022 09:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346138AbiDANGh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Apr 2022 09:06:37 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23828120B9;
        Fri,  1 Apr 2022 06:04:47 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 04C063201F88;
        Fri,  1 Apr 2022 09:04:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 01 Apr 2022 09:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=FCw9QmvzJyic1m27XjwmoXVo7E+vbIo+Z5Bawe
        dqPzk=; b=q5ugLdYuVVuWS7tQzhU5GZNPrTJM0SKR86C+AHUr+p5hUL0ianFMzh
        VR9g0TJJz6v6hFsIy5WXOGvcDMtKiomU58YUAZ5qbDTLJ8zbsjNYNP4cfrvhUeyy
        ftkdYlyDnnIoSZqFAvEeRhx1aOnZQNulKMYGOSd7slPyKwt/sSZpWLtUe6M1GqQu
        14zXHglJSOXlSpDPVLlAeLdKpN9eyUCSJAfWVrJIjCHYpSfLAD9JKhF5vvu3iYzT
        mOmbepS77En6COeVRuNQekZlOBdFRwMSg95erCCITcmFEZL5Sw4hoaeQLX+6Sadv
        gnxWFrwBKx7aiH7sFjOaPL+rLlg/BRbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FCw9QmvzJyic1m27X
        jwmoXVo7E+vbIo+Z5BawedqPzk=; b=eULs5UxeNwBvnMOQSaz+Hz8G1lGtO5gH7
        OpI+tWcJUX3bxU16gHP2kihZ0rhpkpQ+Moi3zL3aqqoGH0QsneLXX8Vhy9yKYefB
        Z+/z2zeX67hN/ky4GVjzYixNc6kAuYPVllZ8fxeL2b+0+lbrWzK3uwBWd3ExRlDl
        md3bO5rD7E5ag/Zc8lgUs/6sscTRB7mgyx9Hti0waBx6EPtTmD3zgsyZQKQI5X45
        7jTwaeWn5MF3Wb3I934DK/SspRpnQ6gCeC5tYKYcBR46rnevM2mYodCWOSjgOYkZ
        V68IleNO2S/fMim7GpU4LIeDUDvRnvl2fWbsyaOwkhJ+SPjlF10Ow==
X-ME-Sender: <xms:bPhGYoWeBid1zJ4Da1Bokbwh_uycwGfujUCUxnoD_C0OrvLbMhBNQw>
    <xme:bPhGYskYz1CvtC7hzESwfwD2lkmwi9uOnqvahhL_gTooSKZFq5_ADZmVDb8Ls_l1C
    SaFCFac1c81JyhOYPc>
X-ME-Received: <xmr:bPhGYsZ7Hpc1_QPCSegFGeC9og0HOjZRUIFeUB0YiAm4BYT_eCCFYWdI12eE9G2LvfzQni_nQRpwYCjsXhpKG7DCuAjHU41WNdxdGf8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bPhGYnUDms6EbQJmDraPp0DOJ_FIXT-NKFU3jd5YfNyxe1OmBKF8AQ>
    <xmx:bPhGYilbzjhaSZmAFvadwuemq2M8pRA-DSbJ9R2cK5oYB7KA88_L2g>
    <xmx:bPhGYsdCdq6adNYUKfOolN4IZtFJTaCkoQR7Nsh5IvMOVWHSrrwaiQ>
    <xmx:bfhGYnjrOjeKOHOUFk9ZrpQ5d7E2noXWzaqqnBf58olpCy_iHeSsSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 09:04:44 -0400 (EDT)
Date:   Fri, 1 Apr 2022 15:04:42 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: (EXT) Re: (EXT) Re: [PATCH v2 3/3] clk: Drop the rate range on
 clk_put
Message-ID: <20220401130442.myegjneyuc7fkfnd@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <2236051.ElGaqSPkdT@steina-w>
 <20220401122736.5yvanksa4pla7uql@houat>
 <2099976.irdbgypaU6@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6p5flgbzivy44ezv"
Content-Disposition: inline
In-Reply-To: <2099976.irdbgypaU6@steina-w>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--6p5flgbzivy44ezv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2022 at 02:59:37PM +0200, Alexander Stein wrote:
> Hi Maxime,
>=20
> Am Freitag, 1. April 2022, 14:27:36 CEST schrieb Maxime Ripard:
> > On Fri, Apr 01, 2022 at 01:55:20PM +0200, Alexander Stein wrote:
> > > Am Donnerstag, 31. M=E4rz 2022, 17:31:34 CEST schrieb Maxime Ripard:
> > > > > Old Signed by an unknown key
> > > >=20
> > > > Hi Tony,
> > > >=20
> > > > On Thu, Mar 31, 2022 at 06:00:42PM +0300, Tony Lindgren wrote:
> > > > > * Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> > > > > > On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > > > > > > It seems the dts assigned-clock-parents no longer works now?
> > > > > >=20
> > > > > > That would make some kind of sense, __set_clk_parents calls clk=
_put
> > > > > > on
> > > > > > both the assigned clock and its parent.
> > > > > >=20
> > > > > > Could you see what parent (and why?) it tries to enforce then?
> > > > >=20
> > > > > It picks the other option available for the mux clock that only h=
as
> > > > > two options. No idea why, but if you have some debug patch in min=
d I
> > > > > can give it a try.
> > > > >=20
> > > > > > It looks like the gpt1_fck driver might favor another parent for
> > > > > > that
> > > > > > rate, which, if it's an invalid configuration, shouldn't really
> > > > > > happen?
> > > > >=20
> > > > > Hmm there's a gate clock and a mux clock, there's not really a ra=
te
> > > > > selection available here for the sources.
> > > >=20
> > > > If I followed the OMAP driver properly, clk_mux_determine_rate_flag=
s is
> > > > doing the heavy lifting, could you run your test with
> > >=20
> > > I'm affected by this patch as well on an imx8mp platform (see [1] for=
 some
> > > details)
> > >=20
> > > In the failing case with with your patch applied I get the following =
error
> > > ---
> > > [    0.661064] clk_set_rate_range_nolock: core req rate 500000000
> > > [    0.664084] clk_set_rate_range_nolock: clamped rate 500000000
> > > [    0.669851] clk_core_set_rate_nolock: rate 500000000
> > > [    0.674843] clk_core_set_rate_nolock: rounded rate 500000000
> > > [    0.680536] clk_set_rate_range_nolock: core req rate 800000000
> > > [    0.686389] clk_set_rate_range_nolock: clamped rate 800000000
> > > [    0.692164] clk_core_set_rate_nolock: rate 800000000
> > > [    0.697153] clk_mux_determine_rate_flags: requested rate 800000000
> > > [    0.703363] clk_mux_determine_rate_flags: current parent sys_pll1
> > > [    0.709487] clk_mux_determine_rate_flags: current parent rate 8000=
00000
> > > [    0.716147] Unable to handle kernel NULL pointer dereference at vi=
rtual
> > > address 0000000000000000
> > > [    0.724977] Mem abort info:
> > > [    0.727775]   ESR =3D 0x96000004
> > > [    0.730835]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > > [    0.736177]   SET =3D 0, FnV =3D 0
> > > [    0.739239]   EA =3D 0, S1PTW =3D 0
> > > [    0.742382]   FSC =3D 0x04: level 0 translation fault
> > > [    0.747287] Data abort info:
> > > [    0.750172]   ISV =3D 0, ISS =3D 0x00000004
> > > [    0.754027]   CM =3D 0, WnR =3D 0
> > > [    0.757002] [0000000000000000] user address but active_mm is swapp=
er
> > > [    0.763394] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > > [    0.768985] Modules linked in:
> > > [    0.772049] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> > > 5.17.0-next-20220331+ #48 8e9d24095c7f6b15f85bc2ad57a5609e219130b9
> > > [    0.782984] Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8=
MPxL
> > > (DT) [    0.789985] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -=
SSBS
> > > BTYPE=3D--) [    0.796985] pc : clk_mux_determine_rate_flags+0x280/0x=
2cc
> > > [    0.802407] lr : clk_mux_determine_rate_flags+0xf4/0x2cc
> > > [    0.807747] sp : ffff800009ceb590
> > > [    0.811072] x29: ffff800009ceb590 x28: ffff800009ceb6a0 x27:
> > > ffff800008eaa038
> > > [    0.818245] x26: ffff8000092fe0b0 x25: ffff000000090000 x24:
> > > ffff000000090000
> > > [    0.825420] x23: 0000000000000000 x22: ffff800008ea95d8 x21:
> > > ffff0000028f4700
> > > [    0.832595] x20: 000000002faf0800 x19: 0000000000000000 x18:
> > > 0000000000004590
> > > [    0.839770] x17: 0000000000004570 x16: 0000000000004560 x15:
> > > ffff8000092ff250
> > > [    0.846945] x14: 0000000000000000 x13: 3030303030303030 x12:
> > > 3820657461722074
> > > [    0.854120] x11: 6e6572617020746e x10: 6572727563203a73 x9 :
> > > 7563203a7367616c
> > > [    0.861295] x8 : 665f657461725f65 x7 : 205d373834393037 x6 :
> > > ffff800009a947c8
> > > [    0.868472] x5 : ffff800008eafe68 x4 : 0000000000000009 x3 :
> > > 000000002faf0800
> > > [    0.875645] x2 : ffff800008eafef4 x1 : ffff800008eaa038 x0 :
> > > ffff8000092fd5b8
> > > [    0.882822] Call trace:
> > > [    0.885273]  clk_mux_determine_rate_flags+0x280/0x2cc
> > > [    0.890347]  clk_mux_determine_rate+0x10/0x20
> > > [    0.894720]  clk_core_determine_round_nolock+0x4c/0xb4
> > > [    0.899882]  clk_core_round_rate_nolock+0x30/0x80
> > > [    0.904607]  clk_core_round_rate_nolock+0x70/0x80
> > > [    0.909334]  clk_hw_round_rate+0x44/0x74
> > > [    0.913270]  clk_factor_round_rate+0x60/0x80
> > > [    0.917557]  clk_core_determine_round_nolock+0x88/0xb4
> > > [    0.922720]  clk_core_round_rate_nolock+0x30/0x80
> > > [    0.927445]  clk_core_set_rate_nolock.part.0+0xa4/0x1d0
> > > [    0.932695]  clk_set_rate_range_nolock+0x234/0x244
> > > [    0.937507]  __clk_put+0x60/0x12c
> > > [    0.940834]  clk_put+0xc/0x1c
> > > [    0.943809]  __set_clk_parents+0x12c/0x244
> > > [    0.947920]  of_clk_set_defaults+0x20/0x50
> > > [    0.952032]  of_clk_add_hw_provider.part.0+0x94/0x120
> > > [    0.957107]  of_clk_add_hw_provider+0x10/0x20
> > > [    0.961482]  imx8mp_clocks_probe+0x3458/0x34d0
> > > [    0.965945]  platform_probe+0x64/0x100
> > > [    0.969707]  call_driver_probe+0x28/0x130
> > > [    0.973732]  really_probe+0x178/0x310
> > > [    0.977409]  __driver_probe_device+0xfc/0x144
> > > [    0.981782]  driver_probe_device+0x38/0x12c
> > > [    0.985982]  __driver_attach+0xcc/0x220
> > > [    0.989834]  bus_for_each_dev+0x6c/0xc0
> > > [    0.993682]  driver_attach+0x20/0x2c
> > > [    0.997270]  bus_add_driver+0x140/0x230
> > > [    1.001120]  driver_register+0x74/0x120
> > > [    1.004970]  __platform_driver_register+0x24/0x30
> > > [    1.009697]  imx8mp_clk_driver_init+0x18/0x20
> > > [    1.014070]  do_one_initcall+0x58/0x200
> > > [    1.017920]  do_initcalls+0x164/0x19c
> > > [    1.021597]  kernel_init_freeable+0x134/0x17c
> > > [    1.025970]  kernel_init+0x2c/0x150
> > > [    1.029470]  ret_from_fork+0x10/0x20
> > > [    1.033065] Code: f9000f94 912982c1 b0002900 9116e000 (f9400262)
> > > [    1.039188] ---[ end trace 0000000000000000 ]---
> > > [    1.043869] Kernel panic - not syncing: Attempted to kill init!
> > > exitcode=3D0x0000000b
> > > [    1.051523] SMP: stopping secondary CPUs
> > > [    1.055467] Kernel Offset: disabled
> > > [    1.058960] CPU features: 0x000,00020009,00001082
> > > [    1.063684] Memory Limit: none
> > > [    1.066748] ---[ end Kernel panic - not syncing: Attempted to kill
> > > init!
> > > exitcode=3D0x0000000b ]---
> > > ---
> > >=20
> > > With the $subject patch reverted and bootable system:
> > > ---
> > > [    0.659922] clk_core_set_rate_nolock: rate 1000000000
> > > [    0.662154] clk_core_set_rate_nolock: rounded rate 1000000000
> > > [    0.667932] clk_core_set_rate_nolock: rate 800000000
> > > [    0.672918] clk_core_set_rate_nolock: rounded rate 800000000
> > > [    0.678601] clk_core_set_rate_nolock: rate 500000000
> > > [    0.683592] clk_core_set_rate_nolock: rounded rate 500000000
> > > [    0.689276] clk_core_set_rate_nolock: rate 400000000
> > > [    0.694267] clk_core_set_rate_nolock: rounded rate 400000000
> > > [    0.699980] clk_core_set_rate_nolock: rate 800000000
> > > [    0.704942] clk_core_set_rate_nolock: rounded rate 800000000
> > > [    0.710627] clk_core_set_rate_nolock: rate 393216000
> > > [    0.715611] clk_core_set_rate_nolock: rounded rate 393216000
> > > [    0.721815] clk_core_set_rate_nolock: rate 361267200
> > > [    0.726284] clk_core_set_rate_nolock: rounded rate 361267200
> > > [    0.734097] clk_core_set_rate_nolock: rate 800000000
> > > [    0.736977] clk_core_set_rate_nolock: rounded rate 800000000
> > > [    0.742652] clk_core_set_rate_nolock: rate 400000000
> > > [    0.747645] clk_core_set_rate_nolock: rounded rate 400000000
> > > [    0.754565] clk_core_set_rate_nolock: rate 500000000
> > > [    0.758331] clk_core_set_rate_nolock: rounded rate 500000000
> > > [    0.764688] SoC: i.MX8MP revision 1.1
> > > [    0.767931] clk_core_set_rate_nolock: rate 500000000
> > > [    0.772675] clk_core_set_rate_nolock: rounded rate 500000000
> > > [    0.778354] clk_core_set_rate_nolock: rate 200000000
> > > [    0.783351] clk_core_set_rate_nolock: rounded rate 200000000
> > > [    0.793748] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> > > [    0.798952] 30860000.serial: ttymxc0 at MMIO 0x30860000 (irq =3D 3=
4,
> > > base_baud =3D 5000000) is a IMX
> > > [    0.806527] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq =3D 3=
5,
> > > base_baud =3D 5000000) is a IMX
> > > [    0.815329] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D 3=
6,
> > > base_baud =3D 5000000) is a IMX
> > > [    0.824176] 30a60000.serial: ttymxc3 at MMIO 0x30a60000 (irq =3D 4=
3,
> > > base_baud =3D 1500000) is a IMX
> > > [    0.832588] printk: console [ttymxc3] enabled
> > > [    0.832588] printk: console [ttymxc3] enabled
> > > [    0.841244] printk: bootconsole [ec_imx6q0] disabled
> > > [    0.841244] printk: bootconsole [ec_imx6q0] disabled
> > > [    0.857871] clk_core_set_rate_nolock: rate 80000000
> > > [    0.862796] clk_core_set_rate_nolock: rounded rate 80000000
> > > [    0.868469] clk_core_set_rate_nolock: rate 20000000
> > > [    0.873364] clk_core_set_rate_nolock: rounded rate 20000000
> > > [    0.879258] clk_core_set_rate_nolock: rate 80000000
> > > [    0.884154] clk_core_set_rate_nolock: rounded rate 80000000
> > > [...]
> > > ---
> > >=20
> > > The 500000000 and 800000000 look a bit like the assigned-clock-rates =
for
> > > clock-controller@30380000 in arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > >=20
> > > If you need some more information, do not hesitate to ask
> >=20
> > Thanks a lot to you three for all your testing. I think I know what
> > might be going on:
> >=20
> > We use the last requested rate on clk_set_rate_range
> > (clk_core.req_rate), and that requested rate if the clock is orphan will
> > be set to 0, so if we were to call clk_set_rate_range before the parent
> > clock is registered, we would effectively call a clk_set_rate to 0
> >=20
> > And the assigned-clocks stuff is handled by __set_clk_parents and
> > __set_clk_rates, called by of_clk_set_defaults(), in turn called by
> > of_clk_init and of_clk_add_provider. Both __set_clk_parents and
> > __set_clk_rates will call clk_put once done with the clock, and we will
> > with this patch trigger the clk_set_rate to 0 I mentioned before.
> >=20
> > So we just became very good at triggering the underlying issue :)
> >=20
> > And I think it's that while we update the requested rate when the
> > missing parent is registered, we never do when we mux away from it using
> > clk_set_parent.
> >=20
> > Could you test the following patch and let me know if it works?
> >=20
> > --->8---
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 91f863b7a824..ee5a0223e47d 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -2599,6 +2599,8 @@ static int clk_core_set_parent_nolock(struct clk_=
core
> > *core, } else {
> >  		__clk_recalc_rates(core, POST_RATE_CHANGE);
> >  		__clk_recalc_accuracies(core);
> > +
> > +		core->req_rate =3D core->rate;
> >  	}
> >=20
> >  runtime_put:
> >=20
> > --->8---
>=20
> Thanks for the patch. Unfortunately it does not help in my case. Here is =
the=20
> output form the other patch. It's the same clock (sys_pll1) but a differe=
nt=20
> rate for the first calls.
>=20
> ---
> [    0.658706] clk_set_rate_range_nolock: core req rate 800000000        =
                                                           =20
> [    0.661715] clk_set_rate_range_nolock: clamped rate 800000000         =
                                                           =20
> [    0.667496] clk_core_set_rate_nolock: rate 800000000                  =
                                                           =20
> [    0.672485] clk_core_set_rate_nolock: rounded rate 800000000          =
                                                           =20
> [    0.678171] clk_set_rate_range_nolock: core req rate 800000000        =
                                                           =20
> [    0.684033] clk_set_rate_range_nolock: clamped rate 800000000         =
                                                           =20
> [    0.689804] clk_core_set_rate_nolock: rate 800000000                  =
                                                           =20
> [    0.694795] clk_mux_determine_rate_flags: requested rate 800000000    =
                                                           =20
> [    0.701005] clk_mux_determine_rate_flags: current parent sys_pll1     =
                                                           =20
> [    0.707130] clk_mux_determine_rate_flags: current parent rate 80000000=
0                                                          =20
> [    0.713789] Unable to handle kernel NULL pointer dereference at virtua=
l=20
> address 0000000000000000                                 =20
> [    0.722618] Mem abort info:                                           =
                                                           =20
> [    0.725411]   ESR =3D 0x96000004                                      =
                                                             =20
> [    0.728483]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits          =
                                                               =20
> [    0.733822]   SET =3D 0, FnV =3D 0                                    =
                                                               =20
> [    0.736879]   EA =3D 0, S1PTW =3D 0                                   =
                                                               =20
> [    0.740032]   FSC =3D 0x04: level 0 translation fault
> [    0.744930] Data abort info:
> [    0.747820]   ISV =3D 0, ISS =3D 0x00000004
> [    0.751666]   CM =3D 0, WnR =3D 0
> [    0.754645] [0000000000000000] user address but active_mm is swapper
> [    0.761034] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    0.766627] Modules linked in:
> [    0.769690] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.17.0-next-2022=
0331+=20
> #51 62b66a4e908a3493b6d37735830c8ba1462e0fc9
> [    0.780625] Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MPxL=
 (DT)
> [    0.787627] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    0.794625] pc : clk_mux_determine_rate_flags+0x280/0x2cc
> [    0.800049] lr : clk_mux_determine_rate_flags+0xf4/0x2cc
> [    0.805388] sp : ffff800009ceb590
> [    0.808713] x29: ffff800009ceb590 x28: ffff800009ceb6a0 x27:=20
> ffff800008eaa038
> [    0.815886] x26: ffff8000092fe090 x25: ffff000000090000 x24:=20
> ffff000000090000
> [    0.823061] x23: 0000000000000000 x22: ffff800008ea95d8 x21:=20
> ffff000002aab700
> [    0.830236] x20: 000000002faf0800 x19: 0000000000000000 x18:=20
> 0000000000004590
> [    0.837411] x17: 0000000000004570 x16: 0000000000004560 x15:=20
> ffff8000092ff230
> [    0.844586] x14: 0000000000000000 x13: 3030303030303030 x12:=20
> 3820657461722074
> [    0.851761] x11: 6e6572617020746e x10: 6572727563203a73 x9 :=20
> 7563203a7367616c
> [    0.858936] x8 : 665f657461725f65 x7 : 205d303331373037 x6 :=20
> ffff800009a947c8
> [    0.866113] x5 : ffff800008eafe68 x4 : 0000000000000009 x3 :=20
> 000000002faf0800
> [    0.873286] x2 : ffff800008eafef4 x1 : ffff800008eaa038 x0 :=20
> ffff8000092fd598
> [    0.880464] Call trace:
> [    0.882914]  clk_mux_determine_rate_flags+0x280/0x2cc
> [    0.887989]  clk_mux_determine_rate+0x10/0x20
> [    0.892361]  clk_core_determine_round_nolock+0x4c/0xb4
> [    0.897524]  clk_core_round_rate_nolock+0x30/0x80
> [    0.902249]  clk_core_round_rate_nolock+0x70/0x80
> [    0.906976]  clk_hw_round_rate+0x44/0x74
> [    0.910911]  clk_factor_round_rate+0x60/0x80
> [    0.915199]  clk_core_determine_round_nolock+0x88/0xb4
> [    0.920361]  clk_core_round_rate_nolock+0x30/0x80
> [    0.925086]  clk_core_set_rate_nolock.part.0+0xa4/0x1d0
> [    0.930336]  clk_set_rate_range_nolock+0x234/0x244
> [    0.935149]  __clk_put+0x60/0x12c
> [    0.938474]  clk_put+0xc/0x1c
> [    0.941451]  __set_clk_parents+0x12c/0x244
> [    0.945561]  of_clk_set_defaults+0x20/0x50
> [    0.949674]  of_clk_add_hw_provider.part.0+0x94/0x120
> [    0.954750]  of_clk_add_hw_provider+0x10/0x20
> [    0.959124]  imx8mp_clocks_probe+0x3458/0x34d0
> [    0.963586]  platform_probe+0x64/0x100
> [    0.967349]  call_driver_probe+0x28/0x130
> [    0.971374]  really_probe+0x178/0x310
> [    0.975051]  __driver_probe_device+0xfc/0x144
> [    0.979424]  driver_probe_device+0x38/0x12c
> [    0.983624]  __driver_attach+0xcc/0x220
> [    0.987476]  bus_for_each_dev+0x6c/0xc0
> [    0.991324]  driver_attach+0x20/0x2c
> [    0.994911]  bus_add_driver+0x140/0x230
> [    0.998761]  driver_register+0x74/0x120
> [    1.002611]  __platform_driver_register+0x24/0x30
> [    1.007338]  imx8mp_clk_driver_init+0x18/0x20
> [    1.011711]  do_one_initcall+0x58/0x200
> [    1.015561]  do_initcalls+0x164/0x19c
> [    1.019238]  kernel_init_freeable+0x134/0x17c
> [    1.023613]  kernel_init+0x2c/0x150
> [    1.027111]  ret_from_fork+0x10/0x20
> [    1.030705] Code: f9000f94 912982c1 d0002900 91166000 (f9400262)=20
> [    1.036829] ---[ end trace 0000000000000000 ]---
> [    1.041512] Kernel panic - not syncing: Attempted to kill init!=20
> exitcode=3D0x0000000b
> [    1.049164] SMP: stopping secondary CPUs
> [    1.053108] Kernel Offset: disabled
> [    1.056600] CPU features: 0x000,00020009,00001082
> [    1.061326] Memory Limit: none
> [    1.064390] ---[ end Kernel panic - not syncing: Attempted to kill ini=
t!=20
> exitcode=3D0x0000000b ]---

Does it also happen if you only apply the patch I had above, and not all
the debugging?

Maxime

--6p5flgbzivy44ezv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkb4agAKCRDj7w1vZxhR
xeY4AQCJ+iH0YpezOkJ4GgEi/RfoH44CrHCkhvfZ2OFynTp8xgEAiybzdI3uM4Zx
i/iSmEos/sQjmE+38RrHNEFTRH2Y/Ao=
=jXqO
-----END PGP SIGNATURE-----

--6p5flgbzivy44ezv--
