Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22BC406E1C
	for <lists+linux-omap@lfdr.de>; Fri, 10 Sep 2021 17:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhIJPW4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Sep 2021 11:22:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:51880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234283AbhIJPWz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Sep 2021 11:22:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EC6F61209;
        Fri, 10 Sep 2021 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631287304;
        bh=CbNz1rzoSFm00uQJz/u72u5SivwGBBDRz0qJI5QdDaM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=V7ciEkK9mEnakSWJE3N4krO7k2vrOpmry0w+wvzAy1bZ3XMguq963vYcZcHMhbkcQ
         x7ANNcSEtGtiXr1Xj+7aiwv1E27gfX0Z50UmidA3ONuzViyH1yN4OIKthsWYkWJBLe
         hAq+Ab6ceICFi9lREoka6lp0jC8aSZViVWGgIfA05TrqgZRGbDikqgvebCxAdlNYne
         38Hjduxvm/TEItUQUw1UNSqQjV6n+HRuJCBtwfXtpkBgWu+yuGEcmGbA/SCkbkut7w
         GJ/nZIG9xCuKxK+ZJZ5ZWvX2PhffOEa/9LD+XZiYRiv1pGFhslWj/6cmI4P6C7bPWp
         3///swqr7VHCw==
Received: by mail-ed1-f45.google.com with SMTP id v5so2997602edc.2;
        Fri, 10 Sep 2021 08:21:44 -0700 (PDT)
X-Gm-Message-State: AOAM5321JOC7WHPcIHXvY3KgjLTSOiIU29ULFoHViG8oHuNi3bNJwhqq
        vHnd4TK7YbeFeBNeM7XBZ4LMmmme9LNOVMrs/Q==
X-Google-Smtp-Source: ABdhPJwFDT05YgegDxpw6X9YVt8fY+sNUwfG3GBBSmEfh/3dD7dytmm4EPa4GhHvVBQlL3RBk8/aEeEOsUsyRziT54I=
X-Received: by 2002:a05:6402:150a:: with SMTP id f10mr9555307edw.318.1631287302645;
 Fri, 10 Sep 2021 08:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com> <CAMuHMdUhZy7W_HLtNJ2ECK5uQV5xHV7pDk5BXfNUpW9L68G5Aw@mail.gmail.com>
 <CAGETcx_7N3gtaT-YHGaGL+Qtkv=JOhgPcPF1A+kQ4aaDoetvSA@mail.gmail.com>
 <CAL_Jsq+-DAz+80QtpX5obWWcy=MAyxmTb262VAgMiKwnn=hfxQ@mail.gmail.com>
 <CAGETcx_=8yX6ObaEJk8QNSaWQPdFHsw4R74JrDFKqOL0AN-gLw@mail.gmail.com>
 <CAL_JsqJVsEj=rmExYHtphfxw_W6cq8WU45SSuYi_g2_KiUaFsg@mail.gmail.com> <CAGETcx8WqGN6Dt1snbR0D7yLfAwWjhRawfX3is_xrExP3_tY1g@mail.gmail.com>
In-Reply-To: <CAGETcx8WqGN6Dt1snbR0D7yLfAwWjhRawfX3is_xrExP3_tY1g@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 10 Sep 2021 10:21:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJcsqjJBe8aULYYMkFtx8OTj2wHANZ=83VMMyJ=AEgReg@mail.gmail.com>
Message-ID: <CAL_JsqJcsqjJBe8aULYYMkFtx8OTj2wHANZ=83VMMyJ=AEgReg@mail.gmail.com>
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

On Thu, Sep 9, 2021 at 1:11 PM Saravana Kannan <saravanak@google.com> wrote:
>

TLDR: Read the end first...

