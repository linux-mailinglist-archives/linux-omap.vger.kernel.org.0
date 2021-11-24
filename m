Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76EB45B0FF
	for <lists+linux-omap@lfdr.de>; Wed, 24 Nov 2021 02:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhKXBLN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 20:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbhKXBLN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Nov 2021 20:11:13 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81702C061574
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 17:08:04 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id v203so2373406ybe.6
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 17:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R2plzpSfizpBE1uIRf3WzcqToP7oXOnTBvLRjsrxA/8=;
        b=TETpmVv0izXoFHovUFtuLxzZZjeYKkNdF7uVYt6LpkZtn8uQFg2RpQ+iN3hmgDqPM2
         5linAcFd3G1KPNkcvTw6Ofj464A/4qg9IOZMYhl9uxaxyQVMHY3tV3Gdls7lbp9Vr4ZF
         fsvAlshQMTfh7lThwL1TOmTKaQFc2sEwHVSaagl9wYNpatmlVlMFk8xzplmOQFy/1RsO
         vypqsLCcMW1aACDLdU1O/223WeK3bE1yc8bhAvOeSYWA3JDrZrY2Ct3PrGtiEcL+TCS6
         BsvBIH4xbGzg1SgelZfiawTqCVRi3Pk55/PZ1aTWUveoUuNCUMJPj8R5z3scWWyT2bad
         5Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2plzpSfizpBE1uIRf3WzcqToP7oXOnTBvLRjsrxA/8=;
        b=5DEnJ36o/Xwan/ta9nkh6WobaLEBUtbSNUMbCoFuh12rIwnd8wTIVkdyb8g7g+t71c
         LFfQt92L/NS3PTPzmUnvCzegc6pD3FZ0kQ+GtXyVT/4bxZhOshFUgBWg1htECJqQJf1P
         xJfjw4+r92AxWQiagoyNCjwWt81YIGSEkt5BpkQDzwwtCYB1niNCHmocZ9a0rnNOx1bc
         lxNtB6kwzmRhlFA4befZv5sLadTsrKSeVISXrwDdxrcyNNxcnTdaUfzdvKcFa+w8Qhqx
         fTOvz/FKhHhHqLJqcgPuk/8jbca6gypjWBvWEwZ/mcSSiapu1ZRv6ALpYy3xXvNToxoz
         CU+A==
X-Gm-Message-State: AOAM533QmWGG9+cATlK/56nmxXy2FGYVghoC9q/sefxFtWk0XvFZ+5jO
        wld2ewUmIUzCe5AbwFLl4rLfd3KjP3VvOag/xJqeSA==
X-Google-Smtp-Source: ABdhPJyzBbZuDDS6g985Y3XIOO3WdFz1O7Tm56fRYRvgrxQK3QMM9SZeDhOxIA9KXOwO2EomLT4FCQtOQsn+1QA4fBk=
X-Received: by 2002:a25:760d:: with SMTP id r13mr11019324ybc.296.1637716083173;
 Tue, 23 Nov 2021 17:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-2-saravanak@google.com>
 <YYu4EglV7SBZU2Iy@ryzen> <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
 <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
 <YZO5L7BJuLi5YjWr@ryzen> <YZPKJWtd2VqvufFe@ryzen> <YZfN+oMqD/6howTK@ryzen>
