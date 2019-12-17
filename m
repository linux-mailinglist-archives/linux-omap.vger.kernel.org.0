Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84DDA1233E7
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 18:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfLQRui (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 12:50:38 -0500
Received: from muru.com ([72.249.23.125]:49002 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbfLQRui (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 17 Dec 2019 12:50:38 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C4E8C8116;
        Tue, 17 Dec 2019 17:51:17 +0000 (UTC)
Date:   Tue, 17 Dec 2019 09:50:35 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        bcousson@baylibre.com
Subject: Re: [PATCH 0/6] ARM: omap4/5/dra7: convert iommu support to ti-sysc
Message-ID: <20191217175035.GA35479@atomide.com>
References: <20191212125123.3465-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212125123.3465-1-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191212 04:52]:
> Hi Tony,
> 
> This series converts the IOMMU support for omap4/5 and dra7 to ti-sysc.
> Added patches to drop the legacy hwmod data for these also.

Thanks I applied the dts changes into omap-for-v5.6/ti-sysc-dt
and platform data removal into omap-for-v5.6/ti-sysc-drop-pdata.

Regards,

Tony
