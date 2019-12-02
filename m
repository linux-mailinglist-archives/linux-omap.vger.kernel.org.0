Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD3910EA9D
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2019 14:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfLBNN5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Dec 2019 08:13:57 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:33948 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbfLBNN5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Dec 2019 08:13:57 -0500
Received: by mail-il1-f196.google.com with SMTP id w13so3549241ilo.1
        for <linux-omap@vger.kernel.org>; Mon, 02 Dec 2019 05:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iRaqJkii5NDvh4bw5KA/Xs/RRkx7vhw6MkKlyYCeCOw=;
        b=CWH3+nA2vOQOS7if0baHfTza0GtjjrChBXqEqYMiLaNKG0MGHxnSTvmoGu0GKptPpN
         Y/Nm8DRXwGUTzpsK05NPh7+7Cf7Q0yhzfJW+RraI0tn4WVF/uGEZnD7hxnapCqDNyn8f
         AD9Dv/E/A/vTdlxdNTE2wfLVPZwt5EDDdbbdd2p4XvnNy8eqaV3k6qggIvYYs6AxXxHD
         T4XqBCkmehDDQ67nmH1A3XEJhH/0d1AGWAniJ352+Gpln1XbOhBJZOO0K0ItHVebhFWF
         WWjTw5+lILyJ74n/7Y9sPyyr6jLnmESrNVxH3evgIujPbZfSfzpXpUPW96SVuNKnH5ym
         19Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRaqJkii5NDvh4bw5KA/Xs/RRkx7vhw6MkKlyYCeCOw=;
        b=ooeRUWxo96oaQkg+QAS/Lij5Sq60+mZDjHo1FWty/E1eu2O9jcfvxtTDZfqjXAn3C+
         gWJ/OMIshanlIj2V/ogaqJ2Y/z2ENGJnxmK2koa+kHlCplzuTZ6UZHLTP3fsxESdgE/b
         DdRp5QG3MYhoEt9ZcUGM/VJn0q1QKxozWeYv5iAqqgjSKoPAZbaaGHDeluOPn7KsmcJC
         T6WAlSmsLzwdRWkXI9xi/e6U4NI3ITrzIDXXy0nKJ3RW2LDVDIgx4TtQAhIKN0AD72Cv
         T5puTjIgj0mTs23ziW91k8dzI87c8tp1JM8n423XzN9LyObG1H6m/Zpx6f5NkCinq7/7
         6cig==
X-Gm-Message-State: APjAAAWwTcYUH5YfyUvi7EJS6Ba7akLW6R1/PMGH0Xr97L137ZJffla+
        MvWg3cLfnm2X0/H7u1/e8YDVqDSZ78sPyRMPvpAlt/EG
X-Google-Smtp-Source: APXvYqxVl1D29lOZH3sVmYO9JnYNrzCti0zoKLR8+I1wUw9lv+zAU/aQsHc6FLwzawAKQcezwh2rtj4/GY/rVViCHPk=
X-Received: by 2002:a92:5bdd:: with SMTP id c90mr11238941ilg.78.1575292434667;
 Mon, 02 Dec 2019 05:13:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHCN7x+F9c-_0febeV1EdJqVBs8aOrqYLQdds26MT25t=Sa_Fg@mail.gmail.com>
 <20190822020850.GC17402@pendragon.ideasonboard.com> <CAHCN7xJdCBLo2Qop6gD1kRFXE-fxkH3OuN0XO6t9kUJ3HA-tRw@mail.gmail.com>
 <20191202125941.GF4929@pendragon.ideasonboard.com>
In-Reply-To: <20191202125941.GF4929@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 2 Dec 2019 07:13:40 -0600
Message-ID: <CAHCN7xLPDicS=1ZJ_npXGxh-DOyNLjXcqZTpNvkpErjcce-t1w@mail.gmail.com>
Subject: Re: Question about drm/omap: Remove panel-dpi driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Dec 2, 2019 at 6:59 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> (CC'ing Jyri and Tomi)
>
> I'm sorry for the very late reply, your e-mail got burried in my inbox.

No worries. I moved on a while ago.  ;-)

