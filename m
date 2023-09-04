Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C060791BAF
	for <lists+linux-omap@lfdr.de>; Mon,  4 Sep 2023 18:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbjIDQiB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Sep 2023 12:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234344AbjIDQiB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Sep 2023 12:38:01 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CEB9D;
        Mon,  4 Sep 2023 09:37:58 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-56c2e882416so818598a12.3;
        Mon, 04 Sep 2023 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693845477; x=1694450277; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6EPYeYpUMgvRUbOsFbzGxI3AkdC2ZNuAukK/JdwUVeA=;
        b=MNsc08FNFft+XYkveoMzFSl6M6IyFRs6YP2DxU9Hrbnm/lpNq2QbCYmw7EQ+H6a9Sx
         LfXi8twfoheRZ4Td7jXu8vZRT2KwmjVIQZL8O2ImYwW8fwTMNPkBGFnNnh2MFZ+jZ8i+
         fv/UgEgaLMSi7v/MezLREyXE0hXhhH9xy+nRxnRb2NdMNpChluEhDvxnJjfQrxAGtRSJ
         9t1wz+Y/qDvZEPFpHg/9O01M4VlXxFi24cqdoZj0NisMqUpZk03CHXmnEqtqeV4kDvln
         FCDVOdCoeVA05vEUM4tmOpLb7GlJsrafSQG8Hx3t5asRzmOmI1w6/UNjK+hfAEkTFsJ+
         t3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693845477; x=1694450277;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EPYeYpUMgvRUbOsFbzGxI3AkdC2ZNuAukK/JdwUVeA=;
        b=RAsry2h7AMy9dlrFyYXtsBHixW65+8YjPRPB9UJ114ptpySUjIGcadpaPfz4JJyCpS
         Ht0ynzF+BWf2boNgTCigCU5EVCnWUTc1Il+siZB7sEpx5Cirk9RefY41BK+CjTR38ylL
         x1GtBqiiTC4IZ3X2POmzSdHbPHsoQ6k/Evxxa+whCU3mQWD2KE9psVsOOreXEJW0+wUY
         EEgTvZQA3aktA9VuiOXlpRDGLew6pgP9QXKRx6a9zsxtvnipubD/u6fZtiJ9mEVOyiqQ
         DoeUhZZ2w4J/ZPamhiorXjrvbEpdSpWZYJjDZxQRncS1osvGMree3W/VH64oHRhW6TRK
         cwAg==
X-Gm-Message-State: AOJu0Yzn/wn6uxWdDRVnfB1kvtewf23PjkDjcy8g7odD1J7bN9ESO6gi
        pfVtPX4YZfhF3ulESBU6/bko8NN0oJza1Zx44zBk5n4SOy8=
X-Google-Smtp-Source: AGHT+IGwNwZ0KsmJJEXnkWX1ATQ9qyQ5o0gKg7iJ2dp1fUTAV1iyxvgSQRFUb+poruAKOOFW9V+Y78JAI1xyJuKjbQE=
X-Received: by 2002:a17:90a:4f4a:b0:268:6060:c184 with SMTP id
 w10-20020a17090a4f4a00b002686060c184mr8280762pjl.45.1693845477194; Mon, 04
 Sep 2023 09:37:57 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 4 Sep 2023 11:37:46 -0500
Message-ID: <CAHCN7xJjK=BaNHa=+OKzOmFtNRYKX_APTp5Zj3g-X_iQcpyK6g@mail.gmail.com>
Subject: 6.1.y Regression found on AM3517
To:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     stable <stable@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I have an AM3517-EVM board that I am trying to use the latest 6.1.y
stable, currently 6.1.51.

With git bisect, I narrowed the regression between 6.1.15 and 6.1.16 to commit
eaf9b5612a47 ("driver core: fw_devlink: Don't purge child fwnode's
consumer links")

In the regression, 48002000.scm appears as not ready.  This affects a
variety of dependent peripherals making them unavailable:

wl12xx_buf platform: supplier 48002000.scm not ready
wl12xx_vmmc2 platform: supplier wl12xx_buf not ready
48050000.dss platform: supplier display@0 not ready
48064800.ehci platform: supplier hsusb1_phy not ready
backlight platform: supplier 48002000.scm not ready
display@0 platform: supplier backlight not ready
dmtimer-pwm@11 platform: supplier 48002000.scm not ready
hsusb1_phy platform: supplier 48002000.scm not ready
gpio-leds platform: supplier 48002000.scm not ready
480b4000.mmc platform: supplier wl12xx_vmmc2 not ready

If I build 6.1.51 but I checkout drivers/base/core.c from commit
2455b81afe68 ("driver core: fw_devlink: Add DL_FLAG_CYCLE support to
device links"),
the regression is gone.

I checked the 6.5 kernel, and it appears fine, so I think there is a
possible backport commit missing, and I was hoping Saravana or Tony
might have a suggestion as to which one(s) I should try.  I don't know
if this is found on other OMAP3 boards, but I wouldn't be surprised.

adam
