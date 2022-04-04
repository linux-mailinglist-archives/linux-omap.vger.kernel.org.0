Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F784F0FFC
	for <lists+linux-omap@lfdr.de>; Mon,  4 Apr 2022 09:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238908AbiDDH3P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Apr 2022 03:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236470AbiDDH3O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Apr 2022 03:29:14 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F18393E4;
        Mon,  4 Apr 2022 00:27:18 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id BD08B3201F82;
        Mon,  4 Apr 2022 03:27:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 04 Apr 2022 03:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; bh=TDH98TyHYWyK2t
        EdUf0NoO/6nH3Q1TMk2EezkWhx3sQ=; b=dVMnZC6J7tmVc2SUnBa4VQJJqZ20bo
        6f54IrlyZ8tr75WoIHSLwBO6KSnEfdiuxUimbqbtpmF3Gr9RhlL2ZKSusEe+w1aO
        CI4McmjlBK5t1NSFFVUIp8y95sFNox+JBwrDbsHVRTydyk5+wcAtylD4lI9e+X7E
        n7gkgadc8ZMK7rn7cOl+79hP3fhNAogO9KrvuMpgHuPJ8NEhhPHkDOoZX6giePuM
        nIbHv3t7XmRYCkRcX9Saly/cUk+iDS3PsUuRkdpZ7fJa0kgj3hd0cocDgsSbpAkl
        AG0ObjjhPcY/qRGLBYQWgri0NbrsGC35+bgHQvGxEJaq9ZRrtnfB1+Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=TDH98TyHYWyK2tEdUf0NoO/6nH3Q1TMk2EezkWhx3
        sQ=; b=f4+WBWo2dbAGquUDEXVBczIWI4+fiiWvJ5XQvUSV8sgOzp+23gO8eYlqK
        h14y6fc/Fn27YhO7OFqxM501oQUvwLQL0Acr1bB70UtB2lE8ATX4NBToTbjPQASr
        yjlxXrj4uRaV+IL8n39XTTUZsNlNXl3PzAl+edblexvqSN3ZnF2hjHiA/MqoNfBx
        NAD8uzbrrGz28Ev05vRofgf9HKDyRZMqfFX7z3CPAsJksL3vmoepKzfZ6TyYmYWe
        M/2AWLsbw3/ulG6MGvSfVfsa9ZHPWgcDjDAiCo0tGyM8rZ2c0HrtbgVxtXu/eIqW
        yaVnWuXx4kFjIXGoRF2DOeOL3p+ng==
X-ME-Sender: <xms:0Z1KYo3s9JcjtgrOYW-NphGGx9CqgZvH0obO0_U2k9CHvQYZJpKNTg>
    <xme:0Z1KYjGCwV-gsqijF_O-cDhrACsXElxfsYNW-ukeDPJED2O4E2Dzh9W0MVzaQjvoC
    PGN4YE9_NDEFDZQCZ0>
X-ME-Received: <xmr:0Z1KYg7N6BpEzKu5kDvFlPvaLSGzFQUu06NkchrUJxXT1BJz9pbi-bFEeZU2Lp-6h8eqNM8aIc4HXekC6LK7SFt5Cj4JPVT0kjBKyrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejuddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepkeeludfhledtieegfeelveetveegueeghfeitedttddvjefhgfevgfdt
    leegheehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
    tghh
X-ME-Proxy: <xmx:0Z1KYh1PJQ9XoY6VXz8dX9SuNKKvTanIn9udheYOihk3n7IG2yrwtQ>
    <xmx:0Z1KYrGB9khYukboV_p4SRsPgIFXQzjoLpIiZ_vouVtsRdREPycQOA>
    <xmx:0Z1KYq_ajBfX_xzZ-dBSbSkg75I0RQKoykkNJ9K1I6_CB5nzTuMRUw>
    <xmx:1J1KYiBxUPmYfSNx2X6cPTlTzJJuCgwMrGunaWS9pyhZSH64ESjKCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 03:27:13 -0400 (EDT)
Date:   Mon, 4 Apr 2022 09:27:12 +0200
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
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: [PATCH v2 3/3]
 clk: Drop the rate range on clk_put
Message-ID: <20220404072712.bbsbkq3cpyx4xuzy@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <14273141.O9o76ZdvQC@steina-w>
 <20220401145502.5hnilpku3qh77bvs@houat>
 <4391300.LvFx2qVVIh@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4391300.LvFx2qVVIh@steina-w>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Apr 04, 2022 at 09:06:42AM +0200, Alexander Stein wrote:
> Here is the requested output:
> ---
> $ ./scripts/faddr2line build_arm64/vmlinux=20
> 'clk_mux_determine_rate_flags+0x33c/0x380'
> clk_mux_determine_rate_flags+0x33c/0x380:
> clk_mux_determine_rate_flags at drivers/clk/clk.c:627
> ---
> From a first look it seems that 'best_parent' is just a NULL-pointer here.
> With this small fix
> --->8---
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 071857ef381a..45e081330fac 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -626,7 +626,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
> =20
>         pr_crit("%s: Best parent %s (%lu)\n",
>                 __func__,
> -               best_parent->name,
> +               best_parent? best_parent->name : "unknown",
>                 best);
> =20
>         return 0;
> --->8---
>=20
> The boot eventually get stuck, but at a later point.Which is probably why=
 your=20
> analysis found nothing strange. Due to the size of the output I put it on=
 a=20
> gist on github [1]. Please note that this is still based on a next-202203=
31=20
> based tree without the revert.

I've looked into it over the weekend, and ran qemu on an imx6 to try to
see if it was any similar

I believe the issue comes from the fact that the core will forward rate
requests structure to the parent clock as is, and if the parent clock
changes the parent it wants, we end up trying to use that parent in the
initial clock which doesn't work really well.

I've fixed it in my branch here:
https://github.com/mripard/linux/commits/rpi/clk-improvements-more-fixes

Could you give it a try?
Maxime
