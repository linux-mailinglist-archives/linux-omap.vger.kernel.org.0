Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B498C4EEE37
	for <lists+linux-omap@lfdr.de>; Fri,  1 Apr 2022 15:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343654AbiDANgL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Apr 2022 09:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245196AbiDANgK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Apr 2022 09:36:10 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFFE14DFD8;
        Fri,  1 Apr 2022 06:34:18 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 44E57320092B;
        Fri,  1 Apr 2022 09:34:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 01 Apr 2022 09:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=Bb1FfQKJz9FgOSvVldYwxGuTjx8zCBdfcS060P
        r/7NY=; b=rCK9EuvjcPL1blZ3431FDQ7SwFeuHJ1pQsvxiapLfUhKUeoO+YzaM4
        CjryNzhWjI1hoJllNLEXOuJ1h5BX5ZXipmcfhbP7TSf9bT0/YxnIhJj5VqlHyKo/
        vTkJMpASEw+H/6ImHF+nUjyQfJ+nIjhE5pAV3Gsc7Yo/PYR9F/m2WfExYvGq22xL
        wKuMDucNb3zLnmg7E7NeAdLQNnpEjVfgJ5/bqE1BC7djCAbuiuXpxbq28dFwoGNS
        fDnU2fbvm5+Ot7qCbNi0xvVzHW0h0vncvF8h11l4Q4/heIv4y34zPc3iFZh9VU00
        Wqf+Qxi9VleGDcDdAw0huB3I391bZt7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Bb1FfQKJz9FgOSvVl
        dYwxGuTjx8zCBdfcS060Pr/7NY=; b=ZVldOpNwxdwMkWAAWms9wW3471atlrIsk
        QnmNJS60XjRfEm8HYd/Y+K+r0NFlR9LCSUjc9LifzcMzb91VruO9UJ5LOV9YjKbT
        gIvAXq8o31s8Hu3Ak9PuTvOHQjyM4Rp9GyY1RVlmUWPW0bhCjz0CuxoxUE+X7t98
        Am0qw7dmdrXRVq78z/YWefCQPHmBxmuifgr54aK75Xka3ApkqHbsnit3y0ZWeBJL
        79X3XGgXJmxoF7VmSgJqdrbEBIZXh+ZCu+CgxIV4CaVhfYzx7v6oMZui27Xhywk1
        UAv2xHpgBl6t0Y2iEjnmDSARy+mwNecH3C2bwNisOxclmo6eG2Geg==
X-ME-Sender: <xms:U_9GYkD5E-CRoOAxbmRy_tJa1TwHRzV4UtWr-P_WyBN3YUqlsvRMrQ>
    <xme:U_9GYmi8Zuns90kdtlZqAXo4NmNRndqsdgZDUSSqUXF7gfB3XIb44-0Wvh96fVpoW
    3kIejO2hfiz8jR1geM>
X-ME-Received: <xmr:U_9GYnkARIXq_5QZxJGaIYUPheerycoLr7I3TJweb_j_Q3VfipMnc0dxdQywTY09f5FewWMPZndwpY7poJ9S-Ne2Uqk36Gvl5qqIqfU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:U_9GYqxV0HhTzaOeywefdmNAJ4Xj_UuwANR57yN3FWVReAQi63H4Sw>
    <xmx:U_9GYpTGgPxFWBpSCnZavY05g-rfLR7gA1O8mfGyrQqvXxyp2jokTg>
    <xmx:U_9GYlYhlB5s_XonQFnzt3-Qack_VEOnipMKC0BbAPCcIt8g8cxe1A>
    <xmx:Vv9GYm85lrx5wuQbwCOBsimv9KWVO7GssRQLOKAIxsZfE7uNNKDihA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 09:34:11 -0400 (EDT)
Date:   Fri, 1 Apr 2022 15:34:09 +0200
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
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: [PATCH v2 3/3] clk: Drop the rate
 range on clk_put
Message-ID: <20220401133409.wtilnpgp4fqlrrew@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <2099976.irdbgypaU6@steina-w>
 <20220401130442.myegjneyuc7fkfnd@houat>
 <2823402.e9J7NaK4W3@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="up47urrhxygeer2y"
