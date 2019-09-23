Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7020EBBAD6
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 19:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438084AbfIWR45 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 13:56:57 -0400
Received: from muru.com ([72.249.23.125]:34304 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393421AbfIWR45 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 23 Sep 2019 13:56:57 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 95BE6809F;
        Mon, 23 Sep 2019 17:57:28 +0000 (UTC)
Date:   Mon, 23 Sep 2019 10:56:53 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     arnd@arndb.de, nsekhar@ti.com, olof@lixom.net, t-kristo@ti.com,
        catalin.marinas@arm.com, will@kernel.org, s-anna@ti.com,
        hch@lst.de, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 linux-next 1/4] arm: configs: omap2plus_defconfig:
 Change CONFIG_REMOTEPROC from m to y
Message-ID: <20190923175653.GZ5610@atomide.com>
References: <20190920075946.13282-1-j-keerthy@ti.com>
 <20190920075946.13282-2-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920075946.13282-2-j-keerthy@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Keerthy <j-keerthy@ti.com> [190920 08:00]:
> Commit 6334150e9a36 ("remoteproc: don't allow modular build")
> changes CONFIG_REMOTEPROC to a boolean from a tristate config
> option which inhibits all defconfigs marking CONFIG_REMOTEPROC as
> a module in compiling the remoteproc and dependent config options.
> 
> So fix the omap2plus_defconfig to have CONFIG_REMOTEPROC built in.

Acked-by: Tony Lindgren <tony@atomide.com>
