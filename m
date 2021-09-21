Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9311412F36
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 09:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhIUHTm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 03:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhIUHTl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 03:19:41 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90B1C061575
        for <linux-omap@vger.kernel.org>; Tue, 21 Sep 2021 00:18:10 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id w17so28117484wrv.10
        for <linux-omap@vger.kernel.org>; Tue, 21 Sep 2021 00:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YGEAbHXSaoOeSKdNUKSp2eDYtuE34vb7kZvCNCg8WS0=;
        b=sh8yMuDbDOGoxzO4ADI0dGLvuU735gfVv5A15gwgb7x87zmV/oPf3DLR4Qpw+yc+R6
         3YD9KmSeCB74S7Vlm1P4MsvWG4zrDSqp4NUiNTfh/FvhZzLfeVgTUeFlRsVH9dktUcIB
         BDyxMD654sBYoOo93aMIGyEAM3H1gwp2Evt+KDAycCh8NSSjOsnU8XRnQ2JW1SzcRhhC
         BXU2tLDvW0TcvdDjMAQz8iQibd7+cXmtmpviuKqw49lywbiGll8djnkgpR6GdW4gXDMc
         PDbUokAXjWtNBdnh9lNxO0gxtdbJWqzSnJh/JSVdQw2F0kQ2sDAFfZJf/zFCm5ybUJLR
         PNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YGEAbHXSaoOeSKdNUKSp2eDYtuE34vb7kZvCNCg8WS0=;
        b=K5CNhZnKoNn0B9muJL3ZmaEaAPc2Bo1pR1To904bZ2GCqqtocnc7SNr1078gIFkqSm
         RH0WPxAJ3nKWFzWr+iDMYLjp0nZsFuPmkQ+qGLT99/fph8G4UAc2JMv2QUu5GZXzAZl/
         FmBisJDwCoQeTjAXCNbzxnQSPGorn1yQ1ClX+6QtpsaqkYgB60KxZwxl6Jj1DDk8d+XR
         H85hhPTyj1lCj6StYI+n0tFFEhJt6kn7n0PqeGmdZiz17mOZ0J7EmxsW3NfcQZp6qo8K
         BY6uYspq25SWx+Nj5OzL3hmyKAJjxbWScBdz9iO3ZBfmsEFlpUtjyWwsGVHlC9EgSpW5
         qLLw==
X-Gm-Message-State: AOAM532a6Ik9azBEGIlEy/XEmQXGIyNrcbTNlx7uexa4l+jBwzxEsqWg
        fBO7P5YyofDxQGAKRnAr1ZIlBA==
X-Google-Smtp-Source: ABdhPJwLKYS+Orv3H6DcPfO7ccXZ7yofYe1iBGfAMWonW7ouj8YancroCtZRVfWUkd3W8gGe5ERJ1A==
X-Received: by 2002:a05:6000:1379:: with SMTP id q25mr32495090wrz.280.1632208689229;
        Tue, 21 Sep 2021 00:18:09 -0700 (PDT)
Received: from localhost.localdomain (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
        by smtp.gmail.com with ESMTPSA id w9sm1786918wmc.19.2021.09.21.00.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 00:18:08 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tony@atomide.com
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/1] ARM: dts: dra7: enable BB2D module
Date:   Tue, 21 Sep 2021 09:18:06 +0200
Message-Id: <20210921071807.30978-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The DRA7 & variant SoCs contains a BB2D module which is a Vivante GC320 2D accelerator.

This patchset adds the GPU node and enables it by default.

This is a follow-up of [1] & [2] but:
- using the vivante,gc bindings only
- using ti,sysc instead of hwmod

Changes since v1 at [3]:
- removed status property of bb2d node
- removed enable patches for different platforms
- fixed bb2d size format

[1] https://lore.kernel.org/linux-arm-kernel/20161118024436.13447-1-robertcnelson@gmail.com/
[2] https://lore.kernel.org/linux-arm-kernel/20161118024436.13447-1-robertcnelson@gmail.com/
[3] https://lore.kernel.org/r/20210920125306.12347-1-narmstrong@baylibre.com

Gowtham Tammana (1):
  ARM: dts: dra7: add entry for bb2d module

 arch/arm/boot/dts/dra7.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

-- 
2.25.1

