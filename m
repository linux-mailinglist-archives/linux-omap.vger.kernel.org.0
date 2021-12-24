Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D20F47F13C
	for <lists+linux-omap@lfdr.de>; Fri, 24 Dec 2021 22:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353599AbhLXVvE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Dec 2021 16:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353591AbhLXVvD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Dec 2021 16:51:03 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED28C061401
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:51:03 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id q14so29614372edi.3
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:reply-to:mime-version
         :content-transfer-encoding;
        bh=njyYK8IAwIOI5hjHtw+gwXwGrvmDKnQ12yvC407PC/c=;
        b=nrUu2WgylneQdHddZVe8VLSjunkqzVa8WUUt8DxEvb+q1FOyW+OhpBXa1lBLiIjP7S
         DzsAv4AyGpQBWS0zv+nEl/c/MMOyfdelzS4tpneIx9tA85Bn/ETTF/T9aYOhBClyISS7
         b8HrvT0H17gfI35I7QHKUr+qFjiS1VjPWYPKBhp5FGhMMH/XLwl2v9lF5QMhfOgPb8s0
         Zr8jfTzvR0vkjoXR2X2RN1tU2QQQHl0WMkUhH0aDNRFVeBetmJEz6eb8oJoygJYFIklz
         jU4Ia1ZZQN2qcIgmFFsA4s1L5Nb3Qe6pEZZr+PuDnDNZiLuq6UQavlEGUM8CUEd8KAD9
         ymXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id:reply-to
         :mime-version:content-transfer-encoding;
        bh=njyYK8IAwIOI5hjHtw+gwXwGrvmDKnQ12yvC407PC/c=;
        b=HOlWdQxQ9RlZSMYAhWeQ5ZISnfIol4KIHdGajal5Apm0d7y+BHp+J/fKJvdilEo84i
         u5fAw7kBm30pl1N7b8MHvsq9FQlY/k5G2uzA9bWetqOFnUrEPSsiXVmwrcaTCuZnfanY
         H864FqJhNnwfxrfudJ1CXb3pJt3uOvXrNZAYHJOnuQoIQKWHPu0wFO59HCfmUhRsB1XB
         d+jsmwRxcIbnnl2uNAdOf64+7qrSta9W9imZrpbSOJ2Wt38q/p6e01SNf93wWRuWAuXa
         2JmZPCwnO5RjUfZPlBe0myj8embJRKX46sqrRSiWeP4ka+TOBkWwoEgysyl50WCJ26ig
         frTw==
X-Gm-Message-State: AOAM5314uq26Ue1A59hbFUGu9Ig6FppEBNUvtsQjmKBZvgjCVydAbhKK
        RAzGpzXoy3A3HfrCo/jL4XI=
X-Google-Smtp-Source: ABdhPJyR8fn5Z80Erq4o9fhJERNpTD5/GaaNJ3W+IBDwQIQ/U6pn8nTio9xACytS86gWKRt6frBfAw==
X-Received: by 2002:a17:906:7304:: with SMTP id di4mr6386663ejc.327.1640382661657;
        Fri, 24 Dec 2021 13:51:01 -0800 (PST)
Received: from localhost.localdomain (bband-dyn119.178-40-49.t-com.sk. [178.40.49.119])
        by smtp.gmail.com with ESMTPSA id di5sm3021692ejc.45.2021.12.24.13.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 13:51:01 -0800 (PST)
Sender: Peter Vasil <petervasil@gmail.com>
From:   peter.vasil@gmail.com
To:     peter.vasil@gmail.com, linux-omap@vger.kernel.org
Subject: [PATCH 0/6] OMAP2: Nokia N810: prepare tahvo cells for display
Date:   Fri, 24 Dec 2021 22:39:16 +0100
Message-Id: <20211224214512.1583430-1-peter.vasil@gmail.com>
X-Mailer: git-send-email 2.25.1
Reply-To: peter.vasil@gmail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Bye, and Merry Christmas everyone :-)
Peter

Peter Vasil (6):
[PATCH 1/6] dt-bindings: leds: Nokia Tahvo/Betty ASIC LEDPWM
[PATCH 2/6] dt-bindings: regulator: Nokia Tahvo/Betty ASIC Vcore
[PATCH 3/6] ARM: dts: omap2420-n810: Add Tahvo/Betty LEDPWM and Vcore
[PATCH 4/6] leds: tahvo: Driver for Tahvo/Betty ASIC LEDPWM output
[PATCH 5/6] regulator: tahvo-vcore: Add basic Tahvo/Betty ASIC Vcore
[PATCH 6/6] mfd: retu: Add support for LEDPWM and Vcore regulator MFD

 Documentation/devicetree/bindings/regulator/nokia,tahvo-vcore-regulator.yaml |  41 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/omap2420-n810.dts                                          |  13 +++++++++++++
 arch/arm/boot/dts/omap2420-n8x0-common.dtsi                                  |   8 +++++++-
 drivers/leds/Kconfig                                                         |  12 ++++++++++++
 drivers/leds/Makefile                                                        |   1 +
 drivers/leds/leds-tahvo.c                                                    |  85 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mfd/retu-mfd.c                                                       |   8 ++++++++
 drivers/regulator/Kconfig                                                    |   8 ++++++++
 drivers/regulator/Makefile                                                   |   1 +
 drivers/regulator/tahvo-vcore-regulator.c                                    | 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 280 insertions(+), 1 deletion(-)