>
> On Wed, Aug 21, 2019 at 09:39:27PM -0500, Adam Ford wrote:
> > On Wed, Aug 21, 2019 at 9:08 PM Laurent Pinchart wrote:
> > > On Wed, Aug 21, 2019 at 08:14:43PM -0500, Adam Ford wrote:
> > > > I know it's been nearly 9 months this this was removed, but for those
> > > > of us who still define our displays in the device tree expecting the
> > > > dpi-panel, we're not getting video.
> > > >
> > > > The commit message only states:
> > > >
> > > >     Panels are now supported through the drm_panel infrastructure, remove
> > > >     the omapdrm-specific driver.
> > > >
> > > > It does not give examples of how to do this, and I feel like we should
> > > > have been given some warning or indication.  Is there an example I can
> > > > follow for linking a dpi panel into the omap DSS?
> > >
> > > Sorry to have left you with non-working systems :-(
> >
> > I have really only been following the omap-linux mailing list and only
> > really focus on the LTS kernels because my employer uses the LTS
> > kernels as the basis for the their linux distributions. If there is a
> > different mailing list I should follow, let me know.  I just wish it
> > would have been marked as deprecated or something before just being
> > killed.

 I believe device trees that I support for Logic PD are now in the
MAINTAINER file with references to the omap mailing list, so if they
are modified, I should see them if I don't subscribe to other mailing
lists which modify stuff.

I think what would have helped is if the 'panel-dpi' reference in the
device trees would have been deleted since there were no longer any
drivers to support.  I think I could have caught it earlier.  I don't
always have an LCD on the devices I test when I do spot checks.

The good news in the process, I was able to work with Tomi and others
to fix an annoying bug in the OMAP3630 which always requried me to
modify the kernel config because the stock omap2plus crashed with my
panel timings on the omap3630.

> >
> > > If the panel is supported by a mainline DRM panel driver the change
> > > should be transparent (provided of course that the driver is compiled in
> > > the kernel or as a module). Most panels are supported by the
> > > panel-simple driver (CONFIG_DRM_PANEL_SIMPLE), with a few dozen of other
> > > panels supported by dedicated drivers (in drivers/gpu/drm/panel/)
> > >
> > > Could you point me to the DT sources of one (or all) of the affected
> > > systems ?
> >
> > Sure,
> > The same panel is used on these these two boards:
> > logicpd-som-lv-baseboard.dtsi
> > logicpd-torpedo-37xx-devkit-28.dts
> >
> > A second panel is used on:
> > logicpd-torpedo-37xx-devkit.dts which has the LCD timings defined in
> > logicpd-torpedo-baseboard.dtsi
> > The am3517-evm also uses the same timings, but the gpio enables are different.
>
> I see. The omap3-ha-lcd.dts is also affected. There are only two ways to
> fix this as far as I can tell:
>
> - Add a panel driver matching against the panel-dpi compatible string,
>   and parsing the panel timings from DT there. Thierry Reding, the DRM
>   panel maintainer, has rejected this option multiple times (but it
>   seems people are still trying).

It would be nice to have a generic DT based parser so we don't have to
keep writing C code for something that could be done in DT.  I also
recognize that not all platforms use DT, but for those people C makes
sense.

>
> - Add the exact panel model to the above DT files (see omap3-thunder.dts
>   for an example), and make sure we have a kernel driver for those
>   panels (possibly extending the panel-simple driver). It seems that we
>   are also missing support in panel drivers for innolux,at070tn83,
>   osddisplays,osd057T0559-34ts, samsung,lte430wq-f0c and
>   startek,startek-kd050c.
>
> Tomi, which approach do you think is best at this point ?

I have already submitted patches to add the missing panels to the
simple panel driver for one of the LCD's.    I believe they've been
accepted already.  For the other LCD, I found a device already present
in the simple panels driver and I'm using it.  So for my omap3 based,
boards, I have a solution already in process.  I also submitted a fix
to all the simple panel driver to the omap2plus_defconfig so it is
included in the build.

>
> > The da850-evm uses the same panel as the am3517-evm, but it's not
> > using the same video driver, and I haven't had a chance to see if that
> > driver still exists or not.
>
> The tilcdc driver is still present in the kernel (I'm not aware of a
> plan to remove it), and uses a similar panel support hack as the omapdrm
> driver. I think it would make sense to fix it at some point, but I have
> no plan to do so myself at the moment.

If this driver does lose support for the LCD's, it should be trivial
to migrate the da850-evm to the simple panel driver.

>
> > Thanks for your quick response.
> > :-)
>
> Looks like I did a way worse job this time. Sorry again.

I get why you did it.

>
> > Sorry if my e-mail came across angrily, it wasn't my intention.
>
> No worries, and in any case you had reasons to be annoyed.
>

Thanks

adam

> --
> Regards,
>
> Laurent Pinchart
