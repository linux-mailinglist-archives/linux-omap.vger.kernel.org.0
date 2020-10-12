Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E01428C410
	for <lists+linux-omap@lfdr.de>; Mon, 12 Oct 2020 23:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbgJLV35 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Oct 2020 17:29:57 -0400
Received: from vern.gendns.com ([98.142.107.122]:50628 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgJLV35 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 12 Oct 2020 17:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7rBBN/24ZhuMqbfWasueMTRp1Qqx0RQ7dihft9yfRQE=; b=lortp3tnsp1Nv8DNDiUix3Zde1
        b46950CeXEmamXK72O7Ns3lJEkaG5Ugic3HCv9TxK50O4a8oPrqjK0u79XT7PMvGku9q0kdSYbchH
        sYdFOFzZtP2tplM2THc0PS6yDNALnJey44kCjABBuL5gOaP3hWNS9I4M5eJq/4klI9ScpkQtCXIwf
        XzItm0OgIVKS8gIGVMc/E6rmobrRVOgNN8+AaKqk19ybqy61wFdXa+Vo+seajKqJIhkAKO7K4+Bj2
        SgwX2pAFXTwEfIQ1gmtcqfA6L4XhB6kyHVrRLP/2cFtoPcopk7PyWB/txXMQPwl0bJNsdE0yrM8nR
        8xhFFUmg==;
Received: from [2600:1700:4830:165f::19e] (port=52666 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kS57v-0004Ih-Sj; Mon, 12 Oct 2020 17:13:04 -0400
From:   David Lechner <david@lechnology.com>
To:     linux-omap@vger.kernel.org
Cc:     David Lechner <david@lechnology.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: omap2plus_defconfig: Enable TI eQEP counter driver
Date:   Mon, 12 Oct 2020 16:12:29 -0500
Message-Id: <20201012211229.3282128-4-david@lechnology.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201012211229.3282128-1-david@lechnology.com>
References: <20201012211229.3282128-1-david@lechnology.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This enables the TI eQEP counter driver that is used by BeagleBone Blue.

Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/configs/omap2plus_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index fe383f5a92fb..71b1a8f4c241 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -524,6 +524,8 @@ CONFIG_PHY_DM816X_USB=m
 CONFIG_OMAP_USB2=m
 CONFIG_TI_PIPE3=y
 CONFIG_TWL4030_USB=m
+CONFIG_COUNTER=m
+CONFIG_TI_EQEP=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS_SECURITY=y
-- 
2.25.1

