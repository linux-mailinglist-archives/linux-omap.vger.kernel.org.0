Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8692A29B9
	for <lists+linux-omap@lfdr.de>; Mon,  2 Nov 2020 12:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgKBLqB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Nov 2020 06:46:01 -0500
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21371 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728632AbgKBLpp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Nov 2020 06:45:45 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1604317533; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=exhD318J3G0GIN0gZPsGvNwQejQo+3urCYDqeove6raMxtHYtEePrTUBmFuEOZawdFbHXn77AYIq2V3sq5EVX5Vw9RVhugGBU+Af07GRVnKMiEkz6MwPxfETsRgXpKSPm1Qg17W71bUXgN3IuEzXIwGOpRyb/01SNQUbPRKc8T8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1604317533; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=DDFUcxztyR7l3DRaIN5JA5fhpSA9UgUN5HXVmqSt3Vg=; 
        b=CqFLAVQHI/i4iH7d7suL/E5HAbpLhaX2qEHLWg2/LDyLxzMH0s6kRt9bpibR3jiGykTzeve1aMZVaR+kDAGdW4n8dtvI+8MPal62hKL1SAzDV81jXInw6AT0bXWV8TFwrTWhS2qcjsr+R9Nzc2gqNqOmoA2RP4l7IeievAPgVXw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-220.hsi15.unitymediagroup.de [95.222.213.220]) by mx.zoho.eu
        with SMTPS id 1604317529089394.12772114993777; Mon, 2 Nov 2020 12:45:29 +0100 (CET)
Date:   Mon, 2 Nov 2020 12:45:28 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: [PATCH] ARM: omap2plus_defconfig: add CONFIG_AK8975=m and
 CONFIG_KXCJK1013=m to support motorola xt894's magnetometer and motorola
 xt875's accelerometer respectivly
Message-Id: <20201102124528.646c270fac2aa83c8fcde73d@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Adds CONFIG_AK8975=m and CONFIG_KXCJK1013=m to omap2plus_defconfig to
support motorola xt894's magnetometer and motorola xt875's
accelerometer respectivly

Signed-off-by: Carl Philipp Klemm <carl@uvos.xyz>

---

diff --git a/arch/arm/configs/omap2plus_defconfig
b/arch/arm/configs/omap2plus_defconfig index 1d3106dc0e23..8158aeb53c89
100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -525,6 +525,8 @@ CONFIG_INA2XX_ADC=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_SENSORS_ISL29028=m
 CONFIG_BMP280=m
+CONFIG_KXCJK1013=m
+CONFIG_AK8975=m
 CONFIG_PWM=y
 CONFIG_PWM_OMAP_DMTIMER=m
 CONFIG_PWM_TIECAP=m


-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
