Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E10128A76
	for <lists+linux-omap@lfdr.de>; Sat, 21 Dec 2019 17:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbfLUQlp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 21 Dec 2019 11:41:45 -0500
Received: from muru.com ([72.249.23.125]:49252 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726976AbfLUQlp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 21 Dec 2019 11:41:45 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 15AED806C;
        Sat, 21 Dec 2019 16:42:23 +0000 (UTC)
Date:   Sat, 21 Dec 2019 08:41:41 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20191221164141.GI35479@atomide.com>
References: <20191221005711.47314-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191221005711.47314-1-tony@atomide.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [191220 16:57]:
> Looking around what might affect BO_TILED, I noticed Matthijs had this
> change in his earlier pyra tiler patches. The earlier patch "XXX omapdrm:
> force tiled buffers to be pinned and page-aligned" has no commit log
> though, so I'm not sure what other issues this might fix.
..
> Matthijs, do you have some more info to add to the description?

Also, I'm wondering if this change makes sense alone without the pinning
changes for a fix, or if also the pinning changes are needed.

For reference, the original related patch(es) are available at [0] below.

Regards,

Tony

[0] https://github.com/mvduin/linux/commit/70593563f531a7ac4a3f6ebed0fc98ef86742b12
