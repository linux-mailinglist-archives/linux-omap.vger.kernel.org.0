Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012B63475CE
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 11:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235513AbhCXKUP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 06:20:15 -0400
Received: from muru.com ([72.249.23.125]:46346 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235619AbhCXKTt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 06:19:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4C3768057;
        Wed, 24 Mar 2021 10:20:45 +0000 (UTC)
Date:   Wed, 24 Mar 2021 12:19:45 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     'w00385741 <weiyongjun1@huawei.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] ARM: OMAP2+: Make symbol
 'pdata_quirks_init_clocks' static
Message-ID: <YFsSQYN8qmA2IzQR@atomide.com>
References: <20210318135649.1286347-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318135649.1286347-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* 'w00385741 <weiyongjun1@huawei.com> [210318 15:49]:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> arch/arm/mach-omap2/pdata-quirks.c:578:1: warning:
>  symbol 'pdata_quirks_init_clocks' was not declared. Should it be static?
> 
> This symbol is not used outside of pdata-quirks.c, so this
> commit marks it static.

Thanks applying into omap-for-v5.13/ti-sysc.

Regards,

Tony
