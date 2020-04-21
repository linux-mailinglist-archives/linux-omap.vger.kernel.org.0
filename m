Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C9A1B2CC2
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 18:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgDUQeP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 12:34:15 -0400
Received: from muru.com ([72.249.23.125]:50624 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgDUQeP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Apr 2020 12:34:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B14EA8081;
        Tue, 21 Apr 2020 16:35:00 +0000 (UTC)
Date:   Tue, 21 Apr 2020 09:34:09 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
Subject: Re: [PATCH] ARM: dts: dra7: Fix bus_dma_limit for PCIe
Message-ID: <20200421163409.GW37466@atomide.com>
References: <20200417064340.17527-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417064340.17527-1-kishon@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Kishon Vijay Abraham I <kishon@ti.com> [200416 23:44]:
> Even though commit cfb5d65f2595 ("ARM: dts: dra7: Add bus_dma_limit
> for L3 bus") added bus_dma_limit for L3 bus, the PCIe controller
> gets incorrect value of bus_dma_limit.
> 
> Fix it by adding empty dma-ranges property to axi@0 and axi@1
> (parent device tree node of PCIe controller).

Applying into fixes thanks.

Tony
