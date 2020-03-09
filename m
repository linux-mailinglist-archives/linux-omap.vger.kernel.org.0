Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 753FE17E53A
	for <lists+linux-omap@lfdr.de>; Mon,  9 Mar 2020 17:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgCIQ7s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Mar 2020 12:59:48 -0400
Received: from muru.com ([72.249.23.125]:59394 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727185AbgCIQ7s (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 9 Mar 2020 12:59:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4451C80FA;
        Mon,  9 Mar 2020 17:00:33 +0000 (UTC)
Date:   Mon, 9 Mar 2020 09:59:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Arthur Demchenkov <spinal.by@gmail.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Ladislav Michl <ladis@linux-mips.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP: DTS: N900: fix onenand timings
Message-ID: <20200309165944.GO37466@atomide.com>
References: <20200308191934.8263-1-spinal.by@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200308191934.8263-1-spinal.by@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arthur Demchenkov <spinal.by@gmail.com> [200308 12:21]:
> Commit a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
> started using DT specified timings for GPMC, and as a result the
> OneNAND stopped working on N900 as we had wrong values in the DT.
> Fix by updating the values to bootloader timings that have been tested
> to be working on Nokia N900 with OneNAND manufacturers: Samsung,
> Numonyx.
> 
> Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")

Applying into fixes thanks.

Tony
