Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F72841E85C
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 09:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352526AbhJAHgS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 03:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352497AbhJAHgR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 03:36:17 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D839CC06177A;
        Fri,  1 Oct 2021 00:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/KNbdMFoOKxu0lGyFPrV7jwi5kRSdH7fdSWGknBxn4c=; b=hlJ4++4nqjH7wJjFg1Bu1Krhh2
        xxnCJJWg7qML7/JbuIGJy2gJCXl0Yk5LAZxgKyan7mRPSO4g/0+H1Zlrtd1WC9UqadV8pmue1fxpM
        txJKUEndHDcnVt4IrhFRyUfFPeHGqbljIYBu2KOLZZBbtA625LQoR6a/QO/K71MECKr4=;
Received: from p200300ccff0b42001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:4200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3s-00012f-1t; Fri, 01 Oct 2021 09:34:28 +0200
Received: from andi by aktux with local (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3q-00CBfP-HK; Fri, 01 Oct 2021 09:34:26 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        hns@goldelico.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/5] arm: dts: omap3-gta04: dtbs_check fixes
Date:   Fri,  1 Oct 2021 09:34:11 +0200
Message-Id: <20211001073416.2904733-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series fixes some errors found by make dtbs_check. Most
do not fix functional issues, just syntax but one typo was
unveiled by make dtbs_check which only caused no problems by
luck.

Andreas Kemnade (5):
  arm: dts: omap3-gta04: cleanup LCD definition
  arm: dts: omap3-gta04: fix missing sensor supply
  arm: dts: omap3-gta04a5: fix missing sensor supply
  arm: dts: omap3-gta04a4: accelerometer irq fix
  arm: dts: omap3-gta04: cleanup led node names

 arch/arm/boot/dts/omap3-gta04.dtsi  | 23 +++++++++++++----------
 arch/arm/boot/dts/omap3-gta04a5.dts |  2 ++
 2 files changed, 15 insertions(+), 10 deletions(-)

-- 
2.30.2

