Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFA1313BE5
	for <lists+linux-omap@lfdr.de>; Mon,  8 Feb 2021 18:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbhBHR6X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Feb 2021 12:58:23 -0500
Received: from muru.com ([72.249.23.125]:58996 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233956AbhBHRz6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Feb 2021 12:55:58 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E81F78162;
        Mon,  8 Feb 2021 17:55:32 +0000 (UTC)
Date:   Mon, 8 Feb 2021 19:55:13 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, hns@goldelico.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v4 24/80] drm/omap: dsi: move TE GPIO handling into core
Message-ID: <YCF7ARchcMKvWa4s@atomide.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-25-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-25-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tomi Valkeinen <tomi.valkeinen@ti.com> [201124 12:47]:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> In preparation for removing custom DSS calls from the DSI
> panel driver, this moves support for external tearing event
> GPIOs into the DSI host driver. This way tearing events are
> always handled in the core resulting in simplification of
> the panel drivers.
> 
> The TE GPIO acquisition follows works in the same way as the
> exynos DSI implementation.

Looks like this patch causes the following warnings:

DSI: omapdss DSI error: Failed to receive BTA
DSI: omapdss DSI error: bta sync failed
DSI: omapdss DSI error: vc(0) busy when trying to config for VP
DSI: omapdss DSI error: Failed to receive BTA
DSI: omapdss DSI error: bta sync failed
DSI: omapdss DSI error: vc(0) busy when trying to config for VP
DSI: omapdss DSI error: Failed to receive BTA
DSI: omapdss DSI error: bta sync failed
DSI: omapdss DSI error: vc(0) busy when trying to config for VP
...

Any ideas? The display works for me despite the constant
warnings.

Regards,

Tony
