Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75229CE961
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 18:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfJGQiK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 12:38:10 -0400
Received: from muru.com ([72.249.23.125]:35698 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727876AbfJGQiK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 12:38:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DFE6E8191;
        Mon,  7 Oct 2019 16:38:43 +0000 (UTC)
Date:   Mon, 7 Oct 2019 09:38:07 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] bus: ti-sysc: fix reset sequencing
Message-ID: <20191007163807.GU5610@atomide.com>
References: <20191007122931.18668-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007122931.18668-1-t-kristo@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191007 12:30]:
> Hi,
> 
> These three patches make sure that IOMMU/remoteprocs work across
> all devices with the latest OMAP PRM series for reset support [1].
> The last dangling issues were caused by the removal of the hardlink
> between the reset + clock drivers.

OK. I presume these are safe to wait for v5.5 since we don't
have the rstctrl driver yet?

Regards,

Tony


> [1] https://patchwork.kernel.org/cover/11142871/
> 
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
