Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 816E96B0C2C
	for <lists+linux-omap@lfdr.de>; Wed,  8 Mar 2023 16:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjCHPHb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Mar 2023 10:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjCHPHV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Mar 2023 10:07:21 -0500
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBACFBF3B1
        for <linux-omap@vger.kernel.org>; Wed,  8 Mar 2023 07:07:13 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 1CEF23200961;
        Wed,  8 Mar 2023 10:07:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 08 Mar 2023 10:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1678288029; x=1678374429; bh=9MGUDvQR5kO8q74Bt+RtDaxilLrgMJbIBgc
        qufGksZw=; b=gJ1wVYfzVeVEbm1ro+seMFo812NGfFNCHNB3yu/gL6KrwXQ95fj
        tBY1rRbYxecjT0YR2u2Npao8ur4tilY4xgbZYPwHzqhNHQ4vSA0idDLQSWsCpUVm
        ANqEuLxRAGNu3QHUUsb8Cm1WvUtLMJn7CoW/ylFEYHUzOxzR6Mg18RlfudKet9o/
        R7+34FdcrIiWmK/YGNR4kxwwd4q5XvSPEq4+XhGWqBNsNE7SlwEQlRR+C1D6FxdL
        88d/FUKjAG8g15z+HG5D0jcbwyKR93nCwF6IAL+DrgNEXp2UGEx+sC+A7uBxlUsD
        Mpjl9woNpkjOlWVFnuEo/OWhHsuK/VEX/2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1678288029; x=1678374429; bh=9MGUDvQR5kO8q74Bt+RtDaxilLrgMJbIBgc
        qufGksZw=; b=NB0EwHPQ1POfAJWgWxPacWErNGMu8jcG2Q3oZkG3vLesT/YnZeB
        cAeDmB9gzshlSARIyf+TDivu1XGhd4FYj4SYzaQc2MaVQ6fI2+1V+3wRl8ZHlF7X
        54DttPIrP4FmE8Zg04hocY6fmXcFbVOuwI2A+FWKhmXvL1CZj4AkP4urZonvwCG5
        YsJc7Mny4+VZrmLxxAxTq54/ZREscMiLYDlZsDci4rIkD1Idfe1c6WwL4DuduTNQ
        SdUQMfMIcqEq+nAGtzg6NClz1HAnsj6/vu68ldcavXK4Mt4/WdSTmNoubxOkv56T
        V9zTPGGeYRztgMpOVLATw4+3fMBgVsyxd8w==
X-ME-Sender: <xms:nKQIZFsOYMPLMRZx0cESHlU0YJ7F4OGeY_q3zh--LIy7Q77BaxhmpA>
    <xme:nKQIZOf6peo-CEDrtfkG2w2egZKAuhiTqNfs_zUxJqtYhHjv-g3gObTkMBRVtHUh8
    btpSD-2ZNOIo02pQ2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddufedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:nKQIZIy2a54taY5iqRMzd12cI7XSDW3YaKPgc0KIqH4UNJoADhwIpA>
    <xmx:nKQIZMPt0S-mTLH_xibagnqpYs7wM1ByIB3mP2pxylO6ik4e5Z4VwA>
    <xmx:nKQIZF8yB35NXQHIPdRJubNMU_kFStvKzuSnCKujunFQ-CO683Nd4g>
    <xmx:naQIZKiDUffkf-qEieXfZemHcgvrseGjk1Yy2aA2ktTSih4mNBgLOw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 1C576B60086; Wed,  8 Mar 2023 10:07:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-206-g57c8fdedf8-fm-20230227.001-g57c8fded
Mime-Version: 1.0
Message-Id: <adaf8b7c-f1a7-4770-adb6-31ced13d64d2@app.fastmail.com>
In-Reply-To: <20230308100012.2539189-1-u.kleine-koenig@pengutronix.de>
References: <20230308100012.2539189-1-u.kleine-koenig@pengutronix.de>
Date:   Wed, 08 Mar 2023 16:06:47 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        "Russell King" <linux@armlinux.org.uk>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Ulf Hansson" <ulf.hansson@linaro.org>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Alan Stern" <stern@rowland.harvard.edu>,
        "Mark Brown" <broonie@kernel.org>,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Aaro Koskinen" <aaro.koskinen@iki.fi>,
        "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
        "Tony Lindgren" <tony@atomide.com>,
        "Daniel Mack" <daniel@zonque.org>,
        "Haojian Zhuang" <haojian.zhuang@gmail.com>,
        "Robert Jarzmik" <robert.jarzmik@free.fr>
Cc:     linux-arm-kernel@lists.infradead.org,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 0/8] ARM: Convert to platform remove callback returning void
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Mar 8, 2023, at 11:00, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> this patch series adapts the platform drivers below arch/arm to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the drive=
r core
> doesn't (and cannot) cope for errors during remove. The only effect of=
 a
> non-zero return value in .remove() is that the driver core emits a war=
ning. The
> device is removed anyhow and an early return from .remove() usually yi=
elds a
> resource leak.
>
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
>
> All drivers in arch/arm returned zero unconditionally in their remove =
callback,
> so they could all be converted trivially to .remove_new().
>
> Note that this series depends on commit 5c5a7680e67b ("platform: Provi=
de
> a remove callback that returns no value") which is included in v6.3-rc=
1.

Looks good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> I'm unsure who will pick up this series. Will it go as a whole via arm=
-soc? Or
> will the individual maintainers pick it up?

I can take it through the soc tree, please send it to
soc@kernel.org once you are done getting Acks.

Since all eight patches in the series have the exact same
changelog text and are all trivial, I'd prefer them to be
folded into a single patch if that works for you.

      Arnd
