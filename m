Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257F72E79C2
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 14:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgL3Npg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 08:45:36 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21116 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgL3Npg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Dec 2020 08:45:36 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609335884; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=N2oi7MrLausGS+apv+LM780CZx2fFRLGb5IJ40V/TY0+29r3pTIMjQXuyodgFLzL8ryQ7BiOhcf9HPuEugTUPDWRRf7KGwnxcVuRig8r2mg2lLY44cQ2FNAB6QzFrl83J1pO79RMUDiFQZxJvGkmsfkxN4Cr93hholcjeujnUDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1609335884; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=q7ygfYaP19npClWHELtDNpW8ear7wLZy8KiTxN2l8Ns=; 
        b=bW5iYhwavNLXqX/J5AgjHuWNsrMzjRY2bqrgWVkdva/CUpvN77EIdyCAUv8CVjy8Bn0le/jz04i2gPMmAVza5y4phjQ1WyKchuANpcTmRxrb6c8BA+CCi1EVi9Zc+6HsJvxUqGw9kUs3Ks52ju2lBL+vYk4SZSQUWe534A6wuN0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-179.hsi15.unitymediagroup.de [95.222.213.179]) by mx.zoho.eu
        with SMTPS id 1609335881550458.77128569119225; Wed, 30 Dec 2020 14:44:41 +0100 (CET)
Date:   Wed, 30 Dec 2020 14:44:40 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     tony@atomide.com, sre@kernel.org
Cc:     linux-omap@vger.kernel.org
Subject: [PATCH 1/1] power: supply: cpcap-charger: Add usleep to cpcap
 charger to avoid usb plug bounce
Message-Id: <20201230144440.d92028b58527b5011525cca3@uvos.xyz>
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
 drivers/power/supply/cpcap-charger.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index be7d1da7a5a5..2ff5fd1a9e9e 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -708,6 +708,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 		ichrg = cpcap_charger_current_to_regval(max_current);
 		vchrg = cpcap_charger_voltage_to_regval(ddata->voltage);
+		usleep_range(40000, 60000);
 		error = cpcap_charger_enable(ddata,
 					     CPCAP_REG_CRM_VCHRG(vchrg),
 					     ichrg, 0);
-- 
2.29.2

