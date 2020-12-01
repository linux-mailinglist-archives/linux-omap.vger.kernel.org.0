Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1E02C9825
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 08:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbgLAHbX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 02:31:23 -0500
Received: from muru.com ([72.249.23.125]:49602 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727429AbgLAHbX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 02:31:23 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5E7D780A9;
        Tue,  1 Dec 2020 07:30:49 +0000 (UTC)
Date:   Tue, 1 Dec 2020 09:30:38 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Cc:     krzk@kernel.org, linux@armlinux.org.uk, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: drop unused POWER_AVS option
Message-ID: <20201201073038.GT26857@atomide.com>
References: <20201130124233.32569-1-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130124233.32569-1-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com> [201130 14:43]:
> Commit 785b5bb41b0a ("PM: AVS: Drop the avs directory and the
> corresponding Kconfig") moved AVS code to SOC-specific folders, and
> removed corresponding Kconfig from drivers/power, leaving original
> POWER_AVS config option enabled in omap2plus_defconfig file.
> 
> Remove the option, which has no references in the tree anymore.
> 
> Fixes: 785b5bb41b0a ("PM: AVS: Drop the avs directory and the corresponding Kconfig")

Applying into omap-for-v5.11/defconfig-take2 thanks.

Regards,

Tony
