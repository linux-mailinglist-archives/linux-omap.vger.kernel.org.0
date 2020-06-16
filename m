Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0871FBA52
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 18:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732158AbgFPQKc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 12:10:32 -0400
Received: from muru.com ([72.249.23.125]:58024 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730973AbgFPQK3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Jun 2020 12:10:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 53BD08123;
        Tue, 16 Jun 2020 16:11:20 +0000 (UTC)
Date:   Tue, 16 Jun 2020 09:10:24 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: am335x-pocketbeagle: Fix mmc0 Write Protect
Message-ID: <20200616161024.GC37466@atomide.com>
References: <20200609214521.GB2995279@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609214521.GB2995279@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200609 14:46]:
> AM3358 pin mcasp0_aclkr (ZCZ ball B13) [0] is routed to P1.31 header [1]
> Mode 4 of this pin is mmc0_sdwp (SD Write Protect).  A signal connected
> to P1.31 may accidentally trigger mmc0 write protection.  To avoid this
> situation, do not put mcasp0_aclkr in mode 4 (mmc0_sdwp) by default.
> 
> [0] http://www.ti.com/lit/ds/symlink/am3358.pdf
> [1] https://github.com/beagleboard/pocketbeagle/wiki/System-Reference-Manual#531_Expansion_Headers
> 
> Fixes: 047905376a16 (ARM: dts: Add am335x-pocketbeagle)
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> V2 change:
> - correct P1.13 to P1.31, apologies for not catching that in V1

Thanks (manually) applying into fixes. Your outgoing mail server has replaced
the tabs in the patch with spaces making it not apply FYI.

Regards,

Tony
