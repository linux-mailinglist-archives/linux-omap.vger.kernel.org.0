Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7C21BE0EA
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgD2OaP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:30:15 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53896 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgD2OaP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:30:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEU8h7098671;
        Wed, 29 Apr 2020 09:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588170608;
        bh=JwlsaJWuzGCyraQxOVq9vKJeCHiryLyE+lp1nBBs1EM=;
        h=From:To:CC:Subject:Date;
        b=LmE0x1yO/su7aFnXF9e4BrYy/MeGveo+LCzDo04CYpbYsj5RSsnSMaSkDRf+nLjVh
         MAA1e3w4V3McFDkKjexJDOTW7nhQGygylJ0eUTjrDMjVWWTf/U8v0/BDqYkOzxbKYD
         U6r/VmGhxl9E5bwIl9iYY6+RkEIrKXck1khFDdzY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TEU7hP125135
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 09:30:08 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:30:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:30:07 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEU54k010784;
        Wed, 29 Apr 2020 09:30:06 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/8] ARM: omap4/5: crypto support fixes
Date:   Wed, 29 Apr 2020 17:29:54 +0300
Message-ID: <20200429143002.5050-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series fixes a couple of crypto data bugs for omap4/5. It also adds
support for crypto accelerators for omap5; the data for these is just
basically copied over from omap4.

OMAP5 currently appears to be running out of available DMA channels,
SPI/MMC are allocating a huge number of channels permanently in boot and
there are only 32 of them available in total. To mitigate the issue
partly, I have left the DES node disabled by default to save two
channels, if someone needs DES support, it can be easily enabled.
However, it might be useful to actually disable some of the SPI/MMC
nodes to save on the number of channels and to avoid running into any
problems.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
