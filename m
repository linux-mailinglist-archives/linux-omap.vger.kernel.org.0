Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947467045C8
	for <lists+linux-omap@lfdr.de>; Tue, 16 May 2023 09:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjEPHIg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 May 2023 03:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjEPHIb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 May 2023 03:08:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5281BE1
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 00:08:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07182615CB
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 07:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE76C433D2;
        Tue, 16 May 2023 07:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684220909;
        bh=zTDlgLCpvBp8ETQdMVVhv3Xeg0OraSPaNP3be+FFjzs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ARSn7RJtIfBOTpaT6yb6crhDKMMZ1I82bgT6PFUQHPJo0IbG7ATNYNt3mGWPvbWZs
         Ai1lRItE9m0nUrQpitj1oMS9z81t3/vcuQblKLl1kpjVJuL0sYbXA8l+sbM2NWKUoT
         uikGz5A6x5Ea2GFYFGgS/6T2b+039cSFO76sNwjs0q+KBeOJ9ArjiDM0gHmnN5AH05
         Lpzjiey9jSNsz3XkfpPtfdrZp8SawWLvHtfs85UW6vDOiUOK74auVtHxgwF5BQxQcN
         OonCs8RO+5b9btMRFIgz8/h5xziAdsf5/xIjzCMUk39tF0BB3u9cv7YKliC/Nzzp0E
         n9znsXU8BxnsQ==
Date:   Tue, 16 May 2023 08:08:23 +0100
From:   Lee Jones <lee@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v3] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
Message-ID: <20230516070823.GC10825@google.com>
References: <20230430093505.561265-1-linus.walleij@linaro.org>
 <20230515123647.GD10825@google.com>
 <CACRpkdYrSUOf0M7+Ub6F5uMAf6MDtK9=GLrdWo_Ey98fCfiv0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYrSUOf0M7+Ub6F5uMAf6MDtK9=GLrdWo_Ey98fCfiv0A@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 15 May 2023, Linus Walleij wrote:

> On Mon, May 15, 2023 at 2:36 PM Lee Jones <lee@kernel.org> wrote:
> > On Sun, 30 Apr 2023, Linus Walleij wrote:
> 
> > >  drivers/mfd/tps65010.c          |  14 ++--
> >
> > Reviewed-by: Lee Jones <lee@kernel.org>
> 
> Thanks!
> 
> > What's the merge plan for this?
> 
> I'll make a dedicated pull request for the SoC tree.

Sounds good, have an Ack:

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