Content-Disposition: inline
In-Reply-To: <2823402.e9J7NaK4W3@steina-w>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--up47urrhxygeer2y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2022 at 03:07:10PM +0200, Alexander Stein wrote:
> > Does it also happen if you only apply the patch I had above, and not all
> > the debugging?
>=20
> Yes, these are the last lines I see:
> ---
> [    1.236306] mmcblk0rpmb: mmc0:0001 DA6016 4.00 MiB, chardev (235:0)   =
                                                           =20
> [    1.241031] i2c i2c-1: IMX I2C adapter registered                     =
                                                           =20
> [    1.251771] i2c i2c-3: IMX I2C adapter registered                     =
                                                           =20
> [    1.256957] i2c i2c-5: IMX I2C adapter registered

Could you add on top of next (so dropping everything we did so far)

---- >8 -----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 91f863b7a824..552b1e16a82d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -540,6 +540,8 @@ static bool mux_is_better_rate(unsigned long rate, unsi=
gned long now,
 	if (flags & CLK_MUX_ROUND_CLOSEST)
 		return abs(now - rate) < abs(best - rate);

+	pr_crit("%s +%d rate %lu now %lu best %lu\n", __func__, __LINE__, rate, n=
ow, best);
+
 	return now <=3D rate && now > best;
 }

@@ -552,6 +554,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	unsigned long best =3D 0;
 	struct clk_rate_request parent_req =3D *req;

+	pr_crit("%s: %s: requested rate %lu\n", __func__, core->name, req->rate);
+
+	parent =3D core->parent;
+	pr_crit("%s: %s: current parent %s\n", __func__, core->name, parent ? par=
ent->name : "(null)");
+	pr_crit("%s: %s: current parent rate %lu\n", __func__, core->name, clk_co=
re_get_rate_nolock(parent));
+
 	/* if NO_REPARENT flag set, pass through to current parent */
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent =3D core->parent;
@@ -578,24 +586,37 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 		if (!parent)
 			continue;

+		pr_crit("%s: Trying parent %s (%lu)\n",
+			__func__,
+			parent->name,
+			clk_core_get_rate_nolock(parent));
+
 		if (core->flags & CLK_SET_RATE_PARENT) {
+			pr_crit("%s +%d\n", __func__, __LINE__);
 			parent_req =3D *req;
 			ret =3D __clk_determine_rate(parent->hw, &parent_req);
+			pr_crit("%s +%d %d\n", __func__, __LINE__, ret);
 			if (ret)
 				continue;
 		} else {
+			pr_crit("%s +%d\n", __func__, __LINE__);
 			parent_req.rate =3D clk_core_get_rate_nolock(parent);
 		}

+		pr_crit("%s +%d\n", __func__, __LINE__);
+
 		if (mux_is_better_rate(req->rate, parent_req.rate,
 				       best, flags)) {
+			pr_crit("%s +%d\n", __func__, __LINE__);
 			best_parent =3D parent;
 			best =3D parent_req.rate;
 		}
 	}

-	if (!best_parent)
+	if (!best_parent) {
+		pr_crit("%s +%d\n", __func__, __LINE__);
 		return -EINVAL;
+	}

 out:
 	if (best_parent)
@@ -603,6 +624,11 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	req->best_parent_rate =3D best;
 	req->rate =3D best;

+	pr_crit("%s: Best parent %s (%lu)\n",
+		__func__,
+		best_parent->name,
+		best);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(clk_mux_determine_rate_flags);
@@ -1345,11 +1371,15 @@ static int clk_core_determine_round_nolock(struct c=
lk_core *core,

 	lockdep_assert_held(&prepare_lock);

+	pr_crit("%s +%d %s\n", __func__, __LINE__, core->name);
 	if (!core)
 		return 0;

+	pr_crit("%s +%d\n", __func__, __LINE__);
 	req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);

