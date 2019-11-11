Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E62F74A7
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2019 14:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfKKNTy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 08:19:54 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:46761 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfKKNTy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Nov 2019 08:19:54 -0500
Received: by mail-io1-f67.google.com with SMTP id c6so14487058ioo.13;
        Mon, 11 Nov 2019 05:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iRKDx6Fejpor5pYdLn7G3kgNJ1vgpNwffUtYoE2a0oQ=;
        b=Gdaw3O8jb/PC9I3quBaFNFdXhsLl5xBsKkgou1e+Bqj87wCCdnWo6RL621XW4/F6xm
         o39SfkWAw0j4yM91e9xwJ8shnusIHbUbtSPUY+HxVINCpHWYVBdlED7E+iD2OX7e6GyO
         pHaZ5LO1wYf77A+/Mg3jkjtHAESyJYWiIjL7owvM1VZ7poSVvGtKrVdPK+MwOIt05pmO
         lETO3t6URRBV7XosrTBH9BMkauNKjpE9MVUp0Is/Q8PpnVlqEtlkqlx3fDRnk3ZK1NQg
         em5v59MvK4BAT7na6dNq6gdGc7ZZGIPcLpJX6wQksVmfZruLZEyWSVrY9erTAEBr2EvI
         4ipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRKDx6Fejpor5pYdLn7G3kgNJ1vgpNwffUtYoE2a0oQ=;
        b=L+lo89CHD501ZEIx2WorKj5jIvcscekUqO/pjk0cYApzLQgxVeFioD/q0eNm1MZrZw
         G9dtYmZvcpvjX96sIP7eL8fY0NMcfGP8ZBeQZfR3Cc2E0le+YNgVEONUhDvW+F97DkJO
         eBjjeIB8A46lEsQYtd8x6+6FBJic4iycXhz2JF8qS1SIEMd5z4MYt0dn7AqIXefBiWiw
         iqy3wrqbffrSQWm6JFxM4NoIvVff2lQQi4UnhWYfIG9awZzypQlIha/4VKuuBlWyRsuL
         ih2Li3cTlmDdq6PyUbeJ56fFyKvpnwcwPhzk00fH4sHLTGjkHoYwHAkhmH/xAiPiQZ2O
         Agog==
X-Gm-Message-State: APjAAAXFKqC8g+oUbLqu+MgMP3kBGAyS5KukmWqWGGwmoTWSAzOK4T3v
        wQODHS9loChMEtk43PVVcmOsDJqQZVEz1GCxq1Y=
X-Google-Smtp-Source: APXvYqyGIUTyr+1o8xjw2JPHnMGy0W5HE7ZnIXmNr6qQj4tdycsdQYWpeb8DZtkEpJZuvKILmsvQOeGz0wT4GkeS+qw=
X-Received: by 2002:a5e:8c0a:: with SMTP id n10mr25782091ioj.78.1573478391683;
 Mon, 11 Nov 2019 05:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com> <CAHCN7xJ-1b_OHXy_u8TvA5i4PuWGbci6YN3x1hUY_UaLxzu+QQ@mail.gmail.com>
 <20191101075726.GB6209@pendragon.ideasonboard.com>
In-Reply-To: <20191101075726.GB6209@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 11 Nov 2019 07:19:40 -0600
Message-ID: <CAHCN7x+cCyQ=kp30Z9Vu6-feU2Yp6b=kui-h6G8t67abhYXpCw@mail.gmail.com>
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

On Fri, Nov 1, 2019 at 2:57 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Oct 30, 2019 at 09:44:20AM -0500, Adam Ford wrote:
> > On Wed, Oct 16, 2019 at 8:52 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > Previously, there was an omap panel-dpi driver that would
> > > read generic timings from the device tree and set the display
> > > timing accordingly.  This driver was removed so the screen
> > > no longer functions.  This patch modifies the panel-simple
> > > file to setup the timings to the same values previously used.
> > >
> > > Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")
> >
> > Will this be able to make it into linux-next for the 5.5 merge window?
> > I believe Tony has picked up the device tree portion in his omap
> > tree, but I haven't seen any notifications on this series on whether
> > or not it's being applied.  I also don't know which tree I need to
> > look if it's already been applied.
> >
> > This fixes a regression introduced a while ago where the driver I was
> > using for the display was removed.
>
> Sam, would you be able to pick this up ?

Gentle nudge with the merge window approaching.

Thank you,

adam

>
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > ---
> > > V5:  No Change
> > > V4:  No Change
> > > V3:  No Change
> > > V2:  No Change
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 5d487686d25c..72f69709f349 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -2061,6 +2061,40 @@ static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
> > >         .flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > >  };
> > >
> > > +static const struct drm_display_mode logicpd_type_28_mode = {
> > > +       .clock = 9000,
> > > +       .hdisplay = 480,
> > > +       .hsync_start = 480 + 3,
> > > +       .hsync_end = 480 + 3 + 42,
> > > +       .htotal = 480 + 3 + 42 + 2,
> > > +
> > > +       .vdisplay = 272,
> > > +       .vsync_start = 272 + 2,
> > > +       .vsync_end = 272 + 2 + 11,
> > > +       .vtotal = 272 + 2 + 11 + 3,
> > > +       .vrefresh = 60,
> > > +       .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> > > +};
> > > +
> > > +static const struct panel_desc logicpd_type_28 = {
> > > +       .modes = &logicpd_type_28_mode,
> > > +       .num_modes = 1,
> > > +       .bpc = 8,
> > > +       .size = {
> > > +               .width = 105,
> > > +               .height = 67,
> > > +       },
> > > +       .delay = {
> > > +               .prepare = 200,
> > > +               .enable = 200,
> > > +               .unprepare = 200,
> > > +               .disable = 200,
> > > +       },
> > > +       .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > > +       .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> > > +                    DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
> > > +};
> > > +
> > >  static const struct panel_desc mitsubishi_aa070mc01 = {
> > >         .modes = &mitsubishi_aa070mc01_mode,
> > >         .num_modes = 1,
> > > @@ -3287,6 +3321,9 @@ static const struct of_device_id platform_of_match[] = {
> > >         }, {
> > >                 .compatible = "lg,lp129qe",
> > >                 .data = &lg_lp129qe,
> > > +       }, {
> > > +               .compatible = "logicpd,type28",
> > > +               .data = &logicpd_type_28,
> > >         }, {
> > >                 .compatible = "mitsubishi,aa070mc01-ca1",
> > >                 .data = &mitsubishi_aa070mc01,
>
> --
> Regards,
>
> Laurent Pinchart
