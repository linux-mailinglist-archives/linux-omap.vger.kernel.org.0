Return-Path: <linux-omap+bounces-1705-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E4E927BE8
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 647D21C23308
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2237E4CB4E;
	Thu,  4 Jul 2024 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYXlLMdi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4570945C14;
	Thu,  4 Jul 2024 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113814; cv=none; b=u7GxXx2kJbtLzrwb7XnP+/aToDBX/81MSTs082H9Gm3PZOI1et21jbe5FwvDGhmlaq9sp+lNECzbIWKfTSQGn8xjSb0QQV+a4rNNoHNmh5KMWHyGf+hfrdWQnLmab3iv1iUSidjAF2PU6RDzdHT7KMApFVHKehOEtFs4o7oWhlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113814; c=relaxed/simple;
	bh=8tMNatK1sJi4q8SWgKJTcOEOVd74qA+MZpB63bLVf40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qc9quOHpzm5szCngUmYDhMo6BQfTRFmEOoria9bGMKsRqAEoECgZNesXF5muuZUASc7MuR4AeZnbbDg1dcZ/3QeDQO/NM1a5bVHm7NvzCgwUUkB/8hbrrDAEWETZNLbFge0xu9I2CKLeh2i8qxbsZeiP2IEOAB7tBU3BOk8QeXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYXlLMdi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so5668925e9.1;
        Thu, 04 Jul 2024 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113812; x=1720718612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+SGNEsXbL97x+/CVxCXK+2nldG1TcI8vle2Sq9kOQU=;
        b=KYXlLMdiTDgvEqBmd+5jA8OH+2KuncQwfG7Jg1GR1RtcuP/UuiH9r34Nk62/p292H/
         DO7v7jH+pCsOGxfAYT35mB8qnOcuF3Bvr/JoRiIuNqCaaOx8tahXCOCXujmYSb743k29
         0DzGAJCluW7yz5PHAs7Vzrb9fbBmXf6gxcpE99JqjrxL+FNjm6a6ZeIJZ2Jcnxrquhqk
         9hcMTT5IT7Tv4ttbCBS4trUKjmAsKGjSzkxFHxAorHTS8DYfMS4d+Ez1uUT5OJ2NwgNO
         CfTw9SYj4d1xQyh4YyY8k9508w60DcpNp3hN530C2jLMkXNYfYvXTlGYT1REk8mxovAx
         a1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113812; x=1720718612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+SGNEsXbL97x+/CVxCXK+2nldG1TcI8vle2Sq9kOQU=;
        b=p5Nsn0kN+f7fj6B8PF9mVRHfSQN8gPSynR8tO7gh+9g6ChtTY2iv+zqdGvK+bg0BAI
         x3l8Fjabfqrn07TuZbuz28IZOaaNlJcvQBjD2WfUB5oJU3H3HHleGwUnBC6ZECxlsyxi
         mOxUbTvUJFl5AM9iaGjVL2sGWpCPtgo+P+lPKw61790AeNcmgYtK1X5aa13ULfQ997KE
         gW2hW6ELc73DzFWs4yS62Cl35BK/b5uinmtlFK2WekJkpu/OcEvN9TStQ6hHleAwZ1Vu
         eK5Ma3GRN6niBFw22Ulfr0wY1+yfxhDPBJfTAq+YFOBoEp1dl1PJPSNZNV2wnCgz+vgu
         iUJw==
X-Forwarded-Encrypted: i=1; AJvYcCX/emtH7JyO0GaBZEu1ZvUD0LY2dfkCofszJ0MpXHIyv3ZQXDhwv1GA1eDHX5COIZFZOFsee78eMB811iciDi6rnp6ZIE1ALUg7CIP5sXAKP+bGTXZ+tdSdIuVtIrrJ8OcwP/92bTD8AcGo82RB
X-Gm-Message-State: AOJu0Yz2ldU+893Rrr8QhXkWo6xowi3jDl6caWlxSiBC2qvfbtd06urY
	IFKfeg1HV3/6AfTmI2gu3HqtZw9/01x/DEVliAzMUFY/wxQrwSkN
X-Google-Smtp-Source: AGHT+IFlCPtJM1+sKYumdZ6gx2ub+4aVrMbZyr/O80pjxoUEqlBsGHADGvz3OYhd0xVYDGSg10WjWw==
X-Received: by 2002:a05:600c:3b9a:b0:424:a823:51d8 with SMTP id 5b1f17b1804b1-4264b12e38emr21428825e9.11.1720113811696;
        Thu, 04 Jul 2024 10:23:31 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:31 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:13 +0200
Subject: [PATCH v2 03/24] mfd: hi655x-pmic: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-3-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=764;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=8tMNatK1sJi4q8SWgKJTcOEOVd74qA+MZpB63bLVf40=;
 b=YEtCZD5EBY7hxN5O+Cz2f8AlLr9THmWMnZa7wfo/k7lB8vW/T2U22+sMAVMPb6reODd6iYCWg
 W5ZrxQ0oUYyBTml5t9sZtOXTgwG+laIgc5bGKGBmbIpYGyv23CK9zCe
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`hi655x_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/hi655x-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/hi655x-pmic.c b/drivers/mfd/hi655x-pmic.c
index 042109304db4..5f61909c85e9 100644
--- a/drivers/mfd/hi655x-pmic.c
+++ b/drivers/mfd/hi655x-pmic.c
@@ -41,7 +41,7 @@ static const struct regmap_irq_chip hi655x_irq_chip = {
 	.mask_base = HI655X_IRQ_MASK_BASE,
 };
 
-static struct regmap_config hi655x_regmap_config = {
+static const struct regmap_config hi655x_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = HI655X_STRIDE,
 	.val_bits = 8,

-- 
2.40.1


