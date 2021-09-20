Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5C84114EB
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 14:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238557AbhITMyh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 08:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237664AbhITMyh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Sep 2021 08:54:37 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9FFC061762
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 05:53:10 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id x6so29337137wrv.13
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 05:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4q1a6gC+PswwD0+J0CMs3auxtQONFWFvuS/2KQHKStA=;
        b=e1oLy2nRpOW/L1CUFb3fDLyzuY2TdkOMbFaWBe+KkP/DMrOrK55shgVLBnFshcTHmz
         Ociyt1I4VGHETdbxJ2DH2UwaxzZMaqet3hN0o8MwU7Iip/R8iu84bek98GBnrfGPys8m
         BZJlwEejmmCQBAi8RCFQzCoG4n8zGGGFce8qwu4zXV2g/Z3hbCTRyV5gUh5NfmKhVP5a
         Qmqmvi3Wv4/DG5hezEjqwyeHpG7z3eu6AZx2GmDdKDAU7Fgd17/Far3tntk/gor9iSYx
         R1g0tEJj1VcF4stLB1PGxVLWvzxu3ClVkvoR22TgC3m9k0eozx1mrEiF475vYWHGR2sv
         L2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4q1a6gC+PswwD0+J0CMs3auxtQONFWFvuS/2KQHKStA=;
        b=5tWSdXRR2IKH8tx5qK5ZbWQ0hkL9TlAJd6Tu83gZaTgqXNjWIbaiTOzNsXxep3Q9jb
         zO93yA5hZWLR/VzUfbdI+p9fNdHS51cqRY7/2wfzLoT2eQ5xVn7exs5GFoAgnz6VpS2g
         nv4/HsbYLuvgjjZrDzHDKtLyhxmSm4Ok3eL3Lib9WxkSn02AMTmM7CqgV+D3zIai/xp+
         aHQaGChyDKIi60YCFVTHBOOIGuhUB1Zuk7H6YHRtkEbTWktXon1iDz1V4L3rj7uQ8rI3
         99FGEA5Mfk04zoNo5IBFbyYbMJ24skRtAWMoT/OvcYsgM76EMm9O0+TCnYZgYYBkCLH5
         gV5Q==
X-Gm-Message-State: AOAM5324zCvQcxHLnwsh3mmHpOLTfILGBubHkMPIBR5qmOAa1Abek6OQ
        mv0ohy38o/325SbEKT02EC/KdA==
X-Google-Smtp-Source: ABdhPJyiXXS2iyJts+E4JFgX1cnshJzO2RRbAbnC7W2egNKe6wx79xqI/0BqGk/Lmpa8aLXYHBUIGw==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr17540630wrw.219.1632142388947;
        Mon, 20 Sep 2021 05:53:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:aa8a:ef22:59c5:1bf3])
        by smtp.gmail.com with ESMTPSA id j21sm15791643wrd.48.2021.09.20.05.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:53:08 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tony@atomide.com
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/4] ARM: dts: dra7: enable BB2D module
Date:   Mon, 20 Sep 2021 14:53:02 +0200
Message-Id: <20210920125306.12347-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The DRA7 & variant SoCs contains a BB2D module which is a Vivante GC320 2D accelerator.

This patchset adds the GPU node and enables it on the DRA7, DRA72 & AM57xx platforms.

This is a follow-up of [1] & [2] but:
- using the vivante,gc bindings only
- using ti,sysc instead of hwmod

[1] https://lore.kernel.org/linux-arm-kernel/20161118024436.13447-1-robertcnelson@gmail.com/
[2] https://lore.kernel.org/linux-arm-kernel/20161118024436.13447-1-robertcnelson@gmail.com/

Gowtham Tammana (4):
  ARM: dts: dra7: add entry for bb2d module
  ARM: dts: dra7-evm: Enable BB2D node
  ARM: dts: dra72-evm-common: Enable BB2D node
  ARM: dts: am57xx-evm: Enable BB2D node

 .../boot/dts/am57xx-beagle-x15-common.dtsi    |  4 ++++
 arch/arm/boot/dts/am57xx-idk-common.dtsi      |  4 ++++
 arch/arm/boot/dts/dra7-evm.dts                |  4 ++++
 arch/arm/boot/dts/dra7.dtsi                   | 20 +++++++++++++++++++
 arch/arm/boot/dts/dra72-evm-common.dtsi       |  4 ++++
 5 files changed, 36 insertions(+)

-- 
2.25.1

