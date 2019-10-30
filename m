Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 600ABE9DC8
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2019 15:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfJ3Ood (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Oct 2019 10:44:33 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44783 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfJ3Ood (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Oct 2019 10:44:33 -0400
Received: by mail-io1-f66.google.com with SMTP id w12so2786713iol.11;
        Wed, 30 Oct 2019 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v69E/vAISH85pBxwVE2N7vhsH75pOHxu/fxiGY0QbeQ=;
        b=jXjnRC/x0AeJB/QbSDoglLlI2mM7uoL59nA1SheOa24mpXYHVbx8ZGru91eHCOC5yI
         SJ7vwR86I0EES8IlDT4BmaDC+tPi6otXqTk+VUUQQiYLCsCmtehR0jpFweGy7EDkdets
         kUr2diEZfOmYvdliAUEOSVoTxDU+45JBI8xWqBWSRt8bxMK3LKc3fYZojC1uHE/Tlz9N
         E8KOg3JZclRFc4rXl5LP83vK/QrmmmBVQp2o5mTvTyDf+dX3WPd4887MZPG8Yc7xsuco
         oiVncDPY0nb1HmJ49VrFGHGIqvmcCr3BsVmxsXtwQYePRzEYveNrwfqIWRbnMbe3Rv8Z
         S82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v69E/vAISH85pBxwVE2N7vhsH75pOHxu/fxiGY0QbeQ=;
        b=PbY+p/gIWZr8Fe45LLdvRhi2JWGNUKveD02P9sPNvwrVM6TyXQai1X3TdCpNLg7K8s
         5vYI+NWF2TJeeoZFbBl5gkzbm6h2ImePkO7nDblT+FywB4pjpvfoLDDBS6Sz3VfKaKC7
         QK2lBcqGPXHeeKLjIQ03C5dqiFloxosEqIlKtjG9I1RCUYQvG2gHJ/6LvKziI1MnSz11
         Rt8orm0GDUs9sJoqWzz6Ph7pNV4Y7GPWEgHuTAJctEDgXkuSHJS9jQlP67rB3c4IuBoU
         8AVun+X7TaXcdaIOs02NAY91Z+LdDIYAk26ztiQYO7pLzWgC4EeDByUSU2z1cxWmDWkV
         cCcw==
X-Gm-Message-State: APjAAAVahPdHEFL/emv/Pu7yb4wTTuQr7nURF81ZVjAopZ6RUB+NZpDQ
        lO0HQgfcKI6Bfq8qXesa4a//b9U3jTHqTBTyImyDaw==
X-Google-Smtp-Source: APXvYqz9ISkB3eGeL8FfMvO09xLvJ4YONlu+FugWEIXfRPeSrJQJUmxiQL8wy/pNoaUViiXqYAOHQtwSg3lnrA2NftI=
X-Received: by 2002:a5e:9245:: with SMTP id z5mr87806iop.205.1572446672018;
 Wed, 30 Oct 2019 07:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com>
In-Reply-To: <20191016135147.7743-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 30 Oct 2019 09:44:20 -0500
Message-ID: <CAHCN7xJ-1b_OHXy_u8TvA5i4PuWGbci6YN3x1hUY_UaLxzu+QQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display support
To:     dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 16, 2019 at 8:52 AM Adam Ford <aford173@gmail.com> wrote:
>
> Previously, there was an omap panel-dpi driver that would
> read generic timings from the device tree and set the display
> timing accordingly.  This driver was removed so the screen
> no longer functions.  This patch modifies the panel-simple
> file to setup the timings to the same values previously used.
>
> Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")
>

Will this be able to make it into linux-next for the 5.5 merge window?
 I believe Tony has picked up the device tree portion in his omap
tree, but I haven't seen any notifications on this series on whether
or not it's being applied.  I also don't know which tree I need to
look if it's already been applied.

This fixes a regression introduced a while ago where the driver I was
using for the display was removed.

thank you,

adam

> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> V5:  No Change
> V4:  No Change
> V3:  No Change
> V2:  No Change
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5d487686d25c..72f69709f349 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2061,6 +2061,40 @@ static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
>         .flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  };
>
> +static const struct drm_display_mode logicpd_type_28_mode = {
> +       .clock = 9000,
> +       .hdisplay = 480,
> +       .hsync_start = 480 + 3,
> +       .hsync_end = 480 + 3 + 42,
> +       .htotal = 480 + 3 + 42 + 2,
> +
> +       .vdisplay = 272,
> +       .vsync_start = 272 + 2,
> +       .vsync_end = 272 + 2 + 11,
> +       .vtotal = 272 + 2 + 11 + 3,
> +       .vrefresh = 60,
> +       .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +static const struct panel_desc logicpd_type_28 = {
> +       .modes = &logicpd_type_28_mode,
> +       .num_modes = 1,
> +       .bpc = 8,
> +       .size = {
> +               .width = 105,
> +               .height = 67,
> +       },
> +       .delay = {
> +               .prepare = 200,
> +               .enable = 200,
> +               .unprepare = 200,
> +               .disable = 200,
> +       },
> +       .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +       .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> +                    DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
> +};
> +
>  static const struct panel_desc mitsubishi_aa070mc01 = {
>         .modes = &mitsubishi_aa070mc01_mode,
>         .num_modes = 1,
> @@ -3287,6 +3321,9 @@ static const struct of_device_id platform_of_match[] = {
>         }, {
>                 .compatible = "lg,lp129qe",
>                 .data = &lg_lp129qe,
> +       }, {
> +               .compatible = "logicpd,type28",
> +               .data = &logicpd_type_28,
>         }, {
>                 .compatible = "mitsubishi,aa070mc01-ca1",
>                 .data = &mitsubishi_aa070mc01,
> --
> 2.17.1
>
