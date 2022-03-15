Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59D484DA478
	for <lists+linux-omap@lfdr.de>; Tue, 15 Mar 2022 22:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351909AbiCOVUi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Mar 2022 17:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351844AbiCOVUi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Mar 2022 17:20:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651B03B57F;
        Tue, 15 Mar 2022 14:19:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A91A6111A;
        Tue, 15 Mar 2022 21:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA3DC340E8;
        Tue, 15 Mar 2022 21:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647379124;
        bh=7fQiP2dAetC5aczC6XPG8w0eOMIZncSsjiKI/x8U+wM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mDZdOiG9OcNs1gVnFOJFl2YlEkh3YBP/VmsMbs66S/WQSkMA7jJd3tYjGhxi5r7si
         NN3J7Dk/JDnu5Ztelz5D/3HqSSJbTpbBb08V5ZxW6Cua1ztz9AzuFiaeSZa5Mn1LF8
         sIl+7NkjTGAv+obVItNUKIHRZ6vyFtzCp588GbyH69NYLdc9fGuTrXOx1cZLPOPeXJ
         pzZaCPTobQBw+AXbLZkKaYYV37wRrBNK3OH9c17BwFvydTW/QuYqHhq8XLcOvm/OWJ
         ZUzAy4Xt23fxVvcEsnMlJXyZarHRurbmZIGCRsklq3fu8mbOvhnZ6MSeAZD1MFWGjp
         hMd0aFpM6onTg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220203085618.16043-4-tony@atomide.com>
References: <20220203085618.16043-1-tony@atomide.com> <20220203085618.16043-4-tony@atomide.com>
Subject: Re: [PATCH 3/3] clk: ti: Drop legacy compatibility clocks for dra7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Tue, 15 Mar 2022 14:18:42 -0700
User-Agent: alot/0.10
Message-Id: <20220315211844.7EA3DC340E8@smtp.kernel.org>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 00:56:18)
> We no longer have users for the compatibility clocks and we can drop them.
> These are old duplicate clocks for what we using.
>=20
> Depends-on: 31aa7056bbec ("ARM: dts: Don't use legacy clock defines for d=
ra7 clkctrl")
> Depends-on: 9206a3af4fc0 ("clk: ti: Move dra7 clock devices out of the le=
gacy section")
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
