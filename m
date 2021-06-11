Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57F63A3CD3
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 09:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhFKHT3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 03:19:29 -0400
Received: from muru.com ([72.249.23.125]:41748 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230523AbhFKHT1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Jun 2021 03:19:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 07AA080BA;
        Fri, 11 Jun 2021 07:17:37 +0000 (UTC)
Date:   Fri, 11 Jun 2021 10:17:26 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap2/3: Drop dmas property from I2C node
Message-ID: <YMMOBt6lsrxpPCy7@atomide.com>
References: <20210526094424.27234-1-vigneshr@ti.com>
 <db266433-e97d-9786-bb1d-07d474ebcab4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db266433-e97d-9786-bb1d-07d474ebcab4@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210526 10:08]:
> 
> 
> On 26/05/2021 12:44, Vignesh Raghavendra wrote:
> > DMA was never supported by i2c-omap driver and the bindings were never
> > documented. Therefore drop the entries in preparation to moving
> > bindings to YAML schema.
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > ---
> >   arch/arm/boot/dts/dm816x.dtsi | 4 ----
> >   arch/arm/boot/dts/omap2.dtsi  | 4 ----
> >   arch/arm/boot/dts/omap3.dtsi  | 6 ------
> >   3 files changed, 14 deletions(-)
> 
> Thank you.
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Applying into omap-for-v5.14/dt thanks.

Regards,

Tony
