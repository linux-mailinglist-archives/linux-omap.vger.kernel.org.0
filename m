Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A852212CD1
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 21:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgGBTLV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 15:11:21 -0400
Received: from muru.com ([72.249.23.125]:60502 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgGBTLV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jul 2020 15:11:21 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7543A8062;
        Thu,  2 Jul 2020 19:12:13 +0000 (UTC)
Date:   Thu, 2 Jul 2020 12:11:18 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-omap@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] bus: ti-sysc: Fix wakeirq sleeping function called
 from invalid context
Message-ID: <20200702191118.GP37466@atomide.com>
References: <20200702174929.26506-1-tony@atomide.com>
 <434eff2e-bc7f-84ee-0980-769915cefffb@ti.com>
 <20200702190249.GO37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702190249.GO37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200702 19:03]:
> * Suman Anna <s-anna@ti.com> [200702 18:01]:
> > Hi Tony,
> > 
> > On 7/2/20 12:49 PM, Tony Lindgren wrote:
> > > With CONFIG_DEBUG_ATOMIC_SLEEP enabled we can see the following with
> > > wakeirqs and serial console idled:
> > 
> > Which devices are these? I have one patch from Tero fixing similar errors in
> > OMAP IOMMU driver. Will post that either today or tomorrow.
> 
> I noticed this testing Andy Schevchenko's pending generic serial PM
> patches. It happens on any omap variant with kernel serial console
> detached and uart idled. Then just wait for the autosuspend timeout
> to expire and type a character on the serial console :)

And BTW, Andy's series involves the removal of pm_runtime_irq_safe()
from the serial drivers that we still have. So this won't trigger
currently with the uart. But the issue could trigger with other
drivers though.

Regards,

Tony
