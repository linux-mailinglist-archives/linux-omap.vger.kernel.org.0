Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A453B480
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2019 14:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389823AbfFJMSs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Jun 2019 08:18:48 -0400
Received: from muru.com ([72.249.23.125]:52548 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388833AbfFJMSr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 10 Jun 2019 08:18:47 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DB2EB80CD;
        Mon, 10 Jun 2019 12:19:07 +0000 (UTC)
Date:   Mon, 10 Jun 2019 05:18:43 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Yue Haibing <yuehaibing@huawei.com>
Cc:     paul@pwsan.com, linux@armlinux.org.uk,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH -next] ARM: OMAP2+: Make some variables static
Message-ID: <20190610121843.GY5447@atomide.com>
References: <20190413141744.34488-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190413141744.34488-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Yue Haibing <yuehaibing@huawei.com> [190413 07:18]:
> From: YueHaibing <yuehaibing@huawei.com>
> 
> Fix sparse warnings:
> 
> arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c:532:25: warning: symbol 'am33xx_gpio_hwmod_class' was not declared. Should it be static?
> arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c:542:19: warning: symbol 'am33xx_gpio1_hwmod' was not declared. Should it be static?
> arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c:562:19: warning: symbol 'am33xx_gpio2_hwmod' was not declared. Should it be static?
> arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c:582:19: warning: symbol 'am33xx_gpio3_hwmod' was not declared. Should it be static?

I just noticed this is still pending, sorry for the delay. Applying into
omap-for-v5.3/soc.

Regards,

Tony
