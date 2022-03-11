Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECCCE4D5920
	for <lists+linux-omap@lfdr.de>; Fri, 11 Mar 2022 04:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346067AbiCKDdx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Mar 2022 22:33:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346471AbiCKDdO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Mar 2022 22:33:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5067BEEA45;
        Thu, 10 Mar 2022 19:32:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0250614FF;
        Fri, 11 Mar 2022 03:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D10C340EC;
        Fri, 11 Mar 2022 03:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646969522;
        bh=quIaQxcwLdxIHPApqo99LpioihyDVByi8rbhRFD7EO8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Py3jo2j9DvZPP4xnTnmEZaPQPiM5na/8xsyUfSIVbhFqUIeKJEEXHqqfL+BbvUHd1
         QQJeUTGjn05n7+rTPSiGV5brj9W2wieumQl1RWDc7HTl5eYb49OcPVJD5rDArbujxx
         TArBFTfx02GvWKta3KrDO7OZP9XGaybbJyRyD/uB9Cmu3NVauwcyg92Nbn68EqVJIC
         zkWn8tnH4E+s7h+XBtkkktVvqH2Mo01mIEdrpAAKTAbDS6XOXEgNmcWxY4dJT0AMCw
         vzIIMKuxaDDTQLIAA3cEWgZpL0lumcVLONQi7Vu/VBDoE5EaiyKKIevdV3AwskSX3e
         usN6FfmnLLi9Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220204071449.16762-9-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com> <20220204071449.16762-9-tony@atomide.com>
Subject: Re: [PATCH 8/8] clk: ti: Update component clocks to use ti_dt_clk_name()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Thu, 10 Mar 2022 19:32:00 -0800
User-Agent: alot/0.10
Message-Id: <20220311033202.41D10C340EC@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 23:14:49)
> Let's update all the TI component clocks to use ti_dt_clk_name() instead
> of devicetree node name if available.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
