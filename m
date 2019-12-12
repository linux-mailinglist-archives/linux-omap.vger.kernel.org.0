Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2147011D2F5
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 17:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbfLLQ7X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 11:59:23 -0500
Received: from muru.com ([72.249.23.125]:46398 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729260AbfLLQ7X (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 11:59:23 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0FEB780C0;
        Thu, 12 Dec 2019 17:00:01 +0000 (UTC)
Date:   Thu, 12 Dec 2019 08:59:20 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        s-anna@ti.com
Subject: Re: [PATCH] bus: ti-sysc: Drop MMU quirks
Message-ID: <20191212165920.GU35479@atomide.com>
References: <20191212124751.3400-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212124751.3400-1-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191212 04:48]:
> From: Suman Anna <s-anna@ti.com>
> 
> The OMAP IOMMU driver no longer uses the pm_runtime_irq_safe() API
> after commit 1432ebbd6003 ("iommu/omap: remove pm_runtime_irq_safe
> flag for OMAP IOMMUs"), so the SYSC_QUIRK_LEGACY_IDLE quirk is no
> longer needed for MMU devices. Drop the same.

Thanks applying into omap-for-v5.6/ti-sysc.

Tony
