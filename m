Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468E143A93F
	for <lists+linux-omap@lfdr.de>; Tue, 26 Oct 2021 02:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235419AbhJZAdC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Oct 2021 20:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234724AbhJZAdC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Oct 2021 20:33:02 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B64C061767
        for <linux-omap@vger.kernel.org>; Mon, 25 Oct 2021 17:30:39 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id m63so30313388ybf.7
        for <linux-omap@vger.kernel.org>; Mon, 25 Oct 2021 17:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GKpt6gbUiUnxRUWu5oj6hwoD4Hy59PUSCVuLvc1dxEQ=;
        b=RXv66RKwy6UqpmJo42NU6ImPtA0hhG8/Hy8v1NimoQYcVrEDXumRbWrcFjH1xV+Ock
         bXfHSE1/Aa52wxOkNcAfIoezAMn3Lpd9TvcFaLmUkm9YSD1ViBQO3RTcfNLjsQAEVwPO
         Sr04OJMjHKpOMiakJvt4bqsOkwBFejrv5vw1+yiMxdDWuSGB3dwrLvEHrZHaBDAxQ3uA
         mA+d2EtJEqyxDpUIrllz7ZzNwH/TJ1a18W6GZtWTatTAtJkG5uU+3x0kjP5oP99JIRpK
         8UWvswhWCiyJQ6Wipr1qNVQ4eL1Iq7g7upvvOrcQcLjJqw8VVQGfniWrGznluMgNzjyV
         XYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GKpt6gbUiUnxRUWu5oj6hwoD4Hy59PUSCVuLvc1dxEQ=;
        b=5zxZFmK0AZAftvtSRYFy+iMzFFSGmUCuj1MWAtj3agu6YmJmVVG3+4RMMBDpSwFgGQ
         mFZosYVuVC34ENDXT5RJD5pdBCVUm9SWGhpPN0x2dNZLFyV+Aby0vWHzEmiUG9LvqnId
         duMaEqUOTkFiqvd0wo9Ye0cHy2An6hqNNiDf5svqQFOjneY6Iw6PUC0g/KsdswwDSDnW
         LIl4FVg5+J8pY4FwdO2q6uC55OG6/0Le2C2Btm5k+fQpCd2gV4L/Fm8ha61zlcFwL5WH
         Cxq/niLHM++HkvEJHasN+rAgUeZZzgZk3POQ44chHNiHwyOm6QA9p1p0lSoI1JaMXDNJ
         SLsg==
X-Gm-Message-State: AOAM531BHizC5nu56+4UdME/3hff220muhikoBt5lRVYsCVMavjscDJE
        O4NOOwYdsgi38gu8TWY1s/hXNhNkER/7LKancERsGA==
X-Google-Smtp-Source: ABdhPJwkdfRIKjhmBppLm+T21H0QPHoD4LXXiPIYhqq5jQAumISBbcpXVG/c3VSAYycVKUykbWB0N2n0Rav/D4MlbEo=
X-Received: by 2002:a5b:cce:: with SMTP id e14mr20273877ybr.486.1635208238648;
 Mon, 25 Oct 2021 17:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
 <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com> <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
In-Reply-To: <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 25 Oct 2021 17:30:02 -0700
Message-ID: <CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        linux-arm-kernel@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
        linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 22, 2021 at 10:00 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Fri, 22 Oct 2021 at 05:13, Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Thu, Oct 21, 2021 at 4:21 AM Amit Pundir <amit.pundir@linaro.org> wrote:
> > >
> > > Hi Saravana,
> > >
> > > This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> > > I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.
> >
> > Amit top posting? How did that happen? :)
> >
> > The fact you are seeing this issue is super strange though. The driver
> > literally does nothing other than allowing some sync_state() callbacks
> > to happen. I also grepped for the occurence of "simple-bus" in
> > arch/arm64/boot/dts/qcom/ and the only instance for 8250 is for the
> > soc node.
> >
> > The only thing I can think of is that without my patch some
> > sync_state() callbacks weren't getting called and maybe it was masking
> > some other issue.
> >
> > Can you try to boot with this log (see log patch below) and see if the
> > device hangs right after a sync_state() callback? Also, looking at the
> > different sync_state() implementations in upstream, I'm guessing one
> > of the devices isn't voting for interconnect bandwidth when it should
> > have.
> >
> > Another thing you could do is boot without the simple-bus changes and
> > then look for all instances of "state_synced" in /sys/devices and then
> > see if any of them has the value "0" after boot up is complete.
>
> Turned out RB5 is not even reaching up to
> device_links_flush_sync_list() and seem to be stuck somewhere in
> device_links_driver_bound(). So I added more print logs to narrow down
> to any specific lock state but those additional prints seem to have
> added enough delay to unblock that particular driver (Serial:
> 8250/16550 driver if I understood the logs correctly) and I eventually
> booted to UI.

Ugh... I think I know what's going on. It popped into my head over the weekend.

Couple of ways to confirm my theory:
1. After it finishes booting in both cases, can you compare the output
of the command below? I'm expecting to see a significant drop in the
number of device links.
ls -l /sys/class/devlink | wc -l

2. Can you try out this terrible hack patch (not final fix, no code
reviews please) on top of Tot to see if it fixes your issue without
having to add hacky logs?

Thanks,
Saravana

--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -38,10 +38,12 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
         * a device that has a more specific driver.
         */
        if (match && match->data) {
-               if (of_property_match_string(np, "compatible",
match->compatible) == 0)
+               if (of_property_match_string(np, "compatible",
match->compatible) == 0) {
+                       of_platform_populate(np, NULL, lookup, &pdev->dev);
                        return 0;
-               else
+               } else {
                        return -ENODEV;
+               }
        }
