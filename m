Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B8F54DC25
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jun 2022 09:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358692AbiFPHud (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jun 2022 03:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiFPHuc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jun 2022 03:50:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237DD56F98;
        Thu, 16 Jun 2022 00:50:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BFA25B8213C;
        Thu, 16 Jun 2022 07:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C05C34114;
        Thu, 16 Jun 2022 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655365829;
        bh=c1Fklzn9ReeW/FcEJgHJCunMay9LhWESILSmNJZ7Ecw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IAINSoDeMlPobTkRYuI5dYGy+M+os6G3xLXGYB61huHOP+CNZXmZgiwVaae5PcJsE
         QyTotzBG+4ZeIY8k0Sv9R682mwhORZBBzlIjNjoybchW73VRIfBMvl557wmPsaufef
         HIrhRFkedg6v2FjMDScFjIke+E2jrYBiqaYGV7SNP8m+4Pmj7Mt16JpeNZiKASOAeh
         Anpy2xCOYEPAm4LbTquZIFy7aL5v29KuJ1YsRSOJuQ86+t1W+HnZMO13iNEIc45NI/
         P8PBWxqR3dmFZI7qPzYdYXUjgRO+OhSvv91xrucVIICjKcAqMq5zUmKEgMvWzbWyLB
         Z1yFuiPcy+rug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220615064306.22254-1-tony@atomide.com>
References: <20220615064306.22254-1-tony@atomide.com>
Subject: Re: [PATCH v2 1/1] clk: ti: Stop using legacy clkctrl names for omap4 and 5
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        Tero Kristo <kristo@kernel.org>
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Thu, 16 Jun 2022 00:50:27 -0700
User-Agent: alot/0.10
Message-Id: <20220616075029.43C05C34114@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-06-14 23:43:06)
> With the addition of clock-output-names, we can now unify the internal
> clock naming for omap4 and 5 to follow the other TI SoCs.
>=20
> We are still using legacy clkctrl names for omap4 and 5 based on the clock
> manager name which is wrong. Instead, we want to use the clkctrl clock
> based naming.
>=20
> We must now also drop the legacy TI_CLK_CLKCTRL_COMPAT quirk for the
> clkctrl clock.
>=20
> This change will allow further devicetree warning cleanup as already
> done for am3/4 and dra7.
>=20
> Cc: linux-clk@vger.kernel.org
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tero Kristo <kristo@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-ti-dt and merged into clk-next
