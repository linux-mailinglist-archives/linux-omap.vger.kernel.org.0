Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2D41CF96F
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 17:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgELPkF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 11:40:05 -0400
Received: from muru.com ([72.249.23.125]:54076 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbgELPkF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 11:40:05 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4B5378047;
        Tue, 12 May 2020 15:40:54 +0000 (UTC)
Date:   Tue, 12 May 2020 08:40:01 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Samuel Zou <zou_wei@huawei.com>
Cc:     khilman@kernel.org, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] ARM: OMAP2+: pm33xx-core: Make
 am43xx_get_rtc_base_addr static
Message-ID: <20200512154001.GK37466@atomide.com>
References: <1589251271-106359-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589251271-106359-1-git-send-email-zou_wei@huawei.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Samuel Zou <zou_wei@huawei.com> [200511 19:36]:
> Fix the following sparse warning:
> 
> arch/arm/mach-omap2/pm33xx-core.c:270:14: warning: symbol 'am43xx_get_rtc_base_addr' was not declared.
> 
> The am43xx_get_rtc_base_addr has only call site within pm33xx-core.c
> It should be static
> 
> Fixes: 8c5a916f4c88 ("ARM: OMAP2+: sleep33/43xx: Add RTC-Mode support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>

Applying into omap-for-v5.8/soc thanks.

Tony
