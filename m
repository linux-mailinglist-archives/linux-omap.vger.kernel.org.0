Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A492C132F29
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 20:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgAGTPM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 14:15:12 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:34675 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728652AbgAGTPM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 14:15:12 -0500
Received: by mail-io1-f68.google.com with SMTP id z193so539853iof.1;
        Tue, 07 Jan 2020 11:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yl2wbUAzHAKbcOb1Vl7UvKqELmoqXyVI0Xh3B+s9l6w=;
        b=rkQzotOI2WHHWwl7HXrjtEqiFBUizAnXJy0V8EQAuovXuZcIet+WvPqNR5SjCRKpX3
         RBOmcSr49Rvp4qGRrH8iXEmGIh1XxFKeoUYJC3G0jk3Ln6y1IfZjD6/eLB3cwp6f9L8B
         V5xp35Kp4/+p+M+E/8RZ7RVnE289Ouaw8GJ/JTCsju3xsMP9NfaE8X4KXapOYPEOFbx9
         8c1UEuszme5mHl5SDsWoFPTH89wgrj0jW9rjSb06Enjkys1L2KrVbLlRB6qEJiCUkvjm
         jTv08XipmW3TZppSYqz1ljOQawAKLULX/rRIeXP6mAV1b6DoU12kV8x5Uzfj0ZhR0DV6
         WhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yl2wbUAzHAKbcOb1Vl7UvKqELmoqXyVI0Xh3B+s9l6w=;
        b=j5QiUShOfDHIRnT9AKN1VJ+RPrMDSwRcB7Xy6rZQezNLQkngJWPZhyymAbOaLJx3iA
         Wr0Vn9RscRWCmFzPEchSq+wL+PRpywbOKuAyXuhj0o2xL9tQBSDJgkQBdun0rArpx7p4
         fmAQgNfp/jXABGvRxh+9qjhEG9NIe0hEuHOJpz+HYKURf3pI2OZJ7CWVifgNOfb1/2r+
         bAgBDQAQXgDQv4j6idLYP/P0Hu/W9c/2e9VxMFSLInxMeICbC1edAt5GYMaDySeiXjcP
         8B8KT6M8Df5+7AMYxvOeiB3OAyP8PE6gS7UM8Q4uWmh6R0ca90O80lDAnA3wlZ+cZeL/
         mrpg==
X-Gm-Message-State: APjAAAWWvI0TZUFyjMqa0s7dRD/ankYDFiHSiQ8xBIdLFdhS7qNNlp9P
        stmD1dEj6srUe7qWW+OrcSUm0/Fg3q3S2epWh1n0wfONJ3A=
X-Google-Smtp-Source: APXvYqz9PvnXo6JBf/ETXrEq1+jj6hv8iMvI1zUApsw3LhkJjvDhAUAxswe1B7GebdiWNs1qbym12yJE7R7vujQvTMM=
X-Received: by 2002:a6b:c8c8:: with SMTP id y191mr430846iof.104.1578424511057;
 Tue, 07 Jan 2020 11:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20200106203700.21009-1-tony@atomide.com> <CAOesGMiNbyUXwPFsG-ipTn-xfEs+A2hG8Q8MTcSLz5794GCv0g@mail.gmail.com>
In-Reply-To: <CAOesGMiNbyUXwPFsG-ipTn-xfEs+A2hG8Q8MTcSLz5794GCv0g@mail.gmail.com>
From:   Frank Lee <tiny.windzz@gmail.com>
Date:   Wed, 8 Jan 2020 03:14:59 +0800
Message-ID: <CAEExFWuQuTHNsjABpSBAa46NzftHS0+nLLG=qdEcaeatLZFLeQ@mail.gmail.com>
Subject: Re: [PATCH] clocksource: timer-ti-dm: Fix regression
To:     Olof Johansson <olof@lixom.net>
Cc:     Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jan 7, 2020 at 5:07 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Mon, Jan 6, 2020 at 12:37 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > Clean-up commit 8c82723414d5 ("clocksource/drivers/timer-ti-dm: Switch to
> > platform_get_irq") caused a regression where we now try to access
> > uninitialized data for timer:
> >
> > drivers/clocksource/timer-ti-dm.c: In function 'omap_dm_timer_probe':
> > drivers/clocksource/timer-ti-dm.c:798:13: warning: 'timer' may be used
> > uninitialized in this function [-Wmaybe-uninitialized]
> >
> > On boot we now get:
> >
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 00000004
> > ...
> > (omap_dm_timer_probe) from [<c061ac7c>] (platform_drv_probe+0x48/0x98)
> > (platform_drv_probe) from [<c0618c04>] (really_probe+0x1dc/0x348)
> > (really_probe) from [<c0618ef4>] (driver_probe_device+0x5c/0x160)
> >
> > Let's fix the issue by moving platform_get_irq to happen after timer has
> > been allocated.
> >
> > Fixes: 8c82723414d5 ("clocksource/drivers/timer-ti-dm: Switch to platform_get_irq")
> > Cc: Yangtao Li <tiny.windzz@gmail.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
>
> Acked-by: Olof Johansson <olof@lixom.net>

Acked-by: Yangtao Li <tiny.windzz@gmail.com>

I am sorry. I will pay attention next time.

>
> > ---
> >
> > I did not notice simlar issue with other patches in the series, but
> > please do double check Yangtao.
>
> Yeah, this even seems to be caught at build (but our builds have been
> so noisy with warnings lately that they're hard to spot):
>
> /build/drivers/clocksource/timer-ti-dm.c: In function 'omap_dm_timer_probe':
> /build/drivers/clocksource/timer-ti-dm.c:798:13: warning: 'timer' may
> be used uninitialized in this function [-Wmaybe-uninitialized]
>   798 |  timer->irq = platform_get_irq(pdev, 0);
>       |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> -Olof
