Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1703934A0
	for <lists+linux-omap@lfdr.de>; Thu, 27 May 2021 19:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236748AbhE0RVM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 May 2021 13:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234277AbhE0RVH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 May 2021 13:21:07 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9118C061574
        for <linux-omap@vger.kernel.org>; Thu, 27 May 2021 10:19:21 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id g11so945698ilq.3
        for <linux-omap@vger.kernel.org>; Thu, 27 May 2021 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=f8Lz0tnoM7rtU7X49eHqNYm93CEqb/Fw5Ht2VL188Lc=;
        b=RrR1zdhkjcPhGL8OrJDjRxdrLajTAKlDSKii4g6CFg+vTcHrWkUrgP2ONYv03LDQ8c
         +83Vptoufb8pKEEnARnzSmTI9xCQLlO3Ib11p28cQNcgT27divGPsiXgpyg5DF42/FbQ
         /qFpW97gloJxJJeqvZxWRIDYKXWhRDRP6yOrwNJ65v4dcHPApeNTjbcagSSvL4kFx8h7
         OluBn40KThjq7exszrvU8a6vJzU1Kq9GyY/d4Hmt9JW6n/+Gz11Xo3qSmYUdm769Mqln
         eoE2+F9Sezu0EmUJ1Zf8s8iMqoymXUvcZ0cO/jhiPPMfJY0Ax55JF8qXlwDXSRHl84WB
         5lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=f8Lz0tnoM7rtU7X49eHqNYm93CEqb/Fw5Ht2VL188Lc=;
        b=V2flJV7riAsyTnupDv6n5Y7t3TENY77VNuo1lBRnf8M916JNTbvT+SxLG8Yil5ftHu
         7GVi1e3iGedDDfwpTwmE2iHeL1a9+wzWu2MxW70/xFBbONA36ybpmV6YaTE077fa099u
         M172v1vEcvuGfHEdUGi+gjvU2hOebuQLNl9S0ep9PugRWP2dWd0xpW5ui6M2auExE7zi
         WLd/WqVLEUcktpnqou+UEiv0O9v5gbMGev4aHC9fblQ+jrmIOB4raDuMbWMvpI7WytJx
         AoWZ+MxjnScCr+nIOwkHMnHTLTSh7jiSnC826dhq0jbEjpbwUTU/p2L/B+3A8dYQU+Ic
         tyTQ==
X-Gm-Message-State: AOAM530Wps5cToaX0I7dYerUBzTn3mOH4U1xRvaQBIJwNsIMf/XDyrQR
        z8NHynxy3Gj+89/SKGPmuiOobNkH4BAbsEO9wM4QxZiTHzmphg==
X-Google-Smtp-Source: ABdhPJwIkfgIqm+s41KHLFBP84YI/pHC/Zrb3EhFFyST/y1C8CTT2QTV00jF+ZFVyBlDev9xtR+GXim/0Tk7H6icu9o=
X-Received: by 2002:a05:6e02:504:: with SMTP id d4mr3900017ils.178.1622135961038;
 Thu, 27 May 2021 10:19:21 -0700 (PDT)
MIME-Version: 1.0
From:   Mighty M <mightymb17@gmail.com>
Date:   Thu, 27 May 2021 22:49:10 +0530
Message-ID: <CACLAQJFXr2PeuV9rJtyVTB0ib9QgsHC7W14qA_aCm9qKh81JOA@mail.gmail.com>
Subject: Regulators not working
To:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

My device has twl6032 regulator, and the regulators are always
disabled and off, even after putting regulator-always-on in my dts
they are off. Only the twl regulators are affected, the ones i added
manually (ie fixed reg with gpio) are working fine. Here is my dts
https://pastebin.ubuntu.com/p/pYGG2pTSjB/, my .config
https://pastebin.ubuntu.com/p/vVFrbZ4773/  , my dmesg
https://pastebin.ubuntu.com/p/tqCXGnPZmF/ it says

[    4.330841] VAUX2_6030: 2800 mV, disabled
[    4.334533] twl6030_reg 48070000.i2c:twl@48:regulator-vaux2: always-on 1

and checking the /sys/class/regulator
samsung-espresso10:/sys/devices/platform/44000000.ocp/48000000.interconnect/48000000.interconnect:segment@0/48070000.target-module/48070000.i2c/i2c-0/0-0048/48070000.i2c:twl@48:regulator-vaux2/regulator/regulator.8#
cat state
disabled
samsung-espresso10:/sys/devices/platform/44000000.ocp/48000000.interconnect/48000000.interconnect:segment@0/48070000.target-module/48070000.i2c/i2c-0/0-0048/48070000.i2c:twl@48:regulator-vaux2/regulator/regulator.8#
cat status
off
the regulator_summary https://pastebin.ubuntu.com/p/3DH6h9bkGY/

I cannot understand why the twl pmic isnt working, any help?
