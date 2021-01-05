Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B283C2EB2D4
	for <lists+linux-omap@lfdr.de>; Tue,  5 Jan 2021 19:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbhAESxY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Jan 2021 13:53:24 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21187 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbhAESxY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Jan 2021 13:53:24 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609872754; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=BmQh4zIWf58abgP8G2Opx+meqR5RnRLAbvZenVICo3thPZn4B+2CJDS8HHJ4kKKXq7chVv9mW6dEuviVCyH3ZqeqqCOTSNLq+WPFlcRLwYlKa8s4siqwiZae+5CctTi2pHJEPHFQXP34I5fFoMppQRDdnF4dxY5LJTrrRB2sYfA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1609872754; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=4uZiW8CBXQRju6Mz5El7gEMhzuoyPhQBIMc898QwS4k=; 
        b=QhXPTMAlp8EGpq1iDi0jsAKuiiYAQlp4NBLxw0ca/LcJyc6dAvU+LUaap94TTXbShzsNjSVPGFiWKljw/X0eyQOFcuIbTNT7AFwqfwP+2XxbEas+n3lHA0yqRXQYBgvID/Ja97wtYn30NjqOsqBdXz6RlgIEB6WJAw7enkFvmxA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-212-26.hsi15.unitymediagroup.de [95.222.212.26]) by mx.zoho.eu
        with SMTPS id 1609872752130950.8638236419295; Tue, 5 Jan 2021 19:52:32 +0100 (CET)
Date:   Tue, 5 Jan 2021 19:52:31 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     sre@kernel.org
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
Subject: [PATCH v4 1/1] power: supply: cpcap-charger: Add usleep to cpcap
 charger to avoid usb plug bounce
Message-Id: <20210105195231.e045af1ab1c91de9c726e045@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Adds 80000 us sleep when the usb cable is plugged in to hopfully avoid bounceing
contacts.

Upon pluging in the usb cable vbus will bounce for some time, causing cpcap to
dissconnect charging due to detecting an undervoltage condition. This is a
scope of vbus on xt894 while quickly inserting the usb cable with firm force,
probed at the far side of the usb soccet and vbus loaded with approx 1k:
http://uvos.xyz/maserati/usbplug.jpg.

As can clearly be seen, vbus is all over the place for the first 15 ms or so 
with a small blip at ~40 ms this causes the cpcap to trip up and disable 
charging again.

The delay helps cpcap_usb_detect avoid the worst of this. It is, however, still
not ideal as strong vibrations can cause the issue to reapear at any time during
charging. I have however not been able to cause the device to stop charging due
to this in practice as it is hard to vibrate the device sutch that the vbus pins
start bouncing again but cpcap_usb_detect is not called again due to a detected
dissconnect/reconnect event.

Changes in v4:
Increase timeout after some experiamentation suggested its not sufficant on all 
devices.

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 drivers/power/supply/cpcap-charger.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index c0d452e3dc8b..e6b230dd6de4 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -613,6 +613,9 @@ static void cpcap_usb_detect(struct work_struct *work)
        if (error)
                return;
 
+    /* Delay for 80ms to avoid vbus bouncing when usb cable is plugged in */
+       usleep_range(80000, 120000);
+
        /* Just init the state if a charger is connected with no chrg_det set */
        if (!s.chrg_det && s.chrgcurr1 && s.vbusvld) {
                cpcap_charger_update_state(ddata, CPCAP_CHARGER_DETECTING);
-- 
2.29.2
