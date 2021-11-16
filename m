Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF6F452B0A
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 07:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhKPGju (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 01:39:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233868AbhKPGh1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Nov 2021 01:37:27 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECFCC0432CC;
        Mon, 15 Nov 2021 22:27:32 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id x5so6551577pfr.0;
        Mon, 15 Nov 2021 22:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xUihz6cPZv7rYs39OZ9cIRP3xprrR050mWdI6KmmNmo=;
        b=F4daJEzclFjzRrAWljO2lDAW7Oumn90n0WgJTGEkPieHfnPB5C7AxbIgoaPMI5KaJK
         Iwypr9DXqwBoIEAyV2u9yHDl38Ly/cL7y2FPaIdXFt7DFLsoqt7OFRPD3hT12J3iWna+
         l8XNAqddJbiR4bMSjTCP0A1BqZAfrQpPn2oxeKt7PpTLj5Hcj5b4wzRxbH3VN0ORuAJC
         WUdvVceEUzg8hBlIiUedmFmerIo8YaV36mnPGtkwly0FjqKnaD9kSVwgztQcq8VeNqBQ
         9BWuTjc7HrPMgwg7S7+xtps4e3AjqJCEPobL8NjEjqMAbVucolELI38lXxHZKmCTbufF
         1E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xUihz6cPZv7rYs39OZ9cIRP3xprrR050mWdI6KmmNmo=;
        b=ymIcOAmKLvgdE/ch7RWii/LuPFT3GAYygb8+yMNXrijuEuTNRYOEYcKovbVE91M/Tc
         bClzf0vlxy4/cTjUTyHqsZtRo+h/Ny/BHcOMXIz0drp4p141NtgKcENsjKvi9J/bkJWj
         cfq1QsAaGYdpVAWV3hinnwXo+On5wCOxMnF+ZveGxizvQpQQgD3TfF12Q8obQcFd4r5x
         sFB1EmoFlbsgRneNFicu06DGk0ivD7hPyAbGqHUPayQRoSTzynV7KZY09iXMq6IYIbAO
         GGGiaGRlcPlr/S8vQDOsd8RwgxAByIEcF2SCze5pHVb2WjrE1Cu6Gcn4Qi4+McuRjPoc
         kZRA==
X-Gm-Message-State: AOAM531Rhk+6kOGovWngvgSSi3IOSD0hbmWuomU0s8TuRacSo7t9u4oV
        UBWyM7siHcdWd4c1mvQYbQoVShn2sZQ=
X-Google-Smtp-Source: ABdhPJxZAnlSYRfcdPc+UxhQEFMyuCsfOBYWdrq6so38OF8P/dkezjSelnqcV6b/46C/VfjSkF7Ebw==
X-Received: by 2002:a63:6a43:: with SMTP id f64mr3199613pgc.393.1637044052172;
        Mon, 15 Nov 2021 22:27:32 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id e15sm17225884pfv.131.2021.11.15.22.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 22:27:31 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To:     tony@atomide.com
Cc:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ye Guojin <ye.guojin@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] ARM: OMAP2+: adjust the location of put_device() call in omapdss_init_of
Date:   Tue, 16 Nov 2021 06:27:26 +0000
Message-Id: <20211116062726.154689-1-ye.guojin@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ye Guojin <ye.guojin@zte.com.cn>

This was found by coccicheck:
./arch/arm/mach-omap2/display.c, 272, 1-7, ERROR missing put_device;
call of_find_device_by_node on line 258, but without a corresponding
object release within this function.

Move the put_device() call before the if judgment.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 arch/arm/mach-omap2/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/display.c b/arch/arm/mach-omap2/display.c
index 6daaa645ae5d..21413a9b7b6c 100644
--- a/arch/arm/mach-omap2/display.c
+++ b/arch/arm/mach-omap2/display.c
@@ -263,9 +263,9 @@ static int __init omapdss_init_of(void)
 	}
 
 	r = of_platform_populate(node, NULL, NULL, &pdev->dev);
+	put_device(&pdev->dev);
 	if (r) {
 		pr_err("Unable to populate DSS submodule devices\n");
-		put_device(&pdev->dev);
 		return r;
 	}
 
-- 
2.25.1

