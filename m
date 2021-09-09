Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EDC405877
	for <lists+linux-omap@lfdr.de>; Thu,  9 Sep 2021 16:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245618AbhIIODw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Sep 2021 10:03:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:51564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244381AbhIIODJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 9 Sep 2021 10:03:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3D84610CE;
        Thu,  9 Sep 2021 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631196120;
        bh=VfcMtzFJq+x3oimwRfSGM3+HsOCz4ZFSYvliKSNFghI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Cx7dqUh6Rl0fzneeoP+NmUqbIDdjyAemDWc6Jz7FofANtXhofVIvSsPKycqctmSdv
         1E7CJgPH/X94KjMai9+YdZieMvE7BK1JD0r0Vte/0F348TXS+QNE1Kc4VyrscCCzc/
         2BCZGWPU8W7i0o2IvR83sqra3mifDTURtrqSNf0KPtgfgJf3Id4HqV/OuNoFUC42fN
         AgetbUvQWd5xPZeG7zNcSOpg1T/omv30wsORVp7jSucX8mkEhD6cN7qHdlEWRbiUVN
         T2Rr5IliCvvYno/AofHkbu9lsHxzqmkjHQqHpEXfJlyDoHSwXk8lOvYOABnZuxBlkl
         6Zd0wKZYDwNCw==
Received: by mail-ed1-f49.google.com with SMTP id 9so2797368edx.11;
        Thu, 09 Sep 2021 07:01:59 -0700 (PDT)
X-Gm-Message-State: AOAM533KYHXGUZZ99CUGDLB9e9YKF2T3i8m5MDZdxZsIb7LCH/sVKB2x
        pmWaxCiSgCrXLeZ9RXa0KKYdH8XcQglD/YIwMQ==
X-Google-Smtp-Source: ABdhPJwlfbFsgaLlLSIuNjQjq2JLgFOQzN2NxKhZEqmEPXIEG/ydouVOBI9d0WFnAhc3n78EUwntrE8dU1HlVQySAz0=
X-Received: by 2002:aa7:d645:: with SMTP id v5mr3380474edr.145.1631196118501;
 Thu, 09 Sep 2021 07:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com> <CAMuHMdUhZy7W_HLtNJ2ECK5uQV5xHV7pDk5BXfNUpW9L68G5Aw@mail.gmail.com>
 <CAGETcx_7N3gtaT-YHGaGL+Qtkv=JOhgPcPF1A+kQ4aaDoetvSA@mail.gmail.com>
 <CAL_Jsq+-DAz+80QtpX5obWWcy=MAyxmTb262VAgMiKwnn=hfxQ@mail.gmail.com> <CAGETcx_=8yX6ObaEJk8QNSaWQPdFHsw4R74JrDFKqOL0AN-gLw@mail.gmail.com>
