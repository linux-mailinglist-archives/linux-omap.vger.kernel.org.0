Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28634EF5A7
	for <lists+linux-omap@lfdr.de>; Fri,  1 Apr 2022 17:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345129AbiDAPPb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Apr 2022 11:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354512AbiDAPMC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Apr 2022 11:12:02 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEC025C5A6;
        Fri,  1 Apr 2022 07:55:08 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 44FA63200495;
        Fri,  1 Apr 2022 10:55:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 01 Apr 2022 10:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=b3sW/zxrTNI5mGYD6OwwiVLtKzO/UqouF6I/36
        WEYvc=; b=h94YP8PWKKknj5pHzt7x/7ooZA3eHrNU0oDZIlJ3JESMbpDJzpclA9
        SljWX7QQzPqgKFNAnhAikrpjxcanyW8k453or1kFPL8hrso6dC0O4E1vWZJ/2ay7
        Q1IekNmjHbDPanSsTJ/W0/8ZyiNlEcdppWe+OEiWyOkRmCy4os9Y1B3Nb4uO1OVY
        lHVcBZuDAu6dmZVERdQsM7ufoj9GNn1+ZuwT5pspOb8JDos4sMGIHa5jEdB5OliY
        lqDXL5C9BzrmEaZbn7XosYlxrGLKKYbmoM4+raXEkhZNyTSIpOBG1MyYh+Y9x6wI
        /hZ2810CYUR4AQeqzsznzLMgM68QRvdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=b3sW/zxrTNI5mGYD6
        OwwiVLtKzO/UqouF6I/36WEYvc=; b=MMuybD7ZmyZty6vKIQXFW38dqSdy8887X
        D+ytbXh1GrTrOMYrdnIR9SBQEId2LmWt78zoaYaSwkgAlfXtrPst1tnRKn3Lnoyz
        3KWO6kkf8bvu49dPxdt2QYPyxQ8jsWuZn/28xuLigmE/OScF5sG77V93CyszaAxV
        HEClhwzvYOieZCMjNVKUUY+Xg2hQTu1A3KJoaWrseLjY4UbEJYvtT9Hf6jbmcBfd
        FaObY/3eNR0nOdnqWRmWpM5EoDqzFlKOA88Gb46g4wOm84c40ZEQiyK2WZnfhSCB
        IeuMilsDNRAaYNQFhfcOP8pS2lnXLsM8Ij+UIJ7EDvsa22Ix1IR4Q==
X-ME-Sender: <xms:SRJHYo3Vz3jpowVFvSt-TvBSumqqZZL-zCDH57-DmKs7PN8FofofFQ>
    <xme:SRJHYjG3TJa7XachHfo0MPFarXd6-r2aPezN9RkillEtsGlcwumxII3fsLxLJPgSL
    YE7UWVUI_D175i43wc>
X-ME-Received: <xmr:SRJHYg5ezEEeD0dKdQQ4sH259waC_he0zKoiQWD2kfVG92905ehGRXDhpp7GHATjMSpgNHu5JWtaHTWNPSYbzjdhhssZl4QzdtNPyx8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SRJHYh0MUL5gylxf5sXsVSiqO_vepwx7GsAB4oygRhq8zJezleug5A>
    <xmx:SRJHYrH69n8a3rXwN-UeUGQUnLjhZJXG235CR1YgVJa83vwxF130ig>
    <xmx:SRJHYq9fdnuaJaBd9ZYoCX03yemx1L3VU0Qif4aYIV1tZCd_CnJZew>
    <xmx:ShJHYiBupGxUKQwN9f7aHJunJaDBWNmA-8q1hZfaEilZj8N256UNUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 10:55:05 -0400 (EDT)
Date:   Fri, 1 Apr 2022 16:55:02 +0200
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
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: [PATCH v2 3/3] clk: Drop
 the rate range on clk_put
Message-ID: <20220401145502.5hnilpku3qh77bvs@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <2823402.e9J7NaK4W3@steina-w>
 <20220401133409.wtilnpgp4fqlrrew@houat>
 <14273141.O9o76ZdvQC@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3zpagsxfrtqefzpw"
