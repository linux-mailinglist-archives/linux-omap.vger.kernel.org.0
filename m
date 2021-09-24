Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B748416C82
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 09:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244307AbhIXHHp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 03:07:45 -0400
Received: from muru.com ([72.249.23.125]:36782 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244284AbhIXHHp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Sep 2021 03:07:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C9EA880EE;
        Fri, 24 Sep 2021 07:06:40 +0000 (UTC)
Date:   Fri, 24 Sep 2021 10:06:10 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 0/5] Prepare sdhci-omap to support more SoCs
Message-ID: <YU144u1vF3kxQ27D@atomide.com>
References: <20210921110029.21944-1-tony@atomide.com>
 <CAPDyKFqeCzjjWgM-A8QEQKvGcadB0nQXLQb0ZfFbRRqB29B7pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqeCzjjWgM-A8QEQKvGcadB0nQXLQb0ZfFbRRqB29B7pA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ulf Hansson <ulf.hansson@linaro.org> [210923 18:51]:
> Applied for next, thanks!

Thanks!

> Please tell me, if there are any of these changes that you think
> deserves to be tagged for stable kernels.

As the issues have not been seen so far with mainline kernels, I
think the fixes tags will be enough and no stable tags are needed.

Regaqrds,

Tony