In-Reply-To: <CAGETcx_=8yX6ObaEJk8QNSaWQPdFHsw4R74JrDFKqOL0AN-gLw@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 9 Sep 2021 09:01:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJVsEj=rmExYHtphfxw_W6cq8WU45SSuYi_g2_KiUaFsg@mail.gmail.com>
Message-ID: <CAL_JsqJVsEj=rmExYHtphfxw_W6cq8WU45SSuYi_g2_KiUaFsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To:     Saravana Kannan <saravanak@google.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-oxnas@groups.io,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 8, 2021 at 7:58 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Wed, Sep 8, 2021 at 5:16 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Tue, Sep 7, 2021 at 2:01 AM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > On Mon, Sep 6, 2021 at 12:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > >
> > > > Hi Saravana,
> > > >
> > > > Thanks for your patch!
> > > >
> > > > CC linux-pm, Lee (mfd)
> > > >
> > > > On Sat, Sep 4, 2021 at 2:05 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > > fw_devlink could end up creating device links for bus only devices.
> > > > > However, bus only devices don't get probed and can block probe() or
> > > > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > > > devices using the simple-pm-bus driver.
> > > > >
> > > > > However, there are instances of devices that are not simple buses (they
> > > > > get probed by their specific drivers) that also list the "simple-bus"
> > > > > (or other bus only compatible strings) in their compatible property to
> > > > > automatically populate their child devices. We still want these devices
> > > > > to get probed by their specific drivers. So, we make sure this driver
> > > > > only probes devices that are only buses.
> > > >
> > > > Note that this can also be the case for buses declaring compatibility
> > > > with "simple-pm-bus".  However, at the moment, none of such device
> > > > nodes in upstream DTS files have device-specific drivers.
> > >
> > > Not sure about mfd, but I want to make sure we don't confuse busses
> > > (which are typically added to a class) with these "simple bus" devices
> > > that are added to platform_bus. Also if these other buses are actually
> > > causing an issue, then then should implement their own stub driver or
> > > use try patch[2] if they are added to classes (devices on classes
> > > don't probe)
> > >
> > > [2] - https://lore.kernel.org/lkml/20210831224510.703253-1-saravanak@google.com/
> > >
> > > >
> > > > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > Tested-by: Saravana Kannan <saravanak@google.com>
> > > >
> > > > > --- a/drivers/bus/simple-pm-bus.c
> > > > > +++ b/drivers/bus/simple-pm-bus.c
> > > > > @@ -13,11 +13,26 @@
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/pm_runtime.h>
> > > > >
> > > > > -
> > > > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > > > >  {
> > > > > -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > > > -       struct device_node *np = pdev->dev.of_node;
> > > > > +       const struct device *dev = &pdev->dev;
> > > > > +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > > > +       struct device_node *np = dev->of_node;
> > > > > +       const struct of_device_id *match;
> > > > > +
> > > > > +       match = of_match_device(dev->driver->of_match_table, dev);
> > > > > +
> > > > > +       /*
> > > > > +        * These are transparent bus devices (not simple-pm-bus matches) that
> > > > > +        * have their child nodes populated automatically.  So, don't need to
> > > > > +        * do anything more.
> > > > > +        */
> > > > > +       if (match && match->data) {
> > > > > +               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > > >
> > > > Does this work as expected? Having multiple compatible values in a
> > > > device node does not guarantee there exist a separate driver for any
> > > > of the device-specific compatible values.
> > >
> > > Right, and if they are platform devices that are equivalent to
> > > simple-bus (meaning, they don't do anything in Linux and just have
> > > their devices populated) we can add those to this list too.
> >
> > I think this needs to be a list of compatibles we have drivers for
> > instead.
>
> I don't think a "denylist" (devices we shouldn't probe with this
> driver) would be a short list. As of today, literally any device that
> has children could add a "simple-bus" to the compatible property and
> get its child devices populated for free. If we use a denylist, we'll
> have to update it every time someone adds "simple-bus" as a general
> match to a DT node (new or otherwise) that isn't in the denylist. The
> list would blow up and be a maintenance headache.
>
> Also, a denylist won't capture any DT that isn't part of the kernel
> repo but depends on "simple-bus" to populate the device's child nodes.
> Keep in mind this could be true even for completely upstream drivers
> today. And on top of that, this will also break for downstream drivers
> and platforms in the development stage.

You've got this all backwards. The list would be compatibles for which
they have their own driver. If they have their own driver, we know
that because there is a driver in the kernel. If you have an out of
tree bus driver, then I guess you shouldn't be claiming compatibility
with 'simple-bus'.

> The allowlist is much smaller and manageable.

I count 140 cases of 'simple-bus' with another compatible. I find
roughly 24 of those under drivers/ that have a driver (and look,
there's at91 pinctrl/gpio). There's some more under arch/, but I'm not
sure if they are drivers. This is what I ran:

git grep -ho '".*", "simple-bus"' -- arch/ | cut -d' ' -f1 | grep -oE
'".+"' | grep -v '"syscon"' | sort -u > buses.txt
git grep -f buses.txt -- drivers/

I haven't looked at 'simple-mfd', but that was supposed to always mean
'no driver'.

To put it another way, let's look at 3 possibilities:

'simple-bus'
'foo,has-no-driver', 'simple-bus'
'foo,has-a-driver', 'simple-bus'

The first case is easy. The last 2 cases are not. We have no way to
handle them differently without a list.

> > A more specific compatible that the OS doesn't understand
> > shouldn't cause a change in behavior and adding one would.

Again, if a dt is modified from case 1 to case 2, there should not be
a change in behavior. Presumably if Ulf changed his test in this way,
it would again fail, right?


> I think the amount of specific compatible strings that'll be added,
> but won't have drivers added to Linux AND would want to boot with
> Linux is much less likely than the amount of times we'd have to update
> a denylist.
>
> Also, if we do hit the cases you mention and we want those devices to
> get probed anyway, with my current allowlist approach, we could use
> "driver_override" to force this driver to match them. If you use a
> denylist like you said, there's no way you can get the simple-pm-bus
> to unbind and let the more specific driver to bind.

Where would we set "driver_override"? Aren't we going to end up with a
driver_override list?

[...]

> > > > [*] Especially if "simple-pm-bus" and "simple-bus" would be treated
> > > >     the same.
> > >
> > > They are not treated the same way.
> >
> > I think it would be better if they were. IOW, the core code stops
> > descending into simple-bus, etc. nodes and they are populated here.
> > Then we just get rid of of_default_bus_match_table.
>
> Right, I would if we could. But we can't simply stop descending the
> simple-bus nodes in the core code because all the specific drivers
> that used to have their child devices populated automatically would
> stop working and would need to be updated to populate their child
> devices. And I'm sure there are a ton more downstream kernels and
> downstream DTs (that use upstream kernels) that we would break.
>
> If you really want to do that go for it, but I'd rather not do all
> this as part of trying to fix the issue Ulf reported that needs
> simple-bus only devices probed.

Agreed.

> > That could cause some issues with init ordering. As I recall the at91
> > gpio and pinctrl drivers are sensitive to this. The default call to
> > of_platform_populate doesn't work on those systems because the devices
> > get created later than when their machine specific call happens. It
> > may have been a case of a parent probe assuming a child probe
> > completed after of_platform_populate returns (also a problem for Qcom
> > with DWC3). There's a fix for at91 somewhere in the git history after
> > I broke it. I started trying to untangle things with at91, but never
> > finished that.
>
> I think it'll cause a lot of issues if we stop descending simple-bus
> nodes in the core code. We're just scratching the surface here.

Perhaps, but if there's cases which are that fragile, we should fix them.

Rob
