Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604122BB05B
	for <lists+linux-omap@lfdr.de>; Fri, 20 Nov 2020 17:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbgKTQWU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Nov 2020 11:22:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:40306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729111AbgKTQWT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 20 Nov 2020 11:22:19 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F344B22269;
        Fri, 20 Nov 2020 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605889339;
        bh=kDWYTEzSyPd1hDIkbd2Rs+DZbj+M61LYe2kWDDaSCCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zKkQnsmwMXzf9Scyb5sPJAwuv7i6LiosuO6EMqlF1Ddfi2QfzfeSmiduYfSxAe72n
         72Nme2pRfHAHtiPEb6FcOQsOYdMANOnWYyeAbUY3yteOz5nsbOUBErnm2RrkLnUBoh
         0/kyr9mbk9BVmFxiH42QeSGOhOR8DZYo/lvaeoSE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 16/16] mfd: twl6030: mark of_device_id table as maybe unused
Date:   Fri, 20 Nov 2020 17:21:33 +0100
Message-Id: <20201120162133.472938-16-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120162133.472938-1-krzk@kernel.org>
References: <20201120162133.472938-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver references of_device_id table via of_match_device() so it
will be unused for !CONFIG_OF builds:

  drivers/mfd/twl6030-irq.c:359:34: warning: ‘twl6030_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/twl6030-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
index aff2dfbf3bf9..97af6c2a6007 100644
--- a/drivers/mfd/twl6030-irq.c
+++ b/drivers/mfd/twl6030-irq.c
@@ -356,7 +356,7 @@ static const struct irq_domain_ops twl6030_irq_domain_ops = {
 	.xlate	= irq_domain_xlate_onetwocell,
 };
 
-static const struct of_device_id twl6030_of_match[] = {
+static const struct of_device_id twl6030_of_match[] __maybe_unused = {
 	{.compatible = "ti,twl6030", &twl6030_interrupt_mapping},
 	{.compatible = "ti,twl6032", &twl6032_interrupt_mapping},
 	{ },
-- 
2.25.1

