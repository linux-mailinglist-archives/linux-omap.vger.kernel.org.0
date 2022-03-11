Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0859B4D5926
	for <lists+linux-omap@lfdr.de>; Fri, 11 Mar 2022 04:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346140AbiCKDdw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Mar 2022 22:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346350AbiCKDdA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Mar 2022 22:33:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF15EB313;
        Thu, 10 Mar 2022 19:31:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00ED061380;
        Fri, 11 Mar 2022 03:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593CFC340EC;
        Fri, 11 Mar 2022 03:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646969505;
        bh=/hrzm9cGSEwjsb2/X7PwCayhl/+z0FsjT+gVG1/+r2Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ArWnMqdDO72mUHUL8FOSN1RfwimvJaO402E9uJP9ap2h6zSxtC57gwk+uP+n7ZKuU
         DpMtRwcJjJ9WyWYpKT7ZV8YRj3+X1x3O6ozMxeYbZgXUid3PGIp0T4nMQxyfKgIv0M
         5ldP8XNmDyr81SG0IZG9YT99ro6DBx4s/pTivnn9Btb/KuhP+k+7WVvlmeXqVBRrk4
         uwdtNoLCoSVaP2+4bJZ/vYt5J0IE3h9MpkFUjM1ys5ouqGfwFDIp4zUCxJXKkr4i6o
         Incj1N6VSnPPW7WaY1bzByHkKSjHSX6PlufGq+27Cr0JwRO5RP7Xz5t+2Mbh/pASkY
         rcprLfv2/zmuw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220204071449.16762-7-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com> <20220204071449.16762-7-tony@atomide.com>
Subject: Re: [PATCH 6/8] clk: ti: Add ti_dt_clk_name() helper to use clock-output-names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Thu, 10 Mar 2022 19:31:43 -0800
User-Agent: alot/0.10
Message-Id: <20220311033145.593CFC340EC@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 23:14:47)
> Let's create the clock alias based on the clock-output-names property if
> available. Also the component clock drivers can use ti_dt_clk_name() in
> the following patches.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
