Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771044EEDD4
	for <lists+linux-omap@lfdr.de>; Fri,  1 Apr 2022 15:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346168AbiDANJH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Apr 2022 09:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346172AbiDANJE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Apr 2022 09:09:04 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592FF27CE03;
        Fri,  1 Apr 2022 06:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1648818432; x=1680354432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bo9bSFDlPa6ieBBXyTaYy4QX244DWQpVBon28z0aSnU=;
  b=ScQ7CEkm/p1Uy0gm6G/oVgKfh4thdipXXCfW4tSNuTywxIphmut708J9
   a+z18ovRQ0KrEmb1Rp0Q/IvsMkaj9TT9E9FT/QJYQr6i0+HMgMAmRAIO+
   91ju0GDR7GMVCrrTvPwz2w+mfQCYp9m7qucGBh2WhKN+0T20e8JtbrKvD
   M56NcWasrPbVszz2Q4LOBUO+RJNORi7VvwDx9Y/Q8ClrfCiW9dwZnf35s
   cvA4hFc6C6HiPCvwUTlXLUgFQUq+pV0ljPGGn77wOIZzX3902Sjj9jSti
   yfUH1bekkmWMXgNKqcqvVr0u6YgZPSOMTMHmlUJWXoLNrnY3ApNWBUMNJ
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,227,1643670000"; 
   d="scan'208";a="23044380"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 01 Apr 2022 15:07:10 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 01 Apr 2022 15:07:10 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 01 Apr 2022 15:07:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1648818430; x=1680354430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bo9bSFDlPa6ieBBXyTaYy4QX244DWQpVBon28z0aSnU=;
  b=LQR5LuR1pym6f6O9tSsmP8KWEDijAC5LudkG2Pn10+/xl7099/0FiBeR
   JC42bBi+8vlvCk+K4efi2M4d5vuPLf4zSqUdpqLfS7zDit1c3Frs0K60O
   JgvabfRiswEssNjY/EUlC5DWyrMhwaLPtGb28GwVYLd7ViwNLhaLSWfZm
   H1Wh8en0Ykg7t82b4rKNdYmzW3ByPWNTkpVPjWYP3oYthki25qi+z1Ywo
   b1Y9/lt3g/4JYZpvhp1+bqWaBo86qcXBihDZJ0d6Sp1ElRBpvZnHjaARX
   csSfl2/JNYcwzQ7FUSuOlAKv+R1amyozVN3u++4ZK6iprosbV7GV1xb4m
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,227,1643670000"; 
   d="scan'208";a="23044379"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 01 Apr 2022 15:07:10 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 700C6280065;
        Fri,  1 Apr 2022 15:07:10 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Date:   Fri, 01 Apr 2022 15:07:10 +0200
