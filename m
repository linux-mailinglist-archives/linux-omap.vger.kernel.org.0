Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2EE2170BAC
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 23:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgBZWjY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 17:39:24 -0500
Received: from muru.com ([72.249.23.125]:57922 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727761AbgBZWjY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 17:39:24 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1CD8A8022;
        Wed, 26 Feb 2020 22:40:09 +0000 (UTC)
Date:   Wed, 26 Feb 2020 14:39:21 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 06/12] ARM: dts: am335x-bone-common: Enable PRU-ICSS
 interconnect node
Message-ID: <20200226223921.GB37466@atomide.com>
References: <20200225204649.28220-1-s-anna@ti.com>
 <20200225204649.28220-7-s-anna@ti.com>
 <20200226182924.GU37466@atomide.com>
 <af3965db-54b2-3e4f-414f-d27ca4b5ced1@ti.com>
 <20200226223745.GA37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226223745.GA37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200226 22:38]:
> * Suman Anna <s-anna@ti.com> [200226 20:35]:
> > On 2/26/20 12:29 PM, Tony Lindgren wrote:
> > > * Suman Anna <s-anna@ti.com> [200225 20:47]:
> > >> The PRU-ICSS target module node was left in disabled state in the base
> > >> am33xx-l4.dtsi file. Enable this node on all the AM335x beaglebone
> > >> boards as they mostly use a AM3358 or a AM3359 SoC which do contain
> > >> the PRU-ICSS IP.
> > > 
> > > Just get rid of the top level status = "disabled". The default
> > > is enabled, and the device is there for sure inside the SoC.
> > > And then there's no need for pointless status = "okay" tinkering
> > > in the board specific dts files so no need for this patch.
> > 
> > The IP is not available on all SoCs, and there are about 40 different
> > board files atm across AM33xx and AM437x, and am not sure what SoCs they
> > are actually using.
> 
> Oh that issue again.. Maybe take a look at patch "[PATCH 2/3] bus: ti-sysc:
> Detect display subsystem related devices" if you can add runtime
> detection for the accelerators there similar to what I hadded for omap3.
> acclerators.

Sorry I meant instead patch "[PATCH 6/7] bus: ti-sysc: Implement SoC
revision handling".

Regards,

Tony
