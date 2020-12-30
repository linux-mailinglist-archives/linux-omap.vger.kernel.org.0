Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BF92E79E2
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 15:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgL3ODI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 09:03:08 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21163 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbgL3ODI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Dec 2020 09:03:08 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609336940; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=OgczmwYz5+sFODZ8uYN5kgltBruYmY++4VFRqWnnre6RdS1fWiOuB/CqttB8rZIGTDhBcK3PsFkkoWJdpsJaC/acOrv3iewGuW16K3S6/OaSgIa/7fZ9SM6dr9gZOM9FYG/d4uy3DgB7se4cRFPoAdXbDxeTBrojqXbj8gX2UmA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1609336940; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=+ydaJTyg6DHxZQ2Lq3t4BZtfVtdYPAZqmqx44PFdmp8=; 
        b=Vxhx3yLdZ4JqLZuCQuC1KqcYbf73wzWjNPr+67E6f+V2bc5VgMTArUAQ+XCFpimBqaAT39o02Dly/fWsoFSFoAXGSKU7p7WYtf49a+xsEtPTy2/XmX/etIlKDtXxykoPMiD+7WIlyZb15UbjZ/VzH0KoigmkErCJItWHKqISFgg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-179.hsi15.unitymediagroup.de [95.222.213.179]) by mx.zoho.eu
        with SMTPS id 1609336939080877.8956579314939; Wed, 30 Dec 2020 15:02:19 +0100 (CET)
Date:   Wed, 30 Dec 2020 15:02:18 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     tony@atomide.com, sre@kernel.org
Cc:     linux-omap@vger.kernel.org
Subject: [PATCH v2 1/1] power: supply: cpcap-charger: Add usleep to cpcap
 charger to avoid usb plug bounce
Message-Id: <20201230150218.d5ae76983e6dde68dcebff09@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Adds 40000 ms sleep before cpcap_charger_enable to hopfully avoid the bounce on 
plug in

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 drivers/power/supply/cpcap-charger.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index c0d452e3dc8b..130c61a9f267 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -631,6 +631,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 		return;
 	}
 
+	usleep_range(40000, 60000);
+
 	/* Throttle chrgcurr2 interrupt for charger done and retry */
 	switch (ddata->state) {
 	case CPCAP_CHARGER_CHARGING:
-- 
2.29.2
