Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7BE326C16
	for <lists+linux-omap@lfdr.de>; Sat, 27 Feb 2021 08:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhB0HTe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 27 Feb 2021 02:19:34 -0500
Received: from muru.com ([72.249.23.125]:37738 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229751AbhB0HTe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 27 Feb 2021 02:19:34 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D60AA80CE;
        Sat, 27 Feb 2021 07:19:25 +0000 (UTC)
Date:   Sat, 27 Feb 2021 09:18:45 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, hns@goldelico.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v4 24/80] drm/omap: dsi: move TE GPIO handling into core
Message-ID: <YDnyVV/O78sQjtWb@atomide.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-25-tomi.valkeinen@ti.com>
 <YCF7ARchcMKvWa4s@atomide.com>
 <5b469566-c926-7e1f-8872-84774b96f389@ideasonboard.com>
 <YCVq8JnuMLQq6FEc@atomide.com>
 <4432cf2c-fe15-dab0-3034-789f6d711396@ideasonboard.com>
 <YC4Bte47SFKVgrqX@atomide.com>
 <7c852efd-560a-4dbb-ed04-e4812b343a33@ideasonboard.com>
 <YDecMzuPaXGS/n5l@atomide.com>
 <0eb62659-041d-d3bd-3803-4d562677dfbf@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eb62659-041d-d3bd-3803-4d562677dfbf@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210226 09:04]:
> Hmm, if I read the code right, TE was not enabled at all before this patch.
> And this patch enables it. So maybe TE has never worked with that panel?
> 
> You could try changing the enable_te calls to pass false.
> 
> Or with the upstream driver, comment out
> 
> mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);

Yup you're right that's it.

Commenting it out in drivers/gpu/drm/panel/panel-dsi-cm.c makes the
warnings go away.

There are some BTA related comments in the old v3.0.8 based Android
kernel for droid4 panel at [0], but I don't really follow what they
mean. Maybe it's some ordering issue?

Regards,

Tony


[0] https://github.com/NotKit/android_kernel_motorola_omap4-common/blob/hybris-11.0/drivers/video/omap2/displays/panel-mapphone.c
