Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA344EED1F
	for <lists+linux-omap@lfdr.de>; Fri,  1 Apr 2022 14:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345879AbiDAM3f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Apr 2022 08:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345048AbiDAM3f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Apr 2022 08:29:35 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388BC278565;
        Fri,  1 Apr 2022 05:27:44 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 3818F3200E83;
        Fri,  1 Apr 2022 08:27:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 01 Apr 2022 08:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=imhJ3dD7c0EDWKHCTi05yodLJKdr4rfyFR4YZi
        1T5/k=; b=Dj7Y9t6PIQmM48kvrK0t9XZSneOwQFBSdJ3dFyekeeE/Ov9xCJJUfi
        9XzmMpsv7h7nH8+zslHrT9iuY0O1phzsrY7g0KRLwQeTevkP3ixWiocjgFaE7/7w
        Xwm6gAylVvnmoQ5D9qv5m+9vHWEWo232gtg0Rytblny9bXF83xrowUnZoseePKs5
        +Cyp8wZoNFa90v9dUzul4nt7aQEfue7gT6ZOrPJtJjewjh+kUeQMph7AIrYxOlo7
        oslPvWmrFzcpo0NFxgfa577uy5x0+yAEKeKHFi6ua+DsLSiKG7cOQUOcLUkJUnQu
        Tb1V5fNpkRCUenSELdyBa33NOJovBBpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=imhJ3dD7c0EDWKHCT
        i05yodLJKdr4rfyFR4YZi1T5/k=; b=V9x4umekqY8vrwv0n6+/7leQvDZ1491CQ
        YjyovjeT23NkwPybVqvA+ydg4ERcSb53UMiTqGlTxx4h4mm8/kithoRgs4c6KIcy
        Ee0FEsiPZOwx1Q59woZBNPaagqpOlqTMt7yrrmgKUizYZvV7saiNzVgcB2G3tO/8
        ANNUN8ZvFoAmdo6ZU++63SPWnsbLDgl05xaq9L1EMzM9x1D7+jUH9Niv9FXambq3
        92L18Aad7dHILs9ugDkugn7u8N/K1rDkyIxOFJ5cNEl/yBoF9tC61ZVyjGM6gNqc
        FpOcvOc0/AdNHGMydf0kZwA0WxhmdvRl2G+0J5/Mn5fCzS9a5Yltw==
X-ME-Sender: <xms:u-9GYuzkq-zu62YxHM8qonoEQEwice9PkbDxeby7wktmL9s4BQbiVA>
    <xme:u-9GYqScYi4qSNVVFOzNaRVG1NZgjxZZU08OmLWrCQj4sZ1gEBskk75Jdo_fym7LS
    qFSXU97z6zynkylMhI>
X-ME-Received: <xmr:u-9GYgViSO-tU2vOAHAb5A9mGAqBKhG67cSVWpbQUyf3Ws4tictpqA1TumzC7eXBFRzRwzIaeo8SBc0buKW2ZH63zU9rZi9Mvw7leJs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:u-9GYkimYeE8OOVTnBzMJuYeUdGkjWqixUr5HtBd710BnRA8ipxqwg>
    <xmx:u-9GYgBBnKglNkPYl_CeQkP9yhFtymkjTwgDe3uzq7pmhvz1nT_PUw>
    <xmx:u-9GYlJJ1Jln19MVyE7S2e1A-J1vihAykZQgvaJYQpzV8QU3i04Xeg>
    <xmx:vO9GYgvpzHJYDLq23QJFjCeyCWSZLiqqwud5h5B_5yXRklo1fr_GvA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 08:27:38 -0400 (EDT)
Date:   Fri, 1 Apr 2022 14:27:36 +0200
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
Subject: Re: (EXT) Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <20220401122736.5yvanksa4pla7uql@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <YkXCGlrok0niwlyg@atomide.com>
 <20220331153134.h3alp24hzquajkly@houat>
 <2236051.ElGaqSPkdT@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="73qhweaow4uhckvc"
