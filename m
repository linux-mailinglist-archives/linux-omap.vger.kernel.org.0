Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 045AE4DA472
	for <lists+linux-omap@lfdr.de>; Tue, 15 Mar 2022 22:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351237AbiCOVTd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Mar 2022 17:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351916AbiCOVT2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Mar 2022 17:19:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E66D1D0C5;
        Tue, 15 Mar 2022 14:18:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F6E061127;
        Tue, 15 Mar 2022 21:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA39CC340E8;
        Tue, 15 Mar 2022 21:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647379092;
        bh=be/gX/PGiLONBZmyTh/fIlNNcV7QYQQPphzWC+x8CqM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E6Fic+jssnxRaE4nV+P95riqN6EOhinXVhN3NrsVNrJ27L4vGq8fn6Yh0b7d5p+cT
         rsuQnxndDJAqHcVNczmbR2KnwT2MnO6K7LkBHJUhsIhfU6crI05GGG+8B3fQE/W3dN
         FUHliRUukZt/EuGf3TUWnlv+4Mo5lFGlFJEQ9pcbfQZxifsByDndpO72DGuKgHuTyW
         X/rkaeFh1YhpH/K/1bmhkHC+8FRXyrdMP9qDNN25qAxbOe29Lz9ypMCgMwYTLZKZ8o
         8afU1SmZdrGImdipT1q8Vadd11SJcTmKAF89Klfgl+aGjlEQxruwHnmXxLWQ0Bd0Jq
         rtdpha2Rit8HA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220203085618.16043-2-tony@atomide.com>
References: <20220203085618.16043-1-tony@atomide.com> <20220203085618.16043-2-tony@atomide.com>
Subject: Re: [PATCH 1/3] clk: ti: Drop legacy compatibility clocks for am3
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Tue, 15 Mar 2022 14:18:10 -0700
User-Agent: alot/0.10
Message-Id: <20220315211812.CA39CC340E8@smtp.kernel.org>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 00:56:16)
> We no longer have users for the compatibility clocks and we can drop them.
> These are old duplicate clocks for what we using.
>=20
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