Message-ID: <2823402.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220401130442.myegjneyuc7fkfnd@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech> <2099976.irdbgypaU6@steina-w> <20220401130442.myegjneyuc7fkfnd@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am Freitag, 1. April 2022, 15:04:42 CEST schrieb Maxime Ripard:
> * PGP Signed by an unknown key
>=20
> On Fri, Apr 01, 2022 at 02:59:37PM +0200, Alexander Stein wrote:
> > Hi Maxime,
> >=20
> > Am Freitag, 1. April 2022, 14:27:36 CEST schrieb Maxime Ripard:
> > > On Fri, Apr 01, 2022 at 01:55:20PM +0200, Alexander Stein wrote:
> > > > Am Donnerstag, 31. M=E4rz 2022, 17:31:34 CEST schrieb Maxime Ripard:
> > > > > > Old Signed by an unknown key
> > > > >=20
> > > > > Hi Tony,
> > > > >=20
> > > > > On Thu, Mar 31, 2022 at 06:00:42PM +0300, Tony Lindgren wrote:
> > > > > > * Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> > > > > > > On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > > > > > > > It seems the dts assigned-clock-parents no longer works now?
> > > > > > >=20
> > > > > > > That would make some kind of sense, __set_clk_parents calls
> > > > > > > clk_put
> > > > > > > on
> > > > > > > both the assigned clock and its parent.
> > > > > > >=20
> > > > > > > Could you see what parent (and why?) it tries to enforce then?
> > > > > >=20
> > > > > > It picks the other option available for the mux clock that only
> > > > > > has
> > > > > > two options. No idea why, but if you have some debug patch in m=
ind
> > > > > > I
> > > > > > can give it a try.
> > > > > >=20
> > > > > > > It looks like the gpt1_fck driver might favor another parent =
for
> > > > > > > that
> > > > > > > rate, which, if it's an invalid configuration, shouldn't real=
ly
> > > > > > > happen?
> > > > > >=20
> > > > > > Hmm there's a gate clock and a mux clock, there's not really a
> > > > > > rate
> > > > > > selection available here for the sources.
> > > > >=20
> > > > > If I followed the OMAP driver properly, clk_mux_determine_rate_fl=
ags
> > > > > is
> > > > > doing the heavy lifting, could you run your test with
> > > >=20
> > > > I'm affected by this patch as well on an imx8mp platform (see [1] f=
or
> > > > some
> > > > details)
> > > >=20
> > > > In the failing case with with your patch applied I get the following
> > > > error
> > > > ---
> > > > [    0.661064] clk_set_rate_range_nolock: core req rate 500000000
> > > > [    0.664084] clk_set_rate_range_nolock: clamped rate 500000000
> > > > [    0.669851] clk_core_set_rate_nolock: rate 500000000
> > > > [    0.674843] clk_core_set_rate_nolock: rounded rate 500000000
> > > > [    0.680536] clk_set_rate_range_nolock: core req rate 800000000
> > > > [    0.686389] clk_set_rate_range_nolock: clamped rate 800000000
> > > > [    0.692164] clk_core_set_rate_nolock: rate 800000000
> > > > [    0.697153] clk_mux_determine_rate_flags: requested rate 8000000=
00
> > > > [    0.703363] clk_mux_determine_rate_flags: current parent sys_pll1
> > > > [    0.709487] clk_mux_determine_rate_flags: current parent rate
> > > > 800000000
> > > > [    0.716147] Unable to handle kernel NULL pointer dereference at
> > > > virtual
> > > > address 0000000000000000
> > > > [    0.724977] Mem abort info:
> > > > [    0.727775]   ESR =3D 0x96000004
> > > > [    0.730835]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > > > [    0.736177]   SET =3D 0, FnV =3D 0
> > > > [    0.739239]   EA =3D 0, S1PTW =3D 0
> > > > [    0.742382]   FSC =3D 0x04: level 0 translation fault
> > > > [    0.747287] Data abort info:
> > > > [    0.750172]   ISV =3D 0, ISS =3D 0x00000004
> > > > [    0.754027]   CM =3D 0, WnR =3D 0
> > > > [    0.757002] [0000000000000000] user address but active_mm is
> > > > swapper
> > > > [    0.763394] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > > > [    0.768985] Modules linked in:
> > > > [    0.772049] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> > > > 5.17.0-next-20220331+ #48 8e9d24095c7f6b15f85bc2ad57a5609e219130b9
> > > > [    0.782984] Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on
> > > > MBa8MPxL
> > > > (DT) [    0.789985] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT
> > > > -SSBS
> > > > BTYPE=3D--) [    0.796985] pc : clk_mux_determine_rate_flags+0x280/=
0x2cc
> > > > [    0.802407] lr : clk_mux_determine_rate_flags+0xf4/0x2cc
> > > > [    0.807747] sp : ffff800009ceb590
> > > > [    0.811072] x29: ffff800009ceb590 x28: ffff800009ceb6a0 x27:
> > > > ffff800008eaa038
> > > > [    0.818245] x26: ffff8000092fe0b0 x25: ffff000000090000 x24:
> > > > ffff000000090000
> > > > [    0.825420] x23: 0000000000000000 x22: ffff800008ea95d8 x21:
> > > > ffff0000028f4700
> > > > [    0.832595] x20: 000000002faf0800 x19: 0000000000000000 x18:
> > > > 0000000000004590
> > > > [    0.839770] x17: 0000000000004570 x16: 0000000000004560 x15:
> > > > ffff8000092ff250
> > > > [    0.846945] x14: 0000000000000000 x13: 3030303030303030 x12:
> > > > 3820657461722074
> > > > [    0.854120] x11: 6e6572617020746e x10: 6572727563203a73 x9 :
> > > > 7563203a7367616c
> > > > [    0.861295] x8 : 665f657461725f65 x7 : 205d373834393037 x6 :
> > > > ffff800009a947c8
> > > > [    0.868472] x5 : ffff800008eafe68 x4 : 0000000000000009 x3 :
> > > > 000000002faf0800
> > > > [    0.875645] x2 : ffff800008eafef4 x1 : ffff800008eaa038 x0 :
> > > > ffff8000092fd5b8
> > > > [    0.882822] Call trace:
> > > > [    0.885273]  clk_mux_determine_rate_flags+0x280/0x2cc
> > > > [    0.890347]  clk_mux_determine_rate+0x10/0x20
> > > > [    0.894720]  clk_core_determine_round_nolock+0x4c/0xb4
> > > > [    0.899882]  clk_core_round_rate_nolock+0x30/0x80
> > > > [    0.904607]  clk_core_round_rate_nolock+0x70/0x80
> > > > [    0.909334]  clk_hw_round_rate+0x44/0x74
> > > > [    0.913270]  clk_factor_round_rate+0x60/0x80
> > > > [    0.917557]  clk_core_determine_round_nolock+0x88/0xb4
> > > > [    0.922720]  clk_core_round_rate_nolock+0x30/0x80
> > > > [    0.927445]  clk_core_set_rate_nolock.part.0+0xa4/0x1d0
> > > > [    0.932695]  clk_set_rate_range_nolock+0x234/0x244
> > > > [    0.937507]  __clk_put+0x60/0x12c
> > > > [    0.940834]  clk_put+0xc/0x1c
> > > > [    0.943809]  __set_clk_parents+0x12c/0x244
> > > > [    0.947920]  of_clk_set_defaults+0x20/0x50
> > > > [    0.952032]  of_clk_add_hw_provider.part.0+0x94/0x120
> > > > [    0.957107]  of_clk_add_hw_provider+0x10/0x20
> > > > [    0.961482]  imx8mp_clocks_probe+0x3458/0x34d0
> > > > [    0.965945]  platform_probe+0x64/0x100
> > > > [    0.969707]  call_driver_probe+0x28/0x130
> > > > [    0.973732]  really_probe+0x178/0x310
> > > > [    0.977409]  __driver_probe_device+0xfc/0x144
> > > > [    0.981782]  driver_probe_device+0x38/0x12c
> > > > [    0.985982]  __driver_attach+0xcc/0x220
> > > > [    0.989834]  bus_for_each_dev+0x6c/0xc0
> > > > [    0.993682]  driver_attach+0x20/0x2c
> > > > [    0.997270]  bus_add_driver+0x140/0x230
> > > > [    1.001120]  driver_register+0x74/0x120
> > > > [    1.004970]  __platform_driver_register+0x24/0x30
> > > > [    1.009697]  imx8mp_clk_driver_init+0x18/0x20
> > > > [    1.014070]  do_one_initcall+0x58/0x200
> > > > [    1.017920]  do_initcalls+0x164/0x19c
> > > > [    1.021597]  kernel_init_freeable+0x134/0x17c
> > > > [    1.025970]  kernel_init+0x2c/0x150
> > > > [    1.029470]  ret_from_fork+0x10/0x20
> > > > [    1.033065] Code: f9000f94 912982c1 b0002900 9116e000 (f9400262)
> > > > [    1.039188] ---[ end trace 0000000000000000 ]---
> > > > [    1.043869] Kernel panic - not syncing: Attempted to kill init!
> > > > exitcode=3D0x0000000b
> > > > [    1.051523] SMP: stopping secondary CPUs
> > > > [    1.055467] Kernel Offset: disabled
> > > > [    1.058960] CPU features: 0x000,00020009,00001082
> > > > [    1.063684] Memory Limit: none
> > > > [    1.066748] ---[ end Kernel panic - not syncing: Attempted to ki=
ll
> > > > init!
> > > > exitcode=3D0x0000000b ]---
> > > > ---
> > > >=20
> > > > With the $subject patch reverted and bootable system:
> > > > ---
> > > > [    0.659922] clk_core_set_rate_nolock: rate 1000000000
> > > > [    0.662154] clk_core_set_rate_nolock: rounded rate 1000000000
> > > > [    0.667932] clk_core_set_rate_nolock: rate 800000000
> > > > [    0.672918] clk_core_set_rate_nolock: rounded rate 800000000
> > > > [    0.678601] clk_core_set_rate_nolock: rate 500000000
> > > > [    0.683592] clk_core_set_rate_nolock: rounded rate 500000000
> > > > [    0.689276] clk_core_set_rate_nolock: rate 400000000
> > > > [    0.694267] clk_core_set_rate_nolock: rounded rate 400000000
> > > > [    0.699980] clk_core_set_rate_nolock: rate 800000000
> > > > [    0.704942] clk_core_set_rate_nolock: rounded rate 800000000
> > > > [    0.710627] clk_core_set_rate_nolock: rate 393216000
> > > > [    0.715611] clk_core_set_rate_nolock: rounded rate 393216000
> > > > [    0.721815] clk_core_set_rate_nolock: rate 361267200
> > > > [    0.726284] clk_core_set_rate_nolock: rounded rate 361267200
> > > > [    0.734097] clk_core_set_rate_nolock: rate 800000000
> > > > [    0.736977] clk_core_set_rate_nolock: rounded rate 800000000
> > > > [    0.742652] clk_core_set_rate_nolock: rate 400000000
> > > > [    0.747645] clk_core_set_rate_nolock: rounded rate 400000000
> > > > [    0.754565] clk_core_set_rate_nolock: rate 500000000
> > > > [    0.758331] clk_core_set_rate_nolock: rounded rate 500000000
> > > > [    0.764688] SoC: i.MX8MP revision 1.1
> > > > [    0.767931] clk_core_set_rate_nolock: rate 500000000
> > > > [    0.772675] clk_core_set_rate_nolock: rounded rate 500000000
> > > > [    0.778354] clk_core_set_rate_nolock: rate 200000000
> > > > [    0.783351] clk_core_set_rate_nolock: rounded rate 200000000
> > > > [    0.793748] Serial: 8250/16550 driver, 4 ports, IRQ sharing enab=
led
> > > > [    0.798952] 30860000.serial: ttymxc0 at MMIO 0x30860000 (irq =3D=
 34,
> > > > base_baud =3D 5000000) is a IMX
> > > > [    0.806527] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq =3D=
 35,
