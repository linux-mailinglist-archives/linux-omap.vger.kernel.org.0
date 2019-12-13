Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74C1A11E68C
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 16:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbfLMP3l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 10:29:41 -0500
Received: from muru.com ([72.249.23.125]:47128 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbfLMP3l (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Dec 2019 10:29:41 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 369A88181;
        Fri, 13 Dec 2019 15:30:20 +0000 (UTC)
Date:   Fri, 13 Dec 2019 07:29:38 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Benoit Parrot <bparrot@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 0/3] ARM: dts: am43x-vpfe/ov2659.patch
Message-ID: <20191213152938.GK35479@atomide.com>
References: <20191211140720.10539-1-bparrot@ti.com>
 <20191212174123.GF35479@atomide.com>
 <c4ae58dc-3c81-f493-a665-6926baa0f04c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4ae58dc-3c81-f493-a665-6926baa0f04c@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191213 07:43]:
> On 12/12/2019 19:41, Tony Lindgren wrote:
> > * Benoit Parrot <bparrot@ti.com> [191211 06:04]:
> > > This patch series adds the missing camera endpoint (ov2659) as well as
> > > the required source clocks nodes for the sensor.
> > > 
> > > On the am437x-sk-evm the camera sensor is sourced from clkout1 but that
> > > clock nodes/tree was removed as it was unsed at the time, we are
> > > re-adding the needed clock nodes here.
> > 
> > Tero, it seems I can already pick this series?
> 
> I believe it is ready if you approve the clkout1 clock patch.

OK yeah looks fine.

> > Or ou want to queue the changes to am43xx-clocks.dtsi along with all
> > your other clock patches?
> 
> Well, I have actually never queued any omap2+ dts patches myself, and I
> don't think there would be too many of those coming for next merge either.

OK will queue this series then. For the other ones from Benoit
looks like we need an immutable clock branch before I can apply
anything.

Regards,

Tony
