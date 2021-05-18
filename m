Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE5C3871E0
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 08:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241557AbhERG3N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 02:29:13 -0400
Received: from muru.com ([72.249.23.125]:56960 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346631AbhERG3M (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 May 2021 02:29:12 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A42A280BA;
        Tue, 18 May 2021 06:27:58 +0000 (UTC)
Date:   Tue, 18 May 2021 09:27:51 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Yongqiang Liu <liuyongqiang13@huawei.com>
Cc:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] ARM: OMAP2+: Fix build warning when mmc_omap is
 not built
Message-ID: <YKNeZ/uZ7fOgTE8d@atomide.com>
References: <20210401131533.998767-1-liuyongqiang13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401131533.998767-1-liuyongqiang13@huawei.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yongqiang Liu <liuyongqiang13@huawei.com> [210401 16:09]:
> GCC reports the following warning with W=1:
> 
> arch/arm/mach-omap2/board-n8x0.c:325:19: warning:
> variable 'index' set but not used [-Wunused-but-set-variable]
> 325 |  int bit, *openp, index;
>     |                   ^~~~~
> 
> Fix this by moving CONFIG_MMC_OMAP to cover the rest codes
> in the n8x0_mmc_callback().

Thanks applying into fixes.

Tony
