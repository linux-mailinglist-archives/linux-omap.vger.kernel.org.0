Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773F4108314
	for <lists+linux-omap@lfdr.de>; Sun, 24 Nov 2019 12:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfKXLSD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 24 Nov 2019 06:18:03 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:44998 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfKXLSC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 24 Nov 2019 06:18:02 -0500
Received: by mail-il1-f193.google.com with SMTP id z12so2084807iln.11;
        Sun, 24 Nov 2019 03:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CrNkG5BlcOhjrLe97GUeq39ypxkKbi212efaOAD4P2s=;
        b=HhwE+UJHsvX//yMR2M2WT3iVd6mbLRewPdBO4vT6Zo2hlD3s/TnCCBtk0dWcuTax4/
         2bNHqPVpMmUunoW44l8CMnj96Y9BAV/9kVePFUDmU6megNrbdzeKhKXq27wEP71z/X2H
         UwA1FCYh3VXyOiQpt7M9tPXF/YYkLNuD8W+RxrLIn2ql2c2xs2VKg9oKXqXLNbsfYVo8
         pTqGJE4g3nImEzKHLBK1WwqCBKha/0x8EFWMdi2wAqNuwFGgR6TwMgNXc3duLOnhXYnF
         0y62BvycRtAgmMezN3BP7OyFVwZE+W5pLbUBEW+Rf+711y8KKxConBU7iXO6W+SEYSwJ
         hWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CrNkG5BlcOhjrLe97GUeq39ypxkKbi212efaOAD4P2s=;
        b=QyYjd4zdzCeFrqLq605dLniW5TAfzEaK2zEnsDkWgQRGIzp9JiJVzAFBEgvzi1jrTr
         Mx5i8rjGJ3dlB8dR8oGFIuqUklt1NKZlM3uJisz4K80LgFtGJPwlLJmZEwv7Pwolw4Rc
         B1SSepj07n1Pnx56/dN3+Jnzws2CbK0xKWofCBCmxWswYdZHxfnaSlr31g3bzn+v+k92
         ib1DaLqWvE09tqqD0Cj9yh3w56TLk+TTprWIW0d6kO5H1PxFGYBLipu3tJOQK4kjuPoq
         /kPpE/oaWFKLtb5rcv4HhkBG4MCLStOQoQCibF3/FmtAFzKm37XVQgfb5zWqxNxsgSWv
         MdIQ==
X-Gm-Message-State: APjAAAWJaPyglKTsAZN2DkSakLAttFfKzMSYXa9SRb7EIilX+s9xgrW8
        Hp8voi7URyHZ4j/BeIZzuzD3/4xbW04ijuGQxQc=
X-Google-Smtp-Source: APXvYqyU6nAtmiR0JZrfSjQwWEHpTNwTOG7h4Efvp2GafGmDmtAQ2LNU6yK6AFqN6zLH8r/olIsnVPjP4i9DBn/9NJE=
X-Received: by 2002:a92:7e18:: with SMTP id z24mr26707570ilc.276.1574594280835;
 Sun, 24 Nov 2019 03:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com> <CAHCN7xJ-1b_OHXy_u8TvA5i4PuWGbci6YN3x1hUY_UaLxzu+QQ@mail.gmail.com>
 <20191101075726.GB6209@pendragon.ideasonboard.com> <CAHCN7x+cCyQ=kp30Z9Vu6-feU2Yp6b=kui-h6G8t67abhYXpCw@mail.gmail.com>
In-Reply-To: <CAHCN7x+cCyQ=kp30Z9Vu6-feU2Yp6b=kui-h6G8t67abhYXpCw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 24 Nov 2019 05:17:49 -0600
Message-ID: <CAHCN7xK7vLufvEs1pgQoaJXO2yL4_9t12M2L67WJgTn9CWsBNQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Nov 11, 2019 at 7:19 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Nov 1, 2019 at 2:57 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Wed, Oct 30, 2019 at 09:44:20AM -0500, Adam Ford wrote:
> > > On Wed, Oct 16, 2019 at 8:52 AM Adam Ford <aford173@gmail.com> wrote:
> > > >
> > > > Previously, there was an omap panel-dpi driver that would
> > > > read generic timings from the device tree and set the display
> > > > timing accordingly.  This driver was removed so the screen
> > > > no longer functions.  This patch modifies the panel-simple
> > > > file to setup the timings to the same values previously used.
> > > >
> > > > Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")
> > >
> > > Will this be able to make it into linux-next for the 5.5 merge window?
> > > I believe Tony has picked up the device tree portion in his omap
> > > tree, but I haven't seen any notifications on this series on whether
> > > or not it's being applied.  I also don't know which tree I need to
> > > look if it's already been applied.
> > >
> > > This fixes a regression introduced a while ago where the driver I was
> > > using for the display was removed.
> >
> > Sam, would you be able to pick this up ?
>
Sam,

> Gentle nudge with the merge window approaching.

Is it too late for 5.5?  :-(

adam
>
> Thank you,
>
> adam
>
> >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > > ---
> > > > V5:  No Change
> > > > V4:  No Change
> > > > V3:  No Change
> > > > V2:  No Change
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > index 5d487686d25c..72f69709f349 100644
> > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > @@ -2061,6 +2061,40 @@ static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
> > > >         .flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > > >  };
> > > >
> > > > +static const struct drm_display_mode logicpd_type_28_mode = {
> > > > +       .clock = 9000,
> > > > +       .hdisplay = 480,
> > > > +       .hsync_start = 480 + 3,
> > > > +       .hsync_end = 480 + 3 + 42,
> > > > +       .htotal = 480 + 3 + 42 + 2,
> > > > +
> > > > +       .vdisplay = 272,
> > > > +       .vsync_start = 272 + 2,
> > > > +       .vsync_end = 272 + 2 + 11,
> > > > +       .vtotal = 272 + 2 + 11 + 3,
> > > > +       .vrefresh = 60,
> > > > +       .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> > > > +};
> > > > +
> > > > +static const struct panel_desc logicpd_type_28 = {
> > > > +       .modes = &logicpd_type_28_mode,
> > > > +       .num_modes = 1,
> > > > +       .bpc = 8,
> > > > +       .size = {
> > > > +               .width = 105,
> > > > +               .height = 67,
> > > > +       },
> > > > +       .delay = {
> > > > +               .prepare = 200,
> > > > +               .enable = 200,
> > > > +               .unprepare = 200,
> > > > +               .disable = 200,
> > > > +       },
> > > > +       .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > > > +       .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> > > > +                    DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
> > > > +};
> > > > +
> > > >  static const struct panel_desc mitsubishi_aa070mc01 = {
> > > >         .modes = &mitsubishi_aa070mc01_mode,
> > > >         .num_modes = 1,
> > > > @@ -3287,6 +3321,9 @@ static const struct of_device_id platform_of_match[] = {
> > > >         }, {
> > > >                 .compatible = "lg,lp129qe",
> > > >                 .data = &lg_lp129qe,
> > > > +       }, {
> > > > +               .compatible = "logicpd,type28",
> > > > +               .data = &logicpd_type_28,
> > > >         }, {
> > > >                 .compatible = "mitsubishi,aa070mc01-ca1",
> > > >                 .data = &mitsubishi_aa070mc01,
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
