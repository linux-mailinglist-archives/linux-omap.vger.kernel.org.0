Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB0AAABD88
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 18:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729540AbfIFQRq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 12:17:46 -0400
Received: from muru.com ([72.249.23.125]:60010 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727805AbfIFQRp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Sep 2019 12:17:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5A3A280CC;
        Fri,  6 Sep 2019 16:18:15 +0000 (UTC)
Date:   Fri, 6 Sep 2019 09:17:42 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] ARM: omap2plus_defconfig: Fix missing video
Message-ID: <20190906161742.GE52127@atomide.com>
References: <20190828183351.822-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828183351.822-1-aford173@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190828 11:34]:
> When the panel-dpi driver was removed, the simple-panels driver
> was never enabled, so anyone who used the panel-dpi driver lost
> video, and those who used it inconjunction with simple-panels
> would have to manually enable CONFIG_DRM_PANEL_SIMPLE.
> 
> This patch makes CONFIG_DRM_PANEL_SIMPLE a module in the same
> way the deprecated panel-dpi was.
> 
> Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Applying all three into fixes. Not going to send out a pull
request for the fixes until next week so it may not land
until after the merge window starts. But looks like these
have been broken since 2018, so not super urgent.

Regards,

Tony
