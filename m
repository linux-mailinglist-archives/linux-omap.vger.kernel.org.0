Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9608AF5805
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 21:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731181AbfKHUCo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 15:02:44 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:38503 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730685AbfKHUCn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Nov 2019 15:02:43 -0500
Received: by mail-il1-f194.google.com with SMTP id u17so1316262ilq.5;
        Fri, 08 Nov 2019 12:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mYf/nyD6rltSVBlJ1rEzYYkSo9gCsLs6tcnYeIJug6o=;
        b=hULN7kc6Ntx0VJDf3/r/Ug9KysUhIby/9+oydfz0Fpzli6ZoQi5By2We85qloWst6B
         KxA7mlmhvc4EGkfx4O5/Rjo3X4lURuasgZxveoz5Rwc7Vu3TEPnThe95kgYLEtF/T9NS
         2d3emfu3AjAaSsvEo1kUuny8w3oBima7EHy72jpIdQJZYvTqOgozrbFgbFfJPN10rZts
         E5uMw+UwJ8+Efan0vuD+xVy7VFvetRj4c7eIuMVTxPNafABcb0qCm6CJX+POcsypAcSO
         I5muVAbCYSUVpAjhtGzYGl88oG9TF1ym7IOsepCWEORdapjFaCV1D2GUqlWBkEtzoWuY
         +eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mYf/nyD6rltSVBlJ1rEzYYkSo9gCsLs6tcnYeIJug6o=;
        b=N9+s+A61s+RnBvEmh/z6TRHBcvO1QsuX4HNOZPVOspjln3V/Tap4oafdzm91vGhhbl
         eRwzF73SW/BPl0bcFPBq+mn3Ht2/BeJsWtdXuOExszcg0voDCQ7hPRtlFeoDIrDvTN3K
         W3N60LDyfws4MK+7+Yg615RBvZ8Y1TuKX2r/BD2IpmE4wCVh0A6IGWbuAA6k5s7tm19O
         TQNyuEhkB23kAjwt/bo25IJc+JgILqh70JDqutJlPWZmb2n9un78p6oT/qODHZl5fbiP
         sRoXh+vGbDW2/vN/M2W/YEXcpJLxtR6uZbmMZ+eIyQZp8c7PN4C31zq3SWzgikU5EpKD
         /n7Q==
X-Gm-Message-State: APjAAAUQ38K3mKBGdcWG767/hL1IaDAPdhFItyvpEL+WiUkn26kxTq0Z
        rRl91oKxVbYr/87p660SP1/blbH9jXIHBWhZgRo=
X-Google-Smtp-Source: APXvYqwFjCYO6s12BEyvIYjLOyp6JD59hgPbNgslBpXqVMXVo7xFRqxpwstlboDNb3up2WkJsPVmP6NtsZNsXXoTNKo=
X-Received: by 2002:a92:ca8d:: with SMTP id t13mr14120645ilo.58.1573243361073;
 Fri, 08 Nov 2019 12:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20191007220540.30690-1-aford173@gmail.com> <20191022162223.GU5610@atomide.com>
 <CAHCN7xLy975mxX+cm56PMx-TKODEZjYPfMHb=byspKxYXXq7OA@mail.gmail.com>
 <20191022221919.GF5610@atomide.com> <1CE62E4E-1A38-448C-9197-8FA16747F942@goldelico.com>
 <20191023143646.GG5610@atomide.com>
In-Reply-To: <20191023143646.GG5610@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 8 Nov 2019 14:02:29 -0600
Message-ID: <CAHCN7xKi4oSoVbRM=-D1s2GnMig8xs6iYNwUWj2Ohfj+1okx=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] configs: ARM: omap2plus: Enable OMAP3_THERMAL
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 23, 2019 at 9:36 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * H. Nikolaus Schaller <hns@goldelico.com> [191023 04:42]:
> >
> > > Am 23.10.2019 um 00:19 schrieb Tony Lindgren <tony@atomide.com>:
> > >
> > > * Adam Ford <aford173@gmail.com> [191022 19:01]:
> > >> On Tue, Oct 22, 2019 at 11:22 AM Tony Lindgren <tony@atomide.com> wrote:
> > >>>
> > >>> Hi,
> > >>>
> > >>> * Adam Ford <aford173@gmail.com> [191007 15:06]:
> > >>>> The some in the OMAP3 family have a bandgap thermal sensor, but
> > >>>> omap2plus has it disabled.
> > >>>>
> > >>>> This patch enables the OMAP3_THERMAL by default like the rest of
> > >>>> the OMAP family.
> > >>>
> > >>> Looks like this breaks off mode during idle for omap3, and that's
> > >>> probably why it never got enabled. The difference in power
> > >>> consumption during idle is about 7mW vs 32mW for the SoC as
> > >>> measured from torpedo shunt for main_battery_som.
> > >>>
> > >>> I think the right fix might be simply to add handling for
> > >>> CPU_CLUSTER_PM_ENTER to the related thermal driver to disable
> > >>> it during idle like we have for gpio-omap.c for example.
> > >>
> > >> I am not sure I know where to start on fixing that issue.  Would you
> > >> entertain enabling the driver if we set the device tree to 'disabled'
> > >> by default?  This way if people want to to use it, it can be enabled
> > >> on a per-device option.  Once the power stuff gets resolved, we might
> > >> be able to enable it by default.  For people who are planning on using
> > >> the DM3730 @ 1GHz in high temp environments, I am not sure they'll
> > >> care about low power.
> > >
> > > They should both work fine together though. They are not mutually
> > > exclusive features.
> > >
> > >> I'll try to look into it when I have time, but I was hoping a
> > >> compromise might be a reasonable work-around.
> > >
> > > It should be hopefully a trivial fix.. I have not looked at the
> > > driver code though.
> >
> > If I am taken right, it is the drivers/thermal/ti-soc-thermal/ti-*.c
> > which is a common driver for omap3, omap4, omap5. They only differ
> > in the thermal data and which registers and bits are used to access
> > the ADC.
>
> Yes so it seems. Enabling OMAP3_THERMAL adds support to
> of_ti_bandgap_match[] for omap3 and causes the issue.
>
> > So is this problem with off mode also known for omap4 and omap5?
>
> Probably. But we don't have off mode working for omap4, and
> it cannot be used for omap5 AFAIK.
>
> My guess is we need to call clk_disable() and call
> ti_bandgap_save_ctxt() on CPU_CLUSTER_PM_ENTER similar to
> what ti_bandgap_suspend does. And then restore it on
> CPU_CLUSTER_PM_EXIT.
>
> There's a similar example already in gpio_omap_cpu_notifier().
> Not sure if there is some related errata to deal with too,
> probably the old Nokia n900 or n9 would provide some hints
> on what exactly needs to be done.

I 'think' I have a patch ready that does what you're asking, but I
will fully admit that I don't completely grasp what's going on.

I'll submit it as an RFC, but I am not even sure I understand what to
put into the description, so if you're OK with reviewing the RFC, feel
free to mark up the actual commit message as well.

From what I can see, the changes haven't negatively impact stuff. I
didn't see the power consumption go up before, so I am not sure I can
replicate your findings.

It'll be posted shortly.

adam
>
> Regards,
>
> Tony