Content-Disposition: inline
In-Reply-To: <2236051.ElGaqSPkdT@steina-w>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--73qhweaow4uhckvc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander, Tony, Marek,

On Fri, Apr 01, 2022 at 01:55:20PM +0200, Alexander Stein wrote:
> Am Donnerstag, 31. M=E4rz 2022, 17:31:34 CEST schrieb Maxime Ripard:
> > * PGP Signed by an unknown key
> >=20
> > Hi Tony,
> >=20
> > On Thu, Mar 31, 2022 at 06:00:42PM +0300, Tony Lindgren wrote:
> > > * Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> > > > On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > > > > It seems the dts assigned-clock-parents no longer works now?
> > > >=20
> > > > That would make some kind of sense, __set_clk_parents calls clk_put=
 on
> > > > both the assigned clock and its parent.
> > > >=20
> > > > Could you see what parent (and why?) it tries to enforce then?
> > >=20
> > > It picks the other option available for the mux clock that only has
> > > two options. No idea why, but if you have some debug patch in mind I
> > > can give it a try.
> > >=20
> > > > It looks like the gpt1_fck driver might favor another parent for th=
at
> > > > rate, which, if it's an invalid configuration, shouldn't really hap=
pen?
> > >=20
> > > Hmm there's a gate clock and a mux clock, there's not really a rate
> > > selection available here for the sources.
> >=20
> > If I followed the OMAP driver properly, clk_mux_determine_rate_flags is
> > doing the heavy lifting, could you run your test with
>=20
> I'm affected by this patch as well on an imx8mp platform (see [1] for som=
e=20
> details)
>=20
> In the failing case with with your patch applied I get the following erro=
r=20
> ---
> [    0.661064] clk_set_rate_range_nolock: core req rate 500000000        =
                                                           =20
> [    0.664084] clk_set_rate_range_nolock: clamped rate 500000000         =
                                                           =20
> [    0.669851] clk_core_set_rate_nolock: rate 500000000                  =
                                                           =20
> [    0.674843] clk_core_set_rate_nolock: rounded rate 500000000          =
                                                           =20
> [    0.680536] clk_set_rate_range_nolock: core req rate 800000000        =
                                                           =20
> [    0.686389] clk_set_rate_range_nolock: clamped rate 800000000         =
                                                           =20
> [    0.692164] clk_core_set_rate_nolock: rate 800000000                  =
                                                           =20
> [    0.697153] clk_mux_determine_rate_flags: requested rate 800000000    =
                                                           =20
> [    0.703363] clk_mux_determine_rate_flags: current parent sys_pll1     =
                                                           =20
> [    0.709487] clk_mux_determine_rate_flags: current parent rate 80000000=
0                                                          =20
> [    0.716147] Unable to handle kernel NULL pointer dereference at virtua=
l=20
> address 0000000000000000
> [    0.724977] Mem abort info:                                           =
                                                           =20
> [    0.727775]   ESR =3D 0x96000004                                      =
                                                             =20
> [    0.730835]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits          =
                                                               =20
> [    0.736177]   SET =3D 0, FnV =3D 0                                    =
                                                               =20
> [    0.739239]   EA =3D 0, S1PTW =3D 0                                   =
                                                               =20
> [    0.742382]   FSC =3D 0x04: level 0 translation fault                 =
                                                             =20
> [    0.747287] Data abort info:                                          =
                                                           =20
> [    0.750172]   ISV =3D 0, ISS =3D 0x00000004                           =
                                                               =20
> [    0.754027]   CM =3D 0, WnR =3D 0                                     =
                                                               =20
> [    0.757002] [0000000000000000] user address but active_mm is swapper  =
                                                           =20
> [    0.763394] Internal error: Oops: 96000004 [#1] PREEMPT SMP           =
                                                           =20
> [    0.768985] Modules linked in:                                        =
                                                           =20
> [    0.772049] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.17.0-next-2022=
0331+=20
> #48 8e9d24095c7f6b15f85bc2ad57a5609e219130b9         =20
> [    0.782984] Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MPxL=
 (DT)                                                      =20
> [    0.789985] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)                                                      =20
> [    0.796985] pc : clk_mux_determine_rate_flags+0x280/0x2cc             =
                                                           =20
