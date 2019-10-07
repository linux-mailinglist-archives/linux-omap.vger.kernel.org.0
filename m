Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E0BCEA83
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbfJGRXE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:23:04 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:41012 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfJGRXD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:23:03 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 941EA80516;
        Mon,  7 Oct 2019 19:22:58 +0200 (CEST)
Date:   Mon, 7 Oct 2019 19:22:56 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        thierry.reding@gmail.com, letux-kernel@openphoenux.org,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
Message-ID: <20191007172256.GA1956@ravnborg.org>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=9T81fxlNLQDmeR1-j4EA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Laurent.
On Mon, Oct 07, 2019 at 08:07:56PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series fixes a module alias issue with the five recently
> added panel drivers used by omapdrm.
> 
> Before those panel drivers, omapdrm had custom drivers for the panels,
> and prefixed the OF compatible strings with an "omapdss," prefix. The
> SPI device IDs are constructed by stripping the OF compatible string
> from the prefix, resulting in the "omapdss," prefix being removed, but
> the subsequence OF vendor prefix being kept. The SPI drivers thus had
> modules aliases that contained the vendor prefix.
> 
> Now that the panels are supported by standard drivers and the "omapdss,"
> prefix is removed, the SPI device IDs are stripped from the OF vendor
> prefix. As the new panel drivers copied the module aliases from the
> omapdrm-specific drivers, they contain the vendor prefix in their SPI
> module aliases, and are thus not loaded automatically.
> 
> Fix this by removing the vendor prefix from the SPI modules aliases in
> the drivers. For consistency reason, the manual module aliases are also
> moved to use an SPI module table.

Good explanation - thanks.

> 
> These patches are based on the drm-misc-fixes branch as they fix v5.4
> regressions.
> 
> Laurent Pinchart (5):
>   drm/panel: lg-lb035q02: Fix SPI alias
>   drm/panel: nec-nl8048hl11: Fix SPI alias
>   drm/panel: sony-acx565akm: Fix SPI alias
>   drm/panel: tpo-td028ttec1: Fix SPI alias
>   drm/panel: tpo-td043mtea1: Fix SPI alias

Full series is:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

I expect someone else to pick them up or that you apply them.

	Sam
