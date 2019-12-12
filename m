Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7E0A11D425
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbfLLRfs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:35:48 -0500
Received: from muru.com ([72.249.23.125]:46558 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730101AbfLLRfs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:35:48 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 71D7080C0;
        Thu, 12 Dec 2019 17:36:27 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:35:45 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Jyri Sarha <jsarha@ti.com>, bcousson@baylibre.com,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        peter.ujfalusi@ti.com, bparrot@ti.com
Subject: Re: [PATCH] ARM: dts: am335x-icev2: Add support for OSD9616P0899-10
 at i2c0
Message-ID: <20191212173545.GE35479@atomide.com>
References: <20191204144024.16021-1-jsarha@ti.com>
 <edde771f-8780-e342-3e1b-e30eefac5e4f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edde771f-8780-e342-3e1b-e30eefac5e4f@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191204 20:10]:
> On 04/12/2019 16:40, Jyri Sarha wrote:
> > Add support for OSD9616P0899-10 96x16 passive matrix display. The
> > pre-charge period parameters are taken form a OSD9616P0899-10
> > document, but the display works fine with the default values too.
> > 
> > Signed-off-by: Jyri Sarha <jsarha@ti.com>
...

> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Thanks applying into omap-for-v5.6/dt.

Tony