> [    0.802407] lr : clk_mux_determine_rate_flags+0xf4/0x2cc              =
                                                           =20
> [    0.807747] sp : ffff800009ceb590                                     =
                                                           =20
> [    0.811072] x29: ffff800009ceb590 x28: ffff800009ceb6a0 x27:=20
> ffff800008eaa038                                                    =20
> [    0.818245] x26: ffff8000092fe0b0 x25: ffff000000090000 x24:=20
> ffff000000090000                                                    =20
> [    0.825420] x23: 0000000000000000 x22: ffff800008ea95d8 x21:=20
> ffff0000028f4700                                                    =20
> [    0.832595] x20: 000000002faf0800 x19: 0000000000000000 x18:=20
> 0000000000004590                                                    =20
> [    0.839770] x17: 0000000000004570 x16: 0000000000004560 x15:=20
> ffff8000092ff250                                                    =20
> [    0.846945] x14: 0000000000000000 x13: 3030303030303030 x12:=20
> 3820657461722074                                                    =20
> [    0.854120] x11: 6e6572617020746e x10: 6572727563203a73 x9 :=20
> 7563203a7367616c                                                    =20
> [    0.861295] x8 : 665f657461725f65 x7 : 205d373834393037 x6 :=20
> ffff800009a947c8                                                    =20
> [    0.868472] x5 : ffff800008eafe68 x4 : 0000000000000009 x3 :=20
> 000000002faf0800                                                    =20
> [    0.875645] x2 : ffff800008eafef4 x1 : ffff800008eaa038 x0 :=20
> ffff8000092fd5b8                                                    =20
> [    0.882822] Call trace:                                               =
                                                           =20
> [    0.885273]  clk_mux_determine_rate_flags+0x280/0x2cc                 =
                                                           =20
> [    0.890347]  clk_mux_determine_rate+0x10/0x20                         =
                                                           =20
> [    0.894720]  clk_core_determine_round_nolock+0x4c/0xb4                =
                                                           =20
> [    0.899882]  clk_core_round_rate_nolock+0x30/0x80                     =
                                                           =20
> [    0.904607]  clk_core_round_rate_nolock+0x70/0x80                     =
                                                           =20
> [    0.909334]  clk_hw_round_rate+0x44/0x74                              =
                                                           =20
> [    0.913270]  clk_factor_round_rate+0x60/0x80                          =
                                                           =20
> [    0.917557]  clk_core_determine_round_nolock+0x88/0xb4                =
                                                           =20
> [    0.922720]  clk_core_round_rate_nolock+0x30/0x80                     =
                                                           =20
> [    0.927445]  clk_core_set_rate_nolock.part.0+0xa4/0x1d0               =
                                                           =20
> [    0.932695]  clk_set_rate_range_nolock+0x234/0x244                    =
                                                           =20
> [    0.937507]  __clk_put+0x60/0x12c                                     =
                                                           =20
> [    0.940834]  clk_put+0xc/0x1c                                         =
                                                           =20
> [    0.943809]  __set_clk_parents+0x12c/0x244                            =
                                                           =20
> [    0.947920]  of_clk_set_defaults+0x20/0x50                            =
                                                           =20
> [    0.952032]  of_clk_add_hw_provider.part.0+0x94/0x120                 =
                                                           =20
> [    0.957107]  of_clk_add_hw_provider+0x10/0x20                         =
                                                           =20
> [    0.961482]  imx8mp_clocks_probe+0x3458/0x34d0                        =
                                                           =20
> [    0.965945]  platform_probe+0x64/0x100                                =
                                                           =20
> [    0.969707]  call_driver_probe+0x28/0x130                             =
                                                           =20
> [    0.973732]  really_probe+0x178/0x310                                 =
                                                           =20
> [    0.977409]  __driver_probe_device+0xfc/0x144                         =
                                                           =20
> [    0.981782]  driver_probe_device+0x38/0x12c                           =
                                                           =20
