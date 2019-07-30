Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889BE7A128
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2019 08:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfG3GSE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jul 2019 02:18:04 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48677 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728360AbfG3GSE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 30 Jul 2019 02:18:04 -0400
Received: from [IPv6:2001:983:e9a7:1:3159:f139:4aff:7185] ([IPv6:2001:983:e9a7:1:3159:f139:4aff:7185])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sLSRhAD41qTdhsLSShkY5j; Tue, 30 Jul 2019 08:18:02 +0200
To:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] mach-omap2/devices.c: set dma mask
Message-ID: <7d079362-3881-6890-3e1f-71aeee06f4fc@xs4all.nl>
Date:   Tue, 30 Jul 2019 08:17:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBIbpGuU+C7ZtgIiYgnHJmSkOlZ+q4j6Cu+Iz918/q8XE32k/a12+tsx6+wMtPs54KgSLQ1rG7oBRqB569LEBho4DmH6bBlnbyvjRpjjMoFt6/E6wBa9
 n/a3rjSnNcgVoJqhl3WNHD6o9ReRNvLEXquOF2LiAeYFbzNCmEkkvfFunthj78uHAKSUCEbpMuFyp4F3KlL3l5/lmrPjv6OxBTjnATRSiNeIxSuwEhs1YX92
 CsSLksDBnHsVXGcb6ie0htVUEw99+PR1RWcByxqrALDMk/xts+QT9Q5kb3tJLVnM4xsDH9aljH0D7JP31HLiJPzX0odAxIxlfDMr/ZxwYxsMIcpjWqW0AHa3
 TmPh1L0V7knx/ML0FK2GCMb5E3hYlbzrRDKY3aDHpR5Q0VMEanw=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The dma_mask and coherent_dma_mask values were never set.

This prevented the media omap_vout driver from loading successfully.

Tested on a Pandaboard and Beagle XM board.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 arch/arm/mach-omap2/devices.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
index cc0d08dad141..5a2e198e7db1 100644
--- a/arch/arm/mach-omap2/devices.c
+++ b/arch/arm/mach-omap2/devices.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/of.h>
@@ -43,11 +44,17 @@ static struct resource omap_vout_resource[2] = {
 };
 #endif

+static u64 omap_vout_dma_mask = DMA_BIT_MASK(32);
+
 static struct platform_device omap_vout_device = {
 	.name		= "omap_vout",
 	.num_resources	= ARRAY_SIZE(omap_vout_resource),
 	.resource 	= &omap_vout_resource[0],
 	.id		= -1,
+	.dev		= {
+		.dma_mask		= &omap_vout_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
 };

 int __init omap_init_vout(void)
-- 
2.20.1

