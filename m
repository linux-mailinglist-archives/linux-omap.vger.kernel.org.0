Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B10E43DDCB
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 11:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhJ1Jet (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 05:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbhJ1Jer (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Oct 2021 05:34:47 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97478C061767
        for <linux-omap@vger.kernel.org>; Thu, 28 Oct 2021 02:32:20 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l2so9595921lji.6
        for <linux-omap@vger.kernel.org>; Thu, 28 Oct 2021 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H1cBbZ29iBhIzlADanMboqR5PTvmcX6f2VNyLE4w9Tk=;
        b=ZF8RwgiR46eeZoRy7bQm9ex9lg/svajTlowMu+8I/nRfgUrrjWGJSl4sMB22wU7Yzo
         /amQHrUnik25ChBxiQIVRNWRGarvxrwqBWfH5dqMT9GU5jy4sRNGgEF71cLdL2CDAqVT
         qikRVVu61rlTBpGB7b+ixhzqMJF7B15oRsKr15GP84lQO92p4ldyL+uJ9MVUVxMOsFfh
         QWbkYGdti4Q2LauYBohGXpFdBS1pQF4Qfydx8mBSrZU/m9NsxdO93pfcRWqvy1OG/g7W
         IdbctlT1Tu4E6WoZI23e4BP+BHnxdqJXOc1BL2l2bVA0/suNaoegxy8PlicibO70KB7E
         674A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H1cBbZ29iBhIzlADanMboqR5PTvmcX6f2VNyLE4w9Tk=;
        b=EevfHSk1KDRtL0a6Hm8GIV1LX/SYEW/TWQXqmfEPN1UvKV+zW7r/lF+uv/DuWU0fyq
         k3FPjeQfm+iFOs9t9ZTdZL8CJOOkT9tfR10qJX+WYwiPD079Xh4+QRK8jic937dbt+vs
         EDwkZnZRoSKnaBiGZtPESNNDTiHYIoVWC9UwkKpNsJAoHU3axuECY9KK1lr1zeH/9QpZ
         Akj1kYeWNotkpp2WlNd8eDy3rSuXVsN3tydKkfW0ibI1q5ii2TJH9SpbxuF/0G/PP2ru
         yzRmOx/Ro/eX4ott5e+ZqtSmeOiQVfZlMKTdqm9eX+3SnfT5yr/B98tCjkS16Zstxrvl
         DndA==
X-Gm-Message-State: AOAM5303aa43FHJjUF+JtAxUR7eLWZc4DTLX0uXW1C76sX3CHCSd3EZL
        6yCBb1l0GE39JQ1mwqXBcLp5q2Y5M9samHC7JOaSNEv3LxE=
X-Google-Smtp-Source: ABdhPJxJuR23jXNDWfiQxoqWI52YVAi1m5sbex/r8p4Wi8DX0c1r6Ft0KZ8J9L4U+hz7GkJMrE2CJvDkj11pjzajMi0=
X-Received: by 2002:a05:651c:11c4:: with SMTP id z4mr3422469ljo.463.1635413538930;
 Thu, 28 Oct 2021 02:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com>
 <CAPDyKFp47sAXhM2s5HOqV2wLf-kYRhdqSdzcn7a62ZW23SSPdg@mail.gmail.com>
 <470A96FD-DB24-4C32-BC9F-AE2F617FBF2D@goldelico.com> <2013308.OSlt1BDEiP@pc-42>
In-Reply-To: <2013308.OSlt1BDEiP@pc-42>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 28 Oct 2021 11:31:42 +0200
Message-ID: <CAPDyKFouhj7V7n-7NSw=9-vLWqPvAmhUuZFVPR5Htw=aCLVZ_Q@mail.gmail.com>
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired omap_hsmmc
To:     =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <Jerome.Pouiller@silabs.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Avri Altman <avri.altman@wdc.com>,
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

> > Combining your suggestions we could do roughly:
> >
> > in mmc_sdio_init_card():
> >
> >         if (host->ops->init_card)
> >                 host->ops->init_card(host, card);
> >         else
> >                 mmc_fixup_device(host, sdio_prepare_fixups_methods);
>
> I think I mostly agree, but why you don't call mmc_fixup_device() if
> init_card is defined? (BTW, mmc_fixup_device() takes a card as
> first parameter)

Ack.

>
>
> > Next we need a location for the sdio_prepare_fixups_methods table and functions.
> >
> > For "ti,wl1251" we would then provide the entry in the table and a function doing
> > the setup. But where should these be defined? Likely not in a header file like
> > quirks.h? But there is no quirks.c.
>
> I think you can place your function in drivers/mmc/core/card.h. There are
> already add_quirk(), add_limit_rate_quirk(), add_quirk_mmc(), etc...

FYI: I don't mind adding a quirks.c, if that makes sense.

Kind regards
Uffe