Content-Disposition: inline
In-Reply-To: <14273141.O9o76ZdvQC@steina-w>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--3zpagsxfrtqefzpw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2022 at 03:49:04PM +0200, Alexander Stein wrote:
> Am Freitag, 1. April 2022, 15:34:09 CEST schrieb Maxime Ripard:
> > * PGP Signed by an unknown key
> >=20
> > On Fri, Apr 01, 2022 at 03:07:10PM +0200, Alexander Stein wrote:
> > > > Does it also happen if you only apply the patch I had above, and no=
t all
> > > > the debugging?
> > >=20
> > > Yes, these are the last lines I see:
> > > ---
> > > [    1.236306] mmcblk0rpmb: mmc0:0001 DA6016 4.00 MiB, chardev (235:0)
> > > [    1.241031] i2c i2c-1: IMX I2C adapter registered
> > > [    1.251771] i2c i2c-3: IMX I2C adapter registered
> > > [    1.256957] i2c i2c-5: IMX I2C adapter registered
> >=20
> > Could you add on top of next (so dropping everything we did so far)
> >=20
> > ---- >8 -----
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 91f863b7a824..552b1e16a82d 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -540,6 +540,8 @@ static bool mux_is_better_rate(unsigned long rate,
> > unsigned long now, if (flags & CLK_MUX_ROUND_CLOSEST)
> >  		return abs(now - rate) < abs(best - rate);
> >=20
> > +	pr_crit("%s +%d rate %lu now %lu best %lu\n", __func__, __LINE__,=20
> rate,
> > now, best); +
> >  	return now <=3D rate && now > best;
> >  }
> >=20
> > @@ -552,6 +554,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
> >  	unsigned long best =3D 0;
> >  	struct clk_rate_request parent_req =3D *req;
> >=20
> > +	pr_crit("%s: %s: requested rate %lu\n", __func__, core->name, req-
> >rate);
> > +
> > +	parent =3D core->parent;
> > +	pr_crit("%s: %s: current parent %s\n", __func__, core->name, parent=
=20
> ?
> > parent->name : "(null)"); +	pr_crit("%s: %s: current parent rate %lu\n",
> > __func__, core->name, clk_core_get_rate_nolock(parent)); +
> >  	/* if NO_REPARENT flag set, pass through to current parent */
> >  	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
> >  		parent =3D core->parent;
> > @@ -578,24 +586,37 @@ int clk_mux_determine_rate_flags(struct clk_hw *h=
w,
> >  		if (!parent)
> >  			continue;
> >=20
> > +		pr_crit("%s: Trying parent %s (%lu)\n",
> > +			__func__,
> > +			parent->name,
> > +			clk_core_get_rate_nolock(parent));
> > +
> >  		if (core->flags & CLK_SET_RATE_PARENT) {
> > +			pr_crit("%s +%d\n", __func__, __LINE__);
> >  			parent_req =3D *req;
> >  			ret =3D __clk_determine_rate(parent->hw,=20
> &parent_req);
> > +			pr_crit("%s +%d %d\n", __func__, __LINE__,=20
> ret);
> >  			if (ret)
> >  				continue;
> >  		} else {
> > +			pr_crit("%s +%d\n", __func__, __LINE__);
> >  			parent_req.rate =3D=20
> clk_core_get_rate_nolock(parent);
> >  		}
> >=20
> > +		pr_crit("%s +%d\n", __func__, __LINE__);
> > +
> >  		if (mux_is_better_rate(req->rate, parent_req.rate,
> >  				       best, flags)) {
> > +			pr_crit("%s +%d\n", __func__, __LINE__);
> >  			best_parent =3D parent;
> >  			best =3D parent_req.rate;
> >  		}
> >  	}
> >=20
> > -	if (!best_parent)
> > +	if (!best_parent) {
> > +		pr_crit("%s +%d\n", __func__, __LINE__);
> >  		return -EINVAL;
> > +	}
> >=20
> >  out:
> >  	if (best_parent)
> > @@ -603,6 +624,11 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
> >  	req->best_parent_rate =3D best;
> >  	req->rate =3D best;
> >=20
> > +	pr_crit("%s: Best parent %s (%lu)\n",
> > +		__func__,
> > +		best_parent->name,
> > +		best);
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(clk_mux_determine_rate_flags);
> > @@ -1345,11 +1371,15 @@ static int clk_core_determine_round_nolock(stru=
ct
> > clk_core *core,
> >=20
> >  	lockdep_assert_held(&prepare_lock);
> >=20
> > +	pr_crit("%s +%d %s\n", __func__, __LINE__, core->name);
> >  	if (!core)
> >  		return 0;
> >=20
> > +	pr_crit("%s +%d\n", __func__, __LINE__);
> >  	req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
> >=20
> > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > +
> >  	/*
> >  	 * At this point, core protection will be disabled
> >  	 * - if the provider is not protected at all
> > @@ -1357,10 +1387,13 @@ static int clk_core_determine_round_nolock(stru=
ct
> > clk_core *core, *   over the provider
> >  	 */
> >  	if (clk_core_rate_is_protected(core)) {
> > +		pr_crit("%s +%d\n", __func__, __LINE__);
> >  		req->rate =3D core->rate;
> >  	} else if (core->ops->determine_rate) {
> > +		pr_crit("%s +%d\n", __func__, __LINE__);
> >  		return core->ops->determine_rate(core->hw, req);
> >  	} else if (core->ops->round_rate) {
> > +		pr_crit("%s +%d\n", __func__, __LINE__);
> >  		rate =3D core->ops->round_rate(core->hw, req->rate,
> >  					     &req-
> >best_parent_rate);
> >  		if (rate < 0)
> > @@ -1368,6 +1401,7 @@ static int clk_core_determine_round_nolock(struct
> > clk_core *core,
> >=20
> >  		req->rate =3D rate;
> >  	} else {
> > +		pr_crit("%s +%d\n", __func__, __LINE__);
> >  		return -EINVAL;
> >  	}
> >=20
> > @@ -1402,17 +1436,26 @@ static int clk_core_round_rate_nolock(struct
> > clk_core *core, {
> >  	lockdep_assert_held(&prepare_lock);
> >=20
> > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > +
> >  	if (!core) {
> >  		req->rate =3D 0;
> >  		return 0;
> >  	}
> >=20
> > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > +
> >  	clk_core_init_rate_req(core, req);
> >=20
> > -	if (clk_core_can_round(core))
> > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > +
> > +	if (clk_core_can_round(core)) {
> > +		pr_crit("%s +%d\n", __func__, __LINE__);
> >  		return clk_core_determine_round_nolock(core, req);
> > -	else if (core->flags & CLK_SET_RATE_PARENT)
> > +	} else if (core->flags & CLK_SET_RATE_PARENT) {
> > +		pr_crit("%s +%d\n", __func__, __LINE__);
> >  		return clk_core_round_rate_nolock(core->parent, req);
> > +	}
> >=20
> >  	req->rate =3D core->rate;
> >  	return 0;
> > @@ -2201,21 +2244,31 @@ static int clk_core_set_rate_nolock(struct clk_=
core
> > *core, if (!core)
> >  		return 0;
> >=20
> > +	pr_crit("%s: %s: rate %lu\n", __func__, core->name, req_rate);
> > +
> >  	rate =3D clk_core_req_round_rate_nolock(core, req_rate);
> >=20
> > +	pr_crit("%s: %s: rounded rate %lu\n", __func__, core->name,=20
> req_rate);
> > +
> >  	/* bail early if nothing to do */
> >  	if (rate =3D=3D clk_core_get_rate_nolock(core))
> >  		return 0;
> >=20
> > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > +
> >  	/* fail on a direct rate set of a protected provider */
> >  	if (clk_core_rate_is_protected(core))
> >  		return -EBUSY;
> >=20
> > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > +
> >  	/* calculate new rates and get the topmost changed clock */
> >  	top =3D clk_calc_new_rates(core, req_rate);
> >  	if (!top)
> >  		return -EINVAL;
> >=20
> > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > +
> >  	ret =3D clk_pm_runtime_get(core);
> >  	if (ret)
> >  		return ret;
> > @@ -2367,6 +2420,16 @@ static int clk_set_rate_range_nolock(struct clk =
*clk,
> > goto out;
> >  	}
> >=20
> > +	pr_crit("%s: %s: orphan ? %c\n",
> > +		__func__,
> > +		clk->core->name,
> > +		clk->core->orphan ? 'y' : 'n');
> > +
> > +	pr_crit("%s: %s: core req rate %lu\n",
> > +		__func__,
> > +		clk->core->name,
> > +		clk->core->req_rate);
> > +
> >  	/*
> >  	 * Since the boundaries have been changed, let's give the
> >  	 * opportunity to the provider to adjust the clock rate based on
> > @@ -2384,7 +2447,11 @@ static int clk_set_rate_range_nolock(struct clk =
*clk,
> > * - the determine_rate() callback does not really check for
> >  	 *   this corner case when determining the rate
> >  	 */
> > +
> >  	rate =3D clamp(clk->core->req_rate, min, max);
> > +
> > +	pr_crit("%s: %s: clamped rate %lu\n", __func__, clk->core->name,=20
> rate);
> > +
> >  	ret =3D clk_core_set_rate_nolock(clk->core, rate);
> >  	if (ret) {
> >  		/* rollback the changes */
> > @@ -2599,6 +2666,8 @@ static int clk_core_set_parent_nolock(struct clk_=
core
> > *core, } else {
> >  		__clk_recalc_rates(core, POST_RATE_CHANGE);
> >  		__clk_recalc_accuracies(core);
> > +
> > +		core->req_rate =3D core->rate;
> >  	}
> >=20
> >  runtime_put:
> > ---- >8 -----

So, let's try to follow this through:

> Sure, here we go
> ---
> [    0.630873] Asymmetric key parser 'x509' registered
> [    0.635802] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 243)
> [    0.643210] io scheduler mq-deadline registered
> [    0.647758] io scheduler kyber registered
> [    0.658708] clk_set_rate_range_nolock: arm_a53_div: orphan ? n
> [    0.661717] clk_set_rate_range_nolock: arm_a53_div: core req rate 8000=
00000
> [    0.668724] clk_set_rate_range_nolock: arm_a53_div: clamped rate 80000=
0000

I'm assuming we hit the assigned-clock-parents in the clocks node, and
we try to reparent arm_a53_div / IMX8MP_CLK_A53_SRC to sys_pll1_800m

I'm not entirely sure, but it looks like the arm_a53_div is a gate +
divider, so that it has the same rate than its parent makes sens, and
800MHz for a CPU clock also makes sense.

It's also not an orphan, so it's likely to be a separate issue from Tony
(and thus the fix doesn't help, sorry).

> [    0.675633] clk_core_set_rate_nolock: arm_a53_div: rate 800000000

Now, we set the rate to the same rate, this still makes sense.

> [    0.681761] clk_core_round_rate_nolock +1439
> [    0.686048] clk_core_round_rate_nolock +1446
> [    0.690333] clk_core_round_rate_nolock +1450
> [    0.694619] clk_core_round_rate_nolock +1453
> [    0.698908] clk_core_determine_round_nolock +1374 arm_a53_div

The clock has a round_rate / determine_rate implementation
(clk_divider_round_rate, most likely), thus we call
clk_core_determine_round_nolock()

> [    0.704681] clk_core_determine_round_nolock +1378
> [    0.709408] clk_core_determine_round_nolock +1381
> [    0.714133] clk_core_determine_round_nolock +1393

Still on the right path, we use clk_divider_determine_rate (too bad :)),
it updates the rate

> [    0.718860] clk_core_set_rate_nolock: arm_a53_div: rounded rate 800000=
000

But it didn't change, good. The rounded clock hasn't changed,
clk_core_set_rate_nolock returns, everything's great.

> [    0.725684] clk_set_rate_range_nolock: sys_pll1_800m: orphan ? n
> [    0.731719] clk_set_rate_range_nolock: sys_pll1_800m: core req rate 80=
0000000
> [    0.738894] clk_set_rate_range_nolock: sys_pll1_800m: clamped rate 800=
000000
> [    0.745983] clk_core_set_rate_nolock: sys_pll1_800m: rate 800000000

Then, __set_clk_parents calls clk_put() on the new parent,
sys_pll1_800m, still not an orphan, still with a rate that makes sense.

> [    0.752281] clk_core_round_rate_nolock +1439
> [    0.756569] clk_core_round_rate_nolock +1446
> [    0.760862] clk_core_round_rate_nolock +1450
> [    0.765152] clk_core_round_rate_nolock +1453
> [    0.769435] clk_core_determine_round_nolock +1374 sys_pll1_800m

We still can round the rate, so we go to
clk_core_determine_round_nolock()

> [    0.775385] clk_core_determine_round_nolock +1378
> [    0.780114] clk_core_determine_round_nolock +1381
> [    0.784833] clk_core_determine_round_nolock +1396

But this time using a round_rate implementation: clk_factor_round_rate
(since sys_pll1_800m is a "pure" fixed factor clock). It has the flag
CLK_SET_RATE_PARENT (set in imx_clk_hw_fixed_factor), so
clk_factor_round_rate calls clk_hw_round_rate on its parent
(sys_pll1_out) for the same rate since it has a factor of 1.

> [    0.789559] clk_core_round_rate_nolock +1439
> [    0.793844] clk_core_round_rate_nolock +1446
> [    0.798133] clk_core_round_rate_nolock +1450
> [    0.802423] clk_core_round_rate_nolock +1456

We go through another round_rate cycle here, for sys_pll1_out. It can't
modify the rate (since it's a gate) but it has CLK_SET_RATE_PARENT, so
the rate rounding is forwarded to its parent: sys_pll1_bypass.

> [    0.806708] clk_core_round_rate_nolock +1439
> [    0.810994] clk_core_round_rate_nolock +1446
> [    0.815284] clk_core_round_rate_nolock +1450
> [    0.819570] clk_core_round_rate_nolock +1453

We go through it, and call clk_core_determine_round_nolock again for
sys_pll1_bypass.

> [    0.823856] clk_core_determine_round_nolock +1374 sys_pll1_bypass

Makes total sense so far.

> [    0.829981] clk_core_determine_round_nolock +1378
> [    0.834706] clk_core_determine_round_nolock +1381
> [    0.839431] clk_core_determine_round_nolock +1393
> [    0.844159] clk_mux_determine_rate_flags: sys_pll1_bypass: requested r=
ate 800000000

The requested rate does too. We still have our 800MHz.

> [    0.851856] clk_mux_determine_rate_flags: sys_pll1_bypass: current par=
ent sys_pll1
> [    0.859471] clk_mux_determine_rate_flags: sys_pll1_bypass: current par=
ent rate 800000000

sys_pll1_bypass has CLK_SET_RATE_NO_REPARENT (set by __imx_clk_hw_mux)
and CLK_SET_RATE_PARENT (set by the driver when registering the clock),
so clk_mux_determine_rate_flags will call __clk_determine_rate on its
parent: sys_pll1. __clk_determine_rate then calls
clk_core_round_rate_nolock.

> [    0.867608] clk_core_round_rate_nolock +1439
> [    0.871894] clk_core_round_rate_nolock +1446
> [    0.876182] clk_core_round_rate_nolock +1450
> [    0.880477] clk_core_round_rate_nolock +1453

We call clk_core_determine_round_nolock on sys_pll1

> [    0.884758] clk_core_determine_round_nolock +1374 sys_pll1
> [    0.890273] clk_core_determine_round_nolock +1378
> [    0.894996] clk_core_determine_round_nolock +1381
> [    0.899721] clk_core_determine_round_nolock +1396

sys_pll1 is a clk_pll14xx driver, it has a PLL_1416X type and a rate
table, so it will use clk_pll1416x_ops. It has a round_rate
implementation, clk_pll14xx_round_rate, that doesn't seem to be doing
anything out of the ordinary. My assumption would be that it succeeds
and returns a proper rate.

> [    0.904457] Unable to handle kernel NULL pointer dereference at virtua=
l=20
> address 0000000000000000
> [    0.913285] Mem abort info:
> [    0.916083]   ESR =3D 0x96000004
> [    0.919147]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    0.924484]   SET =3D 0, FnV =3D 0
> [    0.927547]   EA =3D 0, S1PTW =3D 0
> [    0.930697]   FSC =3D 0x04: level 0 translation fault
> [    0.935595] Data abort info:
> [    0.938487]   ISV =3D 0, ISS =3D 0x00000004
> [    0.942334]   CM =3D 0, WnR =3D 0
> [    0.945304] [0000000000000000] user address but active_mm is swapper
> [    0.951696] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    0.957292] Modules linked in:
> [    0.960355] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.17.0-next-2022=
0331+
> #53 da834fe2485dc10e4c2f50265323ce628a30bc5e
> [    0.971291] Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MPxL=
 (DT)
> [    0.978292] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    0.985291] pc : clk_mux_determine_rate_flags+0x33c/0x380
> [    0.990714] lr : clk_mux_determine_rate_flags+0x10c/0x380
> [    0.996141] sp : ffff800009ceb4a0
> [    0.999464] x29: ffff800009ceb4a0 x28: ffff000002cf4700 x27:
> 0000000000000001
> [    1.006639] x26: ffff8000092fe728 x25: ffff800008eaa028 x24:
> ffff800008ea95d8
> [    1.013816] x23: ffff800008ea95d8 x22: ffff000002aab700 x21:
> 000000002faf0800
> [    1.020989] x20: ffff800009ceb640 x19: 0000000000000000 x18:
> 0000000000004590
> [    1.028164] x17: 617220746e657261 x16: 7020746e65727275 x15:
> 63203a7373617079
> [    1.035339] x14: 0000000000000000 x13: 363933312b206b63 x12:
> 6f6c6f6e5f646e75
> [    1.042514] x11: 6f725f656e696d72 x10: 657465645f65726f x9 :
> 206b636f6c6f6e5f
> [    1.049689] x8 : 646e756f725f656e x7 : 205d313237393938 x6 :
> ffff800009a947c8
> [    1.056864] x5 : ffff800008eb0310 x4 : 0000000000000009 x3 :
> 000000002faf0800
> [    1.064039] x2 : ffff800008eb039c x1 : ffff800008eaa028 x0 :
> ffff8000092fd8b8
> [    1.071217] Call trace:
> [    1.073667]  clk_mux_determine_rate_flags+0x33c/0x380
> [    1.078741]  clk_mux_determine_rate+0x10/0x20
> [    1.083115]  clk_core_determine_round_nolock+0xd4/0x140
> [    1.088364]  clk_core_round_rate_nolock+0xac/0xf8
> [    1.093090]  clk_core_round_rate_nolock+0xd4/0xf8
> [    1.097814]  clk_hw_round_rate+0x44/0x7c
> [    1.101751]  clk_factor_round_rate+0x60/0x80
> [    1.106041]  clk_core_determine_round_nolock+0x104/0x140
> [    1.111376]  clk_core_round_rate_nolock+0xac/0xf8
> [    1.116101]  clk_core_set_rate_nolock.part.0+0xac/0x21c
> [    1.121351]  clk_set_rate_range_nolock+0x294/0x2b0

But then, where does this come from?

I'm not entirely sure, but the walk up the clock tree is sane to me.
Could you run

=2E/scripts/faddr2line vmlinux 'clk_mux_determine_rate_flags+0x33c/0x380'

in your kernel compilation directory? (with ARCH and CROSS_COMPILE set
if you're doing cross-compilation)?

My guess would be that we uncovered some other bug there, but I'm not
sure what exactly.

Maxime

--3zpagsxfrtqefzpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkcSRgAKCRDj7w1vZxhR
xS2WAP9k5aAJjAPiyCz2thzcUfZWy1mfqyW1Mj0Pn/C7S2LqRAD/cBvEvLOifj/e
4rpcwZPW3q0ENWJKsV4X4sXn3EkqDgY=
=Nfb5
-----END PGP SIGNATURE-----

--3zpagsxfrtqefzpw--
