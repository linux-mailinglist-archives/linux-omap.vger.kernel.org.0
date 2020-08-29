Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B409A256A97
	for <lists+linux-omap@lfdr.de>; Sun, 30 Aug 2020 00:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgH2WMB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 29 Aug 2020 18:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgH2WLW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 29 Aug 2020 18:11:22 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE8AC06123A;
        Sat, 29 Aug 2020 15:11:22 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t6so2659923ljk.9;
        Sat, 29 Aug 2020 15:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eqKLFOejHvPoCA5PJskfbUfjzApOxehyRsmGMj4+oiw=;
        b=lufC50cLUeKCGVIm35aFlQr/7cb4UxaTGnxv9JCIlFcT5tGTkCFCKeqAJLzcdDkmca
         3PjP7lwVAF9GfyFizN7wu0+z+nR7+gl3BGvr9FedbJZXy7ILvolI7u4q2ZjG5X7YODPz
         a2sqQRoUJKrePbQVJz5+IL3CLXgEdt7f1CLQ4s2zH4FbZYJeJQbTzRzcr/5B53rjZ0Sh
         +PoqJpwv7N7QWqcXF31HtTqLtDHgbbP2ifuivBUbd271CSTkTBW9KihHQjBoBNPARUe4
         y4xDHWf8vS7x9W5ulAgznr9SlkwbK6I6ngfnKjV66X62dk96+Wb63oMUYPR0ZfWY7G3P
         TelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eqKLFOejHvPoCA5PJskfbUfjzApOxehyRsmGMj4+oiw=;
        b=jDFOZ5aDkhunD0ISEndhmMOXBlK5WL9ZJdcWNgyavi9dAneeCuaVFdJYWdYIgqKLlZ
         U2ux5ZVGdQ50yjgPOdVjRGN5xACsg1jORkzOUIp3FnMoSq8dl+mJTUoWamQlrDju68p1
         Jy8yxwEi27bCwz3FkRvIZw9vOZ+SJibSVWa7zUeeIXHCWAQ+PKPclZ7W6cVa/z8grvA0
         G2AZ4ohrGuSHSUzsL74Pqpm/AZ1sSlglCptU6e1AnfmjhhQPuzw/3CP/l4JisveLml0y
         BneAYUOEAl4RUfzpihRnChrYxjXEptVqV5t/85oLiarmb48lJhJEMTRj7aWcTVWhq//J
         DhyQ==
X-Gm-Message-State: AOAM532fF9j62o3Udrjwygii+c4qQzxxplKSyt0UrZCKZKaF+IYiYs0L
        Lgsykfy4V/QZBSJzJWCOXz725I6TqFo=
X-Google-Smtp-Source: ABdhPJzUp75kygHc38shkqJ09g7NBALp4ZTb/A+r5mwYVb5QsH+myXFZB+7zujBjyT3JO8oVl+XNpA==
X-Received: by 2002:a2e:b5b3:: with SMTP id f19mr2100455ljn.210.1598739080913;
        Sat, 29 Aug 2020 15:11:20 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id 4sm697546ljq.92.2020.08.29.15.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 15:11:20 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 8/8] regulator: tps65910: Constify static regulator_ops
Date:   Sun, 30 Aug 2020 00:11:04 +0200
Message-Id: <20200829221104.20870-9-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200829221104.20870-1-rikard.falkeborn@gmail.com>
References: <20200829221104.20870-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The only usage of these is to assign their address to the ops field in
the regulator_desc struct, which is a const pointer. Make them const to
allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/regulator/tps65910-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index 4eb5b19d2344..faa5b3538167 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -757,7 +757,7 @@ static int tps65911_list_voltage(struct regulator_dev *dev, unsigned selector)
 }
 
 /* Regulator ops (except VRTC) */
-static struct regulator_ops tps65910_ops_dcdc = {
+static const struct regulator_ops tps65910_ops_dcdc = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -770,7 +770,7 @@ static struct regulator_ops tps65910_ops_dcdc = {
 	.map_voltage		= regulator_map_voltage_ascend,
 };
 
-static struct regulator_ops tps65910_ops_vdd3 = {
+static const struct regulator_ops tps65910_ops_vdd3 = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -781,7 +781,7 @@ static struct regulator_ops tps65910_ops_vdd3 = {
 	.map_voltage		= regulator_map_voltage_ascend,
 };
 
-static struct regulator_ops tps65910_ops_vbb = {
+static const struct regulator_ops tps65910_ops_vbb = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -793,7 +793,7 @@ static struct regulator_ops tps65910_ops_vbb = {
 	.map_voltage		= regulator_map_voltage_iterate,
 };
 
-static struct regulator_ops tps65910_ops = {
+static const struct regulator_ops tps65910_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -805,7 +805,7 @@ static struct regulator_ops tps65910_ops = {
 	.map_voltage		= regulator_map_voltage_ascend,
 };
 
-static struct regulator_ops tps65911_ops = {
+static const struct regulator_ops tps65911_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
-- 
2.28.0

