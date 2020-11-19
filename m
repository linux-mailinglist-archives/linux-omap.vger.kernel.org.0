Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5221B2B8F77
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 10:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgKSJxn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 04:53:43 -0500
Received: from muru.com ([72.249.23.125]:48760 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726503AbgKSJxn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 04:53:43 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8309B80F5;
        Thu, 19 Nov 2020 09:53:49 +0000 (UTC)
Date:   Thu, 19 Nov 2020 11:53:39 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     linux@armlinux.org.uk, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Message-ID: <20201119095339.GM26857@atomide.com>
References: <20201104064505.5737-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104064505.5737-1-vulab@iscas.ac.cn>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Xu Wang <vulab@iscas.ac.cn> [201104 08:45]:
> Because clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter, so the additional checks are unnecessary, just
> remove them.

Thanks applying into omap-for-v5.11/soc.

Tony
