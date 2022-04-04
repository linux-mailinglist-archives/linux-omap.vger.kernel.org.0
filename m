Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C614F0FC1
	for <lists+linux-omap@lfdr.de>; Mon,  4 Apr 2022 09:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377598AbiDDHJX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Apr 2022 03:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377596AbiDDHJW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Apr 2022 03:09:22 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E4338DA3;
        Mon,  4 Apr 2022 00:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649056045; x=1680592045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iAoilmi938NkDjazIqW4SZ83Z4fTcvV3SJjP3yOiol4=;
  b=dsfxrVJy5nwL48T1aAInomhRjQbcFl58RuoqG2b46dzJB2/R/Pat00f6
   eynOg1jjXGvNuO0CiJy4nQgF6VaKHZzl+F+VDsiJjRoCmX640Pwr+Ty0s
   ayqyiBuzOsivbfxmrzJSntZ7OkCoq4RY24kyMDOEnvL56yFyACe9IZh0j
   1pj3EA0QthyaYMRyZTWktPXO9yCN0mFiB/x4Wu/nHzuONq/MCWxEN+VsK
   0+W6FLSAfT7wzDiA5cTpSo0xjg/n79GuioITjFpu9hJgjjFOjNYd+bIv5
   QlaM3wm5Od/JdRurS+8OefwMul2feRBrTPSwRE2fV9HgPLX6Tmu048Haw
   g==;
X-IronPort-AV: E=Sophos;i="5.90,233,1643670000"; 
   d="scan'208";a="23064772"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 04 Apr 2022 09:07:22 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 04 Apr 2022 09:07:22 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 04 Apr 2022 09:07:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649056042; x=1680592042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iAoilmi938NkDjazIqW4SZ83Z4fTcvV3SJjP3yOiol4=;
  b=DRZJBOrNx1Yf5pBCzmIWz7GSD946+UULzNUBs9AIbqPmxUzBzp4ykS0b
   OayHdoEWwitpIRaesHiXHPelB58ONzAUMli63Q7tK6JF/zynUH+z1V0d7
   I0yzFFYOoAwWluQWfhEjseXDo4ggD7OUdzwxORPvxuuPtP4saAjzTfLir
   LpQZM8wh5/4Tg2TXdAuLzQcFVZQ6h5eWt4b0zuIBmWJRIcKOZPKLcAlYd
   aA0Y0O9LSlnmS6fvCUoyc/K/zULH1spChAHGNhl0QfnlPKv/bJb+p1LsF
   iFkKdZ4XdDQy/QX7+XmsJcO4wI8v+ISb7+Besu+hBbp0Vekh7UtOywYKU
   A==;
X-IronPort-AV: E=Sophos;i="5.90,233,1643670000"; 
   d="scan'208";a="23064756"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Apr 2022 09:06:45 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 18B7B280065;
        Mon,  4 Apr 2022 09:06:45 +0200 (CEST)
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
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Date:   Mon, 04 Apr 2022 09:06:42 +0200
Message-ID: <4391300.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220401145502.5hnilpku3qh77bvs@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech> <14273141.O9o76ZdvQC@steina-w> <20220401145502.5hnilpku3qh77bvs@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Maxime,

