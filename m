Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79ED29AAAB
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2019 10:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390707AbfHWIuO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Aug 2019 04:50:14 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52613 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387472AbfHWIuO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Aug 2019 04:50:14 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i15Go-0003X9-JC; Fri, 23 Aug 2019 10:50:06 +0200
Message-ID: <1566550205.3023.4.camel@pengutronix.de>
Subject: Re: [PATCH 2/8] soc: ti: add initial PRM driver with reset control
 support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>,
        Keerthy <j-keerthy@ti.com>, ssantosh@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        robh+dt@kernel.org
Cc:     tony@atomide.com, devicetree@vger.kernel.org
Date:   Fri, 23 Aug 2019 10:50:05 +0200
In-Reply-To: <e75eed22-1bed-4c8a-930d-e05890d58c47@ti.com>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
         <1565164139-21886-3-git-send-email-t-kristo@ti.com>
         <3b76f0e0-7530-e7b5-09df-2de9956f30ee@ti.com>
         <59709a2d-f13a-bd55-8aba-864c1cf2f19e@ti.com>
         <9372957c-9ab9-b0dd-fe07-815eb2cb2f16@ti.com>
         <0f335aec-bfdf-345a-8dfb-dad70aef1af6@ti.com>
         <a4196b73-63a0-f9d8-1c43-e6c4d1c1d6a4@ti.com>
         <1566400237.4193.15.camel@pengutronix.de>
         <5e82199f-2f75-ee05-ba65-1595d0526572@ti.com>
         <e75eed22-1bed-4c8a-930d-e05890d58c47@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 2019-08-21 at 21:15 +0300, Tero Kristo wrote:
> On 21.8.2019 18.45, Suman Anna wrote:
> > On 8/21/19 10:10 AM, Philipp Zabel wrote:
[...]
> > > In general, assuming the device tree contains no errors, this should not
> > > matter much, but I think it is nice if the reset driver, even with a
> > > misconfigured device tree, can't write into arbitrary bit fields.
> > 
> > Tero,
> > Can you add a check for this if possible?
> 
> Well, I can enforce the usage of reset bit mapping, which I have already 
> implemented for some SoCs like am33xx. If the specific ID is not found, 
> I can bail out. So, basically in this example requesting reset at index 
> 3 would succeed, but it would fail for any other ID; this would be 
> direct HW bit mapping.

That should be fine.

regards
Philipp
