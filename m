Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B156D11CD76
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 13:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbfLLMvj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 07:51:39 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33142 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbfLLMvj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 07:51:39 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpa9G042250;
        Thu, 12 Dec 2019 06:51:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155096;
        bh=8er6wDFEBkNdl2kFjQ3P7eG95DjxtSEZX+pora7oUnY=;
        h=From:To:CC:Subject:Date;
        b=SYJ35BKhV0QYv4eZLaNbIoMNsmyh6utmPoq58F+5cC4HHZ06bbJ0t/mBDz4PDKMwT
         i8bX+iGwS8dGOAfKPmOyKmaILXc3Wi4EQg7+uf3fzRLAJkjiCwEzhHMW+JwwMY4Dix
         l2YXc/vdZuHwWeoyE2tIAnjZDFDSjwZQ1jH5Qaeg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCCpZBn054299
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 06:51:35 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 06:51:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 06:51:34 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpWNc045158;
        Thu, 12 Dec 2019 06:51:33 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <devicetree@vger.kernel.org>, <bcousson@baylibre.com>
Subject: [PATCH 0/6] ARM: omap4/5/dra7: convert iommu support to ti-sysc
Date:   Thu, 12 Dec 2019 14:51:17 +0200
Message-ID: <20191212125123.3465-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

This series converts the IOMMU support for omap4/5 and dra7 to ti-sysc.
Added patches to drop the legacy hwmod data for these also.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