> [    0.985982]  __driver_attach+0xcc/0x220                               =
                                                           =20
> [    0.989834]  bus_for_each_dev+0x6c/0xc0                               =
                                                           =20
> [    0.993682]  driver_attach+0x20/0x2c                                  =
                                                           =20
> [    0.997270]  bus_add_driver+0x140/0x230                               =
                                                           =20
> [    1.001120]  driver_register+0x74/0x120                               =
                                                           =20
> [    1.004970]  __platform_driver_register+0x24/0x30                     =
                                                           =20
> [    1.009697]  imx8mp_clk_driver_init+0x18/0x20                         =
                                                           =20
> [    1.014070]  do_one_initcall+0x58/0x200                               =
                                                           =20
> [    1.017920]  do_initcalls+0x164/0x19c                                 =
                                                           =20
> [    1.021597]  kernel_init_freeable+0x134/0x17c                         =
                                                           =20
> [    1.025970]  kernel_init+0x2c/0x150                                   =
                                                           =20
> [    1.029470]  ret_from_fork+0x10/0x20                                  =
                                                           =20
> [    1.033065] Code: f9000f94 912982c1 b0002900 9116e000 (f9400262)      =
                                                           =20
> [    1.039188] ---[ end trace 0000000000000000 ]---                      =
                                                           =20
> [    1.043869] Kernel panic - not syncing: Attempted to kill init!=20
> exitcode=3D0x0000000b                                              =20
> [    1.051523] SMP: stopping secondary CPUs                              =
                                                           =20
> [    1.055467] Kernel Offset: disabled                                   =
                                                           =20
> [    1.058960] CPU features: 0x000,00020009,00001082                     =
                                                           =20
> [    1.063684] Memory Limit: none                                        =
                                                           =20
> [    1.066748] ---[ end Kernel panic - not syncing: Attempted to kill ini=
t!=20
> exitcode=3D0x0000000b ]---
> ---
>=20
> With the $subject patch reverted and bootable system:
> ---
> [    0.659922] clk_core_set_rate_nolock: rate 1000000000                 =
                                                           =20
> [    0.662154] clk_core_set_rate_nolock: rounded rate 1000000000         =
                                                           =20
> [    0.667932] clk_core_set_rate_nolock: rate 800000000                  =
                                                           =20
> [    0.672918] clk_core_set_rate_nolock: rounded rate 800000000          =
                                                           =20
> [    0.678601] clk_core_set_rate_nolock: rate 500000000                  =
                                                           =20
> [    0.683592] clk_core_set_rate_nolock: rounded rate 500000000          =
                                                           =20
> [    0.689276] clk_core_set_rate_nolock: rate 400000000                  =
                                                           =20
> [    0.694267] clk_core_set_rate_nolock: rounded rate 400000000          =
                                                           =20
> [    0.699980] clk_core_set_rate_nolock: rate 800000000                  =
                                                           =20
> [    0.704942] clk_core_set_rate_nolock: rounded rate 800000000          =
                                                           =20
> [    0.710627] clk_core_set_rate_nolock: rate 393216000                  =
                                                           =20
> [    0.715611] clk_core_set_rate_nolock: rounded rate 393216000          =
                                                           =20
> [    0.721815] clk_core_set_rate_nolock: rate 361267200                  =
                                                           =20
> [    0.726284] clk_core_set_rate_nolock: rounded rate 361267200          =
                                                           =20
> [    0.734097] clk_core_set_rate_nolock: rate 800000000                  =
                                                           =20
> [    0.736977] clk_core_set_rate_nolock: rounded rate 800000000          =
                                                           =20
> [    0.742652] clk_core_set_rate_nolock: rate 400000000                  =
                                                           =20
> [    0.747645] clk_core_set_rate_nolock: rounded rate 400000000          =
                                                           =20
> [    0.754565] clk_core_set_rate_nolock: rate 500000000                  =
                                                           =20
> [    0.758331] clk_core_set_rate_nolock: rounded rate 500000000          =
                                                           =20
