Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7F121707A6
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 19:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgBZS0G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 13:26:06 -0500
Received: from muru.com ([72.249.23.125]:57814 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726789AbgBZS0G (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 13:26:06 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3BDC08022;
        Wed, 26 Feb 2020 18:26:51 +0000 (UTC)
Date:   Wed, 26 Feb 2020 10:26:03 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Drop PRUSS and OMAP4 IPU/DSP hwmod data
Message-ID: <20200226182603.GT37466@atomide.com>
References: <20200224232152.25562-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224232152.25562-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200224 15:22]:
> Hi Tony,
> 
> The following patches drop the hwmod data for PRUSS on AM33xx and AM437x
> SoCs, and for the IPU and DSP processors on OMAP4 SoC. Patches are based
> on 5.6-rc1. Please consider these for the 5.7 merge window.
> 
> I will be submitting another series tomorrow to add the ti-sysc support
> for PRUSS. Nevertheless, the PRUSS hwmods will not be used going forward
> and can be dropped independently.
> 
> The IPU and DSP hwmods were never added for OMAP5 and DRA7xx/AM57xx SoCs,
> and the MMU data was already dropped for 5.6-rc1, as it has all been
> converted to ti-sysc and omap-prm. The DT nodes for these will follow
> for the next merge window once the current OMAP remoteproc DT support
> is accepted [1].

Well we still need the hwmod data until dts data is in place to reset
and idle these modules. So I'll wait with this set until we have the
dts changes in place.

Regards,

Tony
