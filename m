Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFF043DE21
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 11:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhJ1JyL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 05:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbhJ1JyL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Oct 2021 05:54:11 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908B0C061745
        for <linux-omap@vger.kernel.org>; Thu, 28 Oct 2021 02:51:44 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id i26so7771890ljg.7
        for <linux-omap@vger.kernel.org>; Thu, 28 Oct 2021 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KCpmUIi4CdbkIKY1b/j8ncQVr9EMyQgSlpp/uwcjT8I=;
        b=jUDMWyajK0l2lhY4KRjDzD3/OTMk+bkhq3AnRUjLSCXhsitnZHNtNagE85/1smHyJ1
         EBU5SlSD1fhxXVkks2c21QXXeYbjcEsp5G/c0ZJdr4YFC14ua1yF4pfLQz+rRMYipwyM
         usWTyEXNOymtogNGR5Oot/6TGJ8ndkZtxC1cIKCnWtrHNzPZDLqBDbs/hbeoX2vYc3Ww
         5lgIayuiYkYjP1N0UtAnbVfK1jFiq6NgJTKMd5byY2RaIqaGUjyc39XlROSsRRp+SsLB
         3QsvBor/LEIt+BOdimnZcXP2mVVcsoBmiFmZ72DRmcbUktNgWuvxvaPh3oz0l1Wm+yqA
         cjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KCpmUIi4CdbkIKY1b/j8ncQVr9EMyQgSlpp/uwcjT8I=;
        b=Z6yyYnuxdA8XC/wZvtEbHc4DY52+7khHS7AvkorCX8F5ScMxco6tYAtRpkT+p/DBpU
         D5XJ8crp7oC3Mkn4eCkK10rVxqr8tw0ha1oRfRR/MqQFdiQzHkY/ZNFnLJVUv92xi8/w
         84icDrkGLHewBcXr+vAxfayED4JfI2n9Vz2LCluaHKX59kbTxsALfRAjwgFtcs45Ubcn
         WmgdQARqZ4qYp7xsO7Kn8ZL/tHz8x8r7cD8WJ5cynjQ60maSEBa4seqPmL8LffNb5gnm
         A2BJ3x2aIPB3FAsFcnR4Rj5EF65X1bx+0AzXp2Be6xhf5GVL2wMHjZXhdNWCEdJ+08eQ
         T6iA==
X-Gm-Message-State: AOAM5309zeEjcfIxWOf3HpJcA589D06+f5hWN3FVDCV5cdttvddr7oPG
        Us6IX34wSbg/aBkn9fir/xL7XGLMrf3yuJ+fVud9TA==
X-Google-Smtp-Source: ABdhPJzxsTQcVifTPlqxGObEpVIwRC4S2wZKtsuhIX12A13sgEwHMtX3PW6IDKgOaVu1YD8T3f+H+azigKVR3HZZ6S0=
X-Received: by 2002:a05:651c:907:: with SMTP id e7mr3728516ljq.300.1635414702972;
 Thu, 28 Oct 2021 02:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com>
 <CAPDyKFp47sAXhM2s5HOqV2wLf-kYRhdqSdzcn7a62ZW23SSPdg@mail.gmail.com>
 <470A96FD-DB24-4C32-BC9F-AE2F617FBF2D@goldelico.com> <2013308.OSlt1BDEiP@pc-42>
 <1EF25CD6-7801-4C15-AB4C-5F499948A653@goldelico.com> <920CFF1F-475C-4403-B563-DDD144F7E52D@goldelico.com>
In-Reply-To: <920CFF1F-475C-4403-B563-DDD144F7E52D@goldelico.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 28 Oct 2021 11:51:06 +0200
Message-ID: <CAPDyKFp9EEHX1nooBUd7oXCfyaRwFhcikLdxrfcmnoG=2tjEww@mail.gmail.com>
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired omap_hsmmc
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <Jerome.Pouiller@silabs.com>,
        Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bean Huo <beanhuo@micron.com>, linux-mmc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

[...]

> >>>
> >>> Combining your suggestions we could do roughly:
> >>>
> >>> in mmc_sdio_init_card():
> >>>
> >>>       if (host->ops->init_card)
> >>>               host->ops->init_card(host, card);
> >>>       else
> >>>               mmc_fixup_device(host, sdio_prepare_fixups_methods);
> >>
> >> I think I mostly agree, but why you don't call mmc_fixup_device() if
> >> init_card is defined? (BTW, mmc_fixup_device() takes a card as
> >> first parameter)
> >
> > Because I want to get rid of init_card. It is host specific and not client
> > specific.
>
> Ah, on a second though we can do that independently. Either there is
> some init_card - or something in the fixup tables. Why not both...
> So the else clause is not needed.

I agree, I definitely want to get rid of ->init_card() as well, but
let's deal with that from changes on top.

[...]

Kind regards
Uffe
