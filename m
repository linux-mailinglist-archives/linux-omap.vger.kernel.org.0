Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8185117252B
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 18:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbgB0ReW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 12:34:22 -0500
Received: from muru.com ([72.249.23.125]:58076 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729512AbgB0ReW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 Feb 2020 12:34:22 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 12E2F80C0;
        Thu, 27 Feb 2020 17:35:06 +0000 (UTC)
Date:   Thu, 27 Feb 2020 09:34:19 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     santosh.shilimkar@oracle.com
Cc:     Dave Gerlach <d-gerlach@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] ARM: OMAP2+: Introduce cpuidle for am335x/am437x
Message-ID: <20200227173419.GG37466@atomide.com>
References: <20191213030755.16096-1-d-gerlach@ti.com>
 <20191213150344.GJ35479@atomide.com>
 <20200226184328.GY37466@atomide.com>
 <5d775a75-3013-fac2-91e3-ac1967b0f698@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d775a75-3013-fac2-91e3-ac1967b0f698@oracle.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* santosh.shilimkar@oracle.com <santosh.shilimkar@oracle.com> [200226 19:56]:
> On 2/26/20 10:43 AM, Tony Lindgren wrote:
> > Santosh,
> > 
> > * Tony Lindgren <tony@atomide.com> [191213 15:04]:
> > > * Dave Gerlach <d-gerlach@ti.com> [191212 19:07]:
> > > > Hi,
> > > > This series adds support for cpuidle on am335x and am437x using the
> > > > cpuidle_arm driver. When testing on am335x-evm and am437x-gp-evm the
> > > > follow power consumption reductions are seen on v5.5-rc1 baseline:
> > > > 
> > > > 
> > > > Idling at command line, CPUFreq userspace governor to 300MHz:
> > > >    am335x-evm:
> > > >      VDD_MPU: 48 mW -> 5 mW
> > > > 
> > > >    am437x-gp-evm:
> > > >      VDD_MPU: 32 mW -> 3 mW
> > > > 
> > > > 
> > > > Idling at command line, CPUFreq userspace governor to 1GHz:
> > > >    am335x-evm:
> > > >      VDD_MPU: 313 mW -> 18 mW
> > > > 
> > > >    am437x-gp-evm:
> > > >      VDD_MPU: 208 mW -> 10 mW
> > > 
> > > Hey this is great! A beverage on me when we get a chance :)
> > > 
> > > For merging, looks like I should take the series after folks are happy
> > > with it. Santosh, care to review and ack if it looks OK?
> > 
> > Looks like this series of changes is still pending. Care
> > to ack?
> > 
> Was scanning this series today. It looks good to me Tony.
> 
> Acked-by: Santosh Shilimkar <ssantosh@kernel.org>

Thanks applying this series into omap-for-v5.7/pm33xx.

Regards,

Tony