> [    0.764688] SoC: i.MX8MP revision 1.1                                 =
                                                           =20
> [    0.767931] clk_core_set_rate_nolock: rate 500000000                  =
                                                           =20
> [    0.772675] clk_core_set_rate_nolock: rounded rate 500000000          =
                                                           =20
> [    0.778354] clk_core_set_rate_nolock: rate 200000000                  =
                                                           =20
> [    0.783351] clk_core_set_rate_nolock: rounded rate 200000000          =
                                                           =20
> [    0.793748] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled   =
                                                           =20
> [    0.798952] 30860000.serial: ttymxc0 at MMIO 0x30860000 (irq =3D 34,=
=20
> base_baud =3D 5000000) is a IMX                                 =20
> [    0.806527] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq =3D 35,=
=20
> base_baud =3D 5000000) is a IMX                                 =20
> [    0.815329] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D 36,=
=20
> base_baud =3D 5000000) is a IMX                                 =20
> [    0.824176] 30a60000.serial: ttymxc3 at MMIO 0x30a60000 (irq =3D 43,=
=20
> base_baud =3D 1500000) is a IMX                                 =20
> [    0.832588] printk: console [ttymxc3] enabled                         =
                                                           =20
> [    0.832588] printk: console [ttymxc3] enabled                         =
                                                           =20
> [    0.841244] printk: bootconsole [ec_imx6q0] disabled                  =
                                                           =20
> [    0.841244] printk: bootconsole [ec_imx6q0] disabled                  =
                                                           =20
> [    0.857871] clk_core_set_rate_nolock: rate 80000000                   =
                                                           =20
> [    0.862796] clk_core_set_rate_nolock: rounded rate 80000000           =
                                                           =20
> [    0.868469] clk_core_set_rate_nolock: rate 20000000                   =
                                                           =20
> [    0.873364] clk_core_set_rate_nolock: rounded rate 20000000           =
                                                           =20
> [    0.879258] clk_core_set_rate_nolock: rate 80000000                   =
                                                           =20
> [    0.884154] clk_core_set_rate_nolock: rounded rate 80000000
> [...]
> ---
>=20
> The 500000000 and 800000000 look a bit like the assigned-clock-rates for=
=20
> clock-controller@30380000 in arch/arm64/boot/dts/freescale/imx8mp.dtsi
>=20
> If you need some more information, do not hesitate to ask

Thanks a lot to you three for all your testing. I think I know what
might be going on:

We use the last requested rate on clk_set_rate_range
(clk_core.req_rate), and that requested rate if the clock is orphan will
be set to 0, so if we were to call clk_set_rate_range before the parent
clock is registered, we would effectively call a clk_set_rate to 0

And the assigned-clocks stuff is handled by __set_clk_parents and
__set_clk_rates, called by of_clk_set_defaults(), in turn called by
of_clk_init and of_clk_add_provider. Both __set_clk_parents and
__set_clk_rates will call clk_put once done with the clock, and we will
with this patch trigger the clk_set_rate to 0 I mentioned before.

So we just became very good at triggering the underlying issue :)

And I think it's that while we update the requested rate when the
missing parent is registered, we never do when we mux away from it using
clk_set_parent.

Could you test the following patch and let me know if it works?

--->8---

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 91f863b7a824..ee5a0223e47d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2599,6 +2599,8 @@ static int clk_core_set_parent_nolock(struct clk_core=
 *core,
 	} else {
 		__clk_recalc_rates(core, POST_RATE_CHANGE);
 		__clk_recalc_accuracies(core);
+
+		core->req_rate =3D core->rate;
 	}

 runtime_put:

--->8---

Thanks!
Maxime

--73qhweaow4uhckvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkbvuAAKCRDj7w1vZxhR
xUbMAQCLoHnPaPKlnBQfR0JMoQxDqbr/Cw/oA2ZgROL4CC1jWwEA6TKLF2Tj8cO8
JV6ZsjIt2QknAsozk3aAG5bIGZYS5go=
=oL2C
-----END PGP SIGNATURE-----

--73qhweaow4uhckvc--
