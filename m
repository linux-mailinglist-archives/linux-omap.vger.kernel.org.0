Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6982CF222
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 17:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730888AbgLDQnl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 11:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbgLDQnl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 11:43:41 -0500
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AF5C061A4F
        for <linux-omap@vger.kernel.org>; Fri,  4 Dec 2020 08:43:00 -0800 (PST)
Received: by mail-vs1-xe44.google.com with SMTP id j140so3592873vsd.4
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L2827Z3XOh+XnEroPsCQccYwh3m7efG10aQgHlA1ySA=;
        b=JYZU1g+ZlShEvQrrKWBiYO9iBQR9lb1CAooVruB5LFjgcYFN57A0Z5Vyg0QfmpRgPI
         mWA5CIgBn5zwwntKCAzMxCOKmmTG35klow6QnerENNCPXmnsGiIbKnhelkt6KNA/nELx
         o9rBEIY32vBcPqkvXGeIcJrpW5gwGxgRRwG2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L2827Z3XOh+XnEroPsCQccYwh3m7efG10aQgHlA1ySA=;
        b=Rr8yz69MktLyWD38+OAqWEXBxzRUV3VGxsvJ68DAEkbnMuYVSTLp910wugAg8Lwq/s
         1UNATBoYHaDB9K5cSxR4TN88A5CR6LqfwnhcfDIMzIAY6v4hEe///wbizxDcGMccu11N
         2mRAO7XpEp6qDTgO5ZDXybqlWnoqdeHNQLhX2Kt+6nmmPbPtX1GNP/0MmSj6XvJIA/L9
         MYPFW7sjKbQvKJKBU+FGh9kJXzhW7zbvKuROtt0WrGj8gsMOWJeSLDZFUfd4Itut1eLZ
         lBi13CPpgNnoSdg2yvohukJTKfspozOSjlMnZmzD46TpqKQvyoMw5TfFOPjSP5IWYnR0
         P7VA==
X-Gm-Message-State: AOAM531bB1AOxXec1lpeExjPFeeDDqmmNCN640mtozlGEObOLNxuA5KT
        8elOtAPLL6Rr9k3do/zRSDZk0xrJUMxJHw==
X-Google-Smtp-Source: ABdhPJxbuFphP3DS/6H0s4eEAirtj5JnfekcDcJdLFo1VgPyBaW2idJJwHmSG/mjzfqDQDD3VbURNg==
X-Received: by 2002:a67:ad0f:: with SMTP id t15mr4197150vsl.24.1607100179961;
        Fri, 04 Dec 2020 08:42:59 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id x71sm400655vsc.2.2020.12.04.08.42.59
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Dec 2020 08:42:59 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id y26so2051272uan.5
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 08:42:59 -0800 (PST)
X-Received: by 2002:ab0:35fa:: with SMTP id w26mr4096249uau.90.1607100178761;
 Fri, 04 Dec 2020 08:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20201204095539.31705-1-andreas@kemnade.info> <CAD=FV=WLcEBv7gaA3MOVYmxJ3d2Q+mo+Amkex=0eu_19jMtjrA@mail.gmail.com>
 <20201204171428.0a011188@aktux>
In-Reply-To: <20201204171428.0a011188@aktux>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Dec 2020 08:42:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vynttaz00yqbihgK0HxyrPt9b0i0-8Ft6-4NEPc_NkeQ@mail.gmail.com>
Message-ID: <CAD=FV=Vynttaz00yqbihgK0HxyrPt9b0i0-8Ft6-4NEPc_NkeQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: omap_device: fix idling of devices during probe
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, Dec 4, 2020 at 8:14 AM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> > > Fixes: 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")
> >
> > From the description it sounds like this problem has always existed
> > but the async probe just tickled it reliably.  Seems like it'd make
> > sense to tag the "Fixes" as some earlier commit so you make sure your
> > fix gets picked to kernels even if they don't have the async probe
> > patch?
> >
>
> Hmm, maybe
> Fixes: 04abaf07f6d5 ("ARM: OMAP2+: omap_device: Sync omap_device and
> pm_runtime after probe defer")
>
> But on the other hand to stable branches only such patches are applied
> which solve pratical problems not only theoretical problems. But maybe
> it solves several random issues where nobody took care to debug them.
>
> That would be since v4.11.

I guess maybe best is to include both.  Then if someone is debugging
why their async probe is failing they will notice this commit, but
they also might decide to pick it earlier just to be safe...

-Doug
