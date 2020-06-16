Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36091FBA97
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 18:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732163AbgFPQMg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 12:12:36 -0400
Received: from muru.com ([72.249.23.125]:58038 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732179AbgFPQMb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Jun 2020 12:12:31 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CDDED8123;
        Tue, 16 Jun 2020 16:13:21 +0000 (UTC)
Date:   Tue, 16 Jun 2020 09:12:26 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH V2] ARM: dts: am5729: beaglebone-ai: fix rgmii phy-mode
Message-ID: <20200616161226.GD37466@atomide.com>
References: <20200615155701.GA3845236@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615155701.GA3845236@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200615 08:58]:
> Since commit cd28d1d6e52e ("net: phy: at803x: Disable phy delay for
> RGMII mode") the networking is broken on the BeagleBone AI which has
> the AR8035 PHY for Gigabit Ethernet [0].  The fix is to switch from
> phy-mode = "rgmii" to phy-mode = "rgmii-rxid".
> 
> Note: Grygorii made a similar DT fix for other AM57xx boards with a
> different phy in commit 820f8a870f65 ("ARM: dts: am57xx: fix networking
> on boards with ksz9031 phy").
> 
> [0] https://git.io/Jf7PX
> 
> Fixes: 520557d4854b ("ARM: dts: am5729: beaglebone-ai: adding device tree")
> Cc: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> V2:
> - fix formatting of commit reference
> - add Review-by: from Grygorii

Thanks applying into fixes.

Regards,

Tony
