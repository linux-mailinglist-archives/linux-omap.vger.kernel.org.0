Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3735F564CC
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 10:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbfFZIpS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Jun 2019 04:45:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50632 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFZIpS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Jun 2019 04:45:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5Q8i5Ep068189;
        Wed, 26 Jun 2019 03:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561538645;
        bh=LtR8YqPAxJoiiaQr+rKC4/jbAgDp9J8cOhOylP72rFk=;
        h=To:CC:From:Subject:Date;
        b=uCmi320peXxY+9VVMxlqGczAuesFTOnvNiO719Tx3/VfLpv8kLRtAVEsLt4v9TA7u
         5S+K5IDrMWs93S4SgZ9ClOyFe6U6KQdl8IHCb3oj1q3y7mPbMhe7PSkHAchIXdmQDp
         J4CK53JrZx6ou4nwx9Ry5ka0o64SD8lcxWmsRaA0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5Q8i5lN006920
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Jun 2019 03:44:05 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 03:44:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 03:44:03 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5Q8hxVh129407;
        Wed, 26 Jun 2019 03:44:00 -0500
To:     <hch@lst.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>
CC:     <axboe@kernel.dk>, <iommu@lists.linux-foundation.org>,
        <linux-ide@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
        <rmk+kernel@arm.linux.org.uk>, "Nori, Sekhar" <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>
From:   Roger Quadros <rogerq@ti.com>
Subject: SATA broken with LPAE
Message-ID: <16f065ef-f4ac-46b4-de2a-6b5420ae873a@ti.com>
Date:   Wed, 26 Jun 2019 11:43:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Christoph / Hans,

SATA has been broken on TI platforms with LPAE, on systems with RAM addresses > 32-bits,
(e.g. DRA7 rev.H+) since v4.18.

The commit at which it breaks is
21e07dba9fb1179148089d611fc9e6e70d1887c3 ("scsi: reduce use of block bounce buffers").

The effect is that the SATA controller starts to see DMA addresses
above 32-bit which it does not support.

Could you please shed some light on how it is supposed to work if
we don't call blk_queue_bounce_limit() for devices that can do only 32-bit DMA
on a system that has addressable RAM above 32-bit Physical?

The below patch fixes it. Is this the right thing to do?

diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index 3aab2e3d57f3..b925dc54cfa5 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -62,6 +62,9 @@ static int ahci_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(dev->of_node, "hisilicon,hisi-ahci"))
 		hpriv->flags |= AHCI_HFLAG_NO_FBS | AHCI_HFLAG_NO_NCQ;
 
+	if (of_device_is_compatible(dev->of_node, "snps,dwc-ahci"))
+		hpriv->flags |= AHCI_HFLAG_32BIT_ONLY;
+
 	port = acpi_device_get_match_data(dev);
 	if (!port)
 		port = &ahci_port_info;
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 65d0a10c76ad..9083c7b89dfc 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1750,6 +1750,21 @@ static int scsi_map_queues(struct blk_mq_tag_set *set)
 	return blk_mq_map_queues(&set->map[HCTX_TYPE_DEFAULT]);
 }
 
+static u64 scsi_calculate_bounce_limit(struct Scsi_Host *shost)
+{
+	struct device *dma_dev = shost->dma_dev;
+	u64 bounce_limit = 0xffffffff;
+
+	if (shost->unchecked_isa_dma)
+		return BLK_BOUNCE_ISA;
+
+	if (dma_dev && dma_dev->dma_mask)
+		bounce_limit = (u64)dma_max_pfn(dma_dev) << PAGE_SHIFT;
+
+	return bounce_limit;
+}
+
 void __scsi_init_queue(struct Scsi_Host *shost, struct request_queue *q)
 {
 	struct device *dev = shost->dma_dev;
@@ -1769,8 +1784,7 @@ void __scsi_init_queue(struct Scsi_Host *shost, struct request_queue *q)
 	}
 
 	blk_queue_max_hw_sectors(q, shost->max_sectors);
-	if (shost->unchecked_isa_dma)
-		blk_queue_bounce_limit(q, BLK_BOUNCE_ISA);
+	blk_queue_bounce_limit(q, scsi_calculate_bounce_limit(shost));
 	blk_queue_segment_boundary(q, shost->dma_boundary);
 	dma_set_seg_boundary(dev, shost->dma_boundary);

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
