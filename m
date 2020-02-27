Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0192172534
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 18:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbgB0RgD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 12:36:03 -0500
Received: from muru.com ([72.249.23.125]:58086 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729601AbgB0RgD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 Feb 2020 12:36:03 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CB30180C0;
        Thu, 27 Feb 2020 17:36:47 +0000 (UTC)
Date:   Thu, 27 Feb 2020 09:35:59 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Dave Gerlach <d-gerlach@ti.com>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: am33xx/am4372: Add cpuidle dt states
Message-ID: <20200227173559.GH37466@atomide.com>
References: <20191213041725.16831-1-d-gerlach@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213041725.16831-1-d-gerlach@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dave Gerlach <d-gerlach@ti.com> [191212 20:16]:
> Hi,
> This series adds DT idle states for TI am33xx and am4372 platforms.
> The mpu_gate is added for both platforms which gates the MPU clock
> to save power during idle. It depends on the driver series sent
> here [1].
> 
> Regards,
> Dave
> 
> [1] https://marc.info/?l=linux-kernel&m=157620644400324&w=2

Thanks applying into omap-for-v5.7/dt.

Regards,

Tony
