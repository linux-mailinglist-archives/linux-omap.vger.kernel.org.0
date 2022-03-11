Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31EBA4D5914
	for <lists+linux-omap@lfdr.de>; Fri, 11 Mar 2022 04:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238500AbiCKDdl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Mar 2022 22:33:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346451AbiCKDdM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Mar 2022 22:33:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F4DF8BB8;
        Thu, 10 Mar 2022 19:31:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29C6061595;
        Fri, 11 Mar 2022 03:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834A4C340EC;
        Fri, 11 Mar 2022 03:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646969513;
        bh=vN8FrC+ZryvEblfaI+TVtWZRI5Pi06sEJWmW0klVtlQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Sv3apWGamDBFFdEkbJpLGTbi+tegCjdAcT+DF18b51wVreFZZ8gwBAidp5qLOkz0f
         XJWBm9vwnujfWb7MbTA+hKnu+jsU5BOI7dhsiN4gon+ZfJ70qoBZsPn/tk/0A0QIbT
         voAKQFDDGlDkPyvKfq+KalY34JM/XBWcoJ8BvXP8jp6RFRJvE+sFxgkdbyZj493UZ+
         OjD/wYraSUhR1f1AMVtoZueir5+78gO/XY/8DXAVN0qDx/8xUS7z/uS4C12KoRboFr
         TgSYHjLy71cKZzPT8Tbi4CaWEvov+cNIerqNyS1CkAnWabxviB+HBnnwryEixsGJds
         udfpqxFrC+XHw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220204071449.16762-8-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com> <20220204071449.16762-8-tony@atomide.com>
Subject: Re: [PATCH 7/8] clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Thu, 10 Mar 2022 19:31:51 -0800
User-Agent: alot/0.10
Message-Id: <20220311033153.834A4C340EC@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 23:14:48)
> Let's update the TI pll and clockdomain clocks to use ti_dt_clk_name()
> instead of devicetree node name if available.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
