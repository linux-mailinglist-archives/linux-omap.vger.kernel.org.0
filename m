Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1E920B0F1
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 13:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgFZLxk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 07:53:40 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:35973 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726901AbgFZLxk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 07:53:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id omv4jNJEP0MRaomvKjN2nD; Fri, 26 Jun 2020 13:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593172419; bh=Bl7/tf6cZ6MfnMEA03awoe0xkqHwNxbrdk9dAWjJ7Mc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=X6QH8aj5MojZj5CzcUKe6ATIx1UrBuReB3gdrlvU4drPRlAI44J9wLajq2Aro1hNU
         oxMmVX3BHer7KbpV8E77lb4rWel7OhG9UTcbuITHrR8AszJZtuf5IK2hMyr91FNkd8
         4bPy+rRHLMkrow72hqZlAj+u+9TpVfmiSLHU5sLPvnr4BdHyRR5A93Jn1Aio3al7iz
         yXJFSDrLZiDicW1i53syq1q3NwM7FUHjtuW83m9G07Axe+6PdsRFUtUgr/tyBmRrcV
         LtczNPu3R16LMU2MoFEPgIfbLsoRcPCppzy4Y/Y/1cRMkv3OFjXoC29aas2vsBBX46
         lQj4hw/kvuyQw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/7] ov9640: update MODULE_DESCRIPTION
Date:   Fri, 26 Jun 2020 13:53:15 +0200
Message-Id: <20200626115321.1898798-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIzDGmm54NkO8W3SCVbUUAstiCA20EKfCwZIT0izPaF5iBHWGwmtdzwhRo5LIoLW+5JOnha/vYGpqq8JTMDB3rHvgpWRBbDJEWi4TF3qqvKYMNoW7rsF
 TE5iKNNQzd6+65Nn5SerVPeYg5cf7m2hrGObdy+nT8hPM43LWW/1GPtTj4UzVGwegC7kIvfwlpxJ+IdtqWzXTNBaRYsOAvP9yZoDyAQFz8Ul7p4b4TrcEQs7
 5tCT3DbemiI8gky8cS1WhEcmGgeFFi8LmMRAX/Fort3HK1egz6TEENQFneV3R/ldlnyqlx0Z0omXc8OtsKLhgA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove the confusing SoC Camera reference.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/ov9640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index 482609665305..3a21f51d9325 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -772,6 +772,6 @@ static struct i2c_driver ov9640_i2c_driver = {
 
 module_i2c_driver(ov9640_i2c_driver);
 
-MODULE_DESCRIPTION("SoC Camera driver for OmniVision OV96xx");
+MODULE_DESCRIPTION("OmniVision OV96xx CMOS Image Sensor driver");
 MODULE_AUTHOR("Marek Vasut <marek.vasut@gmail.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.27.0

