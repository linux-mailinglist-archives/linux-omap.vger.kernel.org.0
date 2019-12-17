Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E509312340E
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 19:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfLQSBM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 13:01:12 -0500
Received: from muru.com ([72.249.23.125]:49010 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727754AbfLQSBM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 17 Dec 2019 13:01:12 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DED448116;
        Tue, 17 Dec 2019 18:01:51 +0000 (UTC)
Date:   Tue, 17 Dec 2019 10:01:09 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        s-anna@ti.com
Subject: Re: [PATCH 0/5] ARM: OMAP2+: a few pdata changes for ipc/reset
Message-ID: <20191217180109.GB35479@atomide.com>
References: <20191212130541.3657-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212130541.3657-1-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191212 05:06]:
> Hi Tony,
> 
> These patches fix up the existing pdata quirks for IOMMU support, and
> add the missed reset pdata. Needed towards IPC.

Thanks applied all into omap-for-v5.6/soc.

Regards,

Tony
