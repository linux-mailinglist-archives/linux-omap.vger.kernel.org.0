Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20485B0269
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2019 19:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbfIKRNm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Sep 2019 13:13:42 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35713 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729450AbfIKRNm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Sep 2019 13:13:42 -0400
Received: by mail-io1-f67.google.com with SMTP id f4so46873557ion.2;
        Wed, 11 Sep 2019 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6+SoHhsQOovqeJZiGrW82P38EagpxDWDR4IIb3FtRF0=;
        b=XVZB36l4tCCXIo99rJgiEOcRMbNK/SDldNDhuEWHpRBjh9g1qEnpocs0amMHNLuITu
         nTt0wafLCJ2XqHDDe5Vowa9SwAUsqRHYXqlFcBJvKMUoC90gXSsKVLz1ry/5H/dSJAKE
         43rCckOnr2QVdwEnZNU+NrVErFfEFAe1mijavOefP+CcwT1Ig0vXBhkUIuYcg9RiTR5Q
         HTpq2vMxLJoa4mVpnwqv+fpVe1KcBUKHsqa6TOkXoov68QAADJBLTevGBqfdyoo8M/VF
         pPBZOSKHY26pofiVpOkorepZpmsIjFgc9XWu04QRFdfyUrvNpVUBnkGKzu82+bge2LQD
         iF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+SoHhsQOovqeJZiGrW82P38EagpxDWDR4IIb3FtRF0=;
        b=sEbrFCb5yBI4k0vUm3laSt1LkPJ58wckYgD9ucdoV83F+RWEIwhH3TSXSOS5iCQ9/g
         FwFbVx1wsq/F3nx+uBaAbYwGUZoFyajKoIUgREJK+X66NZ0jU0k3Ddunjy6Rs5Q23za2
         yG2RB73MZ7iPDTtiROUiyyZRUZahdlylgLB6fBbFIvBXXkYmB4wJ68TQKc0ZneZIwKrr
         UhJux+ngqwtULisu5WeBuOTU9E4EGBtGTJI7jZVL/uxbh7xEQBQiCv2kLb91zIjRisc9
         s7Zp5xpQ+HSpR0DPmVwjWtLFlOiahGiTY+i4BJEjrhJhhS7o9C6xJcaqBc6sGaPzDd++
         4nyg==
X-Gm-Message-State: APjAAAWByvrSkhWIQ4ZD95KMJl9e6aCjxH5GA8T8EosV8KGS0gJrLc+V
        1GBu532mWlYgzOWbTL/TjlFr5m7eZMtFWccVc/oJT2bC
X-Google-Smtp-Source: APXvYqzvZEOqQx2WkH+vz6db30rZjP0YoOEZETq41+nri6onsnfSe2ye9BXROxkmT5TyXDj3omZewOfWQsdOtYuRCP4=
X-Received: by 2002:a02:65cd:: with SMTP id u196mr38920494jab.3.1568222019620;
 Wed, 11 Sep 2019 10:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190911145226.21088-1-aford173@gmail.com> <20190911165021.qr5i37mpnua3fvw5@earth.universe>
In-Reply-To: <20190911165021.qr5i37mpnua3fvw5@earth.universe>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 11 Sep 2019 12:13:27 -0500
Message-ID: <CAHCN7xKin45Hqr1fgoOmbBKaM_hM_xnvrs2_5nnxAifHL2Sz0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: omap2plus_defconfig: Update for removed items
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 11, 2019 at 11:50 AM Sebastian Reichel <sre@kernel.org> wrote:
>
> Hi,
>
> On Wed, Sep 11, 2019 at 09:52:25AM -0500, Adam Ford wrote:
> > The omap panel-dpi driver was removed in
> > Commit 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")
> >
> > The tFP410 and DVI connector was remove in
> > Commit be3143d8b27f ("drm/omap: Remove TFP410 and DVI connector drivers")
> >
> > This patch removes these items from the omap2plus_defconfig.
>
> The omapdrm specific drivers have generic replacements, that
> should be added to the defconfig instead:
>
> DRM_OMAP_PANEL_DPI -> DRM_PANEL_SIMPLE
> DRM_OMAP_ENCODER_TFP410 -> DRM_TI_TFP410
>
> Nothing should be required for DRM_OMAP_CONNECTOR_DVI.

The DPI panel was already done.

https://patchwork.kernel.org/patch/11119569/

I'll submit a patch for the TFP410

adam
>
> -- Sebastian
>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> > index c7bf9c493646..166b36be2ca6 100644
> > --- a/arch/arm/configs/omap2plus_defconfig
> > +++ b/arch/arm/configs/omap2plus_defconfig
> > @@ -349,12 +349,9 @@ CONFIG_OMAP5_DSS_HDMI=y
> >  CONFIG_OMAP2_DSS_SDI=y
> >  CONFIG_OMAP2_DSS_DSI=y
> >  CONFIG_DRM_OMAP_ENCODER_OPA362=m
> > -CONFIG_DRM_OMAP_ENCODER_TFP410=m
> >  CONFIG_DRM_OMAP_ENCODER_TPD12S015=m
> > -CONFIG_DRM_OMAP_CONNECTOR_DVI=m
> >  CONFIG_DRM_OMAP_CONNECTOR_HDMI=m
> >  CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
> > -CONFIG_DRM_OMAP_PANEL_DPI=m
> >  CONFIG_DRM_OMAP_PANEL_DSI_CM=m
> >  CONFIG_DRM_OMAP_PANEL_SONY_ACX565AKM=m
> >  CONFIG_DRM_OMAP_PANEL_LGPHILIPS_LB035Q02=m
> > --
> > 2.17.1
> >
