Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4B0DC8E6
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 17:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391998AbfJRPjA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 11:39:00 -0400
Received: from muru.com ([72.249.23.125]:38080 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728464AbfJRPjA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 11:39:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 09A72809F;
        Fri, 18 Oct 2019 15:39:33 +0000 (UTC)
Date:   Fri, 18 Oct 2019 08:38:56 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 00/21] Drop more legacy platform data for omaps
Message-ID: <20191018153856.GP5610@atomide.com>
References: <20191017194411.18258-1-tony@atomide.com>
 <291b705f-cfe7-9d22-16c0-90d269cfa799@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <291b705f-cfe7-9d22-16c0-90d269cfa799@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Keerthy <j-keerthy@ti.com> [191018 04:55]:
> 
> 
> On 18/10/19 1:13 AM, Tony Lindgren wrote:
> > Hi all,
> > 
> > Here's a series of changes to remove more legacy platform data and
> > ti,hwmods devitree property for omap variants.
> > 
> > The patches are against v5.4-rc1, but please note that the watchdog
> > changes depend on the following patch:
> > 
> > [PATCH] bus: ti-sysc: Fix watchdog quirk handling
> 
> Tested with the above on AM33/AM43 for DS0. All working fine
> however this series needs a re base on top of 5.4-rc3 as the patches are not
> applying cleanly.

Thanks for testing. Yeah these are still against v5.4-rc1.

> Also rc1 does not have the remoteproc config fix patch so i added that
> remoteproc config fix patch on top.

OK

Thanks,

Tony
