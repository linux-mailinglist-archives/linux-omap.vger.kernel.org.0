Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD0912EB3D
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 22:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgABVUF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 16:20:05 -0500
Received: from muru.com ([72.249.23.125]:50022 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbgABVUE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jan 2020 16:20:04 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7871F8087;
        Thu,  2 Jan 2020 21:20:44 +0000 (UTC)
Date:   Thu, 2 Jan 2020 13:20:00 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     =?utf-8?B?QW5kcsOp?= Hentschel <nerv@dawncrow.de>
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux@arm.linux.org.uk, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] ARM: dts: Move interconnect target module for
 omap3 sgx to separate dtsi files
Message-ID: <20200102212000.GG16702@atomide.com>
References: <20191230202037.28836-1-nerv@dawncrow.de>
 <20200102193359.GE16702@atomide.com>
 <9e39831c-bfa8-d497-7d3e-ff6ec04b8e52@dawncrow.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e39831c-bfa8-d497-7d3e-ff6ec04b8e52@dawncrow.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* André Hentschel <nerv@dawncrow.de> [200102 21:16]:
> Am 02.01.20 um 20:33 schrieb Tony Lindgren:
> > * André Hentschel <nerv@dawncrow.de> [191230 20:22]:
> >> Only dm3730 and am3715 come with SGX support
> > 
> > AFAIK dm3730 is just a marketing name for a catalog version of
> > omap3630. So using omap36xx.dtsi is correct and we should not
> > change that.
> > 
> > Can you please just add a minimal dm3725.dtsi that your board dts
> > can include and avoid disabling sgx in the board specific file?
> > That is assuming you have dm3725 with dsp and isp but no sgx.
> 
> I removed the sgx disable part already in 2/2.
> Consulting my table:
>      DM3730 | DM3725 | AM3715 | AM3703
> DSP    X    |   X    |        |    
> SGX    X    |        |   X    |    
> Where X is "supported"
> 
> So including omap63xx.dtsi seems right after this patch moves the
> sgx part to separate dtsi. Or do you want to have the sxg
> disabling in the dm3725.dtsi?

Yes please just add a minimal dm3725.dtsi including omap36xx.dtsi
and setting sgx to status = "disabled". And then you can include
dm3725.dtsi from your board specific dts file.

> > You can read the detected SoC with:
> > 
> > # cat /sys/bus/soc/devices/soc0/machine
> 
> # cat /sys/bus/soc/devices/soc0/machine
> DM3725
> # cat /sys/bus/soc/devices/soc0/revision 
> ES1.2

OK yeah makes sense for that product as potentially only the dsp
is used for audio.

Regards,

Tony