> > > > base_baud =3D 5000000) is a IMX
> > > > [    0.815329] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D=
 36,
> > > > base_baud =3D 5000000) is a IMX
> > > > [    0.824176] 30a60000.serial: ttymxc3 at MMIO 0x30a60000 (irq =3D=
 43,
> > > > base_baud =3D 1500000) is a IMX
> > > > [    0.832588] printk: console [ttymxc3] enabled
> > > > [    0.832588] printk: console [ttymxc3] enabled
> > > > [    0.841244] printk: bootconsole [ec_imx6q0] disabled
> > > > [    0.841244] printk: bootconsole [ec_imx6q0] disabled
> > > > [    0.857871] clk_core_set_rate_nolock: rate 80000000
> > > > [    0.862796] clk_core_set_rate_nolock: rounded rate 80000000
> > > > [    0.868469] clk_core_set_rate_nolock: rate 20000000
> > > > [    0.873364] clk_core_set_rate_nolock: rounded rate 20000000
> > > > [    0.879258] clk_core_set_rate_nolock: rate 80000000
> > > > [    0.884154] clk_core_set_rate_nolock: rounded rate 80000000
> > > > [...]
> > > > ---
> > > >=20
> > > > The 500000000 and 800000000 look a bit like the assigned-clock-rates
> > > > for
> > > > clock-controller@30380000 in arch/arm64/boot/dts/freescale/imx8mp.d=
tsi
> > > >=20
> > > > If you need some more information, do not hesitate to ask
> > >=20
> > > Thanks a lot to you three for all your testing. I think I know what
> > > might be going on:
> > >=20
> > > We use the last requested rate on clk_set_rate_range
> > > (clk_core.req_rate), and that requested rate if the clock is orphan w=
ill
> > > be set to 0, so if we were to call clk_set_rate_range before the pare=
nt
> > > clock is registered, we would effectively call a clk_set_rate to 0
> > >=20
> > > And the assigned-clocks stuff is handled by __set_clk_parents and
> > > __set_clk_rates, called by of_clk_set_defaults(), in turn called by
> > > of_clk_init and of_clk_add_provider. Both __set_clk_parents and
> > > __set_clk_rates will call clk_put once done with the clock, and we wi=
ll
> > > with this patch trigger the clk_set_rate to 0 I mentioned before.
> > >=20
> > > So we just became very good at triggering the underlying issue :)
> > >=20
> > > And I think it's that while we update the requested rate when the
> > > missing parent is registered, we never do when we mux away from it us=
ing
> > > clk_set_parent.
> > >=20
> > > Could you test the following patch and let me know if it works?
> > >=20
> > > --->8---
> > >=20
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 91f863b7a824..ee5a0223e47d 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -2599,6 +2599,8 @@ static int clk_core_set_parent_nolock(struct
> > > clk_core
> > > *core, } else {
> > >=20
> > >  		__clk_recalc_rates(core, POST_RATE_CHANGE);
> > >  		__clk_recalc_accuracies(core);
> > >=20
> > > +
> > > +		core->req_rate =3D core->rate;
> > >=20
> > >  	}
> > > =20
> > >  runtime_put:
> > > --->8---
> >=20
> > Thanks for the patch. Unfortunately it does not help in my case. Here is
> > the output form the other patch. It's the same clock (sys_pll1) but a
> > different rate for the first calls.
> >=20
> > ---
> > [    0.658706] clk_set_rate_range_nolock: core req rate 800000000
> > [    0.661715] clk_set_rate_range_nolock: clamped rate 800000000
> > [    0.667496] clk_core_set_rate_nolock: rate 800000000
> > [    0.672485] clk_core_set_rate_nolock: rounded rate 800000000
> > [    0.678171] clk_set_rate_range_nolock: core req rate 800000000
> > [    0.684033] clk_set_rate_range_nolock: clamped rate 800000000
> > [    0.689804] clk_core_set_rate_nolock: rate 800000000
> > [    0.694795] clk_mux_determine_rate_flags: requested rate 800000000
> > [    0.701005] clk_mux_determine_rate_flags: current parent sys_pll1
> > [    0.707130] clk_mux_determine_rate_flags: current parent rate 800000=
000
> > [    0.713789] Unable to handle kernel NULL pointer dereference at virt=
ual
> > address 0000000000000000
> > [    0.722618] Mem abort info:
> > [    0.725411]   ESR =3D 0x96000004
> > [    0.728483]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [    0.733822]   SET =3D 0, FnV =3D 0
> > [    0.736879]   EA =3D 0, S1PTW =3D 0
> > [    0.740032]   FSC =3D 0x04: level 0 translation fault
> > [    0.744930] Data abort info:
> > [    0.747820]   ISV =3D 0, ISS =3D 0x00000004
> > [    0.751666]   CM =3D 0, WnR =3D 0
> > [    0.754645] [0000000000000000] user address but active_mm is swapper
> > [    0.761034] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > [    0.766627] Modules linked in:
> > [    0.769690] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
> > 5.17.0-next-20220331+ #51 62b66a4e908a3493b6d37735830c8ba1462e0fc9
> > [    0.780625] Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP=
xL
> > (DT) [    0.787627] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SS=
BS
> > BTYPE=3D--) [    0.794625] pc : clk_mux_determine_rate_flags+0x280/0x2cc
> > [    0.800049] lr : clk_mux_determine_rate_flags+0xf4/0x2cc
> > [    0.805388] sp : ffff800009ceb590
> > [    0.808713] x29: ffff800009ceb590 x28: ffff800009ceb6a0 x27:
> > ffff800008eaa038
> > [    0.815886] x26: ffff8000092fe090 x25: ffff000000090000 x24:
> > ffff000000090000
> > [    0.823061] x23: 0000000000000000 x22: ffff800008ea95d8 x21:
> > ffff000002aab700
> > [    0.830236] x20: 000000002faf0800 x19: 0000000000000000 x18:
> > 0000000000004590
> > [    0.837411] x17: 0000000000004570 x16: 0000000000004560 x15:
> > ffff8000092ff230
> > [    0.844586] x14: 0000000000000000 x13: 3030303030303030 x12:
> > 3820657461722074
> > [    0.851761] x11: 6e6572617020746e x10: 6572727563203a73 x9 :
> > 7563203a7367616c
> > [    0.858936] x8 : 665f657461725f65 x7 : 205d303331373037 x6 :
> > ffff800009a947c8
> > [    0.866113] x5 : ffff800008eafe68 x4 : 0000000000000009 x3 :
> > 000000002faf0800
> > [    0.873286] x2 : ffff800008eafef4 x1 : ffff800008eaa038 x0 :
> > ffff8000092fd598
> > [    0.880464] Call trace:
> > [    0.882914]  clk_mux_determine_rate_flags+0x280/0x2cc
> > [    0.887989]  clk_mux_determine_rate+0x10/0x20
> > [    0.892361]  clk_core_determine_round_nolock+0x4c/0xb4
> > [    0.897524]  clk_core_round_rate_nolock+0x30/0x80
> > [    0.902249]  clk_core_round_rate_nolock+0x70/0x80
> > [    0.906976]  clk_hw_round_rate+0x44/0x74
> > [    0.910911]  clk_factor_round_rate+0x60/0x80
> > [    0.915199]  clk_core_determine_round_nolock+0x88/0xb4
> > [    0.920361]  clk_core_round_rate_nolock+0x30/0x80
> > [    0.925086]  clk_core_set_rate_nolock.part.0+0xa4/0x1d0
> > [    0.930336]  clk_set_rate_range_nolock+0x234/0x244
> > [    0.935149]  __clk_put+0x60/0x12c
> > [    0.938474]  clk_put+0xc/0x1c
> > [    0.941451]  __set_clk_parents+0x12c/0x244
> > [    0.945561]  of_clk_set_defaults+0x20/0x50
> > [    0.949674]  of_clk_add_hw_provider.part.0+0x94/0x120
> > [    0.954750]  of_clk_add_hw_provider+0x10/0x20
> > [    0.959124]  imx8mp_clocks_probe+0x3458/0x34d0
> > [    0.963586]  platform_probe+0x64/0x100
> > [    0.967349]  call_driver_probe+0x28/0x130
> > [    0.971374]  really_probe+0x178/0x310
> > [    0.975051]  __driver_probe_device+0xfc/0x144
> > [    0.979424]  driver_probe_device+0x38/0x12c
> > [    0.983624]  __driver_attach+0xcc/0x220
> > [    0.987476]  bus_for_each_dev+0x6c/0xc0
> > [    0.991324]  driver_attach+0x20/0x2c
> > [    0.994911]  bus_add_driver+0x140/0x230
> > [    0.998761]  driver_register+0x74/0x120
> > [    1.002611]  __platform_driver_register+0x24/0x30
> > [    1.007338]  imx8mp_clk_driver_init+0x18/0x20
> > [    1.011711]  do_one_initcall+0x58/0x200
> > [    1.015561]  do_initcalls+0x164/0x19c
> > [    1.019238]  kernel_init_freeable+0x134/0x17c
> > [    1.023613]  kernel_init+0x2c/0x150
> > [    1.027111]  ret_from_fork+0x10/0x20
> > [    1.030705] Code: f9000f94 912982c1 d0002900 91166000 (f9400262)
> > [    1.036829] ---[ end trace 0000000000000000 ]---
> > [    1.041512] Kernel panic - not syncing: Attempted to kill init!
> > exitcode=3D0x0000000b
> > [    1.049164] SMP: stopping secondary CPUs
> > [    1.053108] Kernel Offset: disabled
> > [    1.056600] CPU features: 0x000,00020009,00001082
> > [    1.061326] Memory Limit: none
> > [    1.064390] ---[ end Kernel panic - not syncing: Attempted to kill
> > init!
> > exitcode=3D0x0000000b ]---
>=20
> Does it also happen if you only apply the patch I had above, and not all
> the debugging?

Yes, these are the last lines I see:
=2D--
[    1.236306] mmcblk0rpmb: mmc0:0001 DA6016 4.00 MiB, chardev (235:0)     =
                                                         =20
[    1.241031] i2c i2c-1: IMX I2C adapter registered                       =
                                                         =20
[    1.251771] i2c i2c-3: IMX I2C adapter registered                       =
                                                         =20
[    1.256957] i2c i2c-5: IMX I2C adapter registered
=2D--

Alexander