> On Thu, Sep 9, 2021 at 7:02 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Wed, Sep 8, 2021 at 7:58 PM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > On Wed, Sep 8, 2021 at 5:16 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > >
> > > > On Tue, Sep 7, 2021 at 2:01 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > >
> > > > > On Mon, Sep 6, 2021 at 12:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > >
> > > > > > Hi Saravana,
> > > > > >
> > > > > > Thanks for your patch!
> > > > > >
> > > > > > CC linux-pm, Lee (mfd)
> > > > > >
> > > > > > On Sat, Sep 4, 2021 at 2:05 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > > > > fw_devlink could end up creating device links for bus only devices.
> > > > > > > However, bus only devices don't get probed and can block probe() or
> > > > > > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > > > > > devices using the simple-pm-bus driver.
> > > > > > >
> > > > > > > However, there are instances of devices that are not simple buses (they
> > > > > > > get probed by their specific drivers) that also list the "simple-bus"
> > > > > > > (or other bus only compatible strings) in their compatible property to
> > > > > > > automatically populate their child devices. We still want these devices
> > > > > > > to get probed by their specific drivers. So, we make sure this driver
> > > > > > > only probes devices that are only buses.
> > > > > >
> > > > > > Note that this can also be the case for buses declaring compatibility
> > > > > > with "simple-pm-bus".  However, at the moment, none of such device
> > > > > > nodes in upstream DTS files have device-specific drivers.
> > > > >
> > > > > Not sure about mfd, but I want to make sure we don't confuse busses
> > > > > (which are typically added to a class) with these "simple bus" devices
> > > > > that are added to platform_bus. Also if these other buses are actually
> > > > > causing an issue, then then should implement their own stub driver or
> > > > > use try patch[2] if they are added to classes (devices on classes
> > > > > don't probe)
> > > > >
> > > > > [2] - https://lore.kernel.org/lkml/20210831224510.703253-1-saravanak@google.com/
> > > > >
> > > > > >
> > > > > > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > > > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > > > Tested-by: Saravana Kannan <saravanak@google.com>
> > > > > >
> > > > > > > --- a/drivers/bus/simple-pm-bus.c
> > > > > > > +++ b/drivers/bus/simple-pm-bus.c
> > > > > > > @@ -13,11 +13,26 @@
> > > > > > >  #include <linux/platform_device.h>
> > > > > > >  #include <linux/pm_runtime.h>
> > > > > > >
> > > > > > > -
> > > > > > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > > > > > >  {
> > > > > > > -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > > > > > -       struct device_node *np = pdev->dev.of_node;
> > > > > > > +       const struct device *dev = &pdev->dev;
> > > > > > > +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > > > > > +       struct device_node *np = dev->of_node;
> > > > > > > +       const struct of_device_id *match;
> > > > > > > +
> > > > > > > +       match = of_match_device(dev->driver->of_match_table, dev);
> > > > > > > +
> > > > > > > +       /*
> > > > > > > +        * These are transparent bus devices (not simple-pm-bus matches) that
> > > > > > > +        * have their child nodes populated automatically.  So, don't need to
> > > > > > > +        * do anything more.
> > > > > > > +        */
> > > > > > > +       if (match && match->data) {
> > > > > > > +               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > > > > >
> > > > > > Does this work as expected? Having multiple compatible values in a
> > > > > > device node does not guarantee there exist a separate driver for any
> > > > > > of the device-specific compatible values.
> > > > >
> > > > > Right, and if they are platform devices that are equivalent to
> > > > > simple-bus (meaning, they don't do anything in Linux and just have
> > > > > their devices populated) we can add those to this list too.
> > > >
> > > > I think this needs to be a list of compatibles we have drivers for
> > > > instead.
> > >
> > > I don't think a "denylist" (devices we shouldn't probe with this
> > > driver) would be a short list. As of today, literally any device that
> > > has children could add a "simple-bus" to the compatible property and
> > > get its child devices populated for free. If we use a denylist, we'll
> > > have to update it every time someone adds "simple-bus" as a general
> > > match to a DT node (new or otherwise) that isn't in the denylist. The
> > > list would blow up and be a maintenance headache.
> > >
> > > Also, a denylist won't capture any DT that isn't part of the kernel
> > > repo but depends on "simple-bus" to populate the device's child nodes.
> > > Keep in mind this could be true even for completely upstream drivers
> > > today. And on top of that, this will also break for downstream drivers
> > > and platforms in the development stage.
> >
> > You've got this all backwards.
>
> I don't think so. I got what you are saying.
>
> > The list would be compatibles for which
> > they have their own driver. If they have their own driver, we know
> > that because there is a driver in the kernel. If you have an out of
> > tree bus driver, then I guess you shouldn't be claiming compatibility
> > with 'simple-bus'.
>
> But it isn't just out of tree drivers though. Take for example (a
> random compatible string with a driver in upstream)
> "qcom,sdm845-gpucc" that has DT nodes in a couple of DTS files. It's
> perfectly valid today today to add child nodes under it and have the
> child nodes get populated by making the compatible property:
> "qcom,sdm845-gpucc", "simple-bus"

IMO, that is not valid and I'd reject adding 'simple-bus' to the
schema (so we would know).

Also, if we had only "qcom,sdm845-gpucc" to start with, then we
probably have a driver already.

> The only thing not upstreamed in that case is the DT file. And I'm
> fairly certain our position is not "if your DT isn't in the kernel
> repo we won't support it". In this situation we have no way of knowing
> we need to add "qcom,sdm845-gpucc" to the "it has a driver, don't
> probe it" list. And even if they upstream it, this list is going to
> blow up. And we are breaking backward compatibility that can't be
> fixed without a kernel update (no runtime fixes possible).
>
> > > The allowlist is much smaller and manageable.
> >
> > I count 140 cases of 'simple-bus' with another compatible. I find
> > roughly 24 of those under drivers/ that have a driver (and look,
> > there's at91 pinctrl/gpio). There's some more under arch/, but I'm not
> > sure if they are drivers. This is what I ran:
> >
> > git grep -ho '".*", "simple-bus"' -- arch/ | cut -d' ' -f1 | grep -oE
> > '".+"' | grep -v '"syscon"' | sort -u > buses.txt
> > git grep -f buses.txt -- drivers/
> >
> > I haven't looked at 'simple-mfd', but that was supposed to always mean
> > 'no driver'.
> >
> > To put it another way, let's look at 3 possibilities:
> >
> > 'simple-bus'
> > 'foo,has-no-driver', 'simple-bus'
> > 'foo,has-a-driver', 'simple-bus'
> >
> > The first case is easy. The last 2 cases are not. We have no way to
> > handle them differently without a list.
> >
> > > > A more specific compatible that the OS doesn't understand
> > > > shouldn't cause a change in behavior and adding one would.
> >
> > Again, if a dt is modified from case 1 to case 2, there should not be
> > a change in behavior.
>
> My point is that if DT is modified from 1 to 2, we'll need to add
> "foo,has-no-driver" to the list we'll maintain. That preserves
> backward compatibility with existing DTs and if someone modifies the
> DT it's more likely that they can modify the kernel too. See more
> below.

I assume this list is just cases of I need to bind the simple-bus
driver for devlinks, right?

Being able to update the kernel is not a valid assumption. While the
kernel sources may be updated, it is perfectly valid to update a dtb
and not the kernel. This is what SUSE does (or was doing?). DTBs from
the latest kernel (because that's the most complete h/w description,
right?) and an LTS kernel. Think about updating your PC's OS and
firmware. Do you want updating either of those independently to work?
Probably so. It's the same thing with kernel and dtb(in firmware)
updates. While specific platforms or environments (Android) may not
care, in general we have to.

However, we can cheat a little bit if the kernel update goes to stable
kernels, but that should be the exception and I don't think we should
rely on that. Would you want your PC to stop booting due to a firmware
update without a stable kernel update?

> > Presumably if Ulf changed his test in this way,
> > it would again fail, right?
> >
> >
> > > I think the amount of specific compatible strings that'll be added,
> > > but won't have drivers added to Linux AND would want to boot with
> > > Linux is much less likely than the amount of times we'd have to update
> > > a denylist.
> > >
> > > Also, if we do hit the cases you mention and we want those devices to
> > > get probed anyway, with my current allowlist approach, we could use
> > > "driver_override" to force this driver to match them. If you use a
> > > denylist like you said, there's no way you can get the simple-pm-bus
> > > to unbind and let the more specific driver to bind.
> >
> > Where would we set "driver_override"? Aren't we going to end up with a
> > driver_override list?
>
> I'm not saying we maintain a list in the kernel. I'm saying if someone
> changed their DT to add 'foo,has-no-driver', but hit the unlikely case
> where they can update the DT but not the kernel, they can still get
> the 'foo,has-no-driver' to probe by using the driver_override file for
> that device in sysfs. TLDR: they can still get it to work without
> having to modify the kernel.

That doesn't seem like a great experience. How's that going to work if
you didn't boot up enough to get to sysfs?

> > [...]
> >
> > > > > > [*] Especially if "simple-pm-bus" and "simple-bus" would be treated
> > > > > >     the same.
> > > > >
> > > > > They are not treated the same way.
> > > >
> > > > I think it would be better if they were. IOW, the core code stops
> > > > descending into simple-bus, etc. nodes and they are populated here.
> > > > Then we just get rid of of_default_bus_match_table.
> > >
> > > Right, I would if we could. But we can't simply stop descending the
> > > simple-bus nodes in the core code because all the specific drivers
> > > that used to have their child devices populated automatically would
> > > stop working and would need to be updated to populate their child
> > > devices. And I'm sure there are a ton more downstream kernels and
> > > downstream DTs (that use upstream kernels) that we would break.
> > >
> > > If you really want to do that go for it, but I'd rather not do all
> > > this as part of trying to fix the issue Ulf reported that needs
> > > simple-bus only devices probed.
> >
> > Agreed.
>
> I'm confused. So you are okay with this patch to merge now?

No, I'm okay with the separate step of removing descending
'simple-bus', etc. nodes out of of_platform_populate() to do it in the
simple-bus driver.

Backing up...

The problem here is letting what 'simple-bus' (and simple-mfd) means
change with the presence of another compatible and we can't determine
if it changes or not. Has a driver or not doesn't really work. I think
the only thing that works is 'simple-bus' can only mean child nodes
have no dependency on the simple-bus node. If there is a dependency,
then it is not a simple-bus. We might have some cases that violated
this definition and they've gotten lucky so far. I think we just have
to fix these cases as they arise. That's at least bounded by cases
where we already have drivers and shouldn't have new cases introduced.

I still like the idea that 'simple-bus' always binds to a driver, but
I think for that to work we've got to support rebinding to a new
driver when a better matching driver is found. We're never going to
know for sure if/when there is a better match. There's a couple of
cases where we need this.

Rob
