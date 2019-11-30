Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC7110DF94
	for <lists+linux-omap@lfdr.de>; Sat, 30 Nov 2019 23:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfK3WWE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 30 Nov 2019 17:22:04 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:51568 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbfK3WWE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 30 Nov 2019 17:22:04 -0500
X-Greylist: delayed 386 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Nov 2019 17:22:03 EST
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 71DC480615;
        Sat, 30 Nov 2019 23:16:31 +0100 (CET)
Date:   Sat, 30 Nov 2019 23:16:30 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display
 support
Message-ID: <20191130221630.GD29715@ravnborg.org>
References: <20191016135147.7743-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016135147.7743-1-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
        a=7gkXJVJtAAAA:8 a=JT2HSWW1Nyy1Gc0dzioA:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam.

On Wed, Oct 16, 2019 at 08:51:45AM -0500, Adam Ford wrote:
> Previously, there was an omap panel-dpi driver that would
> read generic timings from the device tree and set the display
> timing accordingly.  This driver was removed so the screen
> no longer functions.  This patch modifies the panel-simple
> file to setup the timings to the same values previously used.
> 
> Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> V5:  No Change
> V4:  No Change
> V3:  No Change
> V2:  No Change

Applied to drm-misc-next.
Sorry for the delay - has been absent for a while.

	Sam
