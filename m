Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC84954C413
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jun 2022 10:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237420AbiFOI7U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jun 2022 04:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346703AbiFOI7B (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jun 2022 04:59:01 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08CEBF49;
        Wed, 15 Jun 2022 01:59:00 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3137316bb69so54004137b3.10;
        Wed, 15 Jun 2022 01:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YY6o5gIXCOujoqtYnZ6ZMVVi/7B441zfJT8ExBoqjZI=;
        b=odCtOHgyKBn5icb7FDKVoJvmqv2vVQw3BCunPu3BrnWsSJQ+h8B3qzsji8DBLHuQ5+
         nGyE+sv/4nj0zxkyVuvfw3OfoI76SzuWdtBvxLD6ohCT2AJftoRzjTeYBxXnTti/ScTK
         Q3mafDTLmM69ze7ZmzXOUORBfnPMN2tyIc6HUsbz8NnZwCROg04mqF7FLAH0A/2fNhHr
         nu1fGQrusfsaQ2fXsiz7OF8UtU7wGJ9h2GPC57s53+0dOD1u+hVGuZYd2jF43nUdccZP
         RpfAlReeis6zGKC9pc+8Xv2B9BbMhbTdflC7tnSq8QwwihrBSi19/WpzglCv3/3C/PLA
         dwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YY6o5gIXCOujoqtYnZ6ZMVVi/7B441zfJT8ExBoqjZI=;
        b=p4J8/7o5+13S87xnazRto03aBMwqDCxJMPkBL0cKJ6aXiH6/XgVk1IYwkhKp4MDFMF
         5xu4MZ2G163Kh6aYmHsUy6Z+u1omuMfbqS6SISu+CtkEfB8uvwJPiN8NaXuHHMdMP3QX
         t7hw5CofWGv3Myng3VPnG3ixJsJlc90s1vUiWUi5NK0oJY/WwHiRMPTpEYvNu5K+fej1
         3Qugz9fNtIQ+s3vEqJRVU/FCmh0CQ4YHVVXM3VBjkxmx7/nRapUSsrgxdKG/6LTHG1a4
         jymk69LK66brD3Wj5CRBNoiU/w2wRT1db5C1/26dmT8NyVAO+suRmbiLMaT8+WxqNkXY
         UF/A==
X-Gm-Message-State: AJIora9pavaHD0BIFJloi6bcXr1P/bcuigiiaWLQQQs9zEWRHfpknrO3
        zg2zhrpDemLSIqUd6DOHFcKy8cfRXmUzEyTKvNN8XoFc
X-Google-Smtp-Source: AGRyM1swVJe6COvD5ORmnOO2vkAVflViuU9r1qNX835e1TaZfBaVlpIm+ruE5eShBDbkfdZDdITJ5UI7zml4HZzf3lc=
X-Received: by 2002:a81:184b:0:b0:30c:846e:e2b with SMTP id
 72-20020a81184b000000b0030c846e0e2bmr10479788ywy.97.1655283539896; Wed, 15
 Jun 2022 01:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com> <CAGm1_ktACExigtZUYFWria8=cxhy6x6vDGpLcaZAvnE9G3Bz_A@mail.gmail.com>
 <YqmTXqXLala7Li/+@atomide.com>
In-Reply-To: <YqmTXqXLala7Li/+@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 15 Jun 2022 10:58:48 +0200
Message-ID: <CAGm1_kvM0p=T4L4vDpXj2quMCPqoBidztsLaAsKYCYCGpvVnng@mail.gmail.com>
Subject: Re: Linux 5.18.x: sdhci issue
To:     Tony Lindgren <tony@atomide.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mmc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Wed, Jun 15, 2022 at 10:08 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Yegor Yefremov <yegorslists@googlemail.com> [220615 09:40]:
> > Hi Tony, Ulf,
> >
> > On Thu, May 5, 2022 at 7:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > Hi,
> > >
> > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 09:12]:
> > > > Hi Tony, all,
> > > >
> > > > During the kernel boot I see the following error. The device is still
> > > > working afterwards. 5.17.5 shows the same behavior. Is this a known
> > > > issue?
> > >
> > > Thanks for reporting it, I was not aware of this one. Might be worth
> > > bisecting. Adding linux-mmc and Ulf.
> >
> > This is my bisect result:
> >
> > f433e8aac6b94218394c6e7b80bb89e4e79c9549 is the first bad commit
> > commit f433e8aac6b94218394c6e7b80bb89e4e79c9549
> > Author: Tony Lindgren <tony@atomide.com>
> > Date:   Fri Oct 15 13:47:18 2021 +0300
> >
> >     mmc: sdhci-omap: Implement PM runtime functions
> >
> >     Implement PM runtime functions and enable autosuspend.
> >
> >     Note that we save context in probe to avoid restoring invalid context
> >     on the first resume. For system suspend, we have the new PM runtime
> >     functions do most of the work.
> >
> >     Signed-off-by: Tony Lindgren <tony@atomide.com>
> >     Link: https://lore.kernel.org/r/20211015104720.52240-5-tony@atomide.com
> >     Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> OK thanks this makes sense based on what Arnd replied a few days ago.
>
> Regards,

Your patch did the trick: all warnings/errors are gone. Thanks
everyone for the help.

Yegor
