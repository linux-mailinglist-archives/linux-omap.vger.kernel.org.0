Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6A012E671
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 14:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgABNS4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 08:18:56 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59424 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728165AbgABNS4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 08:18:56 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002DIsE8035027;
        Thu, 2 Jan 2020 07:18:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577971134;
        bh=J7KOfR4C/J8jTphSanRnb8gsLWtOAV6MaL5byMn8870=;
        h=From:To:CC:Subject:Date;
        b=SN/J6557b2yNBNWRX2ub0aj3chRDymMceJKpQJLk5dVj/m5j9f7KY4F0XxOX2srEy
         e+yWMckcpAncOjEqAPKRE314vqW5PSLKLhOQj6xHsJrj3ru+1i3qifN5GXpKYfGfOw
         kYoLlkklSsVWOVAQAD5QJoctqK5FYX+U1H/BayJc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002DIsK4073030;
        Thu, 2 Jan 2020 07:18:54 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Jan
 2020 07:18:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Jan 2020 07:18:53 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002DIp3R075354;
        Thu, 2 Jan 2020 07:18:51 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, <s-anna@ti.com>
Subject: [PATCHv4 00/14] remoteproc: updates for omap remoteproc support
Date:   Thu, 2 Jan 2020 15:18:31 +0200
Message-ID: <20200102131845.12992-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This version addresses any review comments received for v3. Detailed
change logs are added to individual patches, but the main changes are:

- moved a few config options to DT
- PM runtime sequencing cleanup up
- device memory data moved under single structure for clarity
- some error handling fixes / hardening

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
