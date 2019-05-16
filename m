Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E451820D8C
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 18:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfEPQ62 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 12:58:28 -0400
Received: from muru.com ([72.249.23.125]:49676 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbfEPQ62 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 May 2019 12:58:28 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BC5C5804F;
        Thu, 16 May 2019 16:58:46 +0000 (UTC)
Date:   Thu, 16 May 2019 09:58:24 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     keerthy <j-keerthy@ti.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: Re: [PATCH 2/2] arm: dts: dra76-evm: Disable rtc target module
Message-ID: <20190516165824.GD5447@atomide.com>
References: <20190516090657.25211-1-j-keerthy@ti.com>
 <20190516090657.25211-2-j-keerthy@ti.com>
 <20190516161256.GB5447@atomide.com>
 <f3c2a6cd-b478-cec4-cde6-3eb5b6a11392@ti.com>
 <20190516164729.GC5447@atomide.com>
 <f2470149-0a17-cd1a-30d3-288fe2b821e3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2470149-0a17-cd1a-30d3-288fe2b821e3@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* keerthy <j-keerthy@ti.com> [190516 16:54]:
> On 5/16/2019 10:17 PM, Tony Lindgren wrote:
> > But then any new board with dra76 or dra71 will need to debug
> > the same issue again. Sure we can get away for now tweaking the
> > board file, but to me it sounds like it's going to be more
> > devices that will be affected too?
> 
> Okay. This is a SoC related issue so yes any new board will have to again
> implement disabling.

OK

> > Is there some feature matrix available somewhere online?
> 
> Not that i know of. I will try finding something.

OK thanks.

> > How about add minimal dra76 and dra71 dtsi files in addition to
> > the board specific fix(es)? Then for v5.3, we can deal adding more
> > dra7 specifc evm files using these dtsi files or dynamically start
> > disabling modules.
> 
> You mean having a dra76/dra71.dtsi with rtc/usb4_tm disabled and that gets
> included in dra76/dra71-evm.dts?

Yeah, add dra76.dtsi and dra71.dtsi, then include those.

If however you have the same evm dts file with multiple SoC variants
available, then for now you need to also disable devices in the
evm dts. Or add another evm dts file.

Regards,

Tony
