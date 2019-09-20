Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC44B91EF
	for <lists+linux-omap@lfdr.de>; Fri, 20 Sep 2019 16:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389389AbfITO0w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Sep 2019 10:26:52 -0400
Received: from muru.com ([72.249.23.125]:34038 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389378AbfITO0v (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 20 Sep 2019 10:26:51 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 78E1C80AA;
        Fri, 20 Sep 2019 14:27:22 +0000 (UTC)
Date:   Fri, 20 Sep 2019 07:26:47 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ssantosh@kernel.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
        s-anna@ti.com, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv6 10/10] ARM: OMAP2+: pdata-quirks: add PRM data for
 reset support
Message-ID: <20190920142647.GR5610@atomide.com>
References: <20190912170953.GT52127@atomide.com>
 <20190919123258.23172-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919123258.23172-1-t-kristo@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190919 12:33]:
> The parent clockdomain for reset must be in force wakeup mode, otherwise
> the reset may never complete. Add pdata quirks for this purpose for PRM
> driver.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v6: replaced platform specific compatibles with a single common
>     compatible check

Thanks looks good to me:

Acked-by: Tony Lindgren <tony@atomide.com>
