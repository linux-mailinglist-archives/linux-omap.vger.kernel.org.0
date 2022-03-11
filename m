Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3BFF4D591C
	for <lists+linux-omap@lfdr.de>; Fri, 11 Mar 2022 04:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245315AbiCKDch (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Mar 2022 22:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346196AbiCKDcb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Mar 2022 22:32:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953701AC29A;
        Thu, 10 Mar 2022 19:31:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70E9861595;
        Fri, 11 Mar 2022 03:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5163C340EC;
        Fri, 11 Mar 2022 03:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646969463;
        bh=vodOE7ZE5rfvVBxP3mEelKUKxyIAY+7M0QdSqqtXlEs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VrppRUmTMBj4UBAXN47M1fgtCdcIcvRDXUxFpxYU10e0k6N/0t6coyD0tp19b8JiJ
         Y9Qy2wPe1z/HNd3HdJWBfrIVRssWN9G9CS5B9qVpKMc7psfkff0sqlZI+b2URU/Jb7
         NiER8RgKZPbflHCon16jcbc6DGArCPTjCJ4iFfcaf1VV90fGcs8gWPGj+pYLeOmt+D
         q417ZKYHbdyKyZamtqomQFvun2LyZJJAFHL+8j0dcKVt6ofi+J8s3RE9WENJ+8iH7n
         RMCtJJ7uEkMdhmWBBmQdqXNnvNRSm29qAzldQkEFWyPHaP0LDlUTv1jXEsc1Oy0ULw
         DyoZAmFOlJfCg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220204071449.16762-3-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com> <20220204071449.16762-3-tony@atomide.com>
Subject: Re: [PATCH 2/8] clk: ti: Preserve node in ti_dt_clocks_register()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Thu, 10 Mar 2022 19:31:02 -0800
User-Agent: alot/0.10
Message-Id: <20220311033103.C5163C340EC@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 23:14:43)
> In preparation for making use of the clock-output-names, we want to
> keep node around in ti_dt_clocks_register().
>=20
> This change should not needed as a fix currently.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
