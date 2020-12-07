Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB422D1A23
	for <lists+linux-omap@lfdr.de>; Mon,  7 Dec 2020 21:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgLGT7B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Dec 2020 14:59:01 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21121 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgLGT64 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Dec 2020 14:58:56 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607371084; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=LgsNeCqwxxbIQqP7GvNHjwUsrgz/w5K+sh/rweMJpEAbJQzIK7vWi3AaxRDq1Mol/9DXtFl3OvYrRxuucYeOdQFF3r89fyrgdNAx1mquuaO4NQVNwYHW1t634tiMVdnMo52OsxJkgc1781EvGsAWOB/yr920Ue05M0hQeVzh0uY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1607371084; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=FkQC27Bi22jnsG1zv+PB0tMIorvScfPBsclnHU3AbbE=; 
        b=DRspHVysayJYoLmz3GcpXPWpoeJmr0t2+ODTL777W7qCuuQGygU0DQjSVa7kvHPKbWDqLpDucU3R0vTEb3gghqnm9DCOUMRQ0M08pitV3b524gEd1X1OvmQngiL1Enzr+JVxFBv8xRlM2VwE46yEDmi36XxsIJNNHD/sR6hMCSw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-212-9.hsi15.unitymediagroup.de [95.222.212.9]) by mx.zoho.eu
        with SMTPS id 1607371082488411.03986662606906; Mon, 7 Dec 2020 20:58:02 +0100 (CET)
Date:   Mon, 7 Dec 2020 20:58:01 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     tony@atomide.com
Cc:     Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org
Subject: ARM: omap2: pmic-cpcap: fix maximum voltage to be consistent with
 defaults on xt875
Message-Id: <20201207205801.7c830144e5d4212c7aadb615@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

xt875 comes up with a iva voltage of 1375000 and android runs at this too. fix 
maximum voltage to be consistent with this.

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 arch/arm/mach-omap2/pmic-cpcap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
index eab281a5fc9f..09076ad0576d 100644
--- a/arch/arm/mach-omap2/pmic-cpcap.c
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -71,7 +71,7 @@ static struct omap_voltdm_pmic omap_cpcap_iva = {
 	.vp_vstepmin = OMAP4_VP_VSTEPMIN_VSTEPMIN,
 	.vp_vstepmax = OMAP4_VP_VSTEPMAX_VSTEPMAX,
 	.vddmin = 900000,
-	.vddmax = 1350000,
+	.vddmax = 1375000,
 	.vp_timeout_us = OMAP4_VP_VLIMITTO_TIMEOUT_US,
 	.i2c_slave_addr = 0x44,
 	.volt_reg_addr = 0x0,
-- 
2.29.1
