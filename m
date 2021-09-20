Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCB14114F2
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 14:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238767AbhITMyl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 08:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237095AbhITMyk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Sep 2021 08:54:40 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB6EC061764
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 05:53:13 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id d6so29276420wrc.11
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q5dBrRid1lg0ZLWSdKqohgEkhC0UvybMd4GuizpsF68=;
        b=AZKmImTUNjDQIcWUY7WzKnSnCy7bSlxxYwDoGZ3/RkbSNESgRA3hjl7uAZHp1+iEmN
         6BuEkWW1U/s9TtWgRIPl9Hd0+EwZc3nn28B8XTU6y+NsUgnz8wSeyCkQ3TPpbR7HIvOX
         z7xa8tO306d/Wj4uD4755k2dMF7mNAOpqGTuA5FIqqqu39+zW/RYULp+YrBnl7Cjv0n9
         yxINE92OUZDXkzpLkNT5xcKGaMeQH3wBJsbLgIBQZI1kDRGPEEfMWkpH1XRruv3BO4QY
         NbTTxfkRUZKYeRqglZBuygg8dPULjxgCzHnr7tkt9kxCkTn75bSKvC6rwikYi9cO2cFj
         1XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q5dBrRid1lg0ZLWSdKqohgEkhC0UvybMd4GuizpsF68=;
        b=Okxham6o3NWpVSbW+oNsLtD2pZ9KbXd3jCR/rrM+ku6qqevur2xWzyMJKFgTlHB49i
         r2v03nJnZxIFPNehp+40mBixS+obt84KJY2n0OHWePgU1kXBo2QJLf4h7lbgUA2w1BVb
         0nO07QNP9ER6GZjJq39GsDGsBjqWKZjY+a+SSj8pm6jzPXfd1arRaCm3EML8Ap4eZsIU
         vXrGYJ+gdBxJK946JKLmP22lMS7VZWuSsCH10SxmsxOtFMZck9FyKRvwrfXppDbk1FR6
         m81CARa8HTIjdNEWAt9pBZEz/JnAr6QY4K9Zk51McRIbLxp+lC++jpmOoh3YHG2FhxM5
         r4Hg==
X-Gm-Message-State: AOAM533s0+in85zDJZUTNxI+hvxsImW4Rpc5z3ibgzsp/RJj89LsEmCk
        rC+I6n0cXY7mxBnysx7B1Afe+A==
X-Google-Smtp-Source: ABdhPJwp00DImzccMmdqGuQVSiSCikpdE9r3efij8ZgIl/stShbLF23UywqOxJC7d6OEK1dPhrldaQ==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr4405580wrb.385.1632142391536;
        Mon, 20 Sep 2021 05:53:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:aa8a:ef22:59c5:1bf3])
        by smtp.gmail.com with ESMTPSA id j21sm15791643wrd.48.2021.09.20.05.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:53:11 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tony@atomide.com
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gowtham Tammana <g-tammana@ti.com>,
        Jyri Sarha <jsarha@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/4] ARM: dts: dra72-evm-common: Enable BB2D node
Date:   Mon, 20 Sep 2021 14:53:05 +0200
Message-Id: <20210920125306.12347-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920125306.12347-1-narmstrong@baylibre.com>
References: <20210920125306.12347-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Gowtham Tammana <g-tammana@ti.com>

This enables the BB2D graphics accelerator for DRA72 EVM family boards.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/dra72-evm-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index f12825268188..6f1236b80b40 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -535,6 +535,10 @@ &dss {
 	status = "okay";
 };
 
+&bb2d {
+	status = "okay";
+};
+
 &hdmi {
 	status = "okay";
 
-- 
2.25.1