+	pr_crit("%s +%d\n", __func__, __LINE__);
+
 	/*
 	 * At this point, core protection will be disabled
 	 * - if the provider is not protected at all
@@ -1357,10 +1387,13 @@ static int clk_core_determine_round_nolock(struct c=
lk_core *core,
 	 *   over the provider
 	 */
 	if (clk_core_rate_is_protected(core)) {
+		pr_crit("%s +%d\n", __func__, __LINE__);
 		req->rate =3D core->rate;
 	} else if (core->ops->determine_rate) {
+		pr_crit("%s +%d\n", __func__, __LINE__);
 		return core->ops->determine_rate(core->hw, req);
 	} else if (core->ops->round_rate) {
+		pr_crit("%s +%d\n", __func__, __LINE__);
 		rate =3D core->ops->round_rate(core->hw, req->rate,
 					     &req->best_parent_rate);
 		if (rate < 0)
@@ -1368,6 +1401,7 @@ static int clk_core_determine_round_nolock(struct clk=
_core *core,

 		req->rate =3D rate;
 	} else {
+		pr_crit("%s +%d\n", __func__, __LINE__);
 		return -EINVAL;
 	}

@@ -1402,17 +1436,26 @@ static int clk_core_round_rate_nolock(struct clk_co=
re *core,
 {
 	lockdep_assert_held(&prepare_lock);

+	pr_crit("%s +%d\n", __func__, __LINE__);
+
 	if (!core) {
 		req->rate =3D 0;
 		return 0;
 	}

+	pr_crit("%s +%d\n", __func__, __LINE__);
+
 	clk_core_init_rate_req(core, req);

-	if (clk_core_can_round(core))
+	pr_crit("%s +%d\n", __func__, __LINE__);
+
+	if (clk_core_can_round(core)) {
+		pr_crit("%s +%d\n", __func__, __LINE__);
 		return clk_core_determine_round_nolock(core, req);
-	else if (core->flags & CLK_SET_RATE_PARENT)
+	} else if (core->flags & CLK_SET_RATE_PARENT) {
+		pr_crit("%s +%d\n", __func__, __LINE__);
 		return clk_core_round_rate_nolock(core->parent, req);
+	}

 	req->rate =3D core->rate;
 	return 0;
@@ -2201,21 +2244,31 @@ static int clk_core_set_rate_nolock(struct clk_core=
 *core,
 	if (!core)
 		return 0;

+	pr_crit("%s: %s: rate %lu\n", __func__, core->name, req_rate);
+
 	rate =3D clk_core_req_round_rate_nolock(core, req_rate);

+	pr_crit("%s: %s: rounded rate %lu\n", __func__, core->name, req_rate);
+
 	/* bail early if nothing to do */
 	if (rate =3D=3D clk_core_get_rate_nolock(core))
 		return 0;

+	pr_crit("%s +%d\n", __func__, __LINE__);
+
 	/* fail on a direct rate set of a protected provider */
 	if (clk_core_rate_is_protected(core))
 		return -EBUSY;

+	pr_crit("%s +%d\n", __func__, __LINE__);
+
 	/* calculate new rates and get the topmost changed clock */
 	top =3D clk_calc_new_rates(core, req_rate);
 	if (!top)
 		return -EINVAL;

+	pr_crit("%s +%d\n", __func__, __LINE__);
+
 	ret =3D clk_pm_runtime_get(core);
 	if (ret)
 		return ret;
@@ -2367,6 +2420,16 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 		goto out;
 	}

+	pr_crit("%s: %s: orphan ? %c\n",
+		__func__,
+		clk->core->name,
+		clk->core->orphan ? 'y' : 'n');
+
+	pr_crit("%s: %s: core req rate %lu\n",
+		__func__,
+		clk->core->name,
+		clk->core->req_rate);
+
 	/*
 	 * Since the boundaries have been changed, let's give the
 	 * opportunity to the provider to adjust the clock rate based on
@@ -2384,7 +2447,11 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 	 * - the determine_rate() callback does not really check for
 	 *   this corner case when determining the rate
 	 */
+
 	rate =3D clamp(clk->core->req_rate, min, max);
+
+	pr_crit("%s: %s: clamped rate %lu\n", __func__, clk->core->name, rate);
+
 	ret =3D clk_core_set_rate_nolock(clk->core, rate);
 	if (ret) {
 		/* rollback the changes */
@@ -2599,6 +2666,8 @@ static int clk_core_set_parent_nolock(struct clk_core=
 *core,
 	} else {
 		__clk_recalc_rates(core, POST_RATE_CHANGE);
 		__clk_recalc_accuracies(core);
+
+		core->req_rate =3D core->rate;
 	}

 runtime_put:
---- >8 -----

Thanks!
Maxime

--up47urrhxygeer2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkb/UAAKCRDj7w1vZxhR
xfmMAP4h8We2JzL6aqm+Z8dHfhsqpzUgZOIhhDU7MvzftthC6AEAg6f98vGcJHD7
ylnD27n7VHLEqn4HXwnV4ceQ8SVB4As=
=IdXu
-----END PGP SIGNATURE-----

--up47urrhxygeer2y--
