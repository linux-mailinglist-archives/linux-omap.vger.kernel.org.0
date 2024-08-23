Return-Path: <linux-omap+bounces-1976-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2E95CA3F
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 12:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FAD62875E6
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 10:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7418A187853;
	Fri, 23 Aug 2024 10:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6E4pCgQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E89187338
	for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408173; cv=none; b=AsfeB8fosWaVwjH5BRHz3dB2oxgN2TEXmU1ChJYPC6SNkEBPd2ASDoybhP/UsOtNKlprFlvJ9o+Wld3BJKJRfJSR8/AZrxz4hBU6bHS1+Bgu4agD9IKO81p1JiUg+oRl2T2RvBO+xDDO3ocdakFKOWWSitDigvYXjGEF0ioYFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408173; c=relaxed/simple;
	bh=dKvvXGp0G4rwTm+4rjJKl33390X+DCmUn8vg4x43GxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3sgnrO30jos0s3wfFzbPTND06hwzj0jzuHJyR0t6ugVavm5TzLSjf9feGka1UwN7n/H6EYtBmXoGwsRsr0SDZEdTUadY6XCilbslbJ8qCjtlVKZaJ3lvypMtJJ+urf5EUxbqz8rT3hShnqG41fha5yG1rgkIP/DFmsCO9QzM04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6E4pCgQ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53347a8a28eso307094e87.3
        for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 03:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408169; x=1725012969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIb+FksMIOJ64Q0IsP/5G/5OpyiFmNxQ3nT5nVYnW8k=;
        b=b6E4pCgQpIryJ+uRWTMkOAIm655dAoW04uLx7Y2bkTxbzXrint952fwn24JCd7jCs4
         csDdBbitklCbR3nqKSS1+hUV4LE79UygNj0/XOsyRKrKFAf4gHRzXM81fX91mIrGzOUu
         9dl8CQZUtYd8YgegCOGewll9MIdB2NpC3fa24tPFeotKmTVyN+ebq3y2NnVY5c65HF8+
         Vfdam1XhAQBqnxsJ1qBMsWXbGRKksO2btXpNe9vW1SqV5lXE0FVLE7m0hOyLsBt3q2VO
         NtzYIKEGfp6+wxR0x9VAuVFO1MSue9qFeMQ0dlyWNRpG+E+Uw3I8jz9feZ7uhBNOjL5q
         Ctlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408169; x=1725012969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIb+FksMIOJ64Q0IsP/5G/5OpyiFmNxQ3nT5nVYnW8k=;
        b=FEEx1D8pSxmWdPg3F2g3iRqs/xlju1Cc7xNO74jiGJ2roVwhC6cLCj06c/sH419woU
         SH8N2f56JYBjeo6UKHvYMlbW9X4OFYpaaRQDuWcE20XieyLHANZSvlDrNmW5FXDCT0jz
         PHxrADCLCkrD+74myAtt0DoxvT60CJivrYJZgZ1YlRdGoZ4tecYZ2P6cmdwBPCsOGnEn
         9/6GvNjWzWa4rFPX5r6M/fGfVpvChuNbSlThMsM7EDBxwV34ioLAOCswtiN5+JmnCvti
         0J6sVfoFVVBA14jAgQ3vFyUjSu1yBDxD6UgcX9hQx0/9/0MgD2CnQETJiwBDp1qsm2VL
         NjTw==
X-Forwarded-Encrypted: i=1; AJvYcCXz5GGsD6rx8miGAFtM7WYoy+wPzRMCnZs64I9qGI6PkclidQd++RzLHsagK2irQiP68ogNrwicKXU1@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwGqXNlIuA1uLZ5W/0dNZIPf8g49jgVRtDGoNPtVSfuHTj/yc
	U8BBZNgC7FAYgnOp27tYNztowwh27HzI0s4sY2GQIi46CQPv3Q/cIRhY3lGA9ww=
X-Google-Smtp-Source: AGHT+IH2YdNwdbaIsW8x6JwUanSC2De/vmujuXIf/3MDm8QVZfLk7aokO3B6+oX3QzZfH0fhdLKHPg==
X-Received: by 2002:a05:6512:23aa:b0:52f:c438:883c with SMTP id 2adb3069b0e04-5343876c643mr720470e87.1.1724408169146;
        Fri, 23 Aug 2024 03:16:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a1df5sm237912166b.68.2024.08.23.03.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:16:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 12:15:57 +0200
