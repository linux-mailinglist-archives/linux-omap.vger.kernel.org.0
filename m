Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECBC4ED75C
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 11:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbiCaJ4v (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 05:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbiCaJ4u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 05:56:50 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A3F3DDD6;
        Thu, 31 Mar 2022 02:55:02 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 3B5655C01CE;
        Thu, 31 Mar 2022 05:55:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 31 Mar 2022 05:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; bh=fIschB+nqCMB98
        fI8niTL+6mM5W6p3IndMLM7eMuJYg=; b=L8gqq6q27fRzO3XPlGK64ELnFPiAZn
        wL5KwFb1orZWm/7K7ZUKqQLQ94ZfkAVq0Di4FxYMm0VnoaDVAgOu+9EdLUuQpJnM
        aNus2ZH9ysUyVcv+A0pmxZbFNNJwXfpYu5xgBkXx9LTESYJbdSUJZBxRXixkImYw
        5jGZBU+wwO9HKvfBb3PCoDb0jYLTp9I7EIBs5790/QBy5c1cP80mfg0FzeIFdM8r
        zsMfyMK+4kHpIvFwAlq3104cXV3yPjj9ULNMW8u023IVVQWGh80S/xZHohCK9+fy
        /Z5X+2aSr0+uYhUWjh6jZNwN0jrbrWAMtMNIhbxxxIjQsS+edSylG7nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=fIschB+nqCMB98fI8niTL+6mM5W6p3IndMLM7eMuJ
        Yg=; b=efzsegme4AINtrqnsMxTyXhdweEgc+X3PQgEX7lIEcYU7tsY+4sb/O8WG
        9sWSpraeBlHWCopoy1UZZTtkBvIFlHy1B57ITz8D12OCTgFTUF8deIjUU/s5Z2mv
        3u+r9OyPJosmFfC/pKdVxCYboCJ1kRFF5iIb0aAjrPwL35AL6z7Yr0OoQKg6+EOF
        oUiyWA+QW8pAP0f4C49PfqsasJZsWkNSFtKkhHNFTrJOKQj4smPgayqeSsQ8p3jU
        W3DjlewuCX1avxqZ+xH9B2ZwDLXSFRy2VgRk8bx2uLfpe/puax7YjQ73hYmbNvD6
        KX9ou/15o0qJ26HYlcankGWNg3DPw==
X-ME-Sender: <xms:cnpFYgDV5qaH4rUHuhjTMLtX5WY3jbRHVM8gd_FpDliXUKXk3e-Qeg>
    <xme:cnpFYijNnBfcOmnj9t4Adp8H5S5COHn5L7_EEyxHCNdzvUuluL-LcyCX6C_tkOrUy
    G_IlGv1L5fYw3xnCRk>
X-ME-Received: <xmr:cnpFYjmiVbayL9og8FBywuFPc_qh2q-_JIL6ViyXk3ZCalKgbK4A8QwEYmWEwQnyWiQfb8GGQajUwqRz0swWVidNKMqVpUIpZZrZp_M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehledvhfeklefgveelkeeludevffethfdukedvfffhhfegfeeugfehgeef
    jeevtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cnpFYmy0pNHY2jnkNa2mo0MQHPE8EO69bKBH2IP6Cip9Qlg6Kuj7QQ>
    <xmx:cnpFYlSeDXXYQoL7cYBbOKN0IQVi173MyJLo0mMXAiXh95nMp6DryA>
    <xmx:cnpFYhZ-YmG5Nw6SNiiI66moIMtPHr1F48HxQTNfaV9n-ROtVomcxQ>
    <xmx:dHpFYgGLhRCvGhFkr45uejAlf7yPx5Dd6PooQs8A_aRajr4GXCctKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 05:54:58 -0400 (EDT)
Date:   Thu, 31 Mar 2022 11:54:56 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <20220331095456.dyyxsiu2b3yw2vvs@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YkV3ch7R7YxlATW+@atomide.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> * Maxime Ripard <maxime@cerno.tech> [700101 02:00]:
> > Hi Marek,
> >=20
> > On Wed, Mar 30, 2022 at 10:06:13AM +0200, Marek Szyprowski wrote:
> > > On 25.03.2022 17:11, Maxime Ripard wrote:
> > > > While the current code will trigger a new clk_set_rate call wheneve=
r the
> > > > rate boundaries are changed through clk_set_rate_range, this doesn't
> > > > occur when clk_put() is called.
> > > >
> > > > However, this is essentially equivalent since, after clk_put()
> > > > completes, those boundaries won't be enforced anymore.
> > > >
> > > > Let's add a call to clk_set_rate_range in clk_put to make sure those
> > > > rate boundaries are dropped and the clock drivers can react.
> > > >
> > > > Let's also add a few tests to make sure this case is covered.
> > > >
> > > > Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rat=
e")
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >=20
> > > This patch landed recently in linux-next 20220328 as commit 7dabfa2bc=
480=20
> > > ("clk: Drop the rate range on clk_put()"). Sadly it breaks booting of=
=20
> > > the few of my test systems: Samsung ARM 32bit Exynos3250 based Rinato=
=20
> > > board and all Amlogic Meson G12B/SM1 based boards (Odroid C4, N2, Kha=
das=20
> > > VIM3/VIM3l). Rinato hangs always with the following oops:
> > >=20
> > > --->8---
> > >=20
> > > Kernel panic - not syncing: MCT hangs after writing 4 (offset:0x420)
> > > CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc1-00014-g7dabfa2bc=
480=20
> > > #11551
> > > Hardware name: Samsung Exynos (Flattened Device Tree)
> > >  =A0unwind_backtrace from show_stack+0x10/0x14
> > >  =A0show_stack from dump_stack_lvl+0x58/0x70
> > >  =A0dump_stack_lvl from panic+0x10c/0x328
> > >  =A0panic from exynos4_mct_tick_stop+0x0/0x2c
> > > ---[ end Kernel panic - not syncing: MCT hangs after writing 4=20
> > > (offset:0x420) ]---
> > >=20
> > > --->8---
> > >=20
> > > Amlogic boards hang randomly during early userspace init, usually jus=
t=20
> > > after loading the driver modules.
> > >=20
> > > Reverting $subject on top of linux-next fixes all those problems.
> > >=20
> > > I will try to analyze it a bit more and if possible provide some more=
=20
> > > useful/meaning full logs later.
> >=20
> > I'm not sure what could go wrong there, but if you can figure out the
> > clock, if it tries to set a new rate and what rate it is, it would be
> > awesome :)
>=20
> I'm also seeing clockevent break on omaps as a wrong source clock gets
> picked.
>=20
> It seems the dts assigned-clock-parents no longer works now?

That would make some kind of sense, __set_clk_parents calls clk_put on
both the assigned clock and its parent.

Could you see what parent (and why?) it tries to enforce then?

It looks like the gpt1_fck driver might favor another parent for that
rate, which, if it's an invalid configuration, shouldn't really happen?

Maxime