In-Reply-To: <YZfN+oMqD/6howTK@ryzen>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 23 Nov 2021 17:07:27 -0800
Message-ID: <CAGETcx9-ojKeSqRzL9bEoADa7XzoUW_GdvrGh0yeV1wSjXwz3w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Nov 19, 2021 at 8:17 AM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> On 21-11-16 17:11:33, Abel Vesa wrote:
> > On 21-11-16 15:59:11, Abel Vesa wrote:
> > > On 21-11-15 12:17:46, Saravana Kannan wrote:
> > > > On Wed, Nov 10, 2021 at 12:24 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > >
> > > > > On Wed, Nov 10, 2021 at 4:16 AM Abel Vesa <abelvesa@kernel.org> wrote:
> > > > > >
> > > > > > On 21-09-28 17:07:33, Saravana Kannan wrote:
> > > > > > > fw_devlink could end up creating device links for bus only devices.
> > > > > > > However, bus only devices don't get probed and can block probe() or
> > > > > > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > > > > > devices using the simple-pm-bus driver.
> > > > > > >
> > > > > > > However, there are instances of devices that are not simple buses (they get
> > > > > > > probed by their specific drivers) that also list the "simple-bus" (or other
> > > > > > > bus only compatible strings) in their compatible property to automatically
> > > > > > > populate their child devices. We still want these devices to get probed by
> > > > > > > their specific drivers. So, we make sure this driver only probes devices
> > > > > > > that are only buses.
> > > > > > >
> > > > > > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > > > > > Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> > > > > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > > > Tested-by: Saravana Kannan <saravanak@google.com>
> > > > > > > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > > > ---
> > > > > > >  drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
> > > > > > >  1 file changed, 39 insertions(+), 3 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > > > > > > index 01a3d0cd08ed..6b8d6257ed8a 100644
> > > > > > > --- a/drivers/bus/simple-pm-bus.c
> > > > > > > +++ b/drivers/bus/simple-pm-bus.c
> > > > > > > @@ -13,11 +13,36 @@
> > > > > > >  #include <linux/platform_device.h>
> > > > > > >  #include <linux/pm_runtime.h>
> > > > > > >
> > > > > > > -
> > > > > > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > > > > > >  {
> > > > > > > -     const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > > > > > -     struct device_node *np = pdev->dev.of_node;
> > > > > > > +     const struct device *dev = &pdev->dev;
> > > > > > > +     const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > > > > > +     struct device_node *np = dev->of_node;
> > > > > > > +     const struct of_device_id *match;
> > > > > > > +
> > > > > > > +     /*
> > > > > > > +      * Allow user to use driver_override to bind this driver to a
> > > > > > > +      * transparent bus device which has a different compatible string
> > > > > > > +      * that's not listed in simple_pm_bus_of_match. We don't want to do any
> > > > > > > +      * of the simple-pm-bus tasks for these devices, so return early.
> > > > > > > +      */
> > > > > > > +     if (pdev->driver_override)
> > > > > > > +             return 0;
> > > > > > > +
> > > > > > > +     match = of_match_device(dev->driver->of_match_table, dev);
> > > > > > > +     /*
> > > > > > > +      * These are transparent bus devices (not simple-pm-bus matches) that
> > > > > > > +      * have their child nodes populated automatically.  So, don't need to
> > > > > > > +      * do anything more. We only match with the device if this driver is
> > > > > > > +      * the most specific match because we don't want to incorrectly bind to
> > > > > > > +      * a device that has a more specific driver.
> > > > > > > +      */
> > > > > > > +     if (match && match->data) {
> > > > > > > +             if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > > > > > > +                     return 0;
> > > > > > > +             else
> > > > > > > +                     return -ENODEV;
> > > > > > > +     }
> > > > > >
> > > > > > This change is breaking the expected behavior for the already existent
> > > > > > simple-bus nodes. All the simple-bus compatibles should be replaced now
> > > > > > to simple-pm-bus. In my case, on some i.MX8 platforms, without the
> > > > > > devlink, the devices suspend sequence changes (and even breaks).
> > > > > >
> > > > > > To avoid breaking the already existent simple-bus nodes, maybe the logic
> > > > > > should've been reversed: keep the simple-bus as is and add another
> > > > > > compatible, IDK, something like simple-trasnparent-bus, or something.
> > > > >
> > > > > The intent of this change IS to affect existing simple-bus nodes (but
> > > > > not in the way it's affecting you). But if it's breaking stuff, we
> > > > > obviously need to fix it.
> > > > >
> > > > > I have a hunch on what's going on in your case, but can you point me
> > > > > to the specific simple-bus node that's getting affected? I'm expecting
> > > > > it to be a simple-bus node that gets added AFTER this driver is
> > > > > registered at device_initcall (module_init gets converted to
> > > > > device_initcall).
> > > > >
> > >
> > > Well, for now, I can't pinpoint exactly one specific dts node.
> > > My usecase is a little bit more complicated since it's only happening
> > > in conjunction with a local change in the imx-mu-irq driver
> > > in our local tree. Basically, the local change is forcing a suspend abort by
> > > calling pm_system_wake if there is an irq from SCU triggered after the
> > > suspend noirq imx-mu-irq driver callback has been called.
> > > If we replace all the simple-bus with simple-pm-bus, everything works
> > > fine.

I assume the local change you are referring to is only a code change
and not a DT change? If so, can you please point me to the DTS of the
board you are hitting this issue on? Even without your local code
change, this can give me useful info.

Maybe also point me to one of the simple-bus DT nodes that you needed
to convert to simple-pm-bus for things to work? Maybe if you can find
the minimal set of DT nodes that need a simple-bus to simple-pm-bus
change, that'd be helpful.

> > >
> > > > > Also, can you try this hack patch to see if it helps your case?
> > > > > https://lore.kernel.org/lkml/CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com/
> > > > >
> > >
> > > Nope, it doesn't work with this patch either.
> > >
> > > And the funny thing is, even if I add the pm_runtime_enable to your patch
> > > like this:
> > >
> > > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > > index 6b8d6257ed8a..a13324fd700b 100644
> > > --- a/drivers/bus/simple-pm-bus.c
> > > +++ b/drivers/bus/simple-pm-bus.c
> > > @@ -38,9 +38,11 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> > >          * a device that has a more specific driver.
> > >          */
> > >         if (match && match->data) {
> > > -               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > > +               if (of_property_match_string(np, "compatible", match->compatible) == 0) {
> > > +                       pm_runtime_enable(&pdev->dev);
> > > +                       of_platform_populate(np, NULL, lookup, &pdev->dev);
> > >                         return 0;
> > > -               else
> > > +               } else
> > >                         return -ENODEV;
> > >         }
> > >
> > > I get the following warning:
> > >
> > > [    1.009392] ------------[ cut here ]------------
> > > [    1.013681] Enabling runtime PM for inactive device (bus@5d000000) with active children
> > > [    1.021721] WARNING: CPU: 3 PID: 1 at drivers/base/power/runtime.c:1439 pm_runtime_enable+0xc0/0x100
> > > [    1.030794] Modules linked in:
> > > [    1.033837] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.15.0-04906-gc0a8c67532b6-dirty #226
> > > [    1.042175] Hardware name: Freescale i.MX8QXP MEK (DT)
> > > [    1.047302] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > [    1.054248] pc : pm_runtime_enable+0xc0/0x100
> > > [    1.058594] lr : pm_runtime_enable+0xc0/0x100
> > > [    1.062938] sp : ffff800011e4bb60
> > > [    1.066237] x29: ffff800011e4bb60 x28: 0000000000000000 x27: ffff8000119204d0
> > > [    1.073361] x26: ffff8000119c1060 x25: ffff8000119c1078 x24: ffff80001190f0a0
> > > [    1.080484] x23: 0000000000000000 x22: 0000000000000000 x21: ffff0008006a00f4
> > > [    1.087608] x20: 0000000000000000 x19: ffff0008006a0010 x18: 0000000000000030
> > > [    1.094732] x17: 6974636120687469 x16: 7720293030303030 x15: 3064354073756228
> > > [    1.101856] x14: 2065636976656420 x13: ffff800011c21dc0 x12: 0000000000000246
> > > [    1.108981] x11: 00000000000000c2 x10: ffff800011c79dc0 x9 : 00000000fffff000
> > > [    1.116103] x8 : ffff800011c21dc0 x7 : ffff800011c79dc0 x6 : 0000000000000000
> > > [    1.123227] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 00000000ffffefff
> > > [    1.130351] x2 : ffff800011c21d30 x1 : 6bf7c63081c63600 x0 : 0000000000000000
> > > [    1.137478] Call trace:
> > > [    1.139910]  pm_runtime_enable+0xc0/0x100
> > > [    1.143903]  simple_pm_bus_probe+0x80/0xf0
> > > [    1.147986]  platform_probe+0x6c/0xe0
> > > [    1.151637]  really_probe.part.0+0x9c/0x310
> > > [    1.155805]  __driver_probe_device+0x98/0x144
> > > [    1.160149]  driver_probe_device+0xc8/0x15c
> > > [    1.164319]  __driver_attach+0xfc/0x190
> > > [    1.168141]  bus_for_each_dev+0x70/0xc0
> > > [    1.171964]  driver_attach+0x28/0x3c
> > > [    1.175526]  bus_add_driver+0x108/0x1f0
> > > [    1.179348]  driver_register+0x7c/0x130
> > > [    1.183173]  __platform_driver_register+0x2c/0x40
> > > [    1.187862]  simple_pm_bus_driver_init+0x20/0x2c
> > > [    1.192466]  do_one_initcall+0x54/0x1bc
> > > [    1.196289]  kernel_init_freeable+0x210/0x294
> > > [    1.200633]  kernel_init+0x28/0x130
> > > [    1.204110]  ret_from_fork+0x10/0x20
> > > [    1.207678] ---[ end trace 719a02e69bfeb03f ]---
> > >
> > > though it should be behaving exactly like in the case of simple-pm-bus.

Well, you aren't doing the "if (np)" check. So, it's possible this is
triggering for a device without a DT node and is causing this warning?

> > >
> > > Maybe I'm missing something here.
> > >
> > > I'll keep digging.
> > >
>
> Looking at this, it seems the devlinks are actually dropped after being
> created:

Yeah, that's the point of the change -- to drop SYNC_STATE_ONLY device
links from the simple-bus node to other suppliers. And going by the
name of the link being dropped, I'm fairly certain it's a
SYNC_STATE_ONLY device (I doubt the simple-bus node in this example
has a gpio property).

If this behavior is causing issues for you, then (ok, this is going to
be convoluted statement, so I'll split it into smaller chunks):

1. Take the suppliers of all the simple-bus node without my upstream patch.
2. Only some of them would have a sync_state() implementation (each to
check -- they'd have a state_synced file in their device folder).
3. One of your OTHER devices has a dependency on the list of suppliers
devices in (1) to keep a resource on.

So the presence of the SYNC_STATE_ONLY links was preventing a supplier
from turning off and was proxying for the needs of another device. You
basically have to narrow this down to a supplier and then narrow it
down to a consumer to fix the driver. Also, considering the limiter
set of sync_state() implementations in upstream, I'd guess the
supplier is either an interconnect or a PSCI power domain. The fact
that switching to simple-pm-bus also makes me fairly certain the
supplier in question is a power domain.

Sorry for the vague answers. Without the specific DTS file, I can't
give a better answer.

>
> [   36.993371] Hardware name: Freescale i.MX8QXP MEK (DT)
> [   36.998498] Call trace:
> [   37.000928]  dump_backtrace+0x0/0x19c
> [   37.004578]  show_stack+0x1c/0x70
> [   37.007878]  dump_stack_lvl+0x68/0x84
> [   37.011527]  dump_stack+0x1c/0x38
> [   37.014826]  __device_link_del+0x40/0xbc
> [   37.018738]  device_link_drop_managed+0x74/0x90
> [   37.023253]  device_links_driver_bound+0x1b4/0x280
> [   37.028031]  driver_bound+0x68/0xd0
> [   37.031509]  really_probe.part.0+0x258/0x310
> [   37.035763]  __driver_probe_device+0x98/0x144
> [   37.040107]  driver_probe_device+0xc8/0x15c
> [   37.044279]  __driver_attach+0xfc/0x190
> [   37.048100]  bus_for_each_dev+0x70/0xc0
> [   37.051924]  driver_attach+0x28/0x3c
> [   37.055484]  bus_add_driver+0x108/0x1f0
> [   37.059306]  driver_register+0x7c/0x130
> [   37.063131]  __platform_driver_register+0x2c/0x40
> [   37.067820]  simple_pm_bus_driver_init+0x20/0x2c
> [   37.072424]  do_one_initcall+0x54/0x1bc
> [   37.076249]  kernel_init_freeable+0x210/0x294
> [   37.080591]  kernel_init+0x28/0x130
> [   37.084068]  ret_from_fork+0x10/0x20
> [   37.087688] simple-pm-bus bus@56220000: Dropping the link to 5d090000.gpio
> [   37.094501] device: 'platform:5d090000.gpio--platform:bus@56220000': device_unregister
>
> So, before your patch, the devlinks were not dropped because there was
> no driver to probe for the "simple-bus" compatible.
>
> And I think this tells us why your hack patch didn't solve the problem
> either.

The hack patch is meant to make sure device links of sub nodes don't
get dropped when they shouldn't be. It's strange that you saw the hack
pack was causing the dropping of device links of sub nodes when my
upstream patch doesn't (according to your other email). But I'll leave
this for later.

-Saravana
