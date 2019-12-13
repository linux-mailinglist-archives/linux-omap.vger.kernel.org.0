Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D68B111E5FA
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 15:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfLMO7a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 09:59:30 -0500
Received: from muru.com ([72.249.23.125]:47074 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727329AbfLMO7a (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Dec 2019 09:59:30 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 759138161;
        Fri, 13 Dec 2019 15:00:08 +0000 (UTC)
Date:   Fri, 13 Dec 2019 06:59:26 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Andrew F. Davis" <afd@ti.com>,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Jyri Sarha <jsarha@ti.com>, Roger Quadros <rogerq@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH 12/16] ARM: OMAP2+: Drop legacy platform data for am3 and
 am4 rtc
Message-ID: <20191213145926.GI35479@atomide.com>
References: <20191211172014.35201-1-tony@atomide.com>
 <20191211172014.35201-13-tony@atomide.com>
 <422c4d8d-27e3-7055-e8a4-c830a7e569be@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <422c4d8d-27e3-7055-e8a4-c830a7e569be@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Keerthy <j-keerthy@ti.com> [191213 05:28]:
> On 11/12/19 10:50 pm, Tony Lindgren wrote:
> > We can now probe devices with ti-sysc interconnect driver and dts
> > data. Let's drop the related platform data and custom ti,hwmods
> > dts property.
> > 
> > As we're just dropping data, and the early platform data init
> > is based on the custom ti,hwmods property, we want to drop both
> > the platform data and ti,hwmods property in a single patch.
> > 
> > Note that we also must tag rtc as disabled on am43x-epos-evm as
> > it's not accessible according to commit 4321dc8dff35 ("ARM: AM43XX:
> > hwmod: Add rtc hwmod").
> 
> Both AM3 & AM4 are crashing while probing rtc. Due to rtc-clkctrl enable
> failure. So this breaks AM4/3.

Oh thanks for letting me know. I'll take a look.

Regards,

Tony


