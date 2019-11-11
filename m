Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0408F818A
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2019 21:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbfKKUty (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 15:49:54 -0500
Received: from muru.com ([72.249.23.125]:41700 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfKKUty (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Nov 2019 15:49:54 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3C2F48047;
        Mon, 11 Nov 2019 20:50:30 +0000 (UTC)
Date:   Mon, 11 Nov 2019 12:49:50 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] OMAP2: fixup doc comments in omap_device
Message-ID: <20191111204950.GZ5610@atomide.com>
References: <20191106115945.4298-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106115945.4298-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ben Dooks (Codethink) <ben.dooks@codethink.co.uk> [191106 04:00]:
> The documentation comments in this file are out of
> date with the code, so fix this to avoid the
> following warnings:
> 
> arch/arm/mach-omap2/omap_device.c:133: warning: Function parameter or member 'pdev' not described in 'omap_device_build_from_dt'
> arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'pdev_name' description in 'omap_device_build_from_dt'
> arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'pdev_id' description in 'omap_device_build_from_dt'
> arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'oh' description in 'omap_device_build_from_dt'
> arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'pdata' description in 'omap_device_build_from_dt'
> arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'pdata_len' description in 'omap_device_build_from_dt'
> arch/arm/mach-omap2/omap_device.c:309: warning: Function parameter or member 'pdev' not described in 'omap_device_get_context_loss_count'
> arch/arm/mach-omap2/omap_device.c:309: warning: Excess function parameter 'od' description in 'omap_device_get_context_loss_count'
> arch/arm/mach-omap2/omap_device.c:335: warning: Function parameter or member 'ohs' not described in 'omap_device_alloc'
> arch/arm/mach-omap2/omap_device.c:335: warning: Function parameter or member 'oh_cnt' not described in 'omap_device_alloc'
> arch/arm/mach-omap2/omap_device.c:335: warning: Excess function parameter 'oh' description in 'omap_device_alloc'
> arch/arm/mach-omap2/omap_device.c:335: warning: Excess function parameter 'pdata' description in 'omap_device_alloc'
> arch/arm/mach-omap2/omap_device.c:335: warning: Excess function parameter 'pdata_len' description in 'omap_device_alloc'
> arch/arm/mach-omap2/omap_device.c:659: warning: Function parameter or member 'pdev' not described in 'omap_device_register'
> arch/arm/mach-omap2/omap_device.c:659: warning: Excess function parameter 'od' description in 'omap_device_register'
> arch/arm/mach-omap2/omap_device.c:682: warning: Function parameter or member 'pdev' not described in 'omap_device_enable'
> arch/arm/mach-omap2/omap_device.c:682: warning: Excess function parameter 'od' description in 'omap_device_enable'
> arch/arm/mach-omap2/omap_device.c:713: warning: Function parameter or member 'pdev' not described in 'omap_device_idle'
> arch/arm/mach-omap2/omap_device.c:713: warning: Excess function parameter 'od' description in 'omap_device_idle'

Thanks applying into omap-for-v5.5/soc.

Tony
