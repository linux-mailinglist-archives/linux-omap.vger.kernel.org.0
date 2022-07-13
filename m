Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4B85734AF
	for <lists+linux-omap@lfdr.de>; Wed, 13 Jul 2022 12:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbiGMKyo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Jul 2022 06:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235406AbiGMKyn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Jul 2022 06:54:43 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAD4FF588
        for <linux-omap@vger.kernel.org>; Wed, 13 Jul 2022 03:54:41 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id h16so6443411ila.2
        for <linux-omap@vger.kernel.org>; Wed, 13 Jul 2022 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24vatrNQy4mAwOD26diK3DSgxu+qePazInIA4QqKNZk=;
        b=jfPZqHtoZbCOAxAg1WVYPBaHFTGcLSOGYzT+uhgLdeaz/mz+HHbRWMu5ugQaM3N1/b
         6WPI8XXLnORiaMuhQNWtbu+lIjiHz1915u6o+Quvz8WBxsOHGMRWVgE3i2Dcj8faF/Kh
         L0M21NTtlwbhswZlUuy/Xvje11Bc75+yhKHVTPGIuRzMh+IYHyNarfx9yw39ojFTIpq/
         57RC1cGLmEwFCmo0uFjJiKnHK4CbItqPrfDrPaX5T7q6E2DlG2Ca/fZhzwj3HFJ8lZJO
         cw1I8PUdk8FlDtecDxAIX5dNiFJliz7AeqlrFu7oswhzOrNgXDrS+ciVlsAlVfhsYr/r
         U9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24vatrNQy4mAwOD26diK3DSgxu+qePazInIA4QqKNZk=;
        b=jdAj1TLojS25ePCn5hjFvrg6z/gj6Zsm/ePXsxEt6crNmuA4hqhifs7SJtsvRDuW0j
         uj4i0YtvF4gMq24dRbUfNmPWf6iE5FPW8aGIVmdjUUGjUcTuYB/c8rlfvvTwBQoiOTjc
         7pCjQokFXkj48Zb8OZRceZkwTqCJ8aTI0vTh2Ak63c94IIPj+0zNmPAQzZXcgCbweif8
         fGHxfU+wTXGdfowe8FK5UsYl7guSueClSnHeS/lfLDtvQBFpBEaZZdPwLX4mPbmuwSfo
         xWw18GPuFgzgwSiv0L8Yf+ODY4ySFprhdF4cuVDrnYXzMF4V65pzVeW4iCS3D0lO9MyO
         5LpA==
X-Gm-Message-State: AJIora9HZ6Zw5OdqP6B0+tMdhZEYns3gOEiYk1xIHWU6Hag+kj8Dv37+
        3sFiW8Ee1NUZ+n8mOy6QGQtqsxWzgNDsKYc4bcKeZZJ13DQ=
X-Google-Smtp-Source: AGRyM1v1QI/iq6qY76yqPD/R27P3k4+BLtKUnZOAwoRG74WvRGL2i+kIVVkgi1EoGXhAzXt3jqv8++rgnPFnESaU8Ls=
X-Received: by 2002:a05:6e02:10d1:b0:2dc:2443:f651 with SMTP id
 s17-20020a056e0210d100b002dc2443f651mr1492776ilj.172.1657709680990; Wed, 13
 Jul 2022 03:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220622051215.34063-1-tony@atomide.com> <CAPDyKFpNBQK3QZk-+5-4YB8=2O3sxwj5-nThd00ayp7FHSjUSA@mail.gmail.com>
 <YrlKjZHJ37PHy9af@atomide.com> <CAPDyKFqxSuuMtmfqwSojPqfHhv4RDLtRQf+JbOGZJkxVhDDAtQ@mail.gmail.com>
 <Ys1msXeqPipP7J5g@atomide.com>
In-Reply-To: <Ys1msXeqPipP7J5g@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 13 Jul 2022 12:54:04 +0200
Message-ID: <CAPDyKFrT4hR_HYAsA77ea6j7YMvZ4941aXpN28r_GgF5VLMoEw@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 12 Jul 2022 at 14:18, Tony Lindgren <tony@atomide.com> wrote:
>
> * Ulf Hansson <ulf.hansson@linaro.org> [220712 09:52]:
> > On Mon, 27 Jun 2022 at 08:13, Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > * Ulf Hansson <ulf.hansson@linaro.org> [220623 12:55]:
> > > > On Wed, 22 Jun 2022 at 07:12, Tony Lindgren <tony@atomide.com> wrote:
> > > > >
> > > > > We need runtime PM enabled early in probe before sdhci_setup_host() for
> > > > > sdhci_omap_set_capabilities(). But on the first runtime resume we must
> > > > > not call sdhci_runtime_resume_host() as sdhci_setup_host() has not been
> > > > > called yet. Let's check for an initialized controller like we already do
> > > > > for context restore to fix a lockdep warning.
> > > >
> > > > Thanks for explaining the background to the problem. However, looking
> > > > a bit closer I am worried that the error path in ->probe() is broken
> > > > too.
> > > >
> > > > It seems in the error path, at the label "err_rpm_put", there is a
> > > > call to pm_runtime_put_autosuspend(). This doesn't really guarantee
> > > > that the ->runtime_suspend() callback will be invoked, which I guess
> > > > is the assumption, don't you think?
> > >
> > > OK I'll check and send a separate patch for that.
> > >
> > > > That said, I wonder if it would not be easier to convert the ->probe()
> > > > function to make use of pm_runtime_get_noresume() and
> > > > pm_runtime_set_active() instead. In this way the ->probe() function
> > > > becomes responsible of turning on/off the resources "manually" that it
> > > > requires to probe (and when it fails to probe), while we can keep the
> > > > ->runtime_suspend|resume() callbacks simpler.
> > > >
> > > > Did that make sense to you?
> > >
> > > Simpler would be better :) We need to call pm_runtime_get_sync() at some
> > > point though to enable the parent device hierarchy.
> >
> > Is there a parent device that has runtime PM enabled?
>
> Yes there is the interconnect target module device as the parent with
> runtime PM enabled. So the sdhci-omap driver needs the parent enabled.

I see, thanks for clarifying!

>
> > In other cases, it should be fine to use pm_runtime_set_active()
> > during ->probe().
>
> Yup, this can't be done here though AFAIK. Something needs to enable
> runtime PM for the parent device to have the sdhci registers accessible.
>
> > > Just calling the
> > > sdhci_omap runtime functions is not enough. And we still need to check
> > > for the valid context too. Also I'm not convinced that calling
> > > pm_runtime_get_sync() on the parent device would do the right thing on
> > > old omap3 devices without bigger changes..
> >
> > I certainly agree. The parent should not be managed directly by the
> > sdhci driver.
>
> OK
>
> > One thing that can be discussed though, is whether
> > pm_runtime_set_active() actually should runtime resume the parent,
> > which would make the behaviour consistent with how suppliers are being
> > treated.
>
> Hmm yeah that's an interesting idea.
>
> > > But maybe you have some better
> > > ideas that I'm not considering.
> >
> > I can try to draft a patch, if that would help? But, let's finalize
> > the discussion above first (apologize for the delay).
>
> OK. Should we apply the $subject patch to fix the splat meanwhile
> though? Seems like what you're suggesting may take some more discussion
> on the mailing lists.

Yep, that seems like a reasonable way forward. I keep you cced if/when
I propose something that can replace it.

So I applied the v2 for fixes and by adding a stable tag, thanks!

Kind regards
Uffe
