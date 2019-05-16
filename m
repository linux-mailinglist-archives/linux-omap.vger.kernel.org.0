Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 275E620CA7
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 18:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfEPQNA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 12:13:00 -0400
Received: from muru.com ([72.249.23.125]:49652 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbfEPQNA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 May 2019 12:13:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A3C68804F;
        Thu, 16 May 2019 16:13:18 +0000 (UTC)
Date:   Thu, 16 May 2019 09:12:56 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: Re: [PATCH 2/2] arm: dts: dra76-evm: Disable rtc target module
Message-ID: <20190516161256.GB5447@atomide.com>
References: <20190516090657.25211-1-j-keerthy@ti.com>
 <20190516090657.25211-2-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516090657.25211-2-j-keerthy@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Keerthy <j-keerthy@ti.com> [190516 09:06]:
> rtc is fused out on dra76 and accessing target module
> register is causing a boot crash hence disable it.

So for a fix, can we have a separate dra7 something dtsi file
to disable these instead?

Or are there already multiple SoC revisions for the same EVM?

Then in the long run, if there are the same EVMs with multiple
SoC options, the best thing to do is to would be to detect the
SoC type and update the property dynamically to set the features
not available on the booted SoC to status = "disabled". Seems
like that could be done in the ti-sysc driver probe unless needed
earlier.

Regards,

Tony
