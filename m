Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34DE2413B5C
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 22:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhIUUbG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 16:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhIUUbF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 16:31:05 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5ABC061574;
        Tue, 21 Sep 2021 13:29:36 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id 42so222171uak.11;
        Tue, 21 Sep 2021 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+xoUoHNLWwQxNlICe7S0Bso4TmLrF3Y5Y9/zLM7GtA=;
        b=ZSiyT13qRPnoccslyJ87Nq8ZohgDjViWUSJaaFKTU84pW9R4NoE2BOykFhFPP1KdyF
         LJ5ZhbAUhc2EXo+rk0AXlFNij/CH091WCjvGbL184sR0JqSsLq2g3VMAcTsxu3T+FfPS
         12cIIv5f4A8UtCMyZSGrYbhev+Ork54G3CMQrLOPs7RfbC/vWSP5M2MpNbYEhRsfLInS
         XTIRKzMu+Ch3TxWMaoAfGsqfRZ/3X3qHg5aztR/j9+D9XBrI8M+pulhgEDUcWnfteKrQ
         ZmeHF3HljHhF6M56TChcoYeq+B7oYiGNq0T5n9sq+Qmut2Z54FLvveDJWC/eTVqj0lY9
         xacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+xoUoHNLWwQxNlICe7S0Bso4TmLrF3Y5Y9/zLM7GtA=;
        b=aVtZEfQzNtNfYwDnX1n80IB7iohJzxacrh2aZxy5W+fsxXoSHUiHPXT04sLvSZu9kA
         gYmeVxA78b0c4jWFHvD+LFF1B/MmJ3sI77Kxa8I81UBWRAxfhuxLcqyhIfrnpzHwsu1+
         Gvu2LC6PVv61Rb+E8Dky/TLrMgOCWyn+tKPi2UzIr2u5UDvJH3zN0LDf7iS7LwNlvBPc
         4qe6KMTOas4EA5nkoDdZjcdnJOzf6BwUbI0K9n6oL2p243NgqoSdbf25kw/mQwNW8sGb
         DP0HidKy9/9UIDrtrqKS23FUyg3Lua3eaRn80rzmhIVALBdw0xj/9avQ7fc2g2WEscxV
         wjMg==
X-Gm-Message-State: AOAM533BAfLhqS41hl1WuodMxf5rzCyULslkAmR9bm7ilIsySq5NU7s4
        p9jm0GGF8/uaZM7LVqrx/fTQQO1fehrI4s3WxIu5jkcw/X4=
X-Google-Smtp-Source: ABdhPJwKlDQsxNdmBpncw45lnYHrUpZ8vGxaQWi988wkSFP6Mkcy/vz7WGu1FJtowhnKHAmvR3K3KKqQnM+zU44r1Hk=
X-Received: by 2002:a05:6130:325:: with SMTP id ay37mr19533245uab.88.1632256176026;
 Tue, 21 Sep 2021 13:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com> <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com> <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com> <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com> <YUmOGFUFONR/ynfW@atomide.com>
 <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
In-Reply-To: <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Tue, 21 Sep 2021 13:29:24 -0700
Message-ID: <CAEf4M_B1vam_ykRZmQ5++QArC-=+yooRg25BrQXKE5nk8AtqbA@mail.gmail.com>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
To:     Suman Anna <s-anna@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 21, 2021 at 9:09 AM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Matti, Tony,
>
> On 9/21/21 2:47 AM, Tony Lindgren wrote:
> > * Matti Vaittinen <mazziesaccount@gmail.com> [210920 08:23]:
> >> Finally, adding the udelay(100); (as Tony suggested) at the end of the
> >> omap_reset_deassert() did make the oops go away even when pruss_tm was
> >> enabled. I don't know what would be a proper fix though.
>
> I have been able to boot v5.15-rc1 just fine on my BBB without any additional
> changes [1].
>
> May I ask what is your BBB board version? My board is rev.A5C.

That rev is quite old [1].  Would you be able to try a Rev C?  It has
been in production since around 2014 with the move from 2GB to 4GB
eMMC.

Thanks,
Drew
[1] https://elinux.org/Beagleboard:BeagleBoneBlack#Revision_A5C
