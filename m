Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68F3711D41A
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730119AbfLLRed (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:34:33 -0500
Received: from muru.com ([72.249.23.125]:46548 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730116AbfLLRed (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:34:33 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0666280C0;
        Thu, 12 Dec 2019 17:35:11 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:34:30 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
        bcousson@baylibre.com, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, tomi.valkeinen@ti.com,
        laurent.pinchart@ideasonboard.com, bparrot@ti.com
Subject: Re: [PATCH] ARM: dts: am335x-evmsk: Use drm simple-panel instead of
 tilcdc-panel
Message-ID: <20191212173430.GD35479@atomide.com>
References: <20191204105554.14212-1-jsarha@ti.com>
 <1aa8c476-031a-e156-7648-c9740a98e3ee@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1aa8c476-031a-e156-7648-c9740a98e3ee@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [191204 11:26]:
> 
> 
> On 04/12/2019 12.55, Jyri Sarha wrote:
> > Move to use the new drm panel support in tilcdc together with added
> > "newhaven,nhd-4.3-480272ef-atxl"-panel support in drm panel-simple.
> 
> Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Thanks applying into omap-for-v5.6/dt.

Tony
