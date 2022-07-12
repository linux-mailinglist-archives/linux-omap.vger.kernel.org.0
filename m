Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE3257164C
	for <lists+linux-omap@lfdr.de>; Tue, 12 Jul 2022 11:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbiGLJ63 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Jul 2022 05:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiGLJ63 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Jul 2022 05:58:29 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185C2AAB05
        for <linux-omap@vger.kernel.org>; Tue, 12 Jul 2022 02:58:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t1so9527978lft.8
        for <linux-omap@vger.kernel.org>; Tue, 12 Jul 2022 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37VTfuLmrmrfifjGIyTRdObjI/MKcJWQ1tpeTXrM7yE=;
        b=UURjb34NTwrnFBr9T0FFPI+3EiJ0S9Jci1LVvi6IinmRpPDwTTTQPpvuA6FgGpsFOv
         vcH2Ec7iBf6xYHsRRyt9C0KVfOPbjVhljQWAItp2WhFF/W4Eq/803HOKP4sl5BMxUaGJ
         gZXzDyhOjLpp+XeP6wXCiyO3u6ixxYDfqVH8d16sECEtJx7yQQku/JW8nIsiC3l4JVJw
         5CA3tn47cIgWcP+O5BQtGdmN2+ErI92vgd+kKCKe0zrdrtTN5dYnW+rf/2+UheLdWGSp
         /xXvrAbgDdp7yWgQx/Ju05a/Zjs2bcSodlXzw1k809jSGkIF1Rb6FkMIMXvdLoWRCufE
         Zs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37VTfuLmrmrfifjGIyTRdObjI/MKcJWQ1tpeTXrM7yE=;
        b=2TpFWqYcT3e/qM1Eihoyjt7gpQNmBW79rBVOOkXXdLgu9E3eWZ7tePbbORCqs1XNJe
         eJcbmk9pVeUlg7nT4q4zU3abHyj2CfV282oM8RYPCSbtiybpju/NsDv3mh71yoLHFZTD
         4h77cz8h0oiiHev7InPeBuJrG0uxiEQeUMcg1M6nBBMwD+6zmm55fbG5hGB2wmP1UbGQ
         95g0vTn2YTdEBlR+M9L+MQqBg4zXmxJkmmPMlLfMl4451ONNThNJNTz7j4AksHkc6RdU
         ZBfjVpkWycYpOPSMu2pKh19PGidnFMdh/lHxrTLiGIDEhLe/M8ehjpg9ID1JhErB09od
         ishg==
X-Gm-Message-State: AJIora/KAVYGHZci4ZdQgSNtWQ/k+apFDICckGY2uRScrTijDBws8RSi
        oPd3Jj/cILNRiFSURdo+Jo3D1T3ZTRICCjserwErOTujJ1tpKg==
X-Google-Smtp-Source: AGRyM1tF1rH3gCKCxA0w4to0pXkYFZRfaL8jzDdehbvLxjkPzOaPtTNJfkry8AFrEL4erx6bV6uZqFu7tTuU7atW/bU=
X-Received: by 2002:a05:6512:ad6:b0:481:1a75:44c with SMTP id
 n22-20020a0565120ad600b004811a75044cmr14963318lfu.167.1657619906419; Tue, 12
 Jul 2022 02:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220622051215.34063-1-tony@atomide.com> <CAPDyKFpNBQK3QZk-+5-4YB8=2O3sxwj5-nThd00ayp7FHSjUSA@mail.gmail.com>
 <YrlKjZHJ37PHy9af@atomide.com>
In-Reply-To: <YrlKjZHJ37PHy9af@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Jul 2022 11:57:50 +0200
Message-ID: <CAPDyKFqxSuuMtmfqwSojPqfHhv4RDLtRQf+JbOGZJkxVhDDAtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mmc: sdhci-omap: Fix a lockdep warning for PM
 runtime init
To:     Tony Lindgren <tony@atomide.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 27 Jun 2022 at 08:13, Tony Lindgren <tony@atomide.com> wrote:
>
> * Ulf Hansson <ulf.hansson@linaro.org> [220623 12:55]:
> > On Wed, 22 Jun 2022 at 07:12, Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > We need runtime PM enabled early in probe before sdhci_setup_host() for
> > > sdhci_omap_set_capabilities(). But on the first runtime resume we must
> > > not call sdhci_runtime_resume_host() as sdhci_setup_host() has not been
> > > called yet. Let's check for an initialized controller like we already do
> > > for context restore to fix a lockdep warning.
> >
> > Thanks for explaining the background to the problem. However, looking
> > a bit closer I am worried that the error path in ->probe() is broken
> > too.
> >
> > It seems in the error path, at the label "err_rpm_put", there is a
> > call to pm_runtime_put_autosuspend(). This doesn't really guarantee
> > that the ->runtime_suspend() callback will be invoked, which I guess
> > is the assumption, don't you think?
>
> OK I'll check and send a separate patch for that.
>
> > That said, I wonder if it would not be easier to convert the ->probe()
> > function to make use of pm_runtime_get_noresume() and
> > pm_runtime_set_active() instead. In this way the ->probe() function
> > becomes responsible of turning on/off the resources "manually" that it
> > requires to probe (and when it fails to probe), while we can keep the
> > ->runtime_suspend|resume() callbacks simpler.
> >
> > Did that make sense to you?
>
> Simpler would be better :) We need to call pm_runtime_get_sync() at some
> point though to enable the parent device hierarchy.

Is there a parent device that has runtime PM enabled?

In other cases, it should be fine to use pm_runtime_set_active()
during ->probe().

> Just calling the
> sdhci_omap runtime functions is not enough. And we still need to check
> for the valid context too. Also I'm not convinced that calling
> pm_runtime_get_sync() on the parent device would do the right thing on
> old omap3 devices without bigger changes..

I certainly agree. The parent should not be managed directly by the
sdhci driver.

One thing that can be discussed though, is whether
pm_runtime_set_active() actually should runtime resume the parent,
which would make the behaviour consistent with how suppliers are being
treated.

> But maybe you have some better
> ideas that I'm not considering.

I can try to draft a patch, if that would help? But, let's finalize
the discussion above first (apologize for the delay).

Kind regards
Uffe
