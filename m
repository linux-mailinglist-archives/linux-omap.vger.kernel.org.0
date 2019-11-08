Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02DA7F5912
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 22:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfKHVEZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 16:04:25 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:41638 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbfKHVEY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Nov 2019 16:04:24 -0500
Received: by mail-il1-f194.google.com with SMTP id q15so1214246ils.8;
        Fri, 08 Nov 2019 13:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=epWM3knefAqrLqDU/OViVdI12EGBGkgWXZubjUR/AtI=;
        b=psjPZbKl7eoAeg0Hi65pLLJR5aWpIp8eW6QSp222ruy31He0QUvMMPYRhrRTOqbjcO
         WrX/TkaI+epYVp0RWOutmHRDB0ez/3x3W/DtQUhmHTGuMsMFWlTRxmobphUxVYkH1GBy
         iP6rc/fL99P860YoSz3EMeZqiawmzLDunBCI4bD7Ncq/HjAmz5O67/kRM5ZT0AcwwNmk
         jiPY6tFxcV2KphnhWkMrjwTwDlO0oQ6tm3RQVckZcC4XcIuFLLbrQZh8CWC26b+crYD6
         hyxIcuO3eoQroLW/0gKKg421M9rGFyZERm73JMS1XJoGYQUODru4xH7rSppwHXCg+057
         PNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=epWM3knefAqrLqDU/OViVdI12EGBGkgWXZubjUR/AtI=;
        b=Ve9MVi8xKgeyKq5BpM1/LpoEY7UISOUI1ul/JStQ4aDcnliZSHVgJAKL/1CEmnQHAb
         LWcW+r+X6l9FEtNHlsiO/yYjTkes7cUMjuALW6J8mtHzIpCl3ExlV57HiiB3UZR7Xi6p
         MgEelH/MpHYe1SWilbBglcdzarPqcPgioIpUXXX2yjT4hp66SGq/d0j3yEFtzIv3MaUo
         15a1MZK4CcSRSy3yK8MSU70v5FEw/eaKm3GQYIqRqxSjEQKD4fwu+rs0Sml0jkufo9vY
         PLtNj67JXHyh/4gHE2GOduLkWbsWJRhkmWUHpVOgT6eMyTMVhO49VcJp3DJsE/SXLaVG
         GlHw==
X-Gm-Message-State: APjAAAWbL5uB7l2yM3oDPvXBLJm/jYFDo7UhZas3RH6MX8IMPW5TwGPa
        eBHlJNhj7J7VcNIC5TuyguXuGBibuwuilSEpq/w=
X-Google-Smtp-Source: APXvYqw6LOuVT9ebBAj+3hLk3gV0PVdz/r5xYLkm8Egl9Vt/40fOFEiRRhDP1HrKXFl8PUTBOhsUrbzSHNJW3GdbLpM=
X-Received: by 2002:a05:6e02:c2c:: with SMTP id q12mr15390187ilg.205.1573247063677;
 Fri, 08 Nov 2019 13:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20191007220540.30690-1-aford173@gmail.com> <20191022162223.GU5610@atomide.com>
 <CAHCN7xLy975mxX+cm56PMx-TKODEZjYPfMHb=byspKxYXXq7OA@mail.gmail.com>
 <20191022221919.GF5610@atomide.com> <1CE62E4E-1A38-448C-9197-8FA16747F942@goldelico.com>
 <20191023143646.GG5610@atomide.com> <CAHCN7xKi4oSoVbRM=-D1s2GnMig8xs6iYNwUWj2Ohfj+1okx=Q@mail.gmail.com>
 <20191108205139.GP5610@atomide.com>
In-Reply-To: <20191108205139.GP5610@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 8 Nov 2019 15:04:12 -0600
Message-ID: <CAHCN7xLv9K07ya4Ssj_zs_7pwGwWVT_P4QbH88Bz0wPjB=HX_A@mail.gmail.com>
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

On Fri, Nov 8, 2019 at 2:51 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Adam Ford <aford173@gmail.com> [191108 20:03]:
> > On Wed, Oct 23, 2019 at 9:36 AM Tony Lindgren <tony@atomide.com> wrote:
> > > My guess is we need to call clk_disable() and call
> > > ti_bandgap_save_ctxt() on CPU_CLUSTER_PM_ENTER similar to
> > > what ti_bandgap_suspend does. And then restore it on
> > > CPU_CLUSTER_PM_EXIT.
> > >
> > > There's a similar example already in gpio_omap_cpu_notifier().
> > > Not sure if there is some related errata to deal with too,
> > > probably the old Nokia n900 or n9 would provide some hints
> > > on what exactly needs to be done.
> >
> > I 'think' I have a patch ready that does what you're asking, but I
> > will fully admit that I don't completely grasp what's going on.
> >
> > I'll submit it as an RFC, but I am not even sure I understand what to
> > put into the description, so if you're OK with reviewing the RFC, feel
> > free to mark up the actual commit message as well.
> >
> > From what I can see, the changes haven't negatively impact stuff. I
> > didn't see the power consumption go up before, so I am not sure I can
> > replicate your findings.
> >
> > It'll be posted shortly.
>
> Yeah seems to do the job, thanks for fixing this issue.

I am glad I could help!  I am learning new stuff.  :-)

Once the other patch to fix the bandgap clock idling, will it be
possible to accept this as-is, or do you need me to re-base and submit
again?

Ideally, once we get the thermal stuff in and we can drop Nikolaus'
turbo option on the 1GHz processor and just let the processor scale to
1GHz without having to deal with the boost stuff since it should
throttle back when the junction temp hits its threshold.

If you want me to re-base, please let me know which branch I should use.

Thank you,

adam

>
> Tony
