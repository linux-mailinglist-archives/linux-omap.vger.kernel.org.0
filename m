Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC7FA4DA474
	for <lists+linux-omap@lfdr.de>; Tue, 15 Mar 2022 22:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351913AbiCOVTm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Mar 2022 17:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351917AbiCOVTl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Mar 2022 17:19:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94BF237C2;
        Tue, 15 Mar 2022 14:18:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 82E33B8189E;
        Tue, 15 Mar 2022 21:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374C4C340E8;
        Tue, 15 Mar 2022 21:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647379105;
        bh=JGKE9emu8wg+dXuCG9fxq/2XRGR4g+ZqhstoFIBjYr4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pmNle86TDUtbGZqW/u3C3/RvjcUKxn5kABndq+mC5GoDz+shwosvUKh0+BQeoRAbf
         2gqEOZbmvIzj7Ho6ybIMdCdSj8SoO+BAHxLyHFP86CIRbysh84YwI/uAPoqaP0lXJt
         eddsDV2PK/oV4W9NBJnj77yGCDFwM05sC3j+zcYlgDJj87mAYfrT0mElqvoC66fsIz
         m/Ii/HR04PXXszgkC5BXfZizj60+5kRUhSZ590p3npsN2XJgDlv+UrXNg6oENvTwDB
         2r8zwXujmiGjlueb5y5MiNzFB5M4/KHMbOGPr98xEBWP1dZIS3EgPjV7x7cM4duGuE
         Jnt+wQAnHNwIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220203085618.16043-3-tony@atomide.com>
References: <20220203085618.16043-1-tony@atomide.com> <20220203085618.16043-3-tony@atomide.com>
Subject: Re: [PATCH 2/3] clk: ti: Drop legacy compatibility clocks for am4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Tue, 15 Mar 2022 14:18:23 -0700
User-Agent: alot/0.10
Message-Id: <20220315211825.374C4C340E8@smtp.kernel.org>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 00:56:17)
> We no longer have users for the compatibility clocks and we can drop them.
> These are old duplicate clocks for what we using.
>=20
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
