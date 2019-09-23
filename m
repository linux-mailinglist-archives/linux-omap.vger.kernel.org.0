Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C2FBBB9D
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 20:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbfIWSa7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 14:30:59 -0400
Received: from muru.com ([72.249.23.125]:34366 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726921AbfIWSa7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 23 Sep 2019 14:30:59 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 566C1809F;
        Mon, 23 Sep 2019 18:31:30 +0000 (UTC)
Date:   Mon, 23 Sep 2019 11:30:55 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Russell King <linux@armlinux.org.uk>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ARM: omap2plus_defconfig: Update for removed items
Message-ID: <20190923183055.GC5610@atomide.com>
References: <20190911145226.21088-1-aford173@gmail.com>
 <20190911165021.qr5i37mpnua3fvw5@earth.universe>
 <CAHCN7xKin45Hqr1fgoOmbBKaM_hM_xnvrs2_5nnxAifHL2Sz0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKin45Hqr1fgoOmbBKaM_hM_xnvrs2_5nnxAifHL2Sz0A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190911 17:14]:
> On Wed, Sep 11, 2019 at 11:50 AM Sebastian Reichel <sre@kernel.org> wrote:
> >
> > Hi,
> >
> > On Wed, Sep 11, 2019 at 09:52:25AM -0500, Adam Ford wrote:
> > > The omap panel-dpi driver was removed in
> > > Commit 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")
> > >
> > > The tFP410 and DVI connector was remove in
> > > Commit be3143d8b27f ("drm/omap: Remove TFP410 and DVI connector drivers")
> > >
> > > This patch removes these items from the omap2plus_defconfig.
> >
> > The omapdrm specific drivers have generic replacements, that
> > should be added to the defconfig instead:
> >
> > DRM_OMAP_PANEL_DPI -> DRM_PANEL_SIMPLE
> > DRM_OMAP_ENCODER_TFP410 -> DRM_TI_TFP410
> >
> > Nothing should be required for DRM_OMAP_CONNECTOR_DVI.
> 
> The DPI panel was already done.
> 
> https://patchwork.kernel.org/patch/11119569/
> 
> I'll submit a patch for the TFP410

I picked that one into fixes, will apply the rest
of defconfig changes into omap-for-v5.5/defconfig.
Not planning on pushing it out until after -rc1
though.

Regards,

Tony