Am Freitag, 1. April 2022, 16:55:02 CEST schrieb Maxime Ripard:
> * PGP Signed by an unknown key
> 
> On Fri, Apr 01, 2022 at 03:49:04PM +0200, Alexander Stein wrote:
> > Am Freitag, 1. April 2022, 15:34:09 CEST schrieb Maxime Ripard:
> > > > Old Signed by an unknown key
> > > 
> > > On Fri, Apr 01, 2022 at 03:07:10PM +0200, Alexander Stein wrote:
> > > > > Does it also happen if you only apply the patch I had above, and not
> > > > > all
> > > > > the debugging?
> > > > 
> > > > Yes, these are the last lines I see:
> > > > ---
> > > > [    1.236306] mmcblk0rpmb: mmc0:0001 DA6016 4.00 MiB, chardev (235:0)
> > > > [    1.241031] i2c i2c-1: IMX I2C adapter registered
> > > > [    1.251771] i2c i2c-3: IMX I2C adapter registered
> > > > [    1.256957] i2c i2c-5: IMX I2C adapter registered
> > > 
> > > Could you add on top of next (so dropping everything we did so far)
> > > 
> > > ---- >8 -----
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 91f863b7a824..552b1e16a82d 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -540,6 +540,8 @@ static bool mux_is_better_rate(unsigned long rate,
> > > unsigned long now, if (flags & CLK_MUX_ROUND_CLOSEST)
> > > 
> > >  		return abs(now - rate) < abs(best - rate);
> > > 
> > > +	pr_crit("%s +%d rate %lu now %lu best %lu\n", __func__, __LINE__,
> > 
> > rate,
> > 
> > > now, best); +
> > > 
> > >  	return now <= rate && now > best;
> > >  
> > >  }
> > > 
> > > @@ -552,6 +554,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
> > > 
> > >  	unsigned long best = 0;
> > >  	struct clk_rate_request parent_req = *req;
> > > 
> > > +	pr_crit("%s: %s: requested rate %lu\n", __func__, core->name, req-
> > >
> > >rate);
> > >
> > > +
> > > +	parent = core->parent;
> > > +	pr_crit("%s: %s: current parent %s\n", __func__, core->name, parent
> > 
> > ?
> > 
> > > parent->name : "(null)"); +	pr_crit("%s: %s: current parent rate %lu\n",
> > > __func__, core->name, clk_core_get_rate_nolock(parent)); +
> > > 
> > >  	/* if NO_REPARENT flag set, pass through to current parent */
> > >  	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
> > >  	
> > >  		parent = core->parent;
> > > 
> > > @@ -578,24 +586,37 @@ int clk_mux_determine_rate_flags(struct clk_hw
> > > *hw,
> > > 
> > >  		if (!parent)
> > >  		
> > >  			continue;
> > > 
> > > +		pr_crit("%s: Trying parent %s (%lu)\n",
> > > +			__func__,
> > > +			parent->name,
> > > +			clk_core_get_rate_nolock(parent));
> > > +
> > > 
> > >  		if (core->flags & CLK_SET_RATE_PARENT) {
> > > 
> > > +			pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  			parent_req = *req;
> > >  			ret = __clk_determine_rate(parent->hw,
> > 
> > &parent_req);
> > 
> > > +			pr_crit("%s +%d %d\n", __func__, __LINE__,
> > 
> > ret);
> > 
> > >  			if (ret)
> > >  			
> > >  				continue;
> > >  		
> > >  		} else {
> > > 
> > > +			pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  			parent_req.rate =
> > 
> > clk_core_get_rate_nolock(parent);
> > 
> > >  		}
> > > 
> > > +		pr_crit("%s +%d\n", __func__, __LINE__);
> > > +
> > > 
> > >  		if (mux_is_better_rate(req->rate, parent_req.rate,
> > >  		
> > >  				       best, flags)) {
> > > 
> > > +			pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  			best_parent = parent;
> > >  			best = parent_req.rate;
> > >  		
> > >  		}
> > >  	
> > >  	}
> > > 
> > > -	if (!best_parent)
> > > +	if (!best_parent) {
> > > +		pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  		return -EINVAL;
> > > 
> > > +	}
> > > 
> > >  out:
> > >  	if (best_parent)
> > > 
> > > @@ -603,6 +624,11 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
> > > 
> > >  	req->best_parent_rate = best;
> > >  	req->rate = best;
> > > 
> > > +	pr_crit("%s: Best parent %s (%lu)\n",
> > > +		__func__,
> > > +		best_parent->name,
> > > +		best);
> > > +
> > > 
> > >  	return 0;
> > >  
> > >  }
> > >  EXPORT_SYMBOL_GPL(clk_mux_determine_rate_flags);
> > > 
> > > @@ -1345,11 +1371,15 @@ static int
> > > clk_core_determine_round_nolock(struct
> > > clk_core *core,
> > > 
> > >  	lockdep_assert_held(&prepare_lock);
> > > 
> > > +	pr_crit("%s +%d %s\n", __func__, __LINE__, core->name);
> > > 
> > >  	if (!core)
> > >  	
> > >  		return 0;
> > > 
> > > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
> > > 
> > > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > > +
> > > 
> > >  	/*
> > >  	
> > >  	 * At this point, core protection will be disabled
> > >  	 * - if the provider is not protected at all
> > > 
> > > @@ -1357,10 +1387,13 @@ static int
> > > clk_core_determine_round_nolock(struct
> > > clk_core *core, *   over the provider
> > > 
> > >  	 */
> > >  	
> > >  	if (clk_core_rate_is_protected(core)) {
> > > 
> > > +		pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  		req->rate = core->rate;
> > >  	
> > >  	} else if (core->ops->determine_rate) {
> > > 
> > > +		pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  		return core->ops->determine_rate(core->hw, req);
> > >  	
> > >  	} else if (core->ops->round_rate) {
> > > 
> > > +		pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  		rate = core->ops->round_rate(core->hw, req->rate,
> > >  		
> > >  					     &req-
> > >
> > >best_parent_rate);
> > >
> > >  		if (rate < 0)
> > > 
> > > @@ -1368,6 +1401,7 @@ static int clk_core_determine_round_nolock(struct
> > > clk_core *core,
> > > 
> > >  		req->rate = rate;
> > >  	
> > >  	} else {
> > > 
> > > +		pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  		return -EINVAL;
> > >  	
> > >  	}
> > > 
> > > @@ -1402,17 +1436,26 @@ static int clk_core_round_rate_nolock(struct
> > > clk_core *core, {
> > > 
> > >  	lockdep_assert_held(&prepare_lock);
> > > 
> > > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > > +
> > > 
> > >  	if (!core) {
> > >  	
> > >  		req->rate = 0;
> > >  		return 0;
> > >  	
> > >  	}
> > > 
> > > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > > +
> > > 
> > >  	clk_core_init_rate_req(core, req);
> > > 
> > > -	if (clk_core_can_round(core))
> > > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > > +
> > > +	if (clk_core_can_round(core)) {
> > > +		pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  		return clk_core_determine_round_nolock(core, req);
> > > 
> > > -	else if (core->flags & CLK_SET_RATE_PARENT)
> > > +	} else if (core->flags & CLK_SET_RATE_PARENT) {
> > > +		pr_crit("%s +%d\n", __func__, __LINE__);
> > > 
> > >  		return clk_core_round_rate_nolock(core->parent, req);
> > > 
> > > +	}
> > > 
> > >  	req->rate = core->rate;
> > >  	return 0;
> > > 
> > > @@ -2201,21 +2244,31 @@ static int clk_core_set_rate_nolock(struct
> > > clk_core
> > > *core, if (!core)
> > > 
> > >  		return 0;
> > > 
> > > +	pr_crit("%s: %s: rate %lu\n", __func__, core->name, req_rate);
> > > +
> > > 
> > >  	rate = clk_core_req_round_rate_nolock(core, req_rate);
> > > 
> > > +	pr_crit("%s: %s: rounded rate %lu\n", __func__, core->name,
> > 
> > req_rate);
> > 
> > > +
> > > 
> > >  	/* bail early if nothing to do */
> > >  	if (rate == clk_core_get_rate_nolock(core))
> > >  	
> > >  		return 0;
> > > 
> > > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > > +
> > > 
> > >  	/* fail on a direct rate set of a protected provider */
> > >  	if (clk_core_rate_is_protected(core))
> > >  	
> > >  		return -EBUSY;
> > > 
> > > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > > +
> > > 
> > >  	/* calculate new rates and get the topmost changed clock */
> > >  	top = clk_calc_new_rates(core, req_rate);
> > >  	if (!top)
> > >  	
> > >  		return -EINVAL;
> > > 
> > > +	pr_crit("%s +%d\n", __func__, __LINE__);
> > > +
> > > 
> > >  	ret = clk_pm_runtime_get(core);
> > >  	if (ret)
> > >  	
> > >  		return ret;
> > > 
> > > @@ -2367,6 +2420,16 @@ static int clk_set_rate_range_nolock(struct clk
> > > *clk, goto out;
> > > 
> > >  	}
> > > 
> > > +	pr_crit("%s: %s: orphan ? %c\n",
> > > +		__func__,
> > > +		clk->core->name,
> > > +		clk->core->orphan ? 'y' : 'n');
> > > +
> > > +	pr_crit("%s: %s: core req rate %lu\n",
> > > +		__func__,
> > > +		clk->core->name,
> > > +		clk->core->req_rate);
> > > +
> > > 
> > >  	/*
> > >  	
> > >  	 * Since the boundaries have been changed, let's give the
> > >  	 * opportunity to the provider to adjust the clock rate based on
> > > 
> > > @@ -2384,7 +2447,11 @@ static int clk_set_rate_range_nolock(struct clk
> > > *clk, * - the determine_rate() callback does not really check for
> > > 
> > >  	 *   this corner case when determining the rate
> > >  	 */
> > > 
> > > +
> > > 
> > >  	rate = clamp(clk->core->req_rate, min, max);
> > > 
> > > +
> > > +	pr_crit("%s: %s: clamped rate %lu\n", __func__, clk->core->name,
> > 
> > rate);
> > 
> > > +
> > > 
> > >  	ret = clk_core_set_rate_nolock(clk->core, rate);
> > >  	if (ret) {
> > >  	
> > >  		/* rollback the changes */
> > > 
> > > @@ -2599,6 +2666,8 @@ static int clk_core_set_parent_nolock(struct
> > > clk_core
> > > *core, } else {
> > > 
> > >  		__clk_recalc_rates(core, POST_RATE_CHANGE);
> > >  		__clk_recalc_accuracies(core);
> > > 
> > > +
> > > +		core->req_rate = core->rate;
> > > 
> > >  	}
> > >  
> > >  runtime_put:
> > > ---- >8 -----
> 
> So, let's try to follow this through:
> > Sure, here we go
> > ---
> > [    0.630873] Asymmetric key parser 'x509' registered
> > [    0.635802] Block layer SCSI generic (bsg) driver version 0.4 loaded
> > (major 243) [    0.643210] io scheduler mq-deadline registered
> > [    0.647758] io scheduler kyber registered
> > [    0.658708] clk_set_rate_range_nolock: arm_a53_div: orphan ? n
> > [    0.661717] clk_set_rate_range_nolock: arm_a53_div: core req rate
> > 800000000 [    0.668724] clk_set_rate_range_nolock: arm_a53_div: clamped
> > rate 800000000
> I'm assuming we hit the assigned-clock-parents in the clocks node, and
> we try to reparent arm_a53_div / IMX8MP_CLK_A53_SRC to sys_pll1_800m
> 
> I'm not entirely sure, but it looks like the arm_a53_div is a gate +
> divider, so that it has the same rate than its parent makes sens, and
> 800MHz for a CPU clock also makes sense.
> 
> It's also not an orphan, so it's likely to be a separate issue from Tony
> (and thus the fix doesn't help, sorry).
> 
> > [    0.675633] clk_core_set_rate_nolock: arm_a53_div: rate 800000000
> 
> Now, we set the rate to the same rate, this still makes sense.
> 
> > [    0.681761] clk_core_round_rate_nolock +1439
> > [    0.686048] clk_core_round_rate_nolock +1446
> > [    0.690333] clk_core_round_rate_nolock +1450
> > [    0.694619] clk_core_round_rate_nolock +1453
> > [    0.698908] clk_core_determine_round_nolock +1374 arm_a53_div
> 
> The clock has a round_rate / determine_rate implementation
> (clk_divider_round_rate, most likely), thus we call
> clk_core_determine_round_nolock()
> 
> > [    0.704681] clk_core_determine_round_nolock +1378
> > [    0.709408] clk_core_determine_round_nolock +1381
> > [    0.714133] clk_core_determine_round_nolock +1393
> 
> Still on the right path, we use clk_divider_determine_rate (too bad :)),
> it updates the rate
> 
> > [    0.718860] clk_core_set_rate_nolock: arm_a53_div: rounded rate
> > 800000000
> But it didn't change, good. The rounded clock hasn't changed,
> clk_core_set_rate_nolock returns, everything's great.
> 
> > [    0.725684] clk_set_rate_range_nolock: sys_pll1_800m: orphan ? n
> > [    0.731719] clk_set_rate_range_nolock: sys_pll1_800m: core req rate
> > 800000000 [    0.738894] clk_set_rate_range_nolock: sys_pll1_800m:
> > clamped rate 800000000 [    0.745983] clk_core_set_rate_nolock:
> > sys_pll1_800m: rate 800000000
> Then, __set_clk_parents calls clk_put() on the new parent,
> sys_pll1_800m, still not an orphan, still with a rate that makes sense.
> 
> > [    0.752281] clk_core_round_rate_nolock +1439
> > [    0.756569] clk_core_round_rate_nolock +1446
> > [    0.760862] clk_core_round_rate_nolock +1450
> > [    0.765152] clk_core_round_rate_nolock +1453
> > [    0.769435] clk_core_determine_round_nolock +1374 sys_pll1_800m
> 
> We still can round the rate, so we go to
> clk_core_determine_round_nolock()
> 
> > [    0.775385] clk_core_determine_round_nolock +1378
> > [    0.780114] clk_core_determine_round_nolock +1381
> > [    0.784833] clk_core_determine_round_nolock +1396
> 
> But this time using a round_rate implementation: clk_factor_round_rate
> (since sys_pll1_800m is a "pure" fixed factor clock). It has the flag
> CLK_SET_RATE_PARENT (set in imx_clk_hw_fixed_factor), so
> clk_factor_round_rate calls clk_hw_round_rate on its parent
> (sys_pll1_out) for the same rate since it has a factor of 1.
> 
> > [    0.789559] clk_core_round_rate_nolock +1439
> > [    0.793844] clk_core_round_rate_nolock +1446
> > [    0.798133] clk_core_round_rate_nolock +1450
> > [    0.802423] clk_core_round_rate_nolock +1456
> 
> We go through another round_rate cycle here, for sys_pll1_out. It can't
> modify the rate (since it's a gate) but it has CLK_SET_RATE_PARENT, so
> the rate rounding is forwarded to its parent: sys_pll1_bypass.
> 
> > [    0.806708] clk_core_round_rate_nolock +1439
> > [    0.810994] clk_core_round_rate_nolock +1446
> > [    0.815284] clk_core_round_rate_nolock +1450
> > [    0.819570] clk_core_round_rate_nolock +1453
> 
> We go through it, and call clk_core_determine_round_nolock again for
> sys_pll1_bypass.
> 
> > [    0.823856] clk_core_determine_round_nolock +1374 sys_pll1_bypass
> 
> Makes total sense so far.
> 
> > [    0.829981] clk_core_determine_round_nolock +1378
> > [    0.834706] clk_core_determine_round_nolock +1381
> > [    0.839431] clk_core_determine_round_nolock +1393
> > [    0.844159] clk_mux_determine_rate_flags: sys_pll1_bypass: requested
> > rate 800000000
> The requested rate does too. We still have our 800MHz.
> 
> > [    0.851856] clk_mux_determine_rate_flags: sys_pll1_bypass: current
> > parent sys_pll1 [    0.859471] clk_mux_determine_rate_flags:
> > sys_pll1_bypass: current parent rate 800000000
> sys_pll1_bypass has CLK_SET_RATE_NO_REPARENT (set by __imx_clk_hw_mux)
> and CLK_SET_RATE_PARENT (set by the driver when registering the clock),
> so clk_mux_determine_rate_flags will call __clk_determine_rate on its
> parent: sys_pll1. __clk_determine_rate then calls
> clk_core_round_rate_nolock.
> 
> > [    0.867608] clk_core_round_rate_nolock +1439
> > [    0.871894] clk_core_round_rate_nolock +1446
> > [    0.876182] clk_core_round_rate_nolock +1450
> > [    0.880477] clk_core_round_rate_nolock +1453
> 
> We call clk_core_determine_round_nolock on sys_pll1
> 
> > [    0.884758] clk_core_determine_round_nolock +1374 sys_pll1
> > [    0.890273] clk_core_determine_round_nolock +1378
> > [    0.894996] clk_core_determine_round_nolock +1381
> > [    0.899721] clk_core_determine_round_nolock +1396
> 
> sys_pll1 is a clk_pll14xx driver, it has a PLL_1416X type and a rate
> table, so it will use clk_pll1416x_ops. It has a round_rate
> implementation, clk_pll14xx_round_rate, that doesn't seem to be doing
> anything out of the ordinary. My assumption would be that it succeeds
> and returns a proper rate.
> 
> > [    0.904457] Unable to handle kernel NULL pointer dereference at virtual
> > address 0000000000000000
> > [    0.913285] Mem abort info:
> > [    0.916083]   ESR = 0x96000004
> > [    0.919147]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [    0.924484]   SET = 0, FnV = 0
> > [    0.927547]   EA = 0, S1PTW = 0
> > [    0.930697]   FSC = 0x04: level 0 translation fault
> > [    0.935595] Data abort info:
> > [    0.938487]   ISV = 0, ISS = 0x00000004
> > [    0.942334]   CM = 0, WnR = 0
> > [    0.945304] [0000000000000000] user address but active_mm is swapper
> > [    0.951696] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > [    0.957292] Modules linked in:
> > [    0.960355] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
> > 5.17.0-next-20220331+ #53 da834fe2485dc10e4c2f50265323ce628a30bc5e
> > [    0.971291] Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MPxL
> > (DT) [    0.978292] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> > BTYPE=--) [    0.985291] pc : clk_mux_determine_rate_flags+0x33c/0x380
> > [    0.990714] lr : clk_mux_determine_rate_flags+0x10c/0x380
> > [    0.996141] sp : ffff800009ceb4a0
> > [    0.999464] x29: ffff800009ceb4a0 x28: ffff000002cf4700 x27:
> > 0000000000000001
> > [    1.006639] x26: ffff8000092fe728 x25: ffff800008eaa028 x24:
> > ffff800008ea95d8
> > [    1.013816] x23: ffff800008ea95d8 x22: ffff000002aab700 x21:
> > 000000002faf0800
> > [    1.020989] x20: ffff800009ceb640 x19: 0000000000000000 x18:
> > 0000000000004590
> > [    1.028164] x17: 617220746e657261 x16: 7020746e65727275 x15:
> > 63203a7373617079
> > [    1.035339] x14: 0000000000000000 x13: 363933312b206b63 x12:
> > 6f6c6f6e5f646e75
> > [    1.042514] x11: 6f725f656e696d72 x10: 657465645f65726f x9 :
> > 206b636f6c6f6e5f
> > [    1.049689] x8 : 646e756f725f656e x7 : 205d313237393938 x6 :
> > ffff800009a947c8
> > [    1.056864] x5 : ffff800008eb0310 x4 : 0000000000000009 x3 :
> > 000000002faf0800
> > [    1.064039] x2 : ffff800008eb039c x1 : ffff800008eaa028 x0 :
> > ffff8000092fd8b8
> > [    1.071217] Call trace:
> > [    1.073667]  clk_mux_determine_rate_flags+0x33c/0x380
> > [    1.078741]  clk_mux_determine_rate+0x10/0x20
> > [    1.083115]  clk_core_determine_round_nolock+0xd4/0x140
> > [    1.088364]  clk_core_round_rate_nolock+0xac/0xf8
> > [    1.093090]  clk_core_round_rate_nolock+0xd4/0xf8
> > [    1.097814]  clk_hw_round_rate+0x44/0x7c
> > [    1.101751]  clk_factor_round_rate+0x60/0x80
> > [    1.106041]  clk_core_determine_round_nolock+0x104/0x140
> > [    1.111376]  clk_core_round_rate_nolock+0xac/0xf8
> > [    1.116101]  clk_core_set_rate_nolock.part.0+0xac/0x21c
> > [    1.121351]  clk_set_rate_range_nolock+0x294/0x2b0
> 
> But then, where does this come from?
> 
> I'm not entirely sure, but the walk up the clock tree is sane to me.
> Could you run
> 
> ./scripts/faddr2line vmlinux 'clk_mux_determine_rate_flags+0x33c/0x380'
> 
> in your kernel compilation directory? (with ARCH and CROSS_COMPILE set
> if you're doing cross-compilation)?
> 
> My guess would be that we uncovered some other bug there, but I'm not
> sure what exactly.

Thanks for that lengthy analysis.

Here is the requested output:
---
$ ./scripts/faddr2line build_arm64/vmlinux 
'clk_mux_determine_rate_flags+0x33c/0x380'
clk_mux_determine_rate_flags+0x33c/0x380:
clk_mux_determine_rate_flags at drivers/clk/clk.c:627
---
From a first look it seems that 'best_parent' is just a NULL-pointer here.
With this small fix
--->8---
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 071857ef381a..45e081330fac 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -626,7 +626,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 
        pr_crit("%s: Best parent %s (%lu)\n",
                __func__,
-               best_parent->name,
+               best_parent? best_parent->name : "unknown",
                best);
 
        return 0;
--->8---

The boot eventually get stuck, but at a later point.Which is probably why your 
analysis found nothing strange. Due to the size of the output I put it on a 
gist on github [1]. Please note that this is still based on a next-20220331 
based tree without the revert.

Best regards,
Alexander

[1] https://gist.github.com/tq-steina/f90c095d141575eaf75395f26671841a



