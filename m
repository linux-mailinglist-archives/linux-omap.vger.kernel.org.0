Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620672C2E6B
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 18:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389971AbgKXRZq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 12:25:46 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:49030 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390795AbgKXRZp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 12:25:45 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 7E93C806DD;
        Tue, 24 Nov 2020 18:25:41 +0100 (CET)
Date:   Tue, 24 Nov 2020 18:25:39 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v4 56/80] drm/panel: panel-dsi-cm: cleanup tear enable
Message-ID: <20201124172539.GA56262@ravnborg.org>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-57-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-57-tomi.valkeinen@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8 a=7gkXJVJtAAAA:8
        a=k9zZKwMtfdSK9zaPWX4A:9 a=CjuIK1q_8ugA:10 a=H9xpq_V2WxwA:10
        a=aeg5Gbbo78KNqacMgKqU:22 a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 24, 2020 at 02:45:14PM +0200, Tomi Valkeinen wrote:
> Simplify the code by moving code from _dsicm_enable_te() into
> dsicm_power_on().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
