Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 185C1F4E52
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 15:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfKHOko (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 09:40:44 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:42137 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727291AbfKHOko (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Nov 2019 09:40:44 -0500
Received: by mail-yb1-f193.google.com with SMTP id a11so2545957ybc.9
        for <linux-omap@vger.kernel.org>; Fri, 08 Nov 2019 06:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFlQKFEFZSYUijpfc0+kdQC29O+8cCkPVm+mWRYeBLI=;
        b=aHxEii7Q218dMr5rQhWYQ+s5yGAqzYWDYAVaNqadtwE1E09d4DrU/IijcPewg1jKZ2
         gcTarAxTGNaGDuLf8PZ1RVEAoKcd4OHH70lxF33/mH6TZi68JwquvbGNEYDNG8jDz9mB
         de8cj489kitVdAj3MZ64YH2vZEguAP8AAEFDzSGpVPTHpeHCUAw7ZioOjMCCXOeYKDMI
         OzL7JcYLOgQm4Jgn1QWEb5MiTdJ379lbflHEeJTij0CykZIHJg0eoonGRZmQg7mIJgbv
         25gbLCtGR9rXbTxTwYrgy/UePNdDpXlrVkppO6NgK/r0sTCr4ifJeM/ftwfnu5mKjaYT
         l45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFlQKFEFZSYUijpfc0+kdQC29O+8cCkPVm+mWRYeBLI=;
        b=l2EXXXp8ChExGOefvzXntLAI/Rdkn/XbW7b0MSKkijvtmgFQfRDdpnI1wpHXbrrIVR
         8jqipBHwF2OmkhFjSNOf9b9E2pMhIZl+LcABesoETKRn7vsFL1bZh8jZ5RqGi1S1jIPR
         foKkAZFQvM7PXLHcibeBN7SRWWHk9BYzCNLDXNVuRDrFFTAJM1dpLTejSKPhq4z/pvDj
         G1j9BEUBQnAiSeCwEYJYXuGDHKJ83xDzh5UPw0RBS1F8gD3EuQbg9Y0HrIqKvTmk1VmZ
         cJZEUQfHqawt895Znr9DbnHgCfkQOpz6WeD5SyrJFp1CzqbOL9Ndp4hefgV9SUxJSlNC
         8RTw==
X-Gm-Message-State: APjAAAV7Fak50LjRan7we/T87/4wEecWY4jJbuSbYScA2+Q8kpxFu13h
        qBudqoPF0j9rsWjVdLtjCdEN/rfneVc=
X-Google-Smtp-Source: APXvYqyxM4oNGlYRPg73Kikq15cDFU2tHxFOYWC9v8A+2/8u+K8xpdi9d6a5a6cvErlUFikdKHwPXA==
X-Received: by 2002:a25:19c5:: with SMTP id 188mr9738259ybz.253.1573224042932;
        Fri, 08 Nov 2019 06:40:42 -0800 (PST)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id r204sm2106776ywb.79.2019.11.08.06.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 06:40:42 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-torpedo: Disable USB Host
Date:   Fri,  8 Nov 2019 08:40:25 -0600
Message-Id: <20191108144025.25168-1-aford173@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

While the OMAP3 family has a USB Host controller, the Torpedo
does not route the host pins off the board rendering it useless.

This patch removes the host references.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
index 506b118e511a..3a5228562b0d 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
@@ -35,6 +35,11 @@
 	};
 };
 
+/* The Torpedo doesn't route the USB host pins */
+&usbhshost {
+	status = "disabled";
+};
+
 &gpmc {
 	ranges = <0 0 0x30000000 0x1000000>;	/* CS0: 16MB for NAND */
 
-- 
2.20.1

