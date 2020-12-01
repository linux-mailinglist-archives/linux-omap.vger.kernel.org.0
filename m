Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01C82C99DE
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 09:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbgLAIrC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 03:47:02 -0500
Received: from muru.com ([72.249.23.125]:49670 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727496AbgLAIrC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 03:47:02 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3868180A9;
        Tue,  1 Dec 2020 08:46:28 +0000 (UTC)
Date:   Tue, 1 Dec 2020 10:46:17 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, hns@goldelico.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v4 49/80] ARM: omap2plus_defconfig: Update for moved DSI
 command mode panel
Message-ID: <20201201084617.GX26857@atomide.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-50-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-50-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [201124 12:48]:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The DSI command mode panel is no longer specific
> to OMAP and thus the config option has been renamed
> slightly.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Best to merge this along with the dss patches:

Acked-by: Tony Lindgren <tony@atomide.com>
