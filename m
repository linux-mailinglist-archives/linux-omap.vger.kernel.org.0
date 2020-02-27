Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20620170DCD
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 02:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgB0B1J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 20:27:09 -0500
Received: from muru.com ([72.249.23.125]:57948 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728133AbgB0B1J (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 20:27:09 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 478558022;
        Thu, 27 Feb 2020 01:27:53 +0000 (UTC)
Date:   Wed, 26 Feb 2020 17:27:05 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Drop PRUSS and OMAP4 IPU/DSP hwmod data
Message-ID: <20200227012705.GD37466@atomide.com>
References: <20200224232152.25562-1-s-anna@ti.com>
 <20200226182603.GT37466@atomide.com>
 <0f47de68-6b89-4219-5ff9-a9c39b6bc759@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f47de68-6b89-4219-5ff9-a9c39b6bc759@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200226 20:31]:
> On 2/26/20 12:26 PM, Tony Lindgren wrote:
> > * Suman Anna <s-anna@ti.com> [200224 15:22]:
> >> Hi Tony,
> >>
> >> The following patches drop the hwmod data for PRUSS on AM33xx and AM437x
> >> SoCs, and for the IPU and DSP processors on OMAP4 SoC. Patches are based
> >> on 5.6-rc1. Please consider these for the 5.7 merge window.
> >>
> >> I will be submitting another series tomorrow to add the ti-sysc support
> >> for PRUSS. Nevertheless, the PRUSS hwmods will not be used going forward
> >> and can be dropped independently.
> >>
> >> The IPU and DSP hwmods were never added for OMAP5 and DRA7xx/AM57xx SoCs,
> >> and the MMU data was already dropped for 5.6-rc1, as it has all been
> >> converted to ti-sysc and omap-prm. The DT nodes for these will follow
> >> for the next merge window once the current OMAP remoteproc DT support
> >> is accepted [1].
> > 
> > Well we still need the hwmod data until dts data is in place to reset
> > and idle these modules. So I'll wait with this set until we have the
> > dts changes in place.
> 
> Not really, you cannot just idle these processors devices by themselves
> without the cores running. The hwmod code actually keeps these in the
> default reset asserted state itself, so no harm done in dropping the
> data. The remoteproc bindings are acked, so for next merge window, we
> can post the dts nodes once those get merged.

OK if they are in reset from the bootloader.. I'll try to check.

Regards,

Tony
