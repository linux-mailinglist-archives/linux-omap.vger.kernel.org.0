Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435C127017E
	for <lists+linux-omap@lfdr.de>; Fri, 18 Sep 2020 17:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgIRP7T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Sep 2020 11:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgIRP7T (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Sep 2020 11:59:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A362AC0613CE
        for <linux-omap@vger.kernel.org>; Fri, 18 Sep 2020 08:59:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8561C2D7;
        Fri, 18 Sep 2020 17:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600444755;
        bh=Wp/J1AEFQL2S412IUsaynd0vSfoQ2onok1jCCJ6gZQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nVf4t0Alwv4/dUdya3hjEQ3HEeLMxQHfpyryztLzKHggTWw1QxQlV4v4X4MOd4oUT
         BOh5bthZeSwh3p0M5ILgMKuCGuJAdQag2GKA8Es8B1KL1O8dA1wVW7oIigXlPX85aj
         EzlmffqL4Y+kDpRQ5ge+qtYreJFj3Fe/H4mknOvU=
Date:   Fri, 18 Sep 2020 18:58:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20200918155844.GH28436@pendragon.ideasonboard.com>
References: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 18, 2020 at 06:25:02PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> Has anyone noticed that booting would have slowed down in 5.8 and in 5.9-rcs? I'm booting x15 with
> my custom config builder, which uses omap2plus_defconfig as a base. I see:
> 
> v5.7
> [    0.597765] cpuidle: using governor menu
> [    0.793198] No ATAGs?
> 
> [    9.654611] Run /sbin/init as init process
> 
> 5.8
> [    0.616660] cpuidle: using governor menu
> [    4.439856] No ATAGs?
> 
> [   15.484710] Run /sbin/init as init process
> 
> v5.9-rc5
> [    0.706165] cpuidle: using governor menu
> [    6.761812] No ATAGs?
> 
> [   19.522536] Run /sbin/init as init process
> 
> 
> So v5.7 boots quickly, and init starts around 9.6 secs. 5.8 is much slower, and 5.9-rc5 even slower.

I've tracked this down to device_link_add_missing_supplier_links()
taking about 40+ms to run, for every device added to the system. Given
the large number of devices, this adds up to 10s on v5.9-rc5, when
called during the initial of_platform_populate().

It doesn't seem there's a single culprit here (although I may have
missed it), "just" lots of walks through the whole device tree that end
up taking way too much time. I'm not planning to investigate this
further at this point.

> My config builder enables all kinds of debug options, so possibly it could be just more debug
> features or such having been implemented, or enabled in omap2plus_defconfig...

-- 
Regards,

Laurent Pinchart