Subject: [PATCH 2/7] memory: emif: simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-b4-cleanup-h-guard-v1-2-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
To: Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dKvvXGp0G4rwTm+4rjJKl33390X+DCmUn8vg4x43GxU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyGFfrOD+/wW6Zo3iZXagedAsbyR4cF12jI3eS
 JPVjmdbm1uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZshhXwAKCRDBN2bmhouD
 11m6D/9n+H35P6ofeRJrA+nm522gpFEX5Eu7CMZi6f2sqzh+NqNhlZtFnclpnvwRGqagON9oSuR
 Y96OyUBnFBxMSfCmZRcrIfLch4iAFvRylrfFRV76JV5PDmUZSYKzKB0qfhFYjHrgN2buG9pC/bi
 8i1N3h0X3QC0FBQ6YH3F7QHUgw7bN4/yylZkg0RIzz73pE4laH/Ue9yqBz7TqycgCamg+3NVfzB
 /R0x4qx8lnVE7kim5XODG+opwaJEqEFz7BP9Qv3PnrEIliml5EbBy7UbjgQGyZczd4RJgcoyNfw
 Eb345jjdaUPW4kAsN7Wkr+Fycxk2GWyOVJOhWU9Nm9YZlq1Xfgb3CxLymwYUIxcZbHZ3wupzjJT
 0u4TgWe8y5dqx9ckkyWQdscun3CpXJ9IFn+aQidrHrX8j7lTwMBkzBAILGSM0U+KCCr7Yr2qQRJ
 iHo2kNPB93ds0C77lDSseIV5tcSs8wOzf4yTO1z1UFVK069j/2paS/n8YNX9fKt1qnPD9SfLpfY
 QlToLO+SLJGVGFsQYAhGuzqsDeuUX4TaqFvRgtyyZ1eYRUL6K2ADzBZRVPJmSzV8fiNjUrIcJZC
 O/iAkNEmtjQlYT7uuioAbBNleCl95X4GFK+alDrlRvo8YaIskbUU2a+YEk1sQMEkdsw2ohC+eqW
 m8iSd0+g4exq3eg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

The driver used file-scope variable 'irq_state' for storing IRQ state
with spin_lock_irqsave, so move it into respective local scopes.  This
should be equivalent, but more readable (less global variables).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware, although I don't think that moving 'irq_state'
scope would affect anything.
---
 drivers/memory/emif.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index b32f3a8f9d71..99eb7d1baa5f 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -7,6 +7,7 @@
  * Aneesh V <aneesh@ti.com>
  * Santosh Shilimkar <santosh.shilimkar@ti.com>
  */
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/reboot.h>
@@ -68,7 +69,6 @@ struct emif_data {
 
 static struct emif_data *emif1;
 static DEFINE_SPINLOCK(emif_lock);
-static unsigned long	irq_state;
 static LIST_HEAD(device_list);
 
 static void do_emif_regdump_show(struct seq_file *s, struct emif_data *emif,
@@ -522,18 +522,18 @@ static void setup_temperature_sensitive_regs(struct emif_data *emif,
 static irqreturn_t handle_temp_alert(void __iomem *base, struct emif_data *emif)
 {
 	u32		old_temp_level;
-	irqreturn_t	ret = IRQ_HANDLED;
+	irqreturn_t	ret;
 	struct emif_custom_configs *custom_configs;
 
-	spin_lock_irqsave(&emif_lock, irq_state);
+	guard(spinlock_irqsave)(&emif_lock);
 	old_temp_level = emif->temperature_level;
 	get_temperature_level(emif);
 
 	if (unlikely(emif->temperature_level == old_temp_level)) {
-		goto out;
+		return IRQ_HANDLED;
 	} else if (!emif->curr_regs) {
 		dev_err(emif->dev, "temperature alert before registers are calculated, not de-rating timings\n");
-		goto out;
+		return IRQ_HANDLED;
 	}
 
 	custom_configs = emif->plat_data->custom_configs;
@@ -553,8 +553,7 @@ static irqreturn_t handle_temp_alert(void __iomem *base, struct emif_data *emif)
 			 * from thread context
 			 */
 			emif->temperature_level = SDRAM_TEMP_VERY_HIGH_SHUTDOWN;
-			ret = IRQ_WAKE_THREAD;
-			goto out;
+			return IRQ_WAKE_THREAD;
 		}
 	}
 
@@ -570,10 +569,9 @@ static irqreturn_t handle_temp_alert(void __iomem *base, struct emif_data *emif)
 		/* Temperature is going up - handle immediately */
 		setup_temperature_sensitive_regs(emif, emif->curr_regs);
 		do_freq_update();
+		ret = IRQ_HANDLED;
 	}
 
-out:
-	spin_unlock_irqrestore(&emif_lock, irq_state);
 	return ret;
 }
 
@@ -616,6 +614,7 @@ static irqreturn_t emif_interrupt_handler(int irq, void *dev_id)
 static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
 {
 	struct emif_data	*emif = dev_id;
+	unsigned long		irq_state;
 
 	if (emif->temperature_level == SDRAM_TEMP_VERY_HIGH_SHUTDOWN) {
 		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");

-- 
2.43.0


