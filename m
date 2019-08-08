Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61ACA85B81
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 09:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730887AbfHHHYh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 03:24:37 -0400
Received: from verein.lst.de ([213.95.11.211]:43954 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbfHHHYh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 8 Aug 2019 03:24:37 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5E94168CF0; Thu,  8 Aug 2019 09:24:32 +0200 (CEST)
Date:   Thu, 8 Aug 2019 09:24:31 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, Christoph Hellwig <hch@lst.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [Bug] v5.3-rc3: arm: omap5: omapdss: omap_fbdev_init fails
 with lpae config and reports dma_mask error
Message-ID: <20190808072431.GA29852@lst.de>
References: <14A6738F-75C6-4479-8B15-FD7395EFC55E@goldelico.com> <DF565339-14BC-411D-9301-5651FA601733@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF565339-14BC-411D-9301-5651FA601733@goldelico.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

please try the patch below:

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 561c4812545b..2c8abf07e617 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -232,6 +232,8 @@ void omap_fbdev_init(struct drm_device *dev)
 	if (!priv->num_pipes)
 		return;
 
+	dma_coerce_mask_and_coherent(dev->dev, DMA_BIT_MASK(32));
+
 	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
 	if (!fbdev)
 		goto fail;
