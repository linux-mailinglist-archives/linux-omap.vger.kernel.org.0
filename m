Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727432A81F7
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 16:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731085AbgKEPQJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 10:16:09 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:34124 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730822AbgKEPQJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 10:16:09 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id CD88380632;
        Thu,  5 Nov 2020 16:16:04 +0100 (CET)
Date:   Thu, 5 Nov 2020 16:16:03 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 40/56] drm/panel: Move OMAP's DSI command mode panel
 driver
Message-ID: <20201105151603.GA67927@ravnborg.org>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-41-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-41-tomi.valkeinen@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
        a=7gkXJVJtAAAA:8 a=cBeVDJENtZ3KrYruT8MA:9 a=CjuIK1q_8ugA:10
        a=AbAUZ8qAyYyZVLSsDulk:22 a=aeg5Gbbo78KNqacMgKqU:22
        a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Nov 05, 2020 at 02:03:17PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The panel driver is no longer using any OMAP specific APIs, so
> let's move it into the generic panel directory.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
